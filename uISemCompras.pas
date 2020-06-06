unit uISemCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, FMTBcd, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, Provider,
  SqlExpr, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppViewr, Grids,
  DBGrids;

type
  TfISemCompras = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Database: TMaskEdit;
    QtdeDias: TMaskEdit;
    Panel1: TPanel;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    Data: TEdit;
    Qcliente: TSQLQuery;
    dspCliente: TDataSetProvider;
    Cliente: TClientDataSet;
    dsCliente: TDataSource;
    dbCliente: TppDBPipeline;
    Rel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    lblData: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    DBGrid1: TDBGrid;
    butOk: TBitBtn;
    ClienteCOD_CLIENTE: TIntegerField;
    ClienteNOME: TStringField;
    ClienteFONE: TStringField;
    ClienteFAX: TStringField;
    ClienteDESC_CIDADE: TStringField;
    ClienteSIGLA: TStringField;
    Label3: TLabel;
    procedure butSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DatabaseExit(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure QtdeDiasExit(Sender: TObject);
    procedure RelPreviewFormCreate(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure dsClienteStateChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalculoDias;
  public
    { Public declarations }
  end;

var
  fISemCompras: TfISemCompras;

implementation

uses UUtil, uDM, uUltPedido;

{$R *.dfm}

procedure TfISemCompras.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfISemCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Cliente.Close;
   action:=cafree;
end;

procedure TfISemCompras.FormCreate(Sender: TObject);
begin
   Database.Text:=datetostr(date);
end;

procedure TfISemCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_Escape: close;
   end;
end;

procedure TfISemCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfISemCompras.DatabaseExit(Sender: TObject);
begin
   if DataErro(Database.Text) = 'S' then
   begin
      DataBase.SetFocus;
      exit;
   end;
   CalculoDias;
end;

procedure TfISemCompras.butImprimirClick(Sender: TObject);
begin
   Rel.Print;
end;

procedure TfISemCompras.CalculoDias;
var vdata: Tdate;
begin
   try
   vdata:=strtodate(DataBase.Text) - strtofloat(QtdeDias.Text);
   Data.Text:=datetostr(vdata);
   except
      Data.Text:=datetostr(Date);
   end;
end;

procedure TfISemCompras.QtdeDiasExit(Sender: TObject);
begin
   CalculoDias;
end;

procedure TfISemCompras.RelPreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TfISemCompras.butOkClick(Sender: TObject);
begin
   if copy(DataBase.Text,1,1) = ' ' then
   begin
      mensagem('Informe a Data Base');
      DataBase.SetFocus;
      exit;
   end;
   if trim(QtdeDias.Text) = '' then
   begin
      mensagem('Informe a quantidade de dias');
      QtdeDias.SetFocus;
      exit;
   end;
   Cliente.close;
   Cliente.Params[0].Text:=vgCod_Empresa;
   Cliente.Params[1].AsDate:=strtodate(Data.Text);
   Cliente.Params[2].AsDate:=strtodate(Database.Text);
   lblData.Caption:='Data Base: '+DataBase.Text+' Últimos '+QtdeDias.Text+' Dias';
   Cliente.Open;
end;

procedure TfISemCompras.dsClienteStateChange(Sender: TObject);
begin
   butImprimir.Enabled:=((not (dsCliente.DataSet.IsEmpty)) or (dsCliente.DataSet.Active));
end;

procedure TfISemCompras.DBGrid1DblClick(Sender: TObject);
begin
   if (Cliente.Active = false) or (Cliente.IsEmpty) then
      exit;
   fUltPedido:=TfUltPedido.create(self);
   fUltPedido.Cod_Cliente.Text:=ClienteCOD_CLIENTE.Text;
   fUltPedido.PNome.Caption:=ClienteNOME.Text;
   fUltPedido.showModal;
   fUltPedido.free;
end;

end.
