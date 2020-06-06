unit uExtratoBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, ExtCtrls, FMTBcd, DB, SqlExpr, DBClient,
  ppCtrls, ppVar, ppPrnabl, ppClass, ppBands, ppDB, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppViewr, ppStrtch, ppMemo,
  ppDesignLayer, ppParameter;

type
  TfExtratoBanco = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DataIni: TMaskEdit;
    Datafin: TMaskEdit;
    Label3: TLabel;
    Num_Conta: TEdit;
    butNumConta: TSpeedButton;
    Id_ContaBanco: TMaskEdit;
    Panel1: TPanel;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    QContas: TSQLQuery;
    QContasDATA_EMISSAO: TSQLTimeStampField;
    QContasDOCUMENTO: TStringField;
    QContasTIPO_CONTA: TIntegerField;
    QContasVALOR_PAGAR: TFloatField;
    QContasVALOR_PAGO: TFloatField;
    QContasID_CONTABANCO: TIntegerField;
    QContasNUM_PEDIDO: TIntegerField;
    QContasNUM_CONTA: TStringField;
    Contas: TClientDataSet;
    ContasDATA: TDateField;
    ContasDOCUMENTO: TStringField;
    ContasNUM_PEDIDO: TIntegerField;
    ContasCREDITO: TFloatField;
    ContasDEBITO: TFloatField;
    ContasSALDO: TFloatField;
    ContasCONTA_BANCO: TStringField;
    dsContas: TDataSource;
    dbContas: TppDBPipeline;
    Rel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
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
    ppDBText7: TppDBText;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    lblData: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText8: TppDBText;
    ContasSALDO_ANTERIOR: TFloatField;
    QSaldoAntR: TSQLQuery;
    QSaldoAntRTIPO_CONTA: TIntegerField;
    QSaldoAntRSALDO: TFloatField;
    ppDBText9: TppDBText;
    ppLabel14: TppLabel;
    ppDBText10: TppDBText;
    QContasDATA_PAGO: TSQLTimeStampField;
    QContasTEXTO: TStringField;
    ContasTEXTO: TStringField;
    ppDBMemo1: TppDBMemo;
    ppLabel15: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure Id_ContaBancoExit(Sender: TObject);
    procedure Num_ContaExit(Sender: TObject);
    procedure Num_ContaEnter(Sender: TObject);
    procedure butNumContaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure butImprimirClick(Sender: TObject);
    procedure RelPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaConta(Tipo: String);
    function SaldoAnterior: double;
  public
    { Public declarations }
  end;

var
  fExtratoBanco: TfExtratoBanco;

implementation

uses UUtil, uDM, uContaBanco;

{$R *.dfm}

procedure TfExtratoBanco.FormCreate(Sender: TObject);
begin
   DataIni.Text:=Inicio_Mes(datetoStr(Date));
   Datafin.Text:=Fim_Mes(datetoStr(Date));
end;

procedure TfExtratoBanco.PesquisaConta(Tipo: String);
var vreg: integer;
sAtivo: string;
begin
   if (id_ContaBanco.Modified = false) and (Num_Conta.Modified = false) then exit;
   if ((id_ContaBanco.Text = '') and (Tipo = 'C')) or ((Num_Conta.Text = '') and (Tipo = 'D')) then
   begin
      ID_CONTABANCO.Clear;
      Num_Conta.Clear;
      exit;
   end;
   sAtivo := ' AND ATIVO = ' + QuotedStr('S');
   if Tipo = 'C' then
      ComandoQSql('select ID_CONTABANCO, NUM_CONTA from CONTABANCO where ID_CONTABANCO = '+id_ContaBanco.Text + sAtivo)
   else
      ComandoQSql('select ID_CONTABANCO, NUM_CONTA from CONTABANCO where NUM_CONTA like  '''+Num_Conta.Text+'%''' + sAtivo);
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      ID_CONTABANCO.Text:=dm.Qsql.Fields[0].Text;
      Num_Conta.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fContaBanco:=TfContaBanco.create(true);
      fContaBanco.TipoCad.Text:='P';
      if Tipo = 'D' then
         fContaBanco.EditNome.Text:=Num_Conta.Text;
      if fContaBanco.ShowModal = mrOk then
      begin
         ID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.Text;
         Num_Conta.Text:=dm.ContaBancoNUM_CONTA.Text;
      end
      else begin
         ID_CONTABANCO.Clear;
         Num_Conta.Clear;
      end;
      dm.ContaBanco.close;
      fContaBanco.Free;
   end;
   dm.Qsql.close;
end;

procedure TfExtratoBanco.Id_ContaBancoExit(Sender: TObject);
begin
   if id_ContaBanco.Modified then
      PesquisaConta('C');
end;

procedure TfExtratoBanco.Num_ContaExit(Sender: TObject);
begin
   if Num_Conta.Modified then
      PesquisaConta('D');
end;

procedure TfExtratoBanco.Num_ContaEnter(Sender: TObject);
begin
   Num_Conta.Modified:=false;
end;

procedure TfExtratoBanco.butNumContaClick(Sender: TObject);
begin
   fContaBanco:=TfContaBanco.create(true);
   fContaBanco.TipoCad.Text:='P';
   if fContaBanco.ShowModal = mrOk then
   begin
      ID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.Text;
      Num_Conta.Text:=dm.ContaBancoNUM_CONTA.Text;
   end;
   dm.ContaBanco.close;
   fContaBanco.Free;
   id_ContaBanco.Modified:=false;
   Num_Conta.Modified:=false;
end;

procedure TfExtratoBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure TfExtratoBanco.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfExtratoBanco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfExtratoBanco.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfExtratoBanco.butImprimirClick(Sender: TObject);
var vconta: integer;
   vsaldo: double;
   vsaldoAnt: double;

begin
   if validaDatas(Dataini.Text,Datafin.Text) = false then
      exit;
   vconta:=0;
   if Id_ContaBanco.Text <> '' then
      vconta:=StrToInt(Id_ContaBanco.Text);
   Qcontas.Close;
   Qcontas.Params.ParamByName('CODEMPRESA').Text:=vgCod_Empresa;
   Qcontas.Params.ParamByName('DATAINI').AsDate:=strtodate(DataIni.Text);
   Qcontas.Params.ParamByName('DATAFIN').AsDate:=strtodate(Datafin.Text);
   Qcontas.Params.ParamByName('CONTA1').AsInteger:=vconta;
   Qcontas.Params.ParamByName('CONTA2').AsInteger:=vconta;
   Qcontas.Open;
   Contas.First;

   vsaldo:=SaldoAnterior;
   vsaldoAnt:=vsaldo;
   while not Contas.Eof do
      contas.Delete;

   while not QContas.Eof do
   begin
      Contas.Append;
      ContasSALDO_ANTERIOR.AsFloat:=vsaldoAnt;
      ContasDATA.text:=QContasDATA_PAGO.Text;
      ContasDOCUMENTO.Text:=QContasDOCUMENTO.Text;
      ContasNUM_PEDIDO.Text:=QContasNUM_PEDIDO.Text;
      ContasCONTA_BANCO.Text:=QContasNUM_CONTA.Text;
      ContasTEXTO.Text:=QContasTEXTO.Text;
      ContasCREDITO.AsFloat:=0;
      ContasDEBITO.AsFloat:=0;

      if QContasTIPO_CONTA.Text = '2' then
      begin
         ContasCREDITO.AsFloat:=QContasVALOR_PAGO.AsFloat;
         vsaldo:=vsaldo + QContasVALOR_PAGO.AsFloat;
      end;
      if QContasTIPO_CONTA.Text = '3' then
      begin
         ContasDEBITO.AsFloat:=QContasVALOR_PAGO.AsFloat;
         vsaldo:=vsaldo - QContasVALOR_PAGO.AsFloat;
      end;

      ContasSALDO.AsFloat:=vsaldo;
      Contas.Post;
      Qcontas.Next;
   end;
   Qcontas.Close;
   lblData.Caption:='Período de: '+DataIni.Text+' Até: '+Datafin.Text;
   rel.Print;
end;

procedure TfExtratoBanco.RelPreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

function TfExtratoBanco.SaldoAnterior: double;
var vconta: integer;
   vsaldo: double;
begin
   vconta:=0;
   if Id_ContaBanco.Text <> '' then
      vconta:=StrToInt(Id_ContaBanco.Text);
   QSaldoAntR.Close;
   QSaldoAntR.Params.ParamByName('CODEMPRESA_REC').Text:=vgCod_Empresa;
   QSaldoAntR.Params.ParamByName('DATA_REC').AsDate:=strtodate(DataIni.Text);
   QSaldoAntR.Params.ParamByName('CONTA1').AsInteger:=vconta;
   QSaldoAntR.Params.ParamByName('CONTA2').AsInteger:=vconta;
   QSaldoAntR.Params.ParamByName('CODEMPRESA_PAG').Text:=vgCod_Empresa;
   QSaldoAntR.Params.ParamByName('DATA_PAG').AsDate:=strtodate(DataIni.Text);
   QSaldoAntR.Params.ParamByName('CONTA3').AsInteger:=vconta;
   QSaldoAntR.Params.ParamByName('CONTA4').AsInteger:=vconta;
   QSaldoAntR.Open;
   vsaldo:=0;
   while not QSaldoAntR.Eof do
   begin
      if QSaldoAntRTIPO_CONTA.Text = '2' then
         vsaldo:=vsaldo + QSaldoAntRSALDO.AsFloat
      else
         vsaldo:=vsaldo - QSaldoAntRSALDO.AsFloat;
      QSaldoAntR.Next;
   end;
   QSaldoAntR.Close;
   result:=vsaldo;
end;

end.
