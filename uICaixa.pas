unit uICaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, FMTBcd, DB, SqlExpr, DBClient,
  ppCtrls, ppPrnabl, ppClass, ppDB, ppBands, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, ppViewr, ppVar, ppDesignLayer, ppParameter;

type
  TfICaixa = class(TForm)
    lblPeriodo: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    RPrevisao: TRadioButton;
    RReal: TRadioButton;
    DataIni: TMaskEdit;
    Datafin: TMaskEdit;
    Panel1: TPanel;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    QSaldoAntP: TSQLQuery;
    QSaldoAntR: TSQLQuery;
    QSaldoAntPSALDO: TFloatField;
    QSaldoAntRSALDO: TFloatField;
    Rel: TClientDataSet;
    Qprev: TSQLQuery;
    QprevDATA_VENCTO: TSQLTimeStampField;
    QprevRECEBER: TFloatField;
    QprevPAGAR: TFloatField;
    RelDATA: TDateField;
    RelRECEBER: TFloatField;
    RelPAGAR: TFloatField;
    RelDIFERENCA: TFloatField;
    RelSALDO: TFloatField;
    dbRel: TppDBPipeline;
    Relatorio1: TppReport;
    dsRel: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    lblData: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel7: TppLabel;
    lblSaldoAnt: TppLabel;
    Qreal: TSQLQuery;
    QrealDATA_PAGO: TSQLTimeStampField;
    QrealRECEBER: TFloatField;
    QrealPAGAR: TFloatField;
    Relatorio2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLine3: TppLine;
    ppLabel13: TppLabel;
    lblData1: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    lblSaldoAnt1: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLine4: TppLine;
    ppDBCalc5: TppDBCalc;
    ppLabel16: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Relatorio1PreviewFormCreate(Sender: TObject);
    procedure RPrevisaoEnter(Sender: TObject);
    procedure RRealEnter(Sender: TObject);
  private
    { Private declarations }
    function SaldoAnterior(Tipo: string): double;
  public
    { Public declarations }
  end;

var
  fICaixa: TfICaixa;

implementation

uses UUtil, uDM;

{$R *.dfm}

procedure TfICaixa.FormCreate(Sender: TObject);
begin
   DataIni.Text:=Inicio_Mes(datetoStr(Date));
   Datafin.Text:=Fim_Mes(datetoStr(Date));
end;

procedure TfICaixa.butImprimirClick(Sender: TObject);
var vlSaldoAnt, vlSaldo, vlDif: double;
begin
   if ValidaDatas(Dataini.Text,DataFin.Text) = false then
      exit;
   rel.First;
   while not rel.Eof do
      rel.delete;

   if RPrevisao.Checked then
   begin
      Qprev.Close;
      Qprev.Params.ParamByName('CODEMPRESA').Text:=vgCod_Empresa;
      Qprev.Params.ParamByName('DATAINI').AsDate:=strtodate(DataIni.Text);
      Qprev.Params.ParamByName('DATAFIN').AsDate:=strtodate(DataFin.Text);
      Qprev.Open;
      while not Qprev.Eof do
      begin
         vlDif:=QprevRECEBER.AsFloat - QprevPAGAR.AsFloat;
         if vlDif <> 0 then
         begin
            rel.Insert;
            RelDATA.text:=QprevDATA_VENCTO.Text;
            RelRECEBER.AsFloat:=QprevRECEBER.AsFloat;
            RelPAGAR.AsFloat:=QprevPAGAR.AsFloat;
            RelDIFERENCA.AsFloat:=vlDif;
            Rel.Post;
         end;
         Qprev.Next;
      end;
   end;
   if RReal.Checked then
   begin
      Qreal.Close;
      Qreal.Params.ParamByName('CODEMPRESA').Text:=vgCod_Empresa;
      Qreal.Params.ParamByName('DATAINI').AsDate:=strtodate(DataIni.Text);
      Qreal.Params.ParamByName('DATAFIN').AsDate:=strtodate(DataFin.Text);
      Qreal.Open;
      while not Qreal.Eof do
      begin
         if QrealPAGAR.AsFloat > 0 then
         begin
            vlDif:=QrealRECEBER.AsFloat - QrealPAGAR.AsFloat;
            rel.Insert;
            RelDATA.text:=QrealDATA_PAGO.Text;
            RelRECEBER.AsFloat:=QrealRECEBER.AsFloat;
            RelPAGAR.AsFloat:=QrealPAGAR.AsFloat;
            RelDIFERENCA.AsFloat:=vlDif;
            Rel.Post;
         end;
         Qreal.Next;
      end;
   end;
//------------------------------------------------------------------------------
   Rel.IndexFieldNames:='DATA';
   Rel.First;

   if RPrevisao.Checked then
      vlSaldo:=SaldoAnterior('P')
   else
      vlSaldo:=0; //SaldoAnterior('R');
   vlSaldoAnt:=vlSaldo;
   while not rel.Eof do
   begin
      vlSaldo:=vlSaldo + RelRECEBER.AsFloat - RelPAGAR.AsFloat;
      rel.edit;
      RelSALDO.AsFloat:=vlSaldo;
      rel.Post;
      rel.Next;
   end;
   lblData.Caption:='Período de: '+DataIni.Text+' até: '+Datafin.text;
   lblSaldoAnt.Caption:='Saldo Anterior: '+formatfloat(',##0.00',vlsaldoAnt);

   lblData1.Caption:='Período de: '+DataIni.Text+' até: '+Datafin.text;
   lblSaldoAnt1.Caption:='Saldo Anterior: '+formatfloat(',##0.00',vlsaldoAnt);
   if RPrevisao.Checked then
      relatorio1.Print
   else
      relatorio2.Print;
end;

function TfICaixa.SaldoAnterior(Tipo: string): double;
var
   vlRec,vlPag: double;
begin

// p-previsao  R-Realizado

   if Tipo = 'P' then
   begin
      QSaldoAntP.Close;
      QSaldoAntP.Params.ParamByName('CODEMPRESA_REC').Text:=vgCod_Empresa;
      QSaldoAntP.Params.ParamByName('DATA_REC').AsDate:=strtodate(DataIni.Text);
      QSaldoAntP.Params.ParamByName('CODEMPRESA_PAG').Text:=vgCod_Empresa;
      QSaldoAntP.Params.ParamByName('DATA_PAG').AsDate:=strtodate(DataIni.Text);
      QSaldoAntP.Open;
      vlRec:=QSaldoAntPSALDO.AsFloat;
      QSaldoAntP.Next;
      vlPag:=QSaldoAntPSALDO.AsFloat;
      QSaldoAntP.Close;
   end
   else begin
      QSaldoAntR.Close;
      QSaldoAntR.Params.ParamByName('CODEMPRESA_REC').Text:=vgCod_Empresa;
      QSaldoAntR.Params.ParamByName('DATA_REC').AsDate:=strtodate(DataIni.Text);
      QSaldoAntR.Params.ParamByName('CODEMPRESA_PAG').Text:=vgCod_Empresa;
      QSaldoAntR.Params.ParamByName('DATA_PAG').AsDate:=strtodate(DataIni.Text);
      QSaldoAntR.Open;
      vlRec:=QSaldoAntRSALDO.AsFloat;
      QSaldoAntR.Next;
      vlPag:=QSaldoAntRSALDO.AsFloat;
      QSaldoAntR.Close;
   end;

   result:=vlRec - vlPag;
end;

procedure TfICaixa.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfICaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TfICaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfICaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfICaixa.Relatorio1PreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TfICaixa.RPrevisaoEnter(Sender: TObject);
begin
   lblPeriodo.Caption:='Vencto';
end;

procedure TfICaixa.RRealEnter(Sender: TObject);
begin
   lblPeriodo.Caption:='Pagto';
end;

end.
