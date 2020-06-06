unit uFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls, Mask, Grids,
  DBGrids, DBClient, FMTBcd, SqlExpr, ppCtrls, ppPrnabl, ppClass, ppDB,
  ppCache, ppBands, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, Provider,
  ppStrtch, ppSubRpt, ppViewr;

type
  TfFicha = class(TForm)
    PageControl1: TPageControl;
    sheetFicha: TTabSheet;
    Panel1: TPanel;
    butOk: TBitBtn;
    butCancelar: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    dsCad: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    DBComboBox1: TDBComboBox;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    GroupBox7: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    TabSheet2: TTabSheet;
    GroupBox8: TGroupBox;
    Grade1: TDBGrid;
    butNovo1: TBitBtn;
    butExcluir1: TBitBtn;
    GroupBox9: TGroupBox;
    Grade2: TDBGrid;
    butNovo2: TBitBtn;
    butExcluir2: TBitBtn;
    GroupBox10: TGroupBox;
    Grade3: TDBGrid;
    butNovo3: TBitBtn;
    butExcluir3: TBitBtn;
    TabSheet3: TTabSheet;
    GroupBox11: TGroupBox;
    Memo1: TMemo;
    butImprimir: TBitBtn;
    butAlterar1: TBitBtn;
    butAlterar2: TBitBtn;
    buAlterar3: TBitBtn;
    dsDiretor: TDataSource;
    dsBanco: TDataSource;
    dsComercio: TDataSource;
    butExcluir: TSpeedButton;
    dsObs: TDataSource;
    CodCliente: TEdit;
    QImpFicha: TSQLQuery;
    dspFicha: TDataSetProvider;
    ImpFicha: TClientDataSet;
    dsFicha: TDataSource;
    dbFicha: TppDBPipeline;
    dbRefBanco: TppDBPipeline;
    dbDiretor: TppDBPipeline;
    RelFicha: TppReport;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine7: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine4: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine17: TppLine;
    ppLabel20: TppLabel;
    ppDBText16: TppDBText;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine20: TppLine;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLine21: TppLine;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine26: TppLine;
    ppLabel31: TppLabel;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLabel32: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel33: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    dsPonte: TDataSource;
    Qdiretor: TSQLQuery;
    dspDiretor: TDataSetProvider;
    Diretor: TClientDataSet;
    QImpFichaTIPO_FICHA: TStringField;
    QImpFichaCNPJ: TStringField;
    QImpFichaINSC_ESTADUAL: TStringField;
    QImpFichaDATA_ABERTURA: TSQLTimeStampField;
    QImpFichaNOME: TStringField;
    QImpFichaFANTASIA: TStringField;
    QImpFichaENDERECO: TStringField;
    QImpFichaNUMERO: TStringField;
    QImpFichaBAIRRO: TStringField;
    QImpFichaCEP: TStringField;
    QImpFichaFONE: TStringField;
    QImpFichaCOMPRADOR: TStringField;
    QImpFichaNUM_FUNC: TIntegerField;
    QImpFichaNOME_ANTERIOR: TStringField;
    QImpFichaEND_PAGAMENTO: TStringField;
    QImpFichaEND_ENTREGA: TStringField;
    QImpFichaPREDIO_PROPRIO: TStringField;
    QImpFichaVALOR_ALUGUEL: TFloatField;
    QImpFichaSEGMENTO: TStringField;
    QImpFichaCATEGORIA: TStringField;
    QImpFichaCLASSIFICACAO: TStringField;
    QImpFichaQTDE_COMPRA_SEMANA: TFloatField;
    QImpFichaDIAS_APRAZO: TIntegerField;
    QImpFichaCONSUMO_MENSAL: TFloatField;
    QImpFichaVALOR_PEDIDO: TFloatField;
    QImpFichaFICHA_CADASTRAL: TStringField;
    QImpFichaCONTRATO_SOCIAL: TStringField;
    QImpFichaCARTAO_CADASTRAL: TStringField;
    QImpFichaDOC_PROPRIETARIO: TStringField;
    QImpFichaDESC_CIDADE: TStringField;
    QImpFichaSIGLA: TStringField;
    QImpFichaCOD_CLIENTE: TIntegerField;
    QdiretorNOME: TStringField;
    QdiretorCPF: TStringField;
    QdiretorFONE: TStringField;
    QdiretorENDERECO: TStringField;
    QdiretorDATANASC: TSQLTimeStampField;
    ImpFichaTIPO_FICHA: TStringField;
    ImpFichaCNPJ: TStringField;
    ImpFichaINSC_ESTADUAL: TStringField;
    ImpFichaDATA_ABERTURA: TSQLTimeStampField;
    ImpFichaNOME: TStringField;
    ImpFichaFANTASIA: TStringField;
    ImpFichaENDERECO: TStringField;
    ImpFichaNUMERO: TStringField;
    ImpFichaBAIRRO: TStringField;
    ImpFichaCEP: TStringField;
    ImpFichaFONE: TStringField;
    ImpFichaCOMPRADOR: TStringField;
    ImpFichaNUM_FUNC: TIntegerField;
    ImpFichaNOME_ANTERIOR: TStringField;
    ImpFichaEND_PAGAMENTO: TStringField;
    ImpFichaEND_ENTREGA: TStringField;
    ImpFichaPREDIO_PROPRIO: TStringField;
    ImpFichaVALOR_ALUGUEL: TFloatField;
    ImpFichaSEGMENTO: TStringField;
    ImpFichaCATEGORIA: TStringField;
    ImpFichaCLASSIFICACAO: TStringField;
    ImpFichaQTDE_COMPRA_SEMANA: TFloatField;
    ImpFichaDIAS_APRAZO: TIntegerField;
    ImpFichaCONSUMO_MENSAL: TFloatField;
    ImpFichaVALOR_PEDIDO: TFloatField;
    ImpFichaFICHA_CADASTRAL: TStringField;
    ImpFichaCONTRATO_SOCIAL: TStringField;
    ImpFichaCARTAO_CADASTRAL: TStringField;
    ImpFichaDOC_PROPRIETARIO: TStringField;
    ImpFichaDESC_CIDADE: TStringField;
    ImpFichaSIGLA: TStringField;
    ImpFichaCOD_CLIENTE: TIntegerField;
    ImpFichaQdiretor: TDataSetField;
    DiretorNOME: TStringField;
    DiretorCPF: TStringField;
    DiretorFONE: TStringField;
    DiretorENDERECO: TStringField;
    DiretorDATANASC: TSQLTimeStampField;
    dsRelDiretor: TDataSource;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppTitleBand1: TppTitleBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText28: TppDBText;
    ppLabel46: TppLabel;
    ppDBText29: TppDBText;
    QRefBanco: TSQLQuery;
    dspRefBanco: TDataSetProvider;
    RefBanco: TClientDataSet;
    dsRelRefBanco: TDataSource;
    QRefBancoNOME_BANCO: TStringField;
    QRefBancoFONE: TStringField;
    QRefBancoTIPO_PESSOA: TStringField;
    QRefBancoNOME_AGENCIA: TStringField;
    QRefBancoNUMERO: TStringField;
    QRefBancoNUM_CONTA: TStringField;
    ImpFichaQRefBanco: TDataSetField;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    QRefComercio: TSQLQuery;
    RelRefComercio: TClientDataSet;
    dspRelRefComercio: TDataSetProvider;
    dsRelComercio: TDataSource;
    dbRefComercio: TppDBPipeline;
    dbObs: TppDBPipeline;
    QRefComercioNOME_FORNECEDOR: TStringField;
    QRefComercioFONE: TStringField;
    QRefComercioCNPJ: TStringField;
    ImpFichaQRefComercio: TDataSetField;
    RelRefComercioNOME_FORNECEDOR: TStringField;
    RelRefComercioFONE: TStringField;
    RelRefComercioCNPJ: TStringField;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    Qobs: TSQLQuery;
    dspObs: TDataSetProvider;
    Obs: TClientDataSet;
    dsRelObs: TDataSource;
    QobsCODIGO: TIntegerField;
    QobsNUM_LINHA: TIntegerField;
    QobsTEXTO: TStringField;
    QobsTIPO: TStringField;
    ObsCODIGO: TIntegerField;
    ObsNUM_LINHA: TIntegerField;
    ObsTEXTO: TStringField;
    ObsTIPO: TStringField;
    ImpFichaQobs: TDataSetField;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand5: TppDetailBand;
    ppDBText39: TppDBText;
    ImpFichaC_ABERTURA: TStringField;
    ImpFichaC_ALTERACAO: TStringField;
    ImpFichaC_FICHA: TStringField;
    ImpFichaC_CONTRATO: TStringField;
    ImpFichaC_CARTAO: TStringField;
    ImpFichaC_CARTEIRA: TStringField;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppLine35: TppLine;
    ppLabel56: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLabel59: TppLabel;
    ppLine40: TppLine;
    ppLine41: TppLine;
    procedure butNovo1Click(Sender: TObject);
    procedure butAlterar1Click(Sender: TObject);
    procedure butNovo2Click(Sender: TObject);
    procedure butAlterar2Click(Sender: TObject);
    procedure butNovo3Click(Sender: TObject);
    procedure buAlterar3Click(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butExcluir1Click(Sender: TObject);
    procedure butExcluir2Click(Sender: TObject);
    procedure butExcluir3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butImprimirClick(Sender: TObject);
    procedure RelFichaPreviewFormCreate(Sender: TObject);
    procedure ImpFichaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ChamaDiretor(Operacao: String);
    procedure ChamaRefBanco(Operacao: String);
    procedure ChamaRefComercio(Operacao: String);
    procedure ExcluirDaTabela(Tabela: TClientDataSet);
    procedure Teclas(var key: word);
    procedure SalvarObservacao;
  public
    { Public declarations }
  end;

var
  fFicha: TfFicha;

implementation

uses uDM, uItensFicha, UUtil, uDMRegra;

{$R *.dfm}

{ TfFicha }

procedure TfFicha.ChamaDiretor(Operacao: String);
begin
   if Operacao = 'A' then
   begin
      if dm.Diretor.RecordCount = 0 then
      begin
         Mensagem('Não há Registro para Alterar');
         exit;
      end;
   end;

   fItensFicha:=TfItensFicha.create(nil);
   fItensFicha.EditTabela.text:='D';
   fItensFicha.CodCliente.Text:=CodCliente.Text;
   if Operacao = 'I' then
      dm.Diretor.Append;
   fItensFicha.showModal;
   fItensFicha.free;
end;

procedure TfFicha.ChamaRefBanco(Operacao: String);
begin
   if Operacao = 'A' then
   begin
      if dm.RefBanco.RecordCount = 0 then
      begin
         Mensagem('Não há Registro para Alterar');
         exit;
      end;
   end;

   fItensFicha:=TfItensFicha.create(nil);
   fItensFicha.EditTabela.text:='B';
   fItensFicha.CodCliente.Text:=CodCliente.Text;
   if Operacao = 'I' then
      dm.RefBanco.Append;
   fItensFicha.showModal;
   fItensFicha.free;
end;

procedure TfFicha.ChamaRefComercio(Operacao: String);
begin
   if Operacao = 'A' then
   begin
      if dm.RefComercio.RecordCount = 0 then
      begin
         Mensagem('Não há Registro para Alterar');
         exit;
      end;
   end;
   fItensFicha:=TfItensFicha.create(nil);
   fItensFicha.CodCliente.Text:=CodCliente.Text;
   fItensFicha.EditTabela.text:='C';
   if Operacao = 'I' then
      dm.RefComercio.Append;
   fItensFicha.showModal;
   fItensFicha.free;
end;

procedure TfFicha.butNovo1Click(Sender: TObject);
begin
   ChamaDiretor('I');
end;

procedure TfFicha.butAlterar1Click(Sender: TObject);
begin
   ChamaDiretor('A');
end;

procedure TfFicha.butNovo2Click(Sender: TObject);
begin
   ChamaRefBanco('I');
end;

procedure TfFicha.butAlterar2Click(Sender: TObject);
begin
   ChamaRefBanco('A');
end;

procedure TfFicha.butNovo3Click(Sender: TObject);
begin
   ChamaRefComercio('I');
end;

procedure TfFicha.buAlterar3Click(Sender: TObject);
begin
   ChamaRefComercio('A');
end;

procedure TfFicha.ExcluirDaTabela(Tabela: TClientDataSet);
begin
   if Tabela.RecordCount = 0 then
   begin
      Mensagem('Não há Registro para excluir');
      exit;
   end;

   if Confirma('Confirmar Exclusão ?','N') = idYes then
   begin
      Tabela.Delete;
      GravaTab(Tabela);
   end
end;

procedure TfFicha.dsCadStateChange(Sender: TObject);
begin
   butOk.Enabled:=dsCad.DataSet.State = dsEdit;
   butImprimir.Enabled:=dsCad.DataSet.State = dsBrowse;
end;

procedure TfFicha.butOkClick(Sender: TObject);
begin
   if dsCad.DataSet.State = dsEdit then
   begin
      dsCad.DataSet.Post;
      GravaTab(dm.Cliente);
   end;
   SalvarObservacao;
end;

procedure TfFicha.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfFicha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Teclas(key);
end;

procedure TfFicha.butCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfFicha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm.Diretor.Close;
   dm.RefBanco.Close;
   dm.RefComercio.Close;
   dm.Cad_Obs.Close;
end;

procedure TfFicha.butExcluir1Click(Sender: TObject);
begin
   ExcluirDaTabela(dm.Diretor);
end;

procedure TfFicha.butExcluir2Click(Sender: TObject);
begin
   ExcluirDaTabela(dm.RefBanco);
end;

procedure TfFicha.butExcluir3Click(Sender: TObject);
begin
   ExcluirDaTabela(dm.RefComercio);
end;

procedure TfFicha.FormActivate(Sender: TObject);
begin
   if not (sheetFicha.Showing) then
      sheetFicha.Show;
   dm.Get_Diretor(CodCliente.text);
   dm.Get_RefBanco(CodCliente.text);
   dm.Get_RefComercio(CodCliente.text);
   dmRegra.Get_Obs(CodCliente.text,'CLI');
   if not DM.Cad_Obs.IsEmpty then
   begin
      while not dm.Cad_Obs.Eof do
      begin
         Memo1.Lines.Add(dm.Cad_ObsTEXTO.Text);
         dm.Cad_Obs.Next;
      end;
   end;
end;

procedure TfFicha.Memo1Change(Sender: TObject);
begin
   if butOk.Enabled = false then
      butOk.Enabled:=(trim(memo1.Text) <> '');
end;

procedure TfFicha.butExcluirClick(Sender: TObject);
begin
   if Confirma('Confirmar Exclusão ?','N')= idyes then
   begin
      Memo1.Clear;
      dsObs.DataSet.First;
      while not dsBanco.DataSet.Eof do
         dsBanco.DataSet.Delete;
      dm.SalvaTab(dm.Cad_Obs);
      dm.salvaTrans;
   end;
end;

procedure TfFicha.Memo1Enter(Sender: TObject);
begin
   fficha.KeyPreview:=false;
end;

procedure TfFicha.Memo1Exit(Sender: TObject);
begin
   fficha.KeyPreview:=true;
end;

procedure TfFicha.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Teclas(key);
end;

procedure TfFicha.Teclas(var key: word);
begin
   if key = vk_Escape then
      close;
   if key = vk_F6 then
   begin
      if butOk.Enabled then
      begin
         butOk.SetFocus;
         butOkClick(self);
      end;
   end;
end;

procedure TfFicha.SalvarObservacao;
var i: integer;
begin
   if trim(Memo1.Text) = '' then
      exit;

   dm.Cad_Obs.First;
   while not dm.Cad_Obs.Eof do
      dm.Cad_Obs.Delete;
   for i:=0 to Memo1.Lines.Count -1 do
   begin
      dm.Cad_Obs.Append;
      dm.Cad_ObsCODIGO.Text:=CodCliente.text;
      dm.Cad_ObsTIPO.Text:='CLI';
      dm.Cad_ObsNUM_LINHA.AsInteger:=i;
      dm.Cad_ObsCODEMPRESA.Text:=vgCod_Empresa;
      dm.Cad_ObsTEXTO.Text:=Memo1.Lines[i];
      dm.Cad_Obs.Post;
   end;
   dm.SalvaTab(dm.Cad_Obs);
end;

procedure TfFicha.butImprimirClick(Sender: TObject);
begin
   if dsCad.DataSet.State in [dsInsert, dsEdit] then
   begin
      mensagem('Salve a Ficha Antes de Imprimir');
      exit;
   end;
   ImpFicha.Close;
   ImpFicha.Params[0].Text:=dm.ClienteCOD_CLIENTE.Text;
   ImpFicha.Open;
   RelFicha.print;
   ImpFicha.Close
end;

procedure TfFicha.RelFichaPreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TfFicha.ImpFichaCalcFields(DataSet: TDataSet);
begin
   if ImpFichaTIPO_FICHA.Text = 'N' then
      ImpFichaC_ABERTURA.Text:='X'
   else
      ImpFichaC_ALTERACAO.text:='X';

   if ImpFichaFICHA_CADASTRAL.Text = 'S' then
      ImpFichaC_FICHA.Text:='X';
   if ImpFichaCONTRATO_SOCIAL.Text = 'S' then
      ImpFichaC_CONTRATO.Text:='X';
   if ImpFichaCARTAO_CADASTRAL.Text = 'S' then
      ImpFichaC_CARTAO.Text:='X';
   if ImpFichaDOC_PROPRIETARIO.Text = 'S' then
      ImpFichaC_CARTEIRA.Text:='X';

end;

end.
