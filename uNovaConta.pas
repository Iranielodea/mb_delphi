unit uNovaConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Buttons, ExtCtrls, Spin;

type
  TfNovaConta = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dsCad: TDataSource;
    Panel1: TPanel;
    butOk: TBitBtn;
    butCancelar: TBitBtn;
    Documento: TEdit;
    DataEmissao: TMaskEdit;
    Valor: TEdit;
    DataVencimento: TMaskEdit;
    Dias: TMaskEdit;
    Cod_Pagto: TMaskEdit;
    Desc_Pagto: TEdit;
    id_ContaBanco: TMaskEdit;
    Num_Conta: TEdit;
    Label8: TLabel;
    QtdeParcelas: TSpinEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Cod_Pessoa: TEdit;
    Tipo: TEdit;
    Label9: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure butCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ValorExit(Sender: TObject);
    procedure DataEmissaoExit(Sender: TObject);
    procedure DataVencimentoExit(Sender: TObject);
    procedure DiasExit(Sender: TObject);
    procedure Cod_PagtoExit(Sender: TObject);
    procedure Desc_PagtoExit(Sender: TObject);
    procedure Desc_PagtoEnter(Sender: TObject);
    procedure id_ContaBancoExit(Sender: TObject);
    procedure Num_ContaExit(Sender: TObject);
    procedure Num_ContaEnter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaForma_Pagto(Tipo: String);
    procedure PesquisaConta(Tipo: String);
    procedure CalculaData(Tipo: string);
  public
    { Public declarations }
  end;

var
  fNovaConta: TfNovaConta;

implementation

uses uDM, UUtil, uForma_Pagto, uContaBanco;

{$R *.dfm}

procedure TfNovaConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfNovaConta.butCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfNovaConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_Escape : close;
      vk_f6: begin
               butOk.SetFocus;
               butOkClick(self);
             end;
   end;
end;

procedure TfNovaConta.ValorExit(Sender: TObject);
begin
   Valor.Text:=FormataValor2(Valor.Text);
end;

procedure TfNovaConta.DataEmissaoExit(Sender: TObject);
begin
   if DataErro(DataEmissao.Text) = 'S' then
   begin
      DataEmissao.SetFocus;
      exit;
   end;
   CalculaData('E');
end;

procedure TfNovaConta.DataVencimentoExit(Sender: TObject);
begin
   if DataErro(DataVencimento.Text) = 'S' then
   begin
      DataVencimento.SetFocus;
      exit;
   end;
   CalculaData('V');
end;

procedure TfNovaConta.DiasExit(Sender: TObject);
begin
   Dias.Text:=FormataInteiro(Dias.Text);
   CalculaData('E');
end;

procedure TfNovaConta.PesquisaForma_Pagto(Tipo: String);
var vreg: integer;
begin
   if (Cod_Pagto.Modified = false) and (Desc_Pagto.Modified = false) then exit;
   if ((Cod_Pagto.Text = '') and (Tipo = 'C')) or ((Desc_Pagto.Text = '') and (Tipo = 'D')) then
   begin
      COD_PAGTO.Clear;
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
      Cod_Pagto.Text:=dm.Qsql.Fields[0].Text;
      Desc_Pagto.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fForma_Pagto:=TfForma_Pagto.create(Self);
      fForma_Pagto.TipoCad.Text:='P';
      if Tipo = 'D' then
         fForma_Pagto.EditNome.Text:=Desc_Pagto.Text;
      if fForma_Pagto.ShowModal = mrOk then
      begin
         Cod_Pagto.Text:=dm.Forma_PagtoCod_Pagto.Text;
         Desc_Pagto.Text:=dm.Forma_PagtoDesc_Pagto.Text;
      end
      else begin
         Cod_Pagto.Clear;
         Desc_Pagto.Clear;
      end;
      dm.Forma_Pagto.close;
      fForma_Pagto.Free;
   end;
   dm.Qsql.close;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfNovaConta.PesquisaConta(Tipo: String);
var vreg: integer;
sAtivo: string;
begin
   if (id_ContaBanco.Modified = false) and (Num_Conta.Modified = false) then exit;
   if ((id_ContaBanco.Text = '') and (Tipo = 'C')) or ((Num_Conta.Text = '') and (Tipo = 'D')) then
   begin
      ID_CONTABANCO.Clear;
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
      ID_CONTABANCO.Text:=dm.Qsql.Fields[0].Text;
      Num_Conta.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fContaBanco:=TfContaBanco.create(true);
      fContaBanco.TipoCad.Text:='P';
      if Tipo = 'D' then
         fContaBanco.EditNome.Text:=Num_Conta.Text;
      if fContaBanco.ShowModal = mrOk then
      begin
         ID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.Text;
         Num_Conta.Text:=dm.ContaBancoNUM_CONTA.Text;
      end
      else begin
         ID_CONTABANCO.Clear;
         Num_Conta.Clear;
      end;
      dm.ContaBanco.close;
      fContaBanco.Free;
   end;
   dm.Qsql.close;
end;

procedure TfNovaConta.Cod_PagtoExit(Sender: TObject);
begin
   PesquisaForma_Pagto('C');
end;

procedure TfNovaConta.Desc_PagtoExit(Sender: TObject);
begin
   if Desc_Pagto.Modified then
      PesquisaForma_Pagto('D');
end;

procedure TfNovaConta.Desc_PagtoEnter(Sender: TObject);
begin
   Desc_Pagto.Modified:=false;
end;

procedure TfNovaConta.id_ContaBancoExit(Sender: TObject);
begin
   if id_ContaBanco.Modified then
      PesquisaConta('C');
end;

procedure TfNovaConta.Num_ContaExit(Sender: TObject);
begin
   if Num_Conta.Modified then
      PesquisaConta('D');
end;

procedure TfNovaConta.Num_ContaEnter(Sender: TObject);
begin
   Num_Conta.Modified:=false;
end;

procedure TfNovaConta.SpeedButton2Click(Sender: TObject);
begin
   fForma_Pagto:=TfForma_Pagto.create(Self);
   fForma_Pagto.TipoCad.Text:='P';
   if fForma_Pagto.ShowModal = mrOk then
   begin
      Cod_Pagto.Text:=dm.Forma_PagtoCod_Pagto.Text;
      Desc_Pagto.Text:=dm.Forma_PagtoDesc_Pagto.Text;
   end;
   dm.Forma_Pagto.close;
   fForma_Pagto.Free;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfNovaConta.SpeedButton1Click(Sender: TObject);
begin
   fContaBanco:=TfContaBanco.create(true);
   fContaBanco.TipoCad.Text:='P';
   if fContaBanco.ShowModal = mrOk then
   begin
      ID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.Text;
      Num_Conta.Text:=dm.ContaBancoNUM_CONTA.Text;
   end;
   dm.ContaBanco.close;
   fContaBanco.Free;
   id_ContaBanco.Modified:=false;
   Num_Conta.Modified:=false;
end;

procedure TfNovaConta.butOkClick(Sender: TObject);
var i: integer;
begin
   if trim(Documento.Text) = '' then
   begin
      mensagem('Informe o documento');
      Documento.SetFocus;
      Exit;
   end;
   if copy(DataEmissao.Text,1,1) = ' ' then
   begin
      mensagem('Informe a data da emiss�o');
      DataEmissao.SetFocus;
      exit;
   end;
   if copy(DataVencimento.Text,1,1) = ' ' then
   begin
      mensagem('Informe a data do Vencimento');
      DataVencimento.SetFocus;
      exit;
   end;
   if PreparaExtenso(Valor.Text) = 0 then
   begin
      mensagem('Informe o Valor');
      Valor.SetFocus;
      exit;
   end;
   if QtdeParcelas.Text = '0' then
   begin
      mensagem('Informe a quantidade de parcelas');
      QtdeParcelas.SetFocus;
      exit;
   end;
   if ValidaDatas(DataEmissao.Text,DataVencimento.Text) = false then
      exit;


   dm.Get_Contas('0');
   for i:=1 to QtdeParcelas.Value do
   begin
      dm.Contas.Append;
      dm.ContasNUM_PEDIDO.Text:='0';
      dm.ContasSEQ_CONTA.AsInteger:=DM.Incrementa('CONTAS','0');
      dm.ContasCOD_EMPRESA.Text:=vgCod_Empresa;
      if Tipo.text = 'P' then
      begin
         dm.ContasTIPO_CONTA.Text:='3';
         dm.ContasCOD_FOR.Text:=Cod_Pessoa.Text;
      end
      else begin
         dm.ContasTIPO_CONTA.Text:='2';
         dm.ContasCOD_CLIENTE.Text:=Cod_Pessoa.Text;
      end;
      if Cod_Pagto.Text <> '' then
         dm.ContasCOD_PAGTO.Text:=Cod_Pagto.Text;
      dm.ContasDATA_EMISSAO.Text:=DataEmissao.Text;
      dm.ContasDATA_VENCTO.Text:=DataVencimento.Text;
      dm.ContasDIAS.Text:=Dias.Text;
      dm.ContasDOCUMENTO.Text:=Documento.Text;

      dm.ContasSITUACAO.Text:='A';

      dm.ContasVALOR_ORIGINAL.AsFloat:=PreparaExtenso(Valor.Text);
      dm.ContasVALOR_PAGO.AsFloat:=0;
      if id_ContaBanco.Text <> '' then
         dm.ContasID_CONTABANCO.Text:=id_ContaBanco.Text;
      dm.ContasVALOR_PAGAR.AsFloat:=PreparaExtenso(Valor.Text);
      dm.Contas.Post;
   end;
   dm.SalvaTab(dm.Contas);
   dm.SalvaTrans;
   dm.Contas.Close;
   close;
end;


procedure TfNovaConta.CalculaData(Tipo: string);
var vdias: Single;
begin
   try
     if Tipo = 'E' then
      DataVencimento.Text:=datetostr(strtodate(DataEmissao.Text)+strtoint(dias.Text));
     if Tipo = 'V' then
     begin
      vdias:=DiasAtrazo(DataVencimento.Text,DataEmissao.Text);
      Dias.Text:=floattostr(vDias);
     end;
   except
         DataVencimento.Text:=datetostr(date);
   end;

end;

procedure TfNovaConta.FormCreate(Sender: TObject);
begin
   DataEmissao.Text:=datetostr(date);
end;

procedure TfNovaConta.FormActivate(Sender: TObject);
begin
   if Tipo.text = 'P' then
      fNovaConta.Caption:='Nova Conta - Pagar'
   else
      fNovaConta.Caption:='Nova Conta - Receber';
end;

end.
