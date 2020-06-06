unit uRPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, DB, DBClient, Provider, ppCtrls, ppDB,
  ppPrnabl, ppClass, ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppStrtch, ppMemo, ppSubRpt, ppViewr, ppEndUsr, jpeg, ppParameter,
  ppDesignLayer;

type
  TfRPedido = class(TForm)
    Qped: TSQLQuery;
    dspPed: TDataSetProvider;
    Ped: TClientDataSet;
    QpedEMP_NOME: TStringField;
    QpedEMP_ENDERECO: TStringField;
    QpedEMP_NUMERO: TStringField;
    QpedEMP_CEP: TStringField;
    QpedEMP_DESC_CIDADE: TStringField;
    QpedEMP_ESTADO: TStringField;
    QpedEMP_FONE: TStringField;
    QpedEMP_FAX: TStringField;
    QpedEMP_EMAIL: TStringField;
    QpedPED_NUM_PEDIDO: TIntegerField;
    QpedPED_DATA: TSQLTimeStampField;
    QpedPED_OBS: TStringField;
    QpedPED_TOTAL_LIQUIDO: TFloatField;
    QpedCLI_NOME: TStringField;
    QpedCLI_ENDERECO: TStringField;
    QpedCLI_BAIRRO: TStringField;
    QpedCLI_NUMERO: TStringField;
    QpedCLI_CEP: TStringField;
    QpedCLI_COMPLEMENTO: TStringField;
    QpedCLI_CNPJ: TStringField;
    QpedCLI_INSC_ESTADUAL: TStringField;
    QpedCLI_DESC_CIDADE: TStringField;
    QpedCLI_UF: TStringField;
    QpedFOR_NOME: TStringField;
    QpedFOR_FONE: TStringField;
    QpedFOR_ENDERECO: TStringField;
    QpedFOR_NUMERO: TStringField;
    QpedFOR_BAIRRO: TStringField;
    QpedFOR_CEP: TStringField;
    QpedFOR_COMPLEMENTO: TStringField;
    QpedFOR_UF: TStringField;
    QpedFOR_DESC_CIDADE: TStringField;
    QpedITE_DESC_PRODUTO: TStringField;
    QpedITE_QTDE: TFloatField;
    QpedITE_VALOR: TFloatField;
    QpedITE_VALOR_TOTAL: TFloatField;
    QpedITE_UN: TStringField;
    PedEMP_NOME: TStringField;
    PedEMP_ENDERECO: TStringField;
    PedEMP_NUMERO: TStringField;
    PedEMP_CEP: TStringField;
    PedEMP_DESC_CIDADE: TStringField;
    PedEMP_ESTADO: TStringField;
    PedEMP_FONE: TStringField;
    PedEMP_FAX: TStringField;
    PedEMP_EMAIL: TStringField;
    PedPED_NUM_PEDIDO: TIntegerField;
    PedPED_DATA: TSQLTimeStampField;
    PedPED_OBS: TStringField;
    PedPED_TOTAL_LIQUIDO: TFloatField;
    PedCLI_NOME: TStringField;
    PedCLI_ENDERECO: TStringField;
    PedCLI_BAIRRO: TStringField;
    PedCLI_NUMERO: TStringField;
    PedCLI_CEP: TStringField;
    PedCLI_COMPLEMENTO: TStringField;
    PedCLI_CNPJ: TStringField;
    PedCLI_INSC_ESTADUAL: TStringField;
    PedCLI_DESC_CIDADE: TStringField;
    PedCLI_UF: TStringField;
    PedFOR_NOME: TStringField;
    PedFOR_FONE: TStringField;
    PedFOR_ENDERECO: TStringField;
    PedFOR_NUMERO: TStringField;
    PedFOR_BAIRRO: TStringField;
    PedFOR_CEP: TStringField;
    PedFOR_COMPLEMENTO: TStringField;
    PedFOR_UF: TStringField;
    PedFOR_DESC_CIDADE: TStringField;
    PedITE_DESC_PRODUTO: TStringField;
    PedITE_QTDE: TFloatField;
    PedITE_VALOR: TFloatField;
    PedITE_VALOR_TOTAL: TFloatField;
    PedITE_UN: TStringField;
    PedC_ENDERECO_FOR: TStringField;
    PedC_ENDERECO_CLI: TStringField;
    PedC_ENDERECO_EMP: TStringField;
    dsPed: TDataSource;
    Tab: TClientDataSet;
    dspTab: TDataSetProvider;
    dsTab: TDataSource;
    dbPed: TppDBPipeline;
    RelPed: TppReport;
    dbTab: TppDBPipeline;
    QTab: TSQLQuery;
    QTabDESC_PAGTO: TStringField;
    dsPonte: TDataSource;
    TabDESC_PAGTO: TStringField;
    QCond: TSQLQuery;
    QCondDESC_CONDICAO: TStringField;
    PedC_DESC_CONDICAO: TStringField;
    QTabVALOR_PAGAR: TFloatField;
    QTabDATA_VENCTO: TSQLTimeStampField;
    TabVALOR_PAGAR: TFloatField;
    TabDATA_VENCTO: TSQLTimeStampField;
    PedQTab: TDataSetField;
    QpedEMP_CNPJ: TStringField;
    PedEMP_CNPJ: TStringField;
    desRel: TppDesigner;
    QpedCLI_EMAIL: TStringField;
    PedCLI_EMAIL: TStringField;
    QTabDIAS: TIntegerField;
    TabDIAS: TIntegerField;
    TabC_DIAS: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppDBText8: TppDBText;
    ppLabel3: TppLabel;
    ppDBText9: TppDBText;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLine3: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine5: TppLine;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel27: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppImage1: TppImage;
    ppLabel24: TppLabel;
    ppDBText30: TppDBText;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    QpedCLI_FONE: TStringField;
    PedCLI_FONE: TStringField;
    procedure PedCalcFields(DataSet: TDataSet);
    procedure RelPedPreviewFormCreate(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRPedido: TfRPedido;

implementation

uses uDM;

{$R *.dfm}

procedure TfRPedido.PedCalcFields(DataSet: TDataSet);
var vend: string;
begin
   if Ped.State = dsInternalCalc then
   begin
      Qcond.Close;
      Qcond.Params[0].Text:=PedPED_NUM_PEDIDO.Text;
      Qcond.Open;
      PedC_DESC_CONDICAO.Text:=QCondDESC_CONDICAO.Text;
      Qcond.Close;
   end;
   vend:='';
//------------------------------------------------------------------------------
// empresa
   if PedEMP_ENDERECO.Text <> '' then
      vend:=PedEMP_ENDERECO.Text;
   if PedEMP_NUMERO.Text <> '' then
      vend:=vend + ', '+PedEMP_NUMERO.Text;
   PedC_ENDERECO_EMP.Text:=vend;
//------------------------------------------------------------------------------
// Fornecedor
   vend:='';
   if PedFOR_ENDERECO.Text <> '' then
      vend:=PedFOR_ENDERECO.Text;
   if PedFOR_NUMERO.Text <> '' then
      vend:=vend + ', '+PedFOR_NUMERO.Text;
   if PedFOR_COMPLEMENTO.Text <> '' then
      vend:=vend + ', '+PedFOR_COMPLEMENTO.Text;
   PedC_ENDERECO_FOR.Text:=vend;
//------------------------------------------------------------------------------
// Cliente
   vend:='';
   if PedCLI_ENDERECO.Text <> '' then
      vend:=PedCLI_ENDERECO.Text;
   if PedCLI_NUMERO.Text <> '' then
      vend:=vend + ', '+PedCLI_NUMERO.Text;
   if PedCLI_COMPLEMENTO.Text <> '' then
      vend:=vend + ', '+PedCLI_COMPLEMENTO.Text;
   PedC_ENDERECO_CLI.Text:=vend;


end;

procedure TfRPedido.RelPedPreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TfRPedido.TabCalcFields(DataSet: TDataSet);
begin
  if Tab.State = dsInternalCalc then
    TabC_DIAS.AsString := TabDIAS.AsString + ' DIAS';
end;

end.
