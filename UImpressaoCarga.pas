unit UImpressaoCarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Data.FMTBcd, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Data.SqlExpr, ppDesignLayer, ppParameter, ppCtrls,
  ppPrnabl, ppBands, ppCache, System.MaskUtils, ppEndUsr, udmParametros;

type
  TfImpressaoCarga = class(TForm)
    QCarga: TSQLQuery;
    cdsCarga: TClientDataSet;
    dspCarga: TDataSetProvider;
    dsCarga: TDataSource;
    dbCarga: TppDBPipeline;
    RepCarga: TppReport;
    cdsCargaCAR_ID: TIntegerField;
    cdsCargaCAR_USINA: TStringField;
    cdsCargaCAR_COMPLUNIDADE: TStringField;
    cdsCargaCAR_DATA: TSQLTimeStampField;
    cdsCargaCAR_NUMPEDIDO: TIntegerField;
    cdsCargaCAR_OBS: TStringField;
    cdsCargaCLI_NOME: TStringField;
    cdsCargaCLI_ENDERECO: TStringField;
    cdsCargaCLI_NUMERO: TStringField;
    cdsCargaCLI_BAIRRO: TStringField;
    cdsCargaCLI_CEP: TStringField;
    cdsCargaCLI_CIDADE: TStringField;
    cdsCargaCLI_CNPJ: TStringField;
    cdsCargaCLI_TELEFONE: TStringField;
    cdsCargaCLI_EMAIL: TStringField;
    cdsCargaCLI_UF: TStringField;
    cdsCargaTRA_NOME: TStringField;
    cdsCargaTRA_ENDERECO: TStringField;
    cdsCargaTRA_BAIRRO: TStringField;
    cdsCargaTRA_CIDADE: TStringField;
    cdsCargaTRA_CEP: TStringField;
    cdsCargaTRA_FONE1: TStringField;
    cdsCargaTRA_FAX: TStringField;
    cdsCargaTRA_CNPJ: TStringField;
    cdsCargaTRA_ANTT: TStringField;
    cdsCargaTRA_RENAVAN: TStringField;
    cdsCargaTRA_EMAIL: TStringField;
    cdsCargaMOT_NOME: TStringField;
    cdsCargaMOT_CPF: TStringField;
    cdsCargaMOT_CNH: TStringField;
    cdsCargaMOT_PLACA: TStringField;
    cdsCargaMOT_REBOQUE1: TStringField;
    cdsCargaMOT_REBOQUE2: TStringField;
    cdsCargaMOT_REBOQUE3: TStringField;
    cdsCargaCTE_NOME: TStringField;
    cdsCargaCTE_ENDERECO: TStringField;
    cdsCargaCTE_BAIRRO: TStringField;
    cdsCargaCTE_CIDADE: TStringField;
    cdsCargaCTE_UF: TStringField;
    cdsCargaCTE_TELEFONE: TStringField;
    cdsCargaCTE_FAX: TStringField;
    cdsCargaCTE_CNPJ: TStringField;
    cdsCargaCTE_IE: TStringField;
    cdsCargaCTE_ANTT: TStringField;
    cdsCargaCTE_EMAIL: TStringField;
    cdsCargaENTR_ENDERECO: TStringField;
    cdsCargaENTR_NUMERO: TStringField;
    cdsCargaENTR_BAIRRO: TStringField;
    cdsCargaENTR_CEP: TStringField;
    cdsCargaENTR_CIDADE: TStringField;
    cdsCargaENTR_UF: TStringField;
    cdsCargaC_CLI_ENDERECO: TStringField;
    cdsCargaC_ENTR_ENDERECO: TStringField;
    cdsCargaC_Placas: TStringField;
    cdsCargaC_CIDADE_DATA: TStringField;
    cdsCargaTRA_UF: TStringField;
    cdsCargaCTE_CEP: TStringField;
    cdsCargaC_TRA_CIDADE_UF: TStringField;
    cdsCargaC_CTE_CIDADE_UF: TStringField;
    cdsCargaCAR_QTDE: TFloatField;
    cdsCargaDESC_UNIDADE: TStringField;
    cdsCargaC_QTDE_UNIDADE: TStringField;
    desRel: TppDesigner;
    cdsCargaMOT_RENAVAN: TStringField;
    cdsCargaUSI_NOME: TStringField;
    cdsCargaUSI_CNPJ: TStringField;
    cdsCargaUSI_FONE: TStringField;
    cdsCargaUSI_EMAIL: TStringField;
    cdsCargaUSI_ENDERECO: TStringField;
    cdsCargaUSI_CIDADE: TStringField;
    cdsCargaADQ_NOME: TStringField;
    cdsCargaADQ_CNPJ: TStringField;
    cdsCargaADQ_CEP: TStringField;
    cdsCargaADQ_FONE: TStringField;
    cdsCargaADQ_EMAIL: TStringField;
    cdsCargaADQ_ENDERECO: TStringField;
    cdsCargaADQ_CIDADE: TStringField;
    cdsCargaC_USI_RAZAO: TStringField;
    cdsCargaC_USI_CIDADE: TStringField;
    cdsCargaC_ADQ_RAZAO: TStringField;
    cdsCargaC_ADQ_CIDADE: TStringField;
    cdsCargaUSI_CEP: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppLabel19: TppLabel;
    ppDBText17: TppDBText;
    ppLabel20: TppLabel;
    ppDBText18: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText19: TppDBText;
    ppLabel24: TppLabel;
    ppDBText21: TppDBText;
    ppLabel25: TppLabel;
    ppDBText22: TppDBText;
    ppLabel26: TppLabel;
    ppDBText23: TppDBText;
    ppLabel27: TppLabel;
    ppDBText24: TppDBText;
    ppLabel28: TppLabel;
    ppDBText25: TppDBText;
    ppLabel29: TppLabel;
    ppDBText26: TppDBText;
    ppLabel30: TppLabel;
    ppDBText27: TppDBText;
    ppLabel31: TppLabel;
    ppDBText28: TppDBText;
    ppLabel32: TppLabel;
    ppDBText29: TppDBText;
    ppLabel34: TppLabel;
    ppDBText31: TppDBText;
    ppLabel35: TppLabel;
    ppDBText32: TppDBText;
    ppLabel36: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLine1: TppLine;
    ppLabel37: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppLabel33: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBText30: TppDBText;
    ppLabel40: TppLabel;
    ppDBText36: TppDBText;
    ppLabel41: TppLabel;
    ppDBText37: TppDBText;
    cdsCargaCLI_ENDERECOCOMPLETO: TStringField;
    cdsCargaCLI_CIDADECOMPLETA: TStringField;
    cdsCargaTRA_ENDERECOCOMPLETO: TStringField;
    cdsCargaTRA_CIDADECOMPLETA: TStringField;
    cdsCargaC_CLI_CIDADE_COMPLETO: TStringField;
    cdsCargaC_TRA_ENDERECO_COMPLETO: TStringField;
    cdsCargaC_TRA_CIDADE_COMPLETO: TStringField;
    cdsCargaC_CLI_RAZAO: TStringField;
    cdsCargaC_TRA_RAZAO: TStringField;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    cdsCargaC_MOT_NOME: TStringField;
    cdsCargaTRA_CPF: TStringField;
    procedure cdsCargaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirOrdem(IdCarga, NumCarga: Integer; PDF: Boolean);
  end;

var
  fImpressaoCarga: TfImpressaoCarga;

implementation

{$R *.dfm}

{ TfImpressaoCarga }

procedure TfImpressaoCarga.cdsCargaCalcFields(DataSet: TDataSet);
var
  sCliEndereco: string;
  sCEP: string;
  sPlacas: string;
  sDocumentoTrans: string;
begin
  if cdsCarga.State = dsInternalCalc then
  begin
    sCliEndereco := cdsCargaCLI_ENDERECO.AsString;
    if cdsCargaCLI_NUMERO.AsString <> '' then
      sCliEndereco := sCliEndereco + ', ' + cdsCargaCLI_NUMERO.AsString;
    if cdsCargaCLI_BAIRRO.AsString <> '' then
      sCliEndereco := sCliEndereco + ' - ' + cdsCargaCLI_BAIRRO.AsString;
//    if cdsCargaCLI_CEP.AsString <> '' then
//    begin
//      sCEP := FormatMaskText('00000-000;0;_', cdsCargaCLI_CEP.AsString);
//      sCliEndereco := sCliEndereco + ' - ' +  sCEP;
//    end;
//    if cdsCargaCLI_CIDADE.AsString <> '' then
//      sCliEndereco := sCliEndereco + ' - ' + cdsCargaCLI_CIDADE.AsString;
//    if cdsCargaCLI_UF.AsString <> '' then
//      sCliEndereco := sCliEndereco + ' - ' + cdsCargaCLI_UF.AsString;

    cdsCargaC_CLI_ENDERECO.AsString := sCliEndereco;
//==============================================================================
    cdsCargaC_MOT_NOME.AsString := cdsCargaMOT_NOME.AsString + ' - ' + FormatMaskText('###.###.###-##;0;_', cdsCargaMOT_CPF.AsString);
    sPlacas := cdsCargaMOT_PLACA.AsString;
    if cdsCargaMOT_REBOQUE1.AsString <> '' then
      sPlacas := sPlacas + ', ' + cdsCargaMOT_REBOQUE1.AsString;
    if cdsCargaMOT_REBOQUE2.AsString <> '' then
      sPlacas := sPlacas + ', ' + cdsCargaMOT_REBOQUE2.AsString;
    if cdsCargaMOT_REBOQUE3.AsString <> '' then
      sPlacas := sPlacas + ', ' + cdsCargaMOT_REBOQUE3.AsString;

    cdsCargaC_Placas.AsString := sPlacas;
//==============================================================================
    if cdsCargaENTR_ENDERECO.AsString <> '' then
    begin
      sCliEndereco := cdsCargaENTR_ENDERECO.AsString;
      if cdsCargaENTR_NUMERO.AsString <> '' then
        sCliEndereco := sCliEndereco + ',' + cdsCargaENTR_NUMERO.AsString;
      if cdsCargaENTR_BAIRRO.AsString <> '' then
        sCliEndereco := sCliEndereco + ',' + cdsCargaENTR_BAIRRO.AsString;
      if cdsCargaENTR_NUMERO.AsString <> '' then
        sCliEndereco := sCliEndereco + ',' + cdsCargaENTR_NUMERO.AsString;
      if cdsCargaENTR_CEP.AsString <> '' then
      begin
        sCEP := FormatMaskText('00000-000;0;_', cdsCargaENTR_CEP.AsString);
        sCliEndereco := sCliEndereco + ' - ' +  sCEP;
      end;
      if cdsCargaENTR_CIDADE.AsString <> '' then
        sCliEndereco := sCliEndereco + ',' + cdsCargaENTR_CIDADE.AsString;
      if cdsCargaENTR_UF.AsString <> '' then
        sCliEndereco := sCliEndereco + ',' + cdsCargaENTR_UF.AsString;
    end;
    cdsCargaC_ENTR_ENDERECO.AsString := sCliEndereco;
//==============================================================================
    cdsCargaC_CIDADE_DATA.AsString := cdsCargaCLI_CIDADE.AsString + ', ' + FormatDateTime('dd " de "mmmm" de "yyyy', cdsCargaCAR_DATA.AsDateTime);

    cdsCargaC_TRA_CIDADE_UF.AsString := cdsCargaTRA_CIDADE.AsString;
    if cdsCargaTRA_UF.AsString <> '' then
      cdsCargaC_TRA_CIDADE_UF.AsString := cdsCargaC_TRA_CIDADE_UF.AsString + ' - ' + cdsCargaTRA_UF.AsString;

    cdsCargaC_CTE_CIDADE_UF.AsString := cdsCargaCTE_CIDADE.AsString;
    if cdsCargaCTE_UF.AsString <> '' then
      cdsCargaC_CTE_CIDADE_UF.AsString := cdsCargaC_CTE_CIDADE_UF.AsString + ' - ' + cdsCargaCTE_UF.AsString;

    cdsCargaC_QTDE_UNIDADE.AsString := FormatFloat(',###', cdsCargaCAR_QTDE.AsFloat) + ' ' + cdsCargaDESC_UNIDADE.AsString;

    cdsCargaC_USI_RAZAO.AsString := cdsCargaUSI_NOME.AsString + ' - ' + FormatMaskText('##.###.###/####-##;0;_', cdsCargaUSI_CNPJ.AsString);
    cdsCargaC_USI_CIDADE.AsString := cdsCargaUSI_CIDADE.AsString + ' - ' + FormatMaskText('#####-###;0;_', cdsCargaUSI_CEP.AsString);

    cdsCargaC_ADQ_RAZAO.AsString :=
      cdsCargaADQ_NOME.AsString + ' - ' + FormatMaskText('##.###.###/####-##;0;_', cdsCargaADQ_CNPJ.AsString);
    cdsCargaC_ADQ_CIDADE.AsString :=
      cdsCargaADQ_CIDADE.AsString + ' - ' + FormatMaskText('#####-###;0;_', cdsCargaADQ_CEP.AsString);

    cdsCargaC_CLI_RAZAO.AsString := cdsCargaCLI_NOME.AsString + ' - ' + FormatMaskText('##.###.###/####-##;0;_', cdsCargaCLI_CNPJ.AsString);
    cdsCargaC_CLI_CIDADE_COMPLETO.AsString := cdsCargaCLI_CIDADECOMPLETA.AsString + ' - ' + FormatMaskText('#####-###;0;_', cdsCargaCLI_CEP.AsString);

    if cdsCargaTRA_CNPJ.AsString <> '' then
      sDocumentoTrans := FormatMaskText('##.###.###/####-##;0;_', cdsCargaTRA_CNPJ.AsString);
    if cdsCargaTRA_CPF.AsString <> '' then
      sDocumentoTrans := FormatMaskText('###.###.###-##;0;_', cdsCargaTRA_CPF.AsString);

    cdsCargaC_TRA_RAZAO.AsString :=
      cdsCargaTRA_NOME.AsString + ' - ' + sDocumentoTrans;
    cdsCargaC_TRA_CIDADE_COMPLETO.AsString :=
      cdsCargaTRA_CIDADECOMPLETA.AsString + ' - ' + FormatMaskText('#####-###;0;_', cdsCargaTRA_CEP.AsString);
  end;
end;

procedure TfImpressaoCarga.ImprimirOrdem(IdCarga, NumCarga: Integer; PDF: Boolean);
var
  lparam: TdmParametros;
  arq: string;
begin

  if PDF then
  begin
     lparam := TdmParametros.Create(nil);
     try
        arq := lparam.CaminhoPDFCarga();
        arq := arq + '\CARGA-' + IntToStr(NumCarga);
     finally
       FreeAndNil(lparam);
     end;
  end;

  cdsCarga.Close;
  cdsCarga.Params[0].AsInteger := IdCarga;

  RepCarga.Template.FileName := 'Autoriza3.rtm';
  RepCarga.Template.LoadFromFile;

  if PDF then
  begin
    RepCarga.AllowPrintToFile := True;
    RepCarga.TextFileName := arq;
    RepCarga.DeviceType := 'PDF';
  end
  else begin
    RepCarga.AllowPrintToArchive := False;
    RepCarga.TextFileName := '';
    RepCarga.DeviceType := 'Screen';
  end;

  RepCarga.Print;
  cdsCarga.Close;
end;

end.
