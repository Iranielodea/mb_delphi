unit uRComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  DB, DBClient, Provider, SqlExpr, ppParameter, ppBands, ppCache, ppCtrls,
  ppPrnabl, ppVar, ppDesignLayer;

type
  TfrComissao = class(TForm)
    QComissao: TSQLQuery;
    dspComissao: TDataSetProvider;
    cdsComissao: TClientDataSet;
    dsComissao: TDataSource;
    RelComissao: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    cdsComissaoNUM_CARGA: TIntegerField;
    cdsComissaoNUM_CARGA_LETRA: TStringField;
    cdsComissaoNUM_PEDIDO: TIntegerField;
    cdsComissaoNOME: TStringField;
    cdsComissaoTIPO_FOR: TStringField;
    cdsComissaoQTDE_PEDIDO: TFloatField;
    cdsComissaoQTDE_CARREG: TFloatField;
    cdsComissaoVALOR_UNIT: TFloatField;
    cdsComissaoVALOR_PEDIDO: TFloatField;
    cdsComissaoBASE_CALCULO: TFloatField;
    cdsComissaoPERC_COMISSAO: TFloatField;
    cdsComissaoVALOR_COMISSAO: TFloatField;
    cdsComissaoSALDO: TFloatField;
    cdsComissaoFATURAMENTO: TStringField;
    cdsComissaoDATA: TSQLTimeStampField;
    cdsComissaoLETRA: TStringField;
    cdsComissaoSIGLA: TStringField;
    dbComissao: TppDBPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText2: TppDBText;
    ppLabel21: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel22: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    lblData: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine3: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    cdsComissaoCOD_FOR: TIntegerField;
    cdsComissaoNOME_FORN: TStringField;
    cdsComissaoDESC_TIPO: TStringField;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppLine4: TppLine;
    cdsComissaoC_Faturamento: TStringField;
    cdsComissaoSITUACAO: TStringField;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppLabel31: TppLabel;
    ppLine5: TppLine;
    cdsComissaoDATA_NF: TDateField;
    QVendedor: TSQLQuery;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField7: TFloatField;
    StringField4: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField4: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    dsVendedor: TDataSource;
    RelVendedor: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel25: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    lbDataVendedor: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine8: TppLine;
    ppLabel52: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel57: TppLabel;
    ppLine9: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel58: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc10: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLabel59: TppLabel;
    ppDBCalc20: TppDBCalc;
    ppParameterList2: TppParameterList;
    dbVendedor: TppDBPipeline;
    cdsVendedorVALOR_UNIT: TFloatField;
    cdsVendedorCOD_VENDEDOR: TIntegerField;
    cdsVendedorNOME_VENDEDOR: TStringField;
    cdsVendedorTOTAL_COMISSAO: TFloatField;
    ppDBCalc11: TppDBCalc;
    cdsVendedorSITUACAO: TStringField;
    cdsVendedorC_Faturamento: TStringField;
    cdsVendedorDATA_NF: TDateField;
    ppLine10: TppLine;
    cdsComissaoNUM_NF: TStringField;
    cdsVendedorNUM_NF: TStringField;
    cdsVendedorUNIDADE: TStringField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText23: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppLine11: TppLine;
    ppLine12: TppLine;
    procedure cdsComissaoCalcFields(DataSet: TDataSet);
    procedure cdsVendedorCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImpressaoComissao(inDataInicial, inDataFinal: string; CodFornecedor:
        Integer);
    procedure ImpressaoComissaoVendedor(inDataInicial, inDataFinal: string;
        CodVendedor: Integer; inUnidade: string);

  end;

var
  frComissao: TfrComissao;

implementation

uses uDM;

{$R *.dfm}

procedure TfrComissao.cdsComissaoCalcFields(DataSet: TDataSet);
begin
  if cdsComissaoSITUACAO.AsString = 'C' then
    cdsComissaoC_Faturamento.AsString := 'Cancelado'
  else
    cdsComissaoC_Faturamento.AsString := cdsComissaoDATA_NF.AsString;
end;

procedure TfrComissao.cdsVendedorCalcFields(DataSet: TDataSet);
begin
  if cdsVendedorSITUACAO.AsString = 'C' then
    cdsVendedorC_Faturamento.AsString := 'Cancelado'
  else
    cdsVendedorC_Faturamento.AsString := cdsVendedorDATA_NF.AsString;
end;

{ TfrComissao }

procedure TfrComissao.ImpressaoComissao(inDataInicial, inDataFinal: string;
    CodFornecedor: Integer);
begin
  cdsComissao.Close;

  cdsComissao.Params.ParamByName('COD_EMPRESA').AsString := vgCod_Empresa;
  cdsComissao.Params.ParamByName('DATAINI').AsDate := StrToDate(inDataInicial);
  cdsComissao.Params.ParamByName('DATAFIN').AsDate := StrToDate(inDataFinal);

  if CodFornecedor > 0 then
    QComissao.SQL.Add(' AND forn.cod_for = ' + IntToStr(CodFornecedor));

  cdsComissao.Open;

  lblData.Caption := 'Período de: ' + inDataInicial + ' Até ' + inDataFinal;
  RelComissao.Print;
  cdsComissao.Close;
end;

procedure TfrComissao.ImpressaoComissaoVendedor(inDataInicial, inDataFinal:
    string; CodVendedor: Integer; inUnidade: string);
begin
  cdsVendedor.Close;

  cdsVendedor.Params.ParamByName('COD_EMPRESA').AsString := vgCod_Empresa;
  cdsVendedor.Params.ParamByName('DATAINI').AsDate := StrToDate(inDataInicial);
  cdsVendedor.Params.ParamByName('DATAFIN').AsDate := StrToDate(inDataFinal);

  if CodVendedor > 0 then
    QVendedor.SQL.Add(' AND ped.cod_vendedor = ' + IntToStr(CodVendedor));

  if inUnidade.Trim() <> '' then
  begin
    QVendedor.SQL.Add(' AND car.unidade Containing(' + QuotedStr(inUnidade) + ')');
  end;

  cdsVendedor.Open;

  lbDataVendedor.Caption := 'Período de: ' + inDataInicial + ' Até ' + inDataFinal;
  RelVendedor.Print;
  cdsVendedor.Close;
end;

end.
