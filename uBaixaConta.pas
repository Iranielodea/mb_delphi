unit uBaixaConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ExtCtrls, ComCtrls, Buttons;

type
  TfBaixaConta = class(TForm)
    dsCad: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Cod_Pagto: TDBEdit;
    Label8: TLabel;
    Data_Emissao: TDBEdit;
    lblPago: TLabel;
    DataPagto: TDBEdit;
    Label10: TLabel;
    DataVenc: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    Valor_Pagar: TDBEdit;
    lblValorPago: TLabel;
    ValorPago: TDBEdit;
    Desc_Pagto: TEdit;
    G_Situacao: TDBRadioGroup;
    Panel3: TPanel;
    DBEdit16: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    butSair: TSpeedButton;
    butAlterar: TBitBtn;
    BitBtn1: TBitBtn;
    id_Conta: TEdit;
    SpeedButton2: TSpeedButton;
    lblConta: TLabel;
    id_ContaBanco: TDBEdit;
    Num_Conta: TEdit;
    butNumConta: TSpeedButton;
    Label1: TLabel;
    dsObs: TDataSource;
    Texto: TMemo;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butAlterarClick(Sender: TObject);
    procedure Data_EmissaoExit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DataVencExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure G_SituacaoExit(Sender: TObject);
    procedure Cod_PagtoExit(Sender: TObject);
    procedure Desc_PagtoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure id_ContaBancoExit(Sender: TObject);
    procedure Num_ContaExit(Sender: TObject);
    procedure Num_ContaEnter(Sender: TObject);
    procedure butNumContaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Calcula_Venc(Data: String);
    procedure PesquisaForma_Pagto(Tipo: String);
    procedure PesquisaConta(Tipo: String);
  public
    { Public declarations }
  end;

var
  fBaixaConta: TfBaixaConta;

implementation

uses uDM, UUtil, uForma_Pagto, uContaBanco;

{$R *.dfm}

procedure TfBaixaConta.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fBaixaConta);
   dm.Get_Contas(id_Conta.Text);
   DM.Get_ObsConta(id_Conta.Text);
   if not (dm.ObsConta.IsEmpty) then
      Texto.Text:=dm.ObsContaTEXTO.Text;

   if dm.ContasTIPO_CONTA.Text = '1' then
   begin
      G_Situacao.Visible:=false;
      lblPago.Visible:=false;
      DataPagto.Visible:=false;
      lblValorPago.Visible:=false;
      ValorPago.Visible:=false;

      lblConta.Visible:=false;
      id_ContaBanco.Visible:=false;
      Num_Conta.Visible:=false;
      butNumConta.Visible:=false;
   end;

   dm.Contas.Edit;
   if dm.ContasCOD_PAGTO.Text <> '' then
   begin
      Cod_Pagto.Modified:=True;
      Cod_PagtoExit(self);
   end;
   if dm.ContasID_CONTABANCO.Text <> '' then
   begin
      id_ContaBanco.Modified:=true;
      id_ContaBancoExit(self);
   end;
end;

procedure TfBaixaConta.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfBaixaConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfBaixaConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_F6: begin
               butAlterar.SetFocus;
               butAlterarClick(self);       
             end;
      vk_Escape: close;
   end;
end;

procedure TfBaixaConta.butAlterarClick(Sender: TObject);
begin
   if dm.ContasDATA_EMISSAO.Text = '' then
   begin
      mensagem('Informe a Data de Emissão');
      Data_Emissao.SetFocus;
      exit;
   end;

   if dm.ContasDATA_VENCTO.Text = '' then
   begin
      mensagem('Informe a Data de Vencimento');
      DataVenc.SetFocus;
      exit;
   end;

   {
   if dm.ContasVALOR_PAGAR.AsFloat <= 0 then
   begin
      mensagem('Informe o Valor');
      Valor_Pagar.SetFocus;
      exit;
   end;
   }
   if dm.ContasDATA_EMISSAO.AsDateTime > dm.ContasDATA_VENCTO.AsDateTime then
   begin
      mensagem('Data da Emissão maior que do Vencimento');
      Data_Emissao.SetFocus;
      exit;
   end;

   if dm.ContasTIPO_CONTA.Text = '2' then
   begin
      if dm.ContasSITUACAO.Text = 'P' then
         ExecutaSql('update CARGA set SITUACAO = ''E'', FINANCEIRO = ''E'' where ID_CARGA = '+dm.ContasNUM_PEDIDO.Text)
      else
         ExecutaSql('update CARGA set SITUACAO = ''A'', FINANCEIRO = ''A'' where ID_CARGA = '+dm.ContasNUM_PEDIDO.Text);
   end;

// observacao
   if dm.ObsConta.IsEmpty then
   begin
      if texto.Text <> '' then
      begin
         dm.ObsConta.Append;
         dm.ObsContaID_CONTA.Text:=id_Conta.Text;
         dm.ObsContaTEXTO.Text:=Texto.Text;
         dm.ObsConta.Post;
      end;
   end
   else begin
      if texto.Text <> '' then
      begin
         dm.ObsConta.Edit;
         dm.ObsContaTEXTO.Text:=Texto.Text;
         dm.ObsConta.Post;
      end;
      if trim(texto.Text) = '' then
         dm.ObsConta.Delete;
   end;

// Salvar
   dm.IniTrans;
   dm.Contas.Post;
   dm.SalvaTab(dm.Contas);
   dm.SalvaTab(dm.ObsConta);
   dm.SalvaTrans;
   close;
end;

procedure TfBaixaConta.Calcula_Venc(Data: String);
begin
// Data E-Emissao, V-Vencimento
   if Data_Emissao.Text <> '' then
   begin
      if Data = 'E' then
         dm.ContasDATA_VENCTO.AsDateTime:=dm.ContasDATA_EMISSAO.AsDateTime + dm.ContasDIAS.AsFloat;
      if Data = 'V' then
      begin
         dm.ContasDIAS.AsFloat:=DiasAtrazo(DataVenc.Text,Data_Emissao.Text);
         dm.ContasDATA_VENCTO.AsDateTime:=dm.ContasDATA_EMISSAO.AsDateTime + dm.ContasDIAS.AsFloat;
      end;
   end;
end;

procedure TfBaixaConta.Data_EmissaoExit(Sender: TObject);
begin
   Calcula_Venc('E');
end;

procedure TfBaixaConta.DBEdit11Exit(Sender: TObject);
begin
   Calcula_Venc('E');
end;

procedure TfBaixaConta.DataVencExit(Sender: TObject);
begin
   Calcula_Venc('V');
end;

procedure TfBaixaConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dscad.DataSet.State in [dsedit,dsinsert] then
      dscad.DataSet.Cancel;
   dscad.DataSet.Close;
   dsObs.DataSet.Close;
end;

procedure TfBaixaConta.G_SituacaoExit(Sender: TObject);
begin
   if dm.ContasSITUACAO.Text = 'P' then
   begin
      dm.ContasDATA_PAGO.AsDateTime:=date;
      dm.ContasVALOR_PAGO.AsFloat:=dm.ContasVALOR_PAGAR.AsFloat
   end
   else begin
      dm.ContasDATA_PAGO.Clear;
      dm.ContasVALOR_PAGO.AsFloat:=0;
   end;
end;

procedure TfBaixaConta.PesquisaForma_Pagto(Tipo: String);
var vreg: integer;
begin
   if (Cod_Pagto.Modified = false) and (Desc_Pagto.Modified = false) then exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Pagto.Text = '') and (Tipo = 'C')) or ((Desc_Pagto.Text = '') and (Tipo = 'D')) then
   begin
      dm.contasCOD_PAGTO.Clear;
      Desc_Pagto.Clear;
      Cod_Pagto.Modified:=false;
      Desc_Pagto.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_Pagto, Desc_Pagto from Forma_Pagto where Cod_Pagto = '+Cod_Pagto.Text)
   else
      ComandoQSql('select Cod_Pagto, Desc_Pagto from Forma_Pagto where Desc_Pagto like  '''+Desc_Pagto.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.contasCod_Pagto.Text:=dm.Qsql.Fields[0].Text;
      Desc_Pagto.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fForma_Pagto:=TfForma_Pagto.create(Self);
      fForma_Pagto.TipoCad.Text:='P';
      if Tipo = 'D' then
         fForma_Pagto.EditNome.Text:=Desc_Pagto.Text;
      if fForma_Pagto.ShowModal = mrOk then
      begin
         dm.contasCod_Pagto.Text:=dm.Forma_PagtoCod_Pagto.Text;
         Desc_Pagto.Text:=dm.Forma_PagtoDesc_Pagto.Text;
      end
      else begin
         dm.contasCod_Pagto.Clear;
         Desc_Pagto.Clear;
      end;
      dm.Forma_Pagto.close;
      fForma_Pagto.Free;
   end;
   dm.Qsql.close;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfBaixaConta.Cod_PagtoExit(Sender: TObject);
begin
   PesquisaForma_Pagto('C');
end;

procedure TfBaixaConta.Desc_PagtoExit(Sender: TObject);
begin
   PesquisaForma_Pagto('D');
end;

procedure TfBaixaConta.SpeedButton2Click(Sender: TObject);
begin
   fForma_Pagto:=TfForma_Pagto.create(Self);
   fForma_Pagto.TipoCad.Text:='P';
   if fForma_Pagto.ShowModal = mrOk then
   begin
      dm.Contas.Edit;
      dm.ContasCod_Pagto.Text:=dm.Forma_PagtoCod_Pagto.Text;
      Desc_Pagto.Text:=dm.Forma_PagtoDesc_Pagto.Text;
   end;
   dm.Forma_Pagto.close;
   fForma_Pagto.Free;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfBaixaConta.PesquisaConta(Tipo: String);
var vreg: integer;
sAtivo: string;
begin
   if (id_ContaBanco.Modified = false) and (Num_Conta.Modified = false) then exit;
   dm.ModoEdicao(dsCad);
   if ((id_ContaBanco.Text = '') and (Tipo = 'C')) or ((Num_Conta.Text = '') and (Tipo = 'D')) then
   begin
      dm.ContasID_CONTABANCO.Clear;
      Num_Conta.Clear;
      exit;
   end;
   sAtivo := ' AND ATIVO = ' + QuotedStr('S');
   if Tipo = 'C' then
      ComandoQSql('select ID_CONTABANCO, NUM_CONTA from CONTABANCO where ID_CONTABANCO = '+id_ContaBanco.Text + sAtivo)
   else
      ComandoQSql('select ID_CONTABANCO, NUM_CONTA from CONTABANCO where NUM_CONTA like  '''+Num_Conta.Text+'%''' + sAtivo);
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.ContasID_CONTABANCO.Text:=dm.Qsql.Fields[0].Text;
      Num_Conta.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fContaBanco:=TfContaBanco.create(Self);
      fContaBanco.TipoCad.Text:='P';
      if Tipo = 'D' then
         fContaBanco.EditNome.Text:=Num_Conta.Text;
      if fContaBanco.ShowModal = mrOk then
      begin
         dm.ContasID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.Text;
         Num_Conta.Text:=dm.ContaBancoNUM_CONTA.Text;
      end
      else begin
         dm.ContasID_CONTABANCO.Clear;
         Num_Conta.Clear;
      end;
      dm.ContaBanco.close;
      fContaBanco.Free;
   end;
   dm.Qsql.close;
end;

procedure TfBaixaConta.id_ContaBancoExit(Sender: TObject);
begin
   if id_ContaBanco.Modified then
      PesquisaConta('C');
end;

procedure TfBaixaConta.Num_ContaExit(Sender: TObject);
begin
   if Num_Conta.Modified then
      PesquisaConta('D');
end;

procedure TfBaixaConta.Num_ContaEnter(Sender: TObject);
begin
   Num_Conta.Modified:=false;
end;

procedure TfBaixaConta.butNumContaClick(Sender: TObject);
begin
   fContaBanco:=TfContaBanco.create(true);
   fContaBanco.TipoCad.Text:='P';
   if fContaBanco.ShowModal = mrOk then
   begin
      dm.Contas.Edit;
      dm.ContasID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.Text;
      Num_Conta.Text:=dm.ContaBancoNUM_CONTA.Text;
   end;
   dm.ContaBanco.close;
   fContaBanco.Free;
   id_ContaBanco.Modified:=false;
   Num_Conta.Modified:=false;
end;

end.
