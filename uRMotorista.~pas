unit uRMotorista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, SqlExpr, DB, Provider, DBClient, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppVar, ppCtrls, ppBands,
  ppPrnabl, ppCache, ppViewr;

type
  TfRMotorista = class(TForm)
    DbMot: TppDBPipeline;
    Rel01: TppReport;
    Mot: TClientDataSet;
    dspMot: TDataSetProvider;
    dsMot: TDataSource;
    Qmot: TSQLQuery;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    dbAniver: TppDBPipeline;
    Rel02: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppDetailBand2: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel13: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine4: TppLine;
    Aniver: TClientDataSet;
    dspAniver: TDataSetProvider;
    dsAniver: TDataSource;
    QAniver: TSQLQuery;
    ppLabel15: TppLabel;
    ppDBCalc3: TppDBCalc;
    AniverDIA: TSmallintField;
    AniverMES: TSmallintField;
    AniverCOD_MOTORISTA: TIntegerField;
    AniverNOME: TStringField;
    AniverFONE2: TStringField;
    AniverDATANASC: TDateField;
    AniverFONE1: TStringField;
    AniverPLACA: TStringField;
    AniverCOD_CIDADE: TIntegerField;
    AniverDESC_CIDADE: TStringField;
    ppLabel16: TppLabel;
    ppDBText11: TppDBText;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    procedure Rel01PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRMotorista: TfRMotorista;

implementation

uses uDM;

{$R *.dfm}

procedure TfRMotorista.Rel01PreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

end.
