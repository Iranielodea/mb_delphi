unit uRTransporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, DBClient, Provider, ppVar, ppCtrls,
  ppBands, ppClass, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppViewr, ppDesignLayer, ppParameter;

type
  TFRTransporte = class(TForm)
    QRelatorio: TSQLQuery;
    dspRelatorio: TDataSetProvider;
    Relatorio: TClientDataSet;
    dsRelatorio: TDataSource;
    dbRel: TppDBPipeline;
    Rel1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    Nome_Agencia: TppDBText;
    Nome_Empresa: TppDBText;
    Desc_Cidade: TppDBText;
    Fone1: TppDBText;
    Fone2: TppDBText;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppLine2: TppLine;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLine3: TppLine;
    QAniver: TSQLQuery;
    dspAniver: TDataSetProvider;
    Aniver: TClientDataSet;
    dsAniver: TDataSource;
    dbAniver: TppDBPipeline;
    Rel2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppLabel7: TppLabel;
    lblData02: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel14: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText6: TppDBText;
    ppLabel17: TppLabel;
    ppLine4: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel18: TppLabel;
    ppDBCalc2: TppDBCalc;
    QRel: TSQLQuery;
    dspRel: TDataSetProvider;
    cdsRel: TClientDataSet;
    dsRel: TDataSource;
    dbRel1: TppDBPipeline;
    Rel3: TppReport;
    ppParameterList3: TppParameterList;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppLabel19: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLabel20: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel21: TppLabel;
    ppDBText9: TppDBText;
    ppLabel22: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel23: TppLabel;
    ppDBText12: TppDBText;
    ppLabel24: TppLabel;
    ppDBText13: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppSummaryBand3: TppSummaryBand;
    ppLabel25: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel26: TppLabel;
    ppDBCalc4: TppDBCalc;
    procedure Rel1PreviewFormCreate(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTransporte: TFRTransporte;

implementation

uses uDM;

{$R *.dfm}

procedure TFRTransporte.Rel1PreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TFRTransporte.ppDetailBand1BeforePrint(Sender: TObject);
begin
   if Relatorio.FieldByName('DESTAQUE').Text = 'S' then
      Nome_Agencia.Font.Color:=clred
   else
      Nome_Agencia.Font.Color:=clBlack;
end;

end.
