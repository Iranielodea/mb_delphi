unit uRCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, DB, DBClient, Provider, SqlExpr, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppCache, ppViewr;

type
  TFRCliente = class(TForm)
    QCliente: TSQLQuery;
    dspCliente: TDataSetProvider;
    Cliente: TClientDataSet;
    dsCliente: TDataSource;
    dbCliente: TppDBPipeline;
    Rel1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel8: TppLabel;
    Rel2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel9: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine3: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine4: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLabel16: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel18: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel19: TppLabel;
    Rel3: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel20: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine5: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppLabel27: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText24: TppDBText;
    ppLabel29: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppLabel30: TppLabel;
    ppLine6: TppLine;
    Rel4: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel28: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine7: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppLine8: TppLine;
    ppDBCalc6: TppDBCalc;
    ppLabel37: TppLabel;
    QAniver: TSQLQuery;
    dspAniver: TDataSetProvider;
    Aniver: TClientDataSet;
    dsAniver: TDataSource;
    dbAniver: TppDBPipeline;
    Rel5: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    AniverMES: TSmallintField;
    AniverCONTATO: TStringField;
    AniverEMAIL: TStringField;
    AniverFONE: TStringField;
    AniverFAX: TStringField;
    AniverDATANASC: TDateField;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel36: TppLabel;
    ppDBText33: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    lblData05: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable15: TppSystemVariable;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel44: TppLabel;
    ppDBCalc7: TppDBCalc;
    procedure Rel1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCliente: TFRCliente;

implementation

uses uDM;

{$R *.dfm}

procedure TFRCliente.Rel1PreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

end.
