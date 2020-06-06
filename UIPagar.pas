unit UIPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TfIPagar = class(TForm)
    GroupBox1: TGroupBox;
    REmissao: TRadioButton;
    RVencto: TRadioButton;
    RPagto: TRadioButton;
    RCliEmissao: TRadioButton;
    RCliVencto: TRadioButton;
    RCliPagto: TRadioButton;
    GroupBox2: TGroupBox;
    RAberto: TRadioButton;
    RPago: TRadioButton;
    RTodos: TRadioButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Cod_For: TMaskEdit;
    NomeFor: TEdit;
    Cod_Pagto: TMaskEdit;
    Desc_Pagto: TEdit;
    Id_ContaBanco: TMaskEdit;
    Num_Conta: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DataIni: TMaskEdit;
    Datafin: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    GTipo: TGroupBox;
    RRelacao: TRadioButton;
    RResumo: TRadioButton;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    RConta: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cod_ForExit(Sender: TObject);
    procedure NomeForExit(Sender: TObject);
    procedure NomeForEnter(Sender: TObject);
    procedure Cod_PagtoExit(Sender: TObject);
    procedure Desc_PagtoExit(Sender: TObject);
    procedure Cod_PagtoEnter(Sender: TObject);
    procedure Desc_PagtoEnter(Sender: TObject);
    procedure Id_ContaBancoExit(Sender: TObject);
    procedure Num_ContaExit(Sender: TObject);
    procedure Num_ContaEnter(Sender: TObject);
    procedure Id_ContaBancoEnter(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaCliente(Tipo: String);
    procedure PesquisaForma_Pagto(Tipo: String);
    procedure PesquisaConta(Tipo: String);
  public
    { Public declarations }
  end;

var
  fIPagar: TfIPagar;

implementation

uses uDM, uForma_Pagto, UUtil, uContaBanco, uFornecedor,
  uRContasPagar;

{$R *.dfm}

procedure TfIPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure TfIPagar.PesquisaCliente(Tipo: String);
var vreg: integer;
begin
   if (Cod_For.Modified = false) and (NomeFor.Modified = false) then exit;
   if ((Cod_For.Text = '') and (Tipo = 'C')) or ((NomeFor.Text = '') and (Tipo = 'D')) then
   begin
      Cod_For.Clear;
      NomeFor.Clear;
      Cod_For.Modified:=false;
      NomeFor.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where Cod_For = '+Cod_For.Text)
   else
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where NOME like  '''+NomeFor.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Cod_For.Text:=dm.Qsql.Fields[0].Text;
      NomeFor.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fFornecedor:=TfFornecedor.create(Self);
      fFornecedor.TipoCad.Text:='P';
      if Tipo = 'D' then
         fFornecedor.EditNome.Text:=NomeFor.Text;
      if fFornecedor.ShowModal = mrOk then
      begin
         Cod_For.Text:=dm.FornecedorCod_For.Text;
         NomeFor.Text:=dm.FornecedorNOME.Text;
      end
      else begin
         Cod_For.Clear;
         NomeFor.Clear;
      end;
      dm.Fornecedor.close;
      fFornecedor.Free;
   end;
   dm.Qsql.close;
   Cod_For.Modified:=false;
   NomeFor.Modified:=false;
end;

procedure TfIPagar.Cod_ForExit(Sender: TObject);
begin
   if Cod_For.Modified then
      PesquisaCliente('C');
end;

procedure TfIPagar.NomeForExit(Sender: TObject);
begin
   if NomeFor.Modified then
      PesquisaCliente('D');
end;

procedure TfIPagar.NomeForEnter(Sender: TObject);
begin
   NomeFor.Modified:=false;
end;

procedure TfIPagar.PesquisaForma_Pagto(Tipo: String);
var vreg: integer;
begin
   if ((Cod_Pagto.Text = '') and (Tipo = 'C')) or ((Desc_Pagto.Text = '') and (Tipo = 'D')) then
   begin
      COD_PAGTO.Clear;
      Desc_Pagto.Clear;
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
end;

procedure TfIPagar.Cod_PagtoExit(Sender: TObject);
begin
   if Cod_Pagto.Modified then
      PesquisaForma_Pagto('C');
end;

procedure TfIPagar.Desc_PagtoExit(Sender: TObject);
begin
   if Desc_Pagto.Modified then
      PesquisaForma_Pagto('D');
end;

procedure TfIPagar.Cod_PagtoEnter(Sender: TObject);
begin
   Cod_Pagto.Modified:=false;
end;

procedure TfIPagar.Desc_PagtoEnter(Sender: TObject);
begin
   Desc_Pagto.Modified:=false;
end;

procedure TfIPagar.PesquisaConta(Tipo: String);
var vreg: integer;
sAtivo: string;
begin
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

procedure TfIPagar.Id_ContaBancoExit(Sender: TObject);
begin
   if Id_ContaBanco.Modified then
      PesquisaConta('C');
end;

procedure TfIPagar.Num_ContaExit(Sender: TObject);
begin
   if Num_Conta.Modified then
      PesquisaConta('D');
end;

procedure TfIPagar.Num_ContaEnter(Sender: TObject);
begin
   Num_Conta.Modified:=false;
end;

procedure TfIPagar.Id_ContaBancoEnter(Sender: TObject);
begin
   Id_ContaBanco.Modified:=false;
end;

procedure TfIPagar.SpeedButton3Click(Sender: TObject);
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
end;

procedure TfIPagar.SpeedButton1Click(Sender: TObject);
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
end;

procedure TfIPagar.SpeedButton2Click(Sender: TObject);
begin
   fFornecedor:=TfFornecedor.create(Self);
   fFornecedor.TipoCad.Text:='P';
   if fFornecedor.ShowModal = mrOk then
   begin
      Cod_For.Text:=dm.FornecedorCod_For.Text;
      NomeFor.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.close;
   fFornecedor.Free;
end;

procedure TfIPagar.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfIPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfIPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_Escape: close;
   end;
end;

procedure TfIPagar.butImprimirClick(Sender: TObject);
var
   vsql: string;
   vlData: String;

begin
   if ValidaDatas(DataIni.Text,Datafin.Text) = false then
      exit;
//------------------------------------------------------------------------------
   if (REmissao.Checked) or (RCliEmissao.Checked) then
      vsql:=' and CON.DATA_EMISSAO between '+DataIngles2(Dataini.Text)+' and '+DataIngles2(Datafin.Text);
   if (RVencto.Checked) or (RCliVencto.Checked) then
      vsql:=' and CON.DATA_VENCTO between '+DataIngles2(Dataini.Text)+' and '+DataIngles2(Datafin.Text);
   if RPagto.Checked or (RCliPagto.Checked) then
      vsql:=' and CON.DATA_PAGO between '+DataIngles2(Dataini.Text)+' and '+DataIngles2(Datafin.Text);
//------------------------------------------------------------------------------
   if Cod_For.Text <> '' then
      vsql:=vsql + ' and CON.COD_FOR = '+Cod_For.Text;
   if Cod_Pagto.Text <> '' then
      vsql:=vsql + ' and CON.COD_PAGTO = '+Cod_Pagto.Text;
   if Id_ContaBanco.Text <> '' then
      vsql:=vsql + ' and CON.ID_CONTABANCO = '+Id_ContaBanco.Text;
//------------------------------------------------------------------------------
   if RAberto.Checked then
      vsql:=vsql + ' and CON.SITUACAO = ''A''';
   if (RPago.Checked) or (RPagto.Checked) or (RCliPagto.Checked) then
      vsql:=vsql + ' and CON.SITUACAO = ''P''';
//------------------------------------------------------------------------------
   if REmissao.Checked then
      vsql:=vsql + ' order by CON.DATA_EMISSAO';
   if RVencto.Checked then
      vsql:=vsql + ' order by CON.DATA_VENCTO';
   if RPagto.Checked then
      vsql:=vsql + ' order by CON.DATA_PAGO';
   if RCliEmissao.Checked then
      vsql:=vsql + ' order by CLI.NOME, CON.DATA_EMISSAO';
   if RCliVencto.Checked then
      vsql:=vsql + ' order by CLI.NOME, CON.DATA_VENCTO';
   if RCliPagto.Checked then
      vsql:=vsql + ' order by CLI.NOME, CON.DATA_PAGO';
   if RConta.Checked then
      vsql:=vsql + ' order by CON.ID_CONTABANCO, CON.DATA_EMISSAO';
//------------------------------------------------------------------------------
   frContasPagar:=TfrContasPagar.create(self);
   with frContasPagar do
   begin
      Receber.Close;
      QReceber.SQL.Add(vsql);
      Receber.Params[0].Text:=vgCod_Empresa;
      Receber.Open;
//------------------------------------------------------------------------------
      vlData:='Período de: '+DataIni.Text+' até: '+Datafin.Text;
      lblData.Caption:=vlData;
      lblData2.Caption:=vlData;
      lblData3.Caption:=vlData;
      lblData4.Caption:=vlData;
      lblData5.Caption:=vlData;
      lblData6.Caption:=vlData;
      lblData7.Caption:=vlData;
      lblData8.Caption:=vlData;
      lblData9.Caption:=vlData;
      lblData10.Caption:=vlData;
      lblData11.Caption:=vlData;
      lblData12.Caption:=vlData;
      lblData13.Caption:=vlData;
      lblData14.Caption:=vlData;
//------------------------------------------------------------------------------
      if RRelacao.Checked then
      begin
        if REmissao.Checked then
           Receber1.Print;
        if RVencto.Checked then
           Receber2.Print;
        if RPagto.Checked then
           Receber3.Print;
        if RCliEmissao.Checked then
           Receber4.Print;
        if RCliVencto.Checked then
           Receber5.Print;
        if RCliPagto.Checked then
           Receber6.Print;
        if RConta.Checked then
           Receber13.Print;
      end;

      if RResumo.Checked then
      begin
        if REmissao.Checked then
           Receber7.Print;
        if RVencto.Checked then
           Receber8.Print;
        if RPagto.Checked then
           Receber9.Print;
        if RCliEmissao.Checked then
           Receber10.Print;
        if RCliVencto.Checked then
           Receber11.Print;
        if RCliPagto.Checked then
           Receber12.Print;
        if RConta.Checked then
           Receber14.Print;
      end;

//------------------------------------------------------------------------------
      Receber.Close;
      free;
   end;
end;

procedure TfIPagar.FormCreate(Sender: TObject);
begin
   DataIni.Text:=Inicio_Mes(datetoStr(Date));
   Datafin.Text:=Fim_Mes(datetoStr(Date));
end;

end.
