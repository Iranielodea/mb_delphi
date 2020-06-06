unit uCargaII;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDM, uDMRegra, uRCarga,
  uParcelas, UImpressaoCarga, udmParametros, UUtil, ufrmImpressaoAutorizacao,
  Data.FMTBcd, Data.SqlExpr, System.MaskUtils, ppEndUsr, ppDB, ppTxPipe,
  ppParameter, ppDesignLayer, ppModule, raCodMod, ppVar, ppBands, ppMemo,
  ppCtrls, ppStrtch, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uDMUnidade;

type
  TfCargaII = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    butSair: TSpeedButton;
    butImprimir: TSpeedButton;
    butCond: TSpeedButton;
    butNovo: TBitBtn;
    butSalvar: TBitBtn;
    butExcluir: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    dsCad: TDataSource;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label24: TLabel;
    Label27: TLabel;
    SpeedButton7: TSpeedButton;
    Label30: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Cod_Manifesto: TDBEdit;
    Nome_Manifesto: TDBEdit;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    Label15: TLabel;
    SpeedButton5: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton6: TSpeedButton;
    Label28: TLabel;
    Label29: TLabel;
    id_Carga: TDBEdit;
    Num_Carga: TDBEdit;
    Letra: TDBEdit;
    Visto: TDBEdit;
    Data: TDBEdit;
    Num_Pedido: TDBEdit;
    EditId_Carga: TEdit;
    butVerPedido: TBitBtn;
    Cod_Motorista: TDBEdit;
    Nome_Motorista: TDBEdit;
    Placa: TDBEdit;
    Cod_Agencia: TDBEdit;
    Nome_Agencia: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Panel6: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Cod_For: TDBEdit;
    Nome_For: TDBEdit;
    Cod_Cliente: TDBEdit;
    Nome_Cliente: TDBEdit;
    Cod_Contato: TDBEdit;
    Nome_Contato: TDBEdit;
    Panel7: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Valor_Carrega: TDBEdit;
    ValorDif: TEdit;
    Panel8: TPanel;
    Label9: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label31: TLabel;
    Valor_Frete: TDBEdit;
    Qtde: TDBEdit;
    EditSaldo: TDBEdit;
    CboUnidade: TDBComboBox;
    Compl: TDBEdit;
    edtQtdeCarga: TDBEdit;
    Label19: TLabel;
    Label23: TLabel;
    MemoArmazem: TDBMemo;
    MemoObs: TMemo;
    chkPDF: TCheckBox;
    butAutoriza: TBitBtn;
    QMot: TSQLQuery;
    QMotCONTATO: TStringField;
    QMotCPF: TStringField;
    QMotESTADO_CPF: TStringField;
    QMotPLACA_REBOQUE1: TStringField;
    QMotPLACA_REBOQUE2: TStringField;
    QMotINSC_ESTADUAL: TStringField;
    QMotCNH: TStringField;
    QAuto: TSQLQuery;
    QAutoENDERECO: TStringField;
    QAutoNUMERO: TStringField;
    QAutoCEP: TStringField;
    QAutoCNPJ: TStringField;
    QAutoINSC_ESTADUAL: TStringField;
    QAutoDESC_CIDADE: TStringField;
    QAutoSIGLA: TStringField;
    QAutoCOMPLEMENTO: TStringField;
    Rel: TppReport;
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    mmTransp: TppMemo;
    lblNumPedido: TppLabel;
    lblObs2: TppLabel;
    mmCte: TppMemo;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    varNome: TppVariable;
    ppLine2: TppLine;
    varEnd: TppVariable;
    varCnpj: TppVariable;
    varIE: TppVariable;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    txtDoc: TppTextPipeline;
    Cidade_Data: TppField;
    txtDocppField2: TppField;
    txtDocppField3: TppField;
    txtDocppField7: TppField;
    txtDocppField8: TppField;
    txtDocppField9: TppField;
    txtDocppField1: TppField;
    txtDocppField4: TppField;
    txtDocppField5: TppField;
    txtDocppField6: TppField;
    txtDocppField10: TppField;
    txtDocppField11: TppField;
    txtDocppField12: TppField;
    txtDocppField13: TppField;
    txtDocppField14: TppField;
    txtDocppField15: TppField;
    txtDocppField16: TppField;
    txtDocppField17: TppField;
    txtDocppField18: TppField;
    desAutoriza: TppDesigner;
    QForn: TSQLQuery;
    QFornNOME: TStringField;
    QFornCNPJ: TStringField;
    QFornENDERECO: TStringField;
    QFornCIDADE_UF: TStringField;
    QFornCEP: TStringField;
    QFornFONE1: TStringField;
    QFornEMAIL: TStringField;
    QFornBAIRRO: TStringField;
    QFornCPF_TRANSP: TStringField;
    QFornCOD_TRANS: TIntegerField;
    QFornINSC_ESTADUAL: TStringField;
    QTransp: TSQLQuery;
    QTranspCOD_TRANS: TIntegerField;
    QTranspNOME: TStringField;
    QTranspCNPJ: TStringField;
    QTranspCPF_TRANSP: TStringField;
    QTranspENDERECO: TStringField;
    QTranspCIDADE_UF: TStringField;
    QTranspCEP: TStringField;
    QTranspFONE1: TStringField;
    QTranspEMAIL: TStringField;
    QTranspBAIRRO: TStringField;
    QTranspINSC_ESTADUAL: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure butCondClick(Sender: TObject);
    procedure butAutorizaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure PesquisaCarga(inCodigo: String);
    procedure Dados_Obs(Tipo: string);
    function TipoRelatorio: string;
    procedure NovaImpressaoAutorizacao;
    procedure DadosTransportador;
    procedure DadosEmissorCTE;
    procedure ListarUnidades;
  public
    { Public declarations }
  end;

var
  fCargaII: TfCargaII;

implementation

{$R *.dfm}

procedure TfCargaII.butAutorizaClick(Sender: TObject);
var Arq: TextFile;
   vlData:  String;
   vlEnd:   String;
   vlCid:   String;
   vlUf:    String;
   vlCnpj:  String;
   vlInsc:  String;
   vlCep:   String;
   vlPlaca1: String;
   vlPlaca2: String;
   vlCpf:    String;
   vlUF_Cpf: String;
   vlArmazem: String;
   vlQtde:    String;
   sCNH: string;
   Formulario: TfImpressaoCarga;
begin
   if Cod_Cliente.Text = '' then
   begin
      Mensagem('Escolha um cliente');
      exit;
   end;

   Formulario := TfImpressaoCarga.Create(Self);
   Formulario.ImprimirOrdem(StrToIntDef(id_Carga.Text, 0), StrToIntDef(Num_Carga.Text, 0), chkPDF.Checked);
   FreeAndNil(Formulario);
   Exit;
//------------------------------------------------------------------------------
  if TipoRelatorio = '2' then
  begin
    NovaImpressaoAutorizacao;
    Exit;
  end;
//------------------------------------------------------------------------------
// Não mais usado

   QAuto.close;
   Qauto.Params[0].Text:=vgCod_Empresa;
   Qauto.Params[1].Text:=Cod_Cliente.Text;
   Qauto.Open;

   vlCpf:='';
   vlUf_Cpf:='';
   vlPlaca1:='';
   vlPlaca2:='';
   sCNH := '';

   if Cod_Motorista.Text <> '' then
   begin
      Qmot.Close;
      Qmot.Params[0].Text:=Cod_Motorista.text;
      Qmot.Open;
      if not Qmot.IsEmpty then
      begin
         if QMotCPF.Text <> '' then
            vlCpf := 'CPF ' + formatMaskText('###.###.###-##;0;_',QMotCPF.Text);
         if QMotESTADO_CPF.Text <> '' then
            vlUF_Cpf := QMotESTADO_CPF.Text;
         if QMotPLACA_REBOQUE1.Text <> '' then
            vlPlaca1 := ' / ' + QMotPLACA_REBOQUE1.Text;
         if QMotPLACA_REBOQUE2.Text <> '' then
            vlPlaca2 := ' / ' + QMotPLACA_REBOQUE2.Text;

         if QMotCNH.AsString <> '' then
          sCNH := ' CNH ' + QMotCNH.AsString;

      end;
      Qmot.Close;
   end;

   vlEnd:=QAutoENDERECO.Text+' '+QAutoNUMERO.Text+' '+QAutoCOMPLEMENTO.Text;
   vlCid:=QAutoDESC_CIDADE.Text;
   vlUf:=QAutoSIGLA.Text;
   vlCnpj:=formatMaskText('##.###.###/####-##;0;_',QAutoCNPJ.Text);
   vlInsc:=QautoInsc_Estadual.text;
   vlCep:=formatMaskText('#####-###;0;_',QAutoCEP.Text);
   vlArmazem:=MemoArmazem.Text;
   QAuto.close;

   vlQtde := formatfloat(',###', dm.CargaQTDE.AsFloat * dm.CargaQTDE_CADA.AsFloat);

   vlData:=formatdateTime('dd" de " mmmm "de" yyyy',strtodate(Data.Text));

   assignfile(Arq,'doc.txt');
   rewrite(arq);

   write(Arq,vlCid+' - '+vluf+', '+vlData+'#');
   write(Arq,vlArmazem+'#');
   write(Arq,'     AUTORIZAMOS O SR. '+Nome_Motorista.text+', ' + vlCpf + ' ' + vlUF_Cpf + sCNH);
   write(Arq,' MOTORISTA DO CAMINHÃO PLACA(S) '+Placa.text + ' ' + vlPlaca1 + ' ' + vlPlaca2 +', A RETIRAR ');
   write(Arq,'PARA A NOSSA EMPRESA A TONELAGEM DE ' + vlQtde + ' KG CORRESPONDENTE A QUANTIDADE DE '+ Qtde.text+' '+CboUnidade.text+' DE AÇÚCAR DE '+ Compl.text+'#');
   write(Arq,Nome_Cliente.text+'#');
   write(Arq,vlEnd+' - CEP '+vlCep+' - '+vlCid+' - '+vlUf+'#');
   write(Arq,'CNPJ - '+vlCnpj+'#');
   write(Arq,'I.E: - '+vlInsc+'#');
   closefile(Arq);

   Rel.Template.FileName:='Autoriza.rtm';
   Rel.Template.LoadFromFile;

   DadosTransportador;

   Rel.Print;
end;

procedure TfCargaII.butCondClick(Sender: TObject);
begin
   fParcelas:=TfParcelas.create(Self);
   fParcelas.ValorPedido.Text:=formatfloat(',#0.00',dm.CargaVALOR_CARREGA.AsFloat);
   fParcelas.DataEmissao.Text:=Data.Text;
   fParcelas.editNumPedido.Text:=Num_Pedido.Text;
   fParcelas.EditNumCarga.Text:=id_Carga.Text;
   fParcelas.editCarga.Text:='S';
   fParcelas.showModal;
   fParcelas.free;
end;

procedure TfCargaII.butImprimirClick(Sender: TObject);
begin
   frCarga:=TfrCarga.create(self);
   with frCarga do
   begin
      frCarga.EditValorUnit.Text:=ValorDif.Text;
      carga.Close;
      Carga.Params[0].Text:=dm.CargaID_CARGA.Text;
      Carga.Open;

      OutrasCargas(Num_Carga.Text, Letra.text, vgCod_Empresa);

      Rel.Template.FileName:='Carga.rtm';
      Rel.Template.LoadFromFile;

      Rel.Print;
      Carga.Close;
      free;
   end;

end;

procedure TfCargaII.butSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfCargaII.DadosEmissorCTE;
var
  lNome: string;
  lEndereco: string;
  lCidade: string;
  lLocal: string;
  lIE: string;
begin

  mmCte.Clear;

  QTransp.Close;
  QTransp.ParamByName('Cod_Trans').AsInteger := DM.CargaCOD_MANIFESTO.AsInteger;
  QTransp.Open;

  if QTransp.IsEmpty then
    Exit;

  mmCte.Lines.Add('Emissor CTe:');
  mmCte.Lines.Add('');
  lNome := QTranspNOME.AsString;

  if QTranspCNPJ.AsString <> '' then
    lNome := lNome + ' - ' +  formatMaskText('##.###.###/####-##;0;_',QTranspCNPJ.AsString);

  if QTranspCPF_TRANSP.AsString <> '' then
    lNome := lNome + ' - ' +  formatMaskText('###.###.###-##;0;_',QTranspCPF_TRANSP.AsString);

  lIE := '';
  if Trim(QTranspINSC_ESTADUAL.AsString) <> '' then
    lIE := 'I.E: ' + QTranspINSC_ESTADUAL.AsString;

  lEndereco := '';
  if Trim(QTranspENDERECO.AsString) <> '' then
    lEndereco := QTranspENDERECO.AsString;
  if QTranspBAIRRO.AsString <> '' then
    lEndereco := lEndereco + ' ' + QTranspBAIRRO.AsString;

  lCidade := '';
  if QTranspCEP.AsString <> '' then
    lCidade := formatMaskText('#####-###;0;_',QTranspCEP.AsString);

  lCidade := lCidade + ' ' + QTranspCIDADE_UF.AsString;

  lLocal := '';
  if Trim(QTranspEMAIL.AsString) <> '' then
    lLocal := QTranspEMAIL.AsString;

  if Trim(QTranspFONE1.AsString) <> '' then
    lLocal := lLocal + ' Fone: ' + QTranspFONE1.AsString;

  mmCte.Lines.Add(lNome);
  mmCte.Lines.Add(lEndereco);
  mmCte.Lines.Add(lCidade);
  mmCte.Lines.Add(lLocal);

  if lIE <> '' then
    mmCte.Lines.Add(lIE);

end;

procedure TfCargaII.DadosTransportador;
var
  lNome: string;
  lEndereco: string;
  lCidade: string;
  lLocal: string;
  lIE: string;
begin
  lblNumPedido.Caption := 'P-' + DM.CargaNUM_PEDIDO.AsString;
  lblObs2.Caption := DBMemo2.Text;

  QForn.Close;
  QForn.ParamByName('cod_motorista').AsInteger := DM.CargaCOD_MOTORISTA.AsInteger;
  QForn.Open;

  if QForn.IsEmpty then
  begin
    mmTransp.Clear;
    Exit;
  end;

  mmTransp.Clear;
  mmTransp.Lines.Add('Proprietário Veículo:');
  mmTransp.Lines.Add('');
  lNome := QFornNOME.AsString;

  if QFornCNPJ.AsString <> '' then
    lNome := lNome + ' - ' +  formatMaskText('##.###.###/####-##;0;_',QFornCNPJ.AsString);

  if QFornCPF_TRANSP.AsString <> '' then
    lNome := lNome + ' - ' +  formatMaskText('###.###.###-##;0;_',QFornCPF_TRANSP.AsString);

  lIE := '';
  if Trim(QFornINSC_ESTADUAL.AsString) <> '' then
    lIE := 'I.E: ' + QFornINSC_ESTADUAL.AsString;

  lEndereco := '';
  if Trim(QFornENDERECO.AsString) <> '' then
    lEndereco := QFornENDERECO.AsString;
  if QFornBAIRRO.AsString <> '' then
    lEndereco := lEndereco + ' ' + QFornBAIRRO.AsString;

  lCidade := '';
  if QFornCEP.AsString <> '' then
    lCidade := formatMaskText('#####-###;0;_',QFornCEP.AsString);

  lCidade := lCidade + ' ' + QFornCIDADE_UF.AsString;

  lLocal := '';
  if Trim(QFornEMAIL.AsString) <> '' then
    lLocal := QFornEMAIL.AsString;

  if Trim(QFornFONE1.AsString) <> '' then
    lLocal := lLocal + ' Fone: ' + QFornFONE1.AsString;

  mmTransp.Lines.Add(lNome);
  mmTransp.Lines.Add(lEndereco);
  mmTransp.Lines.Add(lCidade);
  mmTransp.Lines.Add(lLocal);

  if lIE <> '' then
    mmTransp.Lines.Add(lIE);

  DadosEmissorCTE;

end;

procedure TfCargaII.Dados_Obs(Tipo: string);
var i: integer;
begin
// Tipo: I-Incluir M-Mostrar

   dm.Cad_Obs.First;
   if Tipo = 'I' then
   begin
      while not dm.Cad_Obs.Eof do
         dm.Cad_Obs.Delete;

      for i:=0 to MemoObs.Lines.Count - 1 do
      begin
         dm.Cad_Obs.Append;
         dm.Cad_ObsCODIGO.Text:=id_Carga.Text;
         dm.Cad_ObsTIPO.Text:='CAR';
         dm.Cad_ObsNUM_LINHA.AsInteger:=i;
         dm.Cad_ObsCODEMPRESA.Text:=vgCod_Empresa;
         dm.Cad_ObsTEXTO.Text:=MemoObs.Lines[i];
         dm.Cad_Obs.Post;
      end;
      dm.SalvaTab(dm.Cad_Obs);
   end
   else begin
      MemoObs.Clear;
      while not dm.Cad_Obs.Eof do
      begin
         MemoObs.Lines.Add(dm.Cad_ObsTEXTO.Text);
         DM.Cad_Obs.Next;
      end;
   end;
end;

procedure TfCargaII.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Close;
end;

procedure TfCargaII.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfCargaII.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  ListarUnidades();
  PesquisaCarga(EditId_Carga.Text);
  dmRegra.Saldo_Carga(id_Carga.Text,Num_Pedido.Text);
  ValorDif.Text := dmRegra.Calcula_Lucro(Num_Pedido.Text,'N');
  dmRegra.Get_Obs(dm.CargaID_CARGA.Text,'CAR');
//    ControleMetodo('Dados_Obs');
  Dados_Obs('M');

end;

procedure TfCargaII.ListarUnidades;
var
  lUnidade: TdmUnidade;
begin
  lUnidade := TdmUnidade.Create(Self);
  try
    lUnidade.ListarTodos(StrToInt(vgCod_Empresa));
    CboUnidade.Clear;
    while not lUnidade.QUnidade.Eof do
    begin
      CboUnidade.Items.Add(lUnidade.QUnidadeDESC_UNIDADE.AsString);
      lUnidade.QUnidade.Next;
    end;
    CboUnidade.ItemIndex := 0;
  finally
    FreeAndNil(lUnidade);
  end;

end;

procedure TfCargaII.NovaImpressaoAutorizacao;
begin
  // implementar
  frmImpressaoAutorizacao := TfrmImpressaoAutorizacao.Create(self);
  frmImpressaoAutorizacao.Impressao(DM.CargaID_CARGA.AsInteger);
  frmImpressaoAutorizacao.free;
end;

procedure TfCargaII.PesquisaCarga(inCodigo: String);
begin
   dm.Carga.Close;
   dm.Carga.Params[0].Text:=vgCod_Empresa;
   dm.Carga.Params[1].Text:=inCodigo;
   dm.Carga.open;
end;

function TfCargaII.TipoRelatorio: string;
var
  lParametro: TdmParametros;
begin
  lParametro := TdmParametros.Create(Self);
  try
    Result := lParametro.RetornoTipoRelatorioAutorizacao();
  finally
    FreeAndNil(lParametro);
  end;

end;

end.
