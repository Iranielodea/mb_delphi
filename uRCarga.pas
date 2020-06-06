unit uRCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, DB, ppCtrls, ppPrnabl, ppClass, ppDB, ppBands,
  ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, DBClient, Provider,
  ppViewr, ppStrtch, ppMemo, ppEndUsr, StdCtrls, jpeg, ppSubRpt, ppParameter,
  ppDesignLayer, ppRegion;

type
  TFRCarga = class(TForm)
    QCarga: TSQLQuery;
    dspCarga: TDataSetProvider;
    Carga: TClientDataSet;
    dsCarga: TDataSource;
    CargaCOD_AGENCIA: TIntegerField;
    CargaCOD_CLIENTE: TIntegerField;
    CargaCOD_CONTATO: TIntegerField;
    CargaCOD_FOR: TIntegerField;
    CargaCOD_MOTORISTA: TIntegerField;
    CargaDATA: TSQLTimeStampField;
    CargaID_CARGA: TIntegerField;
    CargaLETRA: TStringField;
    CargaNUM_CARGA: TIntegerField;
    CargaNUM_PEDIDO: TIntegerField;
    CargaQTDE: TFloatField;
    CargaQTDE_PEDIDO: TFloatField;
    CargaVALOR_CARREGA: TFloatField;
    CargaVALOR_FRETE: TFloatField;
    CargaVALOR_PEDIDO: TFloatField;
    CargaVISTO: TStringField;
    CargaNOME_FOR: TStringField;
    CargaNOME_CLIENTE: TStringField;
    CargaNOME_CONTATO: TStringField;
    CargaNOME_MOTORISTA: TStringField;
    Rel: TppReport;
    dbCarga: TppDBPipeline;
    CargaPLACA: TStringField;
    CargaFONE_CLIENTE: TStringField;
    CargaFONE_CONTATO: TStringField;
    CargaFONE_MOTORISTA: TStringField;
    CargaOBS: TStringField;
    desRel: TppDesigner;
    CargaCONTATO_INDICACAO: TStringField;
    CargaFONE_TRANSPORTADOR: TStringField;
    QCargaCOD_AGENCIA: TIntegerField;
    QCargaCOD_CLIENTE: TIntegerField;
    QCargaCOD_CONTATO: TIntegerField;
    QCargaCOD_FOR: TIntegerField;
    QCargaCOD_MOTORISTA: TIntegerField;
    QCargaDATA: TSQLTimeStampField;
    QCargaID_CARGA: TIntegerField;
    QCargaPLACA: TStringField;
    QCargaLETRA: TStringField;
    QCargaNUM_CARGA: TIntegerField;
    QCargaOBS: TStringField;
    QCargaNUM_PEDIDO: TIntegerField;
    QCargaQTDE: TFloatField;
    QCargaQTDE_PEDIDO: TFloatField;
    QCargaVALOR_CARREGA: TFloatField;
    QCargaVALOR_FRETE: TFloatField;
    QCargaVALOR_PEDIDO: TFloatField;
    QCargaCONTATO_INDICACAO: TStringField;
    QCargaVISTO: TStringField;
    QCargaNOME_FOR: TStringField;
    QCargaNOME_CLIENTE: TStringField;
    QCargaFONE_CLIENTE: TStringField;
    QCargaNOME_CONTATO: TStringField;
    QCargaFONE_CONTATO: TStringField;
    QCargaFONE_TRANSPORTADOR: TStringField;
    QCargaNOME_MOTORISTA: TStringField;
    QCargaFONE_MOTORISTA: TStringField;
    QCargaSALDO: TFloatField;
    QCargaARMAZEM: TStringField;
    CargaSALDO: TFloatField;
    CargaARMAZEM: TStringField;
    CargaC_VALORUNIT: TFloatField;
    EditValorUnit: TEdit;
    CargaC_ANO: TStringField;
    QObs: TSQLQuery;
    dsPonte: TDataSource;
    QObsTEXTO: TStringField;
    QObsNUM_LINHA: TIntegerField;
    CargaQObs: TDataSetField;
    dspObs: TDataSetProvider;
    Obs: TClientDataSet;
    dbObs: TppDBPipeline;
    dsObs: TDataSource;
    QCargaVALOR_VENDA: TFloatField;
    CargaVALOR_VENDA: TFloatField;
    QCargaEMAIL_CLIENTE: TStringField;
    CargaEMAIL_CLIENTE: TStringField;
    CargaC_OUTRAS_CARGAS: TStringField;
    QOutrasCargas: TSQLQuery;
    QOutrasCargasNUM_CARGA: TIntegerField;
    QOutrasCargasLETRA: TStringField;
    QCargaNOME_USINA: TStringField;
    CargaNOME_USINA: TStringField;
    QCargaPLACA_REBOQUE1: TStringField;
    QCargaPLACA_REBOQUE2: TStringField;
    QCargaPLACA_REBOQUE3: TStringField;
    CargaPLACA_REBOQUE1: TStringField;
    CargaPLACA_REBOQUE2: TStringField;
    CargaPLACA_REBOQUE3: TStringField;
    CargaC_Placas: TStringField;
    QContas: TSQLQuery;
    QContasNUM_PEDIDO: TIntegerField;
    QContasDATA_VENCTO: TSQLTimeStampField;
    QContasVALOR_PAGAR: TFloatField;
    QContasDESC_PAGTO: TStringField;
    dspContas: TDataSetProvider;
    Contas: TClientDataSet;
    dsContas: TDataSource;
    dbContas: TppDBPipeline;
    CargaQContas: TDataSetField;
    QCargaNUM_NF: TStringField;
    QCargaDATA_NF: TDateField;
    CargaNUM_NF: TStringField;
    CargaDATA_NF: TDateField;
    QCargaCTB_NUM_CONTA: TStringField;
    QCargaCTB_BANCO: TStringField;
    QCargaCTB_AGENCIA: TStringField;
    CargaCTB_NUM_CONTA: TStringField;
    CargaCTB_BANCO: TStringField;
    CargaCTB_AGENCIA: TStringField;
    QCargaCNPJ_CPF: TStringField;
    QCargaCREDITO_NF: TStringField;
    CargaCNPJ_CPF: TStringField;
    CargaCREDITO_NF: TStringField;
    QCargaCTB_CNPJ: TStringField;
    CargaCTB_CNPJ: TStringField;
    QCargaNUM_NOTA2: TStringField;
    QCargaIR: TFloatField;
    QCargaVALOR_NOTA2: TFloatField;
    CargaNUM_NOTA2: TStringField;
    CargaIR: TFloatField;
    CargaVALOR_NOTA2: TFloatField;
    QParcelas: TSQLQuery;
    QParcelasCARGA_ID: TIntegerField;
    QParcelasDIAS: TIntegerField;
    QParcelasFORMAPAGTO_ID: TIntegerField;
    QParcelasID: TIntegerField;
    QParcelasVALOR: TFloatField;
    QParcelasVENCTO: TSQLTimeStampField;
    QParcelasDESC_PAGTO: TStringField;
    dspParcelas: TDataSetProvider;
    Parcelas: TClientDataSet;
    dsParcelas: TDataSource;
    CargaQParcelas: TDataSetField;
    dbParcelas: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText18: TppDBText;
    ppImage1: TppImage;
    ppLabel19: TppLabel;
    ppDBText23: TppDBText;
    ppLabel49: TppLabel;
    ppShape5: TppShape;
    ppDBText24: TppDBText;
    ppLabel35: TppLabel;
    ppDBText16: TppDBText;
    ppLabel44: TppLabel;
    ppLabel47: TppLabel;
    ppDBText17: TppDBText;
    ppLine1: TppLine;
    ppLabel18: TppLabel;
    ppDBText6: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppRegion1: TppRegion;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppDBText26: TppDBText;
    ppDBText22: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppSummaryBand1: TppSummaryBand;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLine25: TppLine;
    ppLabel32: TppLabel;
    ppLine26: TppLine;
    ppLabel33: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppDBText21: TppDBText;
    ppShape4: TppShape;
    ppLine4: TppLine;
    ppLine30: TppLine;
    ppLabel5: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel48: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppDBText25: TppDBText;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppLabel41: TppLabel;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLabel8: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine3: TppLine;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    procedure RelPreviewFormCreate(Sender: TObject);
    procedure CargaCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OutrasCargas(inCarga, inLetra, inCodEmpresa: string);
  end;

var
  FRCarga: TFRCarga;

implementation

uses uDM;

var vlCargas: string;

{$R *.dfm}

procedure TFRCarga.RelPreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TFRCarga.CargaCalcFields(DataSet: TDataSet);
var
  sPlacas: string;
begin
   CargaC_VALORUNIT.Text:=EditValorUnit.Text;
   CargaC_ANO.Text:=formatdatetime('yyyy',dm.CargaDATA.AsDateTime);
   //if Carga.State = dsInternalCalc then
      CargaC_OUTRAS_CARGAS.Text := vlCargas;
   if Carga.State = dsInternalCalc then
   begin
      sPlacas := '';
      if CargaPLACA.AsString <> '' then
        sPlacas := sPlacas + CargaPLACA.AsString;

      if CargaPLACA_REBOQUE1.AsString <> '' then
        sPlacas := sPlacas + ' / ' + CargaPLACA_REBOQUE1.AsString;

      if CargaPLACA_REBOQUE2.AsString <> '' then
        sPlacas := sPlacas + ' / ' + CargaPLACA_REBOQUE2.AsString;

      if CargaPLACA_REBOQUE3.AsString <> '' then
        sPlacas := sPlacas + ' / ' + CargaPLACA_REBOQUE3.AsString;

      CargaC_Placas.AsString := sPlacas;

   end;
end;

procedure TFRCarga.OutrasCargas(inCarga, inLetra, inCodEmpresa: string);
begin
   vlCargas := '';
   if trim(inLetra) = '' then
   begin
      QOutrasCargas.close;
      QOutrasCargas.Params[0].Text := inCodEmpresa;
      QOutrasCargas.Params[1].Text := inCarga;
      QOutrasCargas.Open;

      vlCargas := '';
      if not QOutrasCargas.IsEmpty then
      begin
         while not QOutrasCargas.Eof do
         begin
            vlCargas := vlCargas + QOutrasCargasNUM_CARGA.Text + '-' + QOutrasCargasLETRA.text + ' ';
            QOutrasCargas.next;
         end;
      end;
      QOutrasCargas.Close;
   end;
end;

procedure TFRCarga.FormCreate(Sender: TObject);
begin
   vlCargas := '';
end;

end.
