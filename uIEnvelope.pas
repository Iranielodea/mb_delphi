unit uIEnvelope;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, FMTBcd, DB, SqlExpr,
  ppCtrls, ppPrnabl, ppClass, ppDB, ppCache, ppBands, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, DBClient, Provider, MaskUtils, jpeg, ppEndUsr,ppViewr,
  ppDesignLayer, ppParameter;

type
   TImpressao = (tpCliente, tpTerceiro, tpFornecedor);
  TfIEnvelope = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Lista: TCheckListBox;
    Panel1: TPanel;
    butDesmarcar: TBitBtn;
    RPeq: TRadioButton;
    RMed: TRadioButton;
    RGrande: TRadioButton;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    QClientes: TSQLQuery;
    QClientesCOD_CLIENTE: TIntegerField;
    QClientesNOME: TStringField;
    Qenvelope: TSQLQuery;
    dspEnvelope: TDataSetProvider;
    Envelope: TClientDataSet;
    dbEnvelope: TppDBPipeline;
    RelEnvelope: TppReport;
    dsEnvelope: TDataSource;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppDBText5: TppDBText;
    EnvelopeNOME: TStringField;
    EnvelopeENDERECO: TStringField;
    EnvelopeNUMERO: TStringField;
    EnvelopeCOMPLEMENTO: TStringField;
    EnvelopeBAIRRO: TStringField;
    EnvelopeCEP: TStringField;
    EnvelopeDESC_CIDADE: TStringField;
    EnvelopeSIGLA: TStringField;
    EnvelopeC_ENDERECO: TStringField;
    EnvelopeC_CIDADE: TStringField;
    ppImage1: TppImage;
    desEnvelope: TppDesigner;
    butConfig: TBitBtn;
    dtRel: TClientDataSet;
    dtRelNOME: TStringField;
    dtRelENDERECO: TStringField;
    dtRelNUMERO: TStringField;
    dtRelCOMPLEMENTO: TStringField;
    dtRelBAIRRO: TStringField;
    dtRelCEP: TStringField;
    dtRelDESC_CIDADE: TStringField;
    dtRelSIGLA: TStringField;
    dtRelC_ENDERECO: TStringField;
    dtRelC_CIDADE: TStringField;
    QTerceiro: TSQLQuery;
    QTerceiroCOD_TERCEIRO: TIntegerField;
    QTerceiroNOME: TStringField;
    GroupBox3: TGroupBox;
    RadCliente: TRadioButton;
    RadFornecedor: TRadioButton;
    RadTerceiro: TRadioButton;
    QFornecedor: TSQLQuery;
    QFornecedorCOD_FOR: TIntegerField;
    QFornecedorNOME: TStringField;
    QImpFornecedor: TSQLQuery;
    dspFornecedor: TDataSetProvider;
    ImpFornecedor: TClientDataSet;
    ImpFornecedorNOME: TStringField;
    ImpFornecedorENDERECO: TStringField;
    ImpFornecedorNUMERO: TStringField;
    ImpFornecedorCOMPLEMENTO: TStringField;
    ImpFornecedorBAIRRO: TStringField;
    ImpFornecedorCEP: TStringField;
    ImpFornecedorDESC_CIDADE: TStringField;
    ImpFornecedorSIGLA: TStringField;
    QImpTerceiro: TSQLQuery;
    dspImpTerceiro: TDataSetProvider;
    ImpTerceiro: TClientDataSet;
    ImpTerceiroNOME: TStringField;
    ImpTerceiroENDERECO: TStringField;
    ImpTerceiroNUMERO: TStringField;
    ImpTerceiroCOMPLEMENTO: TStringField;
    ImpTerceiroBAIRRO: TStringField;
    ImpTerceiroCEP: TStringField;
    ImpTerceiroDESC_CIDADE: TStringField;
    ImpTerceiroSIGLA: TStringField;
    ImpFornecedorC_ENDERECO: TStringField;
    ImpFornecedorC_CIDADE: TStringField;
    ImpTerceiroC_ENDERECO: TStringField;
    ImpTerceiroC_CIDADE: TStringField;
    procedure butSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butDesmarcarClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure EnvelopeCalcFields(DataSet: TDataSet);
    procedure butConfigClick(Sender: TObject);
    procedure RelEnvelopePreviewFormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadClienteClick(Sender: TObject);
    procedure RadTerceiroClick(Sender: TObject);
    procedure RadFornecedorClick(Sender: TObject);
    procedure ImpFornecedorCalcFields(DataSet: TDataSet);
    procedure ImpTerceiroCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure PreencheListaCliente;
    procedure PreencheListaTerceiro;
    procedure PreencheListaFornecedores;

    procedure ImprimeCliente;
    procedure ImprimeFornecedor;
    procedure ImprimeTerceiro;

    procedure preencheTabela(Tabela: TClientDataSet);

  public
    { Public declarations }
    TipoImpressao: TImpressao;
  end;

var
  fIEnvelope: TfIEnvelope;

implementation

uses uDM, UUtil;

{$R *.dfm}

procedure TfIEnvelope.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfIEnvelope.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure TfIEnvelope.butDesmarcarClick(Sender: TObject);
var i: integer;
begin
   for i:=0 to lista.Items.Count-1 do
   begin
      if Lista.Checked[i] then
         Lista.Checked[i]:=false;
   end;
end;

procedure TfIEnvelope.butImprimirClick(Sender: TObject);
var i: integer;
   vlCodigo: String;
begin

   if TipoImpressao = tpCliente then
      ImprimeCliente;
   if TipoImpressao = tpFornecedor then
      ImprimeFornecedor;
   if TipoImpressao = tpTerceiro then
      ImprimeTerceiro;

//------------------------------------------------------------------------------

   if RPeq.Checked then
      RelEnvelope.Template.FileName:='EnvelopeP.rtm';
   if RMed.Checked then
      RelEnvelope.Template.FileName:='EnvelopeM.rtm';
   if RGrande.Checked then
      RelEnvelope.Template.FileName:='EnvelopeG.rtm';

   RelEnvelope.Template.LoadFromFile;

   RelEnvelope.Print;

end;

procedure TfIEnvelope.EnvelopeCalcFields(DataSet: TDataSet);
var vlCep: String;
begin
   vlCep:=formatMaskText('#####-###;0;_',EnvelopeCEP.Text);
   EnvelopeC_ENDERECO.Text:=EnvelopeENDERECO.text + ' ' + EnvelopeNUMERO.Text + ' ' + EnvelopeCOMPLEMENTO.Text;
   EnvelopeC_CIDADE.Text:=vlCep + ' - ' +EnvelopeDESC_CIDADE.text + ' - ' + EnvelopeSIGLA.text;
end;

procedure TfIEnvelope.butConfigClick(Sender: TObject);
begin
   desEnvelope.Show;
end;

procedure TfIEnvelope.RelEnvelopePreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TfIEnvelope.FormShow(Sender: TObject);
begin
   PreencheListaCliente;
end;

procedure TfIEnvelope.PreencheListaCliente;
var
   vlNome: String;
begin
   TipoImpressao := tpCliente;
   Lista.clear;
   QClientes.Close;
   QClientes.open;
   while not QClientes.Eof do
   begin
      vlNome:=copy(QClientesNOME.Text+StringOfChar(' ',50),1,50);
      Lista.Items.Add(vlNome + ' ' + QClientesCOD_CLIENTE.Text);
      QClientes.Next;
   end;
   QClientes.Close;
end;

procedure TfIEnvelope.PreencheListaTerceiro;
var
   vlNome: String;
begin
   TipoImpressao := tpTerceiro;
   Lista.Clear;
   QTerceiro.Close;
   QTerceiro.open;
   while not QTerceiro.Eof do
   begin
      vlNome:=copy(QTerceiroNOME.Text+StringOfChar(' ',50),1,50);
      Lista.Items.Add(vlNome + ' ' + QTerceiroCOD_TERCEIRO.Text);
      QTerceiro.Next;
   end;
   QTerceiro.Close;
end;

procedure TfIEnvelope.RadClienteClick(Sender: TObject);
begin
   PreencheListaCliente;
end;

procedure TfIEnvelope.RadTerceiroClick(Sender: TObject);
begin
   PreencheListaTerceiro;
end;

procedure TfIEnvelope.PreencheListaFornecedores;
var
   vlNome: String;
begin
   TipoImpressao := tpFornecedor;
   Lista.clear;
   QFornecedor.Close;
   QFornecedor.open;
   while not QFornecedor.Eof do
   begin
      vlNome:=copy(QFornecedorNOME.Text+StringOfChar(' ',50),1,50);
      Lista.Items.Add(vlNome + ' ' + QFornecedorCOD_FOR.Text);
      QFornecedor.Next;
   end;
   QFornecedor.Close;
end;

procedure TfIEnvelope.RadFornecedorClick(Sender: TObject);
begin
   PreencheListaFornecedores;
end;

procedure TfIEnvelope.ImprimeCliente;
var i: integer;
   vlCodigo: String;
begin
   if TipoImpressao <> tpCliente then
      exit;

   Executa('update CLIENTE set MARCAR = ''N''');
   for i:=0 to lista.Items.Count-1 do
   begin
      if Lista.Checked[i] then
      begin
         vlCodigo:=trim(copy(Lista.Items[i],52,5));
         Executa('update CLIENTE set MARCAR = ''S'' where COD_CLIENTE = '+vlCodigo);
      end;
   end;

   preencheTabela(Envelope);
end;

procedure TfIEnvelope.ImprimeFornecedor;
var i: integer;
   vlCodigo: String;
begin
   if TipoImpressao <> tpFornecedor then
      exit;

   Executa('update FORNECEDOR set MARCAR = ''N''');
   for i:=0 to lista.Items.Count-1 do
   begin
      if Lista.Checked[i] then
      begin
         vlCodigo:=trim(copy(Lista.Items[i],52,5));
         Executa('update FORNECEDOR set MARCAR = ''S'' where COD_FOR = '+vlCodigo);
      end;
   end;

   preencheTabela(ImpFornecedor);
end;

procedure TfIEnvelope.ImprimeTerceiro;
var i: integer;
   vlCodigo: String;
begin
   if TipoImpressao <> tpTerceiro then
      exit;

   Executa('update TERCEIRO set MARCAR = ''N''');
   for i:=0 to lista.Items.Count-1 do
   begin
      if Lista.Checked[i] then
      begin
         vlCodigo:=trim(copy(Lista.Items[i],52,5));
         Executa('update TERCEIRO set MARCAR = ''S'' where COD_TERCEIRO = '+vlCodigo);
      end;
   end;

   preencheTabela(ImpTerceiro);
end;

procedure TfIEnvelope.preencheTabela(Tabela: TClientDataSet);
begin
   dtRel.First;
   while not dtRel.Eof do
      dtRel.Delete;

   Tabela.Close;
   Tabela.Open;
   while not Tabela.Eof do
   begin
      dtRel.Append;
      dtRelNOME.Text := Tabela.FieldByName('NOME').Text;
      dtRelENDERECO.text := Tabela.FieldByName('ENDERECO').text;
      dtRelNUMERO.Text := Tabela.FieldByName('NUMERO').Text;
      dtRelCOMPLEMENTO.Text := Tabela.FieldByName('COMPLEMENTO').Text;
      dtRelBAIRRO.Text := Tabela.FieldByName('BAIRRO').Text;
      dtRelCEP.Text := Tabela.FieldByName('CEP').Text;
      dtRelDESC_CIDADE.Text := Tabela.FieldByName('DESC_CIDADE').Text;
      dtRelSIGLA.Text := Tabela.FieldByName('SIGLA').Text;
      dtRelC_ENDERECO.Text := Tabela.FieldByName('C_ENDERECO').Text;
      dtRelC_CIDADE.Text := Tabela.FieldByName('C_CIDADE').Text;
      dtRel.Post;
      Tabela.Next;
   end;
end;

procedure TfIEnvelope.ImpFornecedorCalcFields(DataSet: TDataSet);
var vlCep: String;
begin
   vlCep:=formatMaskText('#####-###;0;_',ImpFornecedorCEP.Text);
   ImpFornecedorC_ENDERECO.Text:=ImpFornecedorENDERECO.text + ' ' + ImpFornecedorNUMERO.Text + ' ' + ImpFornecedorCOMPLEMENTO.Text;
   ImpFornecedorC_CIDADE.Text:=vlCep + ' - ' +ImpFornecedorDESC_CIDADE.text + ' - ' + ImpFornecedorSIGLA.text;
end;

procedure TfIEnvelope.ImpTerceiroCalcFields(DataSet: TDataSet);
var vlCep: String;
begin
   vlCep:=formatMaskText('#####-###;0;_',ImpTerceiroCEP.Text);
   ImpTerceiroC_ENDERECO.Text:=ImpTerceiroENDERECO.text + ' ' + ImpTerceiroNUMERO.Text + ' ' + ImpTerceiroCOMPLEMENTO.Text;
   ImpTerceiroC_CIDADE.Text:=vlCep + ' - ' +ImpTerceiroDESC_CIDADE.text + ' - ' + ImpTerceiroSIGLA.text;
end;

end.
