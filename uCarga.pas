unit uCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, Buttons,
  FMTBcd, SqlExpr, MaskUtils, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDB, ppTxPipe, ppBands, ppCtrls, ppPrnabl, ppCache, ppStrtch, ppMemo, ppViewr,
  ppModule, raCodMod, ppVar, ppEndUsr, ppParameter, ppDesignLayer, uClassContaBanco,
  uDMCargaVencto, Vcl.Grids, Vcl.DBGrids, uFinanceiro, udmPessoaCredito,
  uServicoCarga;

type
  TfCarga = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    dsCad: TDataSource;
    Panel4: TPanel;
    Label1: TLabel;
    id_Carga: TDBEdit;
    Num_Carga: TDBEdit;
    Label2: TLabel;
    Letra: TDBEdit;
    Label11: TLabel;
    Visto: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Data: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Cod_For: TDBEdit;
    Nome_For: TDBEdit;
    Cod_Cliente: TDBEdit;
    Nome_Cliente: TDBEdit;
    Cod_Contato: TDBEdit;
    Nome_Contato: TDBEdit;
    Label7: TLabel;
    Num_Pedido: TDBEdit;
    Panel6: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Valor_Carrega: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label19: TLabel;
    butNovo: TBitBtn;
    butSalvar: TBitBtn;
    butSair: TSpeedButton;
    butImprimir: TSpeedButton;
    butExcluir: TBitBtn;
    Qpesq: TSQLQuery;
    QpesqQTDE: TIntegerField;
    EditId_Carga: TEdit;
    QSaldo: TSQLQuery;
    QSaldoQTDE_ENTREGUE: TFloatField;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    Label21: TLabel;
    DBEdit3: TDBEdit;
    butCond: TSpeedButton;
    QPedido: TSQLQuery;
    QPedidoVALOR_LUCRO: TFloatField;
    QPesqCarga: TSQLQuery;
    QPesqCargaID_CARGA: TIntegerField;
    butVerPedido: TBitBtn;
    butAutoriza: TBitBtn;
    QAuto: TSQLQuery;
    QAutoENDERECO: TStringField;
    QAutoNUMERO: TStringField;
    QAutoCEP: TStringField;
    QAutoCNPJ: TStringField;
    QAutoINSC_ESTADUAL: TStringField;
    QAutoDESC_CIDADE: TStringField;
    QAutoSIGLA: TStringField;
    Cod_Motorista: TDBEdit;
    Nome_Motorista: TDBEdit;
    Label15: TLabel;
    SpeedButton5: TSpeedButton;
    Placa: TDBEdit;
    Label16: TLabel;
    Cod_Agencia: TDBEdit;
    Label17: TLabel;
    Nome_Agencia: TDBEdit;
    SpeedButton6: TSpeedButton;
    Panel8: TPanel;
    Label9: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Valor_Frete: TDBEdit;
    Qtde: TDBEdit;
    Label22: TLabel;
    ValorDif: TEdit;
    QMot: TSQLQuery;
    Qpesq1: TSQLQuery;
    Qpesq1N_CARGA: TIntegerField;
    DBRadioGroup1: TDBRadioGroup;
    QMotCONTATO: TStringField;
    EditSaldo: TDBEdit;
    MemoArmazem: TDBMemo;
    MemoObs: TMemo;
    QAutoCOMPLEMENTO: TStringField;
    txtDoc: TppTextPipeline;
    Rel: TppReport;
    Cidade_Data: TppField;
    txtDocppField2: TppField;
    txtDocppField3: TppField;
    txtDocppField7: TppField;
    txtDocppField8: TppField;
    txtDocppField9: TppField;
    txtDocppField1: TppField;
    desAutoriza: TppDesigner;
    txtDocppField4: TppField;
    txtDocppField5: TppField;
    txtDocppField6: TppField;
    txtDocppField10: TppField;
    QMotCPF: TStringField;
    QMotESTADO_CPF: TStringField;
    QMotPLACA_REBOQUE1: TStringField;
    QMotPLACA_REBOQUE2: TStringField;
    Label25: TLabel;
    CboUnidade: TDBComboBox;
    Compl: TDBEdit;
    Label26: TLabel;
    txtDocppField11: TppField;
    txtDocppField12: TppField;
    txtDocppField13: TppField;
    txtDocppField14: TppField;
    txtDocppField15: TppField;
    txtDocppField16: TppField;
    txtDocppField17: TppField;
    txtDocppField18: TppField;
    QForn: TSQLQuery;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    Label24: TLabel;
    DBMemo1: TDBMemo;
    butConfig: TBitBtn;
    butConfigAut: TBitBtn;
    DBMemo2: TDBMemo;
    Label27: TLabel;
    DBEdit1: TDBEdit;
    Label28: TLabel;
    QFornNOME: TStringField;
    QFornCNPJ: TStringField;
    QFornENDERECO: TStringField;
    QFornCIDADE_UF: TStringField;
    QFornCEP: TStringField;
    QFornFONE1: TStringField;
    QFornEMAIL: TStringField;
    QFornBAIRRO: TStringField;
    DataNF: TDBEdit;
    Label29: TLabel;
    QFornCPF_TRANSP: TStringField;
    Nome_Manifesto: TDBEdit;
    SpeedButton7: TSpeedButton;
    Label30: TLabel;
    Cod_Manifesto: TDBEdit;
    QFornCOD_TRANS: TIntegerField;
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
    edtQtdeCarga: TDBEdit;
    Label31: TLabel;
    QMotINSC_ESTADUAL: TStringField;
    QFornINSC_ESTADUAL: TStringField;
    QTranspINSC_ESTADUAL: TStringField;
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
    QMotCNH: TStringField;
    chkPDF: TCheckBox;
    CodBanco: TDBEdit;
    Label32: TLabel;
    NumConta: TDBEdit;
    SpeedButton8: TSpeedButton;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit5: TDBEdit;
    Label36: TLabel;
    DBEdit8: TDBEdit;
    GroupBox1: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    dsCargaVencto: TDataSource;
    tsFinanceiro: TTabSheet;
    Panel9: TPanel;
    DBGrid1: TDBGrid;
    btnExcluirParcela: TBitBtn;
    btnGerarParcelas: TBitBtn;
    Label40: TLabel;
    dbedtCOD_USINA: TDBEdit;
    dbedtNOME_USINA: TDBEdit;
    btnUsina: TSpeedButton;
    Label23: TLabel;
    edtCredito: TEdit;
    procedure butSairClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Nome_ClienteExit(Sender: TObject);
    procedure Nome_ContatoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Num_PedidoExit(Sender: TObject);
    procedure Cod_ContatoExit(Sender: TObject);
    procedure Nome_ForExit(Sender: TObject);
    procedure Nome_MotoristaExit(Sender: TObject);
    procedure Nome_AgenciaExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure butSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butExcluirClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure Valor_FreteExit(Sender: TObject);
    procedure QtdeExit(Sender: TObject);
    procedure butCondClick(Sender: TObject);
    procedure butConfigClick(Sender: TObject);
    procedure butVerPedidoClick(Sender: TObject);
    procedure DataExit(Sender: TObject);
    procedure butAutorizaClick(Sender: TObject);
    procedure MemoObsEnter(Sender: TObject);
    procedure MemoObsExit(Sender: TObject);
    procedure RelPreviewFormCreate(Sender: TObject);
    procedure butConfigAutClick(Sender: TObject);
    procedure CboUnidadeChange(Sender: TObject);
    procedure DataNFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Nome_ManifestoExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure edtQtdeCargaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure NumContaExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirParcelaClick(Sender: TObject);
    procedure dsCargaVenctoStateChange(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure QtdeEnter(Sender: TObject);
    procedure DataNFEnter(Sender: TObject);
    procedure DataNFExit(Sender: TObject);
    procedure btnUsinaClick(Sender: TObject);
    procedure dbedtNOME_USINAExit(Sender: TObject);
  private
    { Private declarations }
    FDMVencto: TdmCargaVencto;
    procedure Pesquisa_Letra;
    procedure PesquisaCarga(inCodigo: String);
    procedure Altera_Visto;
    procedure Dados_Pedido(inPedido: String);
    procedure Saldo;
    procedure Calcula_Lucro(Tipo: String);
    procedure Busca_Agencia;
    procedure DadosTransportador;
    procedure DadosEmissorCTE;
    function ValidaCarga: Boolean;
    procedure Dados_Obs(Tipo: string);
    procedure TipoUnidade;
    procedure BuscaTransportador(CodTrans: Integer);
    procedure BuscarPedido;
    procedure ListarUnidades;
    procedure NovaImpressaoAutorizacao;
    function TipoRelatorio: string;
    procedure PreencherObservacao3;

    procedure ControleMetodo(mensgem: string);
    procedure MontarContas;
    procedure ModoEdicao;
    procedure SalvarParcelas;
    procedure BuscarCredito(ACodCliente: Integer);
  public
    { Public declarations }
  end;

var
  fCarga: TfCarga;

implementation

uses uDM, UUtil, uDMRegra, uFornecedor, uCliente, uMotorista, uAgenciador,
  uPesqPedido, uParcelas, uRCarga, uPedido, uTransportador, udmTransportadora,
  uDMCarga, uDMUnidade, ufrmImpressaoAutorizacao, udmParametros,
  UImpressaoCarga, uContaBanco;

{$R *.dfm}

procedure TfCarga.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfCarga.dbedtNOME_USINAExit(Sender: TObject);
begin
  if dbedtNOME_USINA.Modified then
   begin
      dmRegra.PesquisaFornecedor(dbedtNOME_USINA.Text);
      dm.CargaCOD_USINA.Text:=dm.FornecedorCOD_FOR.Text;
      dm.CargaNOME_USINA.Text:=dm.FornecedorNOME.Text;
      dm.Fornecedor.Close;
      ffornecedor.Free;
      dbedtNOME_USINA.Modified:=false;
   end;
end;

procedure TfCarga.dsCadStateChange(Sender: TObject);
begin
   butNovo.Enabled:=dsCad.DataSet.State in [dsBrowse];
   butImprimir.Enabled:=dsCad.DataSet.State in [dsBrowse];
   butCond.Enabled:=dsCad.DataSet.State in [dsBrowse];
   butSalvar.Enabled:=dsCad.DataSet.State in [dsEdit, dsInsert];
   butExcluir.Enabled:=dsCad.DataSet.State in [dsBrowse];
   butAutoriza.Enabled:=dsCad.DataSet.State in [dsBrowse];
end;

procedure TfCarga.dsCargaVenctoStateChange(Sender: TObject);
begin
  if dsCargaVencto.State in [dsEdit, dsInsert] then
    ModoEdicao();
end;

procedure TfCarga.edtQtdeCargaExit(Sender: TObject);
begin
  if dsCad.State in [dsEdit, dsInsert] then
    DM.CargaCOMPLUNIDADE.AsString := edtQtdeCarga.Text + ' KG CADA.';
end;

procedure TfCarga.Pesquisa_Letra;
begin
   dmRegra.Pesquisa_Letra(trim(Data.Text),Cod_Motorista.Text,Num_Pedido.Text);
end;

procedure TfCarga.PreencherObservacao3;
begin
  DM.CargaOBS2.AsString := '"AÇUCAR ADIQUIRIDO DA ' + dm.FornecedorNOME.AsString + '"';
end;

procedure TfCarga.butNovoClick(Sender: TObject);
begin
   MemoObs.Clear;
   ControleMetodo('butNovo.Get_Obs');
   dmRegra.Get_Obs('0','CAR');
   dm.Carga.Append;
   edtCredito.Text := '0';
   TipoUnidade;
   Nome_Motorista.SetFocus;
end;

procedure TfCarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if not (dsCad.DataSet.State in [dsInsert]) then
   begin
      if ValidaCarga = false then
      begin
         action:=canone;
         exit;
      end;
   end;

   if dsCad.DataSet.State in [dsedit,dsinsert] then
      dscad.DataSet.Cancel;
   dscad.DataSet.Close;
   dm.Cad_Obs.Close;

  if vgUsuario <> 'SUPERVISOR' then
    dmRegra.ExportarCargaWEB('', '', 0);
end;

procedure TfCarga.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDMVencto);
end;

procedure TfCarga.FormActivate(Sender: TObject);
begin
//   dm.Tamanho_Form(fCarga);
//   butConfig.Visible:=vgUsuario = 'SUPERVISOR';
//   butConfigAut.Visible:=vgUsuario = 'SUPERVISOR';
//
//   if EditId_Carga.Text = '' then
//   begin
//      PesquisaCarga('0');
//      butNovoClick(self);
//   end
//   else begin
//      PesquisaCarga(EditId_Carga.Text);
//      Saldo;
//      Calcula_Lucro('N');
//
//      dmRegra.Get_Obs(dm.CargaID_CARGA.Text,'CAR');
//      Dados_Obs('M');
//   end;
end;

procedure TfCarga.PesquisaCarga(inCodigo: String);
begin
   dm.Carga.Close;
   dm.Carga.Params[0].Text:=vgCod_Empresa;
   dm.Carga.Params[1].Text:=inCodigo;
   dm.Carga.open;
end;

procedure TfCarga.Altera_Visto;
begin
   dmRegra.Altera_Visto(Cod_Cliente.Text,Cod_Contato.Text);
end;

procedure TfCarga.Nome_ClienteExit(Sender: TObject);
begin
   if Nome_Cliente.Modified then
   begin
      dmRegra.PesquisaCliente(Nome_Cliente.Text);
      dm.CargaCOD_CLIENTE.Text:=dm.ClienteCOD_CLIENTE.Text;
      dm.CargaNOME_CLIENTE.Text:=dm.ClienteNOME.Text;
      dm.Cliente.Close;
      fCliente.Free;
      Altera_Visto;
      BuscarCredito(DM.ClienteCOD_CLIENTE.AsInteger);
      Nome_Cliente.Modified:=false;
   end;
end;

procedure TfCarga.Nome_ContatoExit(Sender: TObject);
begin
   if Nome_Contato.Modified then
   begin
      dmRegra.PesquisaCliente(Nome_Contato.Text);
      dm.CargaCOD_CONTATO.Text:=dm.ClienteCOD_CLIENTE.Text;
      dm.CargaNOME_CONTATO.Text:=dm.ClienteNOME.Text;
      dm.Cliente.Close;
      fCliente.Free;
      Altera_Visto;
      Nome_Contato.Modified:=false;
   end;
end;

procedure TfCarga.SpeedButton3Click(Sender: TObject);
begin
   if dmRegra.PesquisaCliente('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaCOD_CLIENTE.Text:=dm.ClienteCOD_CLIENTE.text;
      dm.CargaNOME_CLIENTE.Text:=dm.ClienteNOME.Text;
      BuscarCredito(DM.ClienteCOD_CLIENTE.AsInteger);
      Altera_Visto;
   end;
   dm.Cliente.Close;
   fCliente.Free;
end;

procedure TfCarga.SpeedButton4Click(Sender: TObject);
begin
   if dmRegra.PesquisaCliente('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaCOD_CONTATO.Text:=dm.ClienteCOD_CLIENTE.text;
      dm.CargaNOME_CONTATO.Text:=dm.ClienteNOME.Text;
      Altera_Visto;
   end;
   dm.Cliente.Close;
   fCliente.Free;
end;

procedure TfCarga.Dados_Pedido(inPedido: String);
begin
   dm.Pedido.Close;
   dm.Pedido.Params[0].Text := vgCod_Empresa;
   dm.Pedido.Params[1].AsInteger := StrToIntDef(inPedido, 0);
   dm.Pedido.Open;

   if (dm.Pedido.IsEmpty) and (StrToIntDef(inPedido, 0) > 0) then
      mensagem('Pedido não Existe');

   dm.CargaNUM_PEDIDO.Text:=dm.PedidoNUM_PEDIDO.Text;
   dm.CargaQTDE_PEDIDO.AsFloat:=dm.PedidoTOTAL_QTDE.AsFloat;
   dm.CargaVALOR_PEDIDO.AsFloat:=dm.PedidoTOTAL_LIQUIDO.AsFloat;
   dm.CargaCOD_FOR.Text:=dm.PedidoCOD_FOR.Text;
   dm.CargaNOME_FORNECEDOR.Text:=dm.PedidoNOME_FOR.Text;

   dm.CargaCOD_CLIENTE.Text:=dm.PedidoCOD_CLIENTE.Text;
   dm.CargaNOME_CLIENTE.Text:=dm.PedidoNOME.Text;

   BuscarCredito(dm.PedidoCOD_CLIENTE.AsInteger);

   dm.CargaCOD_CONTATO.Text:=dm.PedidoCOD_CONTATO.Text;
   if Cod_Contato.Text <> '' then
   begin
      dmRegra.Get_Codigo(dm.QCliente,Cod_Contato.Text);
      dm.CargaNOME_CONTATO.Text:=dm.QClienteNOME.Text;
      dm.QCliente.Close;
      Cod_Contato.Modified:=false;
   end
   else
    dm.CargaNOME_CONTATO.Clear;

   BuscarPedido;

   if not dm.Pedido.IsEmpty then
   begin
      Altera_Visto;
      Pesquisa_Letra;
      Saldo;
      Calcula_Lucro('T');
      Nome_Contato.SetFocus;
   end
   else
      Num_Pedido.SetFocus;

   dm.Pedido.close;
end;

procedure TfCarga.SpeedButton2Click(Sender: TObject);
begin
   fpesqPedido:=TfpesqPedido.create(self);
   fPesqPedido.EditConsulta.Text:='S';
   if fpesqPedido.showModal = mrOk then
   begin
      dm.ModoEdicao(dsCad);
      dm.CargaNUM_PEDIDO.AsInteger := fPesqPedido.PedidoNUM_PEDIDO.AsInteger;
      Num_Pedido.Modified := True;
      Num_PedidoExit(Self);
   end;
   fpesqPedido.Pedido.close;
   fpesqPedido.free;
end;

procedure TfCarga.Saldo;
begin
//  ControleMetodo('Saldo');
   dmRegra.Saldo_Carga(id_Carga.Text,Num_Pedido.Text);
{
   if not (dm.Carga.State = dsInsert) then
      exit;

   Qsaldo.Close;
   Qsaldo.Params[0].text:=vgCod_Empresa;
   if dm.Carga.State = dsInsert then
      Qsaldo.Params[1].text:=id_Carga.Text
   else
      Qsaldo.Params[1].text:='0';
   Qsaldo.Params[2].text:=Num_Pedido.Text;
   Qsaldo.Open;

   if dm.Carga.State = dsInsert then
   begin
      if dm.CargaQTDE.AsFloat = 0 then
         dm.CargaQTDE.AsFloat:=dm.CargaQTDE_PEDIDO.AsFloat - QSaldoQTDE_ENTREGUE.AsFloat;
   end;
   dm.cargaSALDO.asfloat:=dm.CargaQTDE_PEDIDO.AsFloat - QSaldoQTDE_ENTREGUE.AsFloat - dm.CargaQTDE.AsFloat;
   Qsaldo.Close;
}
end;

procedure TfCarga.NumContaExit(Sender: TObject);
var
  obj: TContaBanco;
  sConta: string;
begin
   if NumConta.Modified then
   begin
      obj := TContaBanco.Create;
      try
        sConta := NumConta.Text;
        if NumConta.Text = '' then
          sConta := 'abcde';

        obj.GetNumConta(sConta, 'S', 1);
        dm.CargaID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.Text;
        dm.CargaNUM_CONTA.Text:=dm.ContaBancoNUM_CONTA.Text;
        dm.CargaBANCO.Text:=dm.ContaBancoBANCO.Text;
        dm.CargaAGENCIA.Text:=dm.ContaBancoAGENCIA.Text;
        dm.CargaCNPJ_CPF.AsString := dm.ContaBancoCNPJ_CPF.AsString;
        dm.ContaBanco.Close;
      finally
        FreeAndNil(obj);
      end;
      NumConta.Modified:=false;
   end;

end;

procedure TfCarga.Num_PedidoExit(Sender: TObject);
begin
   if Num_Pedido.Modified then
   begin
      if dm.CargaNUM_PEDIDO.AsInteger > 0 then
      begin
        Dados_Pedido(Num_Pedido.Text);
        MontarContas();
      end;
      Num_Pedido.Modified:=false;
   end;
end;

procedure TfCarga.Cod_ContatoExit(Sender: TObject);
begin
//tetes
end;

procedure TfCarga.ControleMetodo(mensgem: string);
begin
  Exit;
  if vgUsuario = 'SUPERVISOR' then
  begin
    ShowMessage(mensgem);
  end;
end;

procedure TfCarga.Nome_ForExit(Sender: TObject);
begin
   if Nome_For.Modified then
   begin
      dmRegra.PesquisaFornecedor(Nome_For.Text);
      dm.CargaCOD_FOR.Text:=dm.FornecedorCOD_FOR.Text;
      dm.CargaNOME_FORNECEDOR.Text:=dm.FornecedorNOME.Text;
      PreencherObservacao3();
      dm.Fornecedor.Close;
      ffornecedor.Free;
      Nome_For.Modified:=false;
   end;
end;

procedure TfCarga.Nome_ManifestoExit(Sender: TObject);
begin
   if Nome_Manifesto.Modified then
   begin
      dmRegra.PesquisaTransportador(Nome_Manifesto.Text);
      dm.CargaCOD_MANIFESTO.Text:=dm.TransportadorCOD_TRANS.Text;
      dm.CargaNOME_MANIFESTO.Text:=dm.TransportadorNOME.Text;
      dm.Transportador.Close;
      fTransportador.Free;
      Nome_Manifesto.Modified:=false;
   end;
end;

procedure TfCarga.Nome_MotoristaExit(Sender: TObject);
begin
   if Nome_Motorista.Modified then
   begin
      dmRegra.PesquisaMotorista(Nome_Motorista.Text);
      dm.CargaCOD_MOTORISTA.Text:=dm.MotoristaCOD_MOTORISTA.Text;
      dm.CargaNOME_MOTORISTA.Text:=dm.MotoristaNOME.Text;
      dm.CargaPLACA.Text:=dm.MotoristaPLACA.Text;

      BuscaTransportador(dm.MotoristaCOD_TRANS.AsInteger);
      dm.Motorista.Close;
      fMotorista.Free;
      Busca_Agencia;
      if Num_Pedido.Text <> '' then
      begin
         Num_Pedido.Modified:=true;
         Num_PedidoExit(self);

      end;
      Nome_Motorista.Modified:=false;
   end;
end;

procedure TfCarga.NovaImpressaoAutorizacao;
begin
  // implementar
  frmImpressaoAutorizacao := TfrmImpressaoAutorizacao.Create(self);
  frmImpressaoAutorizacao.Impressao(DM.CargaID_CARGA.AsInteger);
  frmImpressaoAutorizacao.free;
end;

procedure TfCarga.Nome_AgenciaExit(Sender: TObject);
begin
{
   if Nome_Agencia.Modified then
   begin
      dmRegra.PesquisaAgenciador(Nome_Agencia.Text);
      dm.CargaCOD_AGENCIA.Text:=dm.AgenciadorCOD_AGENCIA.Text;
      //dm.CargaNOME_AGENCIA.Text:=dm.AgenciadorNOME.Text;
      dm.Agenciador.Close;
      fAgenciador.Free;
      Nome_Agencia.Modified:=false;
   end;
}
end;

procedure TfCarga.SpeedButton6Click(Sender: TObject);
begin
   if dmRegra.PesquisaAgenciador('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaCOD_AGENCIA.Text:=dm.AgenciadorCOD_AGENCIA.text;
      //dm.CargaNOME_AGENCIA.Text:=dm.AgenciadorNOME.Text;
   end;
   dm.Agenciador.Close;
   fAgenciador.Free;
end;

procedure TfCarga.SpeedButton7Click(Sender: TObject);
begin
   if dmRegra.PesquisaTransportador('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaCOD_MANIFESTO.Text:=dm.TransportadorCOD_TRANS.text;
      dm.CargaNOME_MANIFESTO.Text:=dm.TransportadorNOME.Text;
      Nome_Manifesto.Modified := False;
   end;
   dm.Transportador.Close;
   fTransportador.Free;
end;

procedure TfCarga.SpeedButton8Click(Sender: TObject);
begin
   if dmRegra.PesquisaContaBanco('', true) = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaID_CONTABANCO.Text:=dm.ContaBancoID_CONTABANCO.text;
      dm.CargaNUM_CONTA.Text:=dm.ContaBancoNUM_CONTA.Text;
      dm.CargaBANCO.AsString := dm.ContaBancoBANCO.AsString;
      dm.CargaAGENCIA.AsString := dm.ContaBancoAGENCIA.AsString;
      dm.CargaCNPJ_CPF.AsString := dm.ContaBancoCNPJ_CPF.AsString;
      NumConta.Modified := False;
   end;
   dm.ContaBanco.Close;
   fContaBanco.Free;
end;

procedure TfCarga.SpeedButton1Click(Sender: TObject);
begin
   if dmRegra.PesquisaFornecedor('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaCOD_FOR.Text:=dm.FornecedorCOD_FOR.text;
      dm.CargaNOME_FORNECEDOR.Text:=dm.FornecedorNOME.Text;
      PreencherObservacao3();
   end;
   dm.Fornecedor.Close;
   fFornecedor.Free;
end;

procedure TfCarga.SpeedButton5Click(Sender: TObject);
begin
   if dmRegra.PesquisaMotorista('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaCOD_MOTORISTA.Text:=dm.MotoristaCOD_MOTORISTA.text;
      dm.CargaNOME_MOTORISTA.Text:=dm.MotoristaNOME.Text;
      dm.CargaPLACA.Text:=dm.MotoristaPLACA.Text;

      BuscaTransportador(dm.MotoristaCOD_TRANS.AsInteger);
      Altera_Visto;
      Busca_Agencia;

      Num_Pedido.Modified:=true;
      Num_PedidoExit(self);
   end;
   dm.Motorista.Close;
   fMotorista.Free;
end;

procedure TfCarga.butSalvarClick(Sender: TObject);
var
  vlOper: String[1];
  lCarga: TdmCarga;
begin
   if trim(Num_Carga.Text) = '' then
   begin
      mensagem('Informe o número da carga');
      Num_Carga.SetFocus;
      exit;
   end;

   if trim(Data.Text) = '' then
   begin
      mensagem('Informe a data da emissão');
      Data.SetFocus;
      exit;
   end;

   if trim(Cod_Contato.Text) = '' then
   begin
      mensagem('Informe o Contato');
      Nome_Contato.SetFocus;
      exit;
   end;

   if trim(Num_Pedido.Text) = '' then
   begin
      mensagem('Informe o número do pedido');
      Num_Pedido.SetFocus;
      exit;
   end;

   if (dm.CargaVALOR_FRETE.AsFloat) <= 0 then
   begin
      mensagem('Informe o valor do frete');
      Valor_Frete.SetFocus;
      exit;
   end;

   if (dm.CargaQTDE.AsFloat) <= 0 then
   begin
      mensagem('Informe a quantidade');
      Qtde.SetFocus;
      exit;
   end;

   QpesqCarga.Close;
   QpesqCarga.Params[0].Text:=Num_Carga.Text;
   QpesqCarga.Params[1].Text:=Letra.Text;
   QpesqCarga.Params[2].Text:=id_Carga.Text;
   QpesqCarga.Open;
   if not QpesqCarga.IsEmpty then
   begin
      QpesqCarga.Close;
      mensagem('Número da Carga já Existe, Escolha outro número');
      Exit;
   end;
   QpesqCarga.Close;
   vlOper:='I';
   if dm.Carga.State = dsEdit then
      vlOper:='A';

   dm.IniTrans;
   try
     dm.Carga.Post;

     if vlOper = 'A' then
        dmRegra.ContasCarga(id_Carga.Text,'C');

     dm.SalvaTab(dm.Carga);
     if dm.CargaSITUACAO.Text = 'C' then
        ExecutaSql('delete from CONTAS where COD_EMPRESA = '+vgCod_Empresa+' and NUM_PEDIDO = '+id_Carga.text+' and TIPO_CONTA = 2');

      Dados_Obs('I');
      SalvarParcelas();

     dm.SalvaTrans;
   except On E: Exception do
      begin
        dm.CancelaTrans;
        ShowMessage(e.Message);
        Exit;
      end;
   end;
   Saldo;
   if vlOper = 'I' then
   begin
      lCarga := TdmCarga.Create(Self);
      try
        lCarga.ExportarNuvem(DM.CargaID_CARGA.AsInteger);
      finally
        FreeAndNil(lCarga);
      end;
      butCondClick(self);
   end;
end;

procedure TfCarga.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfCarga.FormShow(Sender: TObject);
begin
//  ControleMetodo('onShow');
  FDMVencto := TdmCargaVencto.Create(Self);
  dsCargaVencto.DataSet := FDMVencto.cdsConsulta;

  PageControl1.ActivePageIndex := 0;
  ListarUnidades();

  butConfig.Visible:=vgUsuario = 'SUPERVISOR';
  butConfigAut.Visible:=vgUsuario = 'SUPERVISOR';

  if EditId_Carga.Text = '' then
  begin
//    ControleMetodo('PesquisaCarga');
    PesquisaCarga('0');
    butNovoClick(self);
  end
  else begin
//    ControleMetodo('PesquisaCarga II');
    PesquisaCarga(EditId_Carga.Text);
//    ControleMetodo('Saldo');
    Saldo;
//    ControleMetodo('Calcula_Lucro');
    Calcula_Lucro('N');
//    ControleMetodo('Get_Obs');
    dmRegra.Get_Obs(dm.CargaID_CARGA.Text,'CAR');
//    ControleMetodo('Dados_Obs');
    Dados_Obs('M');
  end;

  FDMVencto.BuscarPorCarga(dm.CargaID_CARGA.AsInteger);

  BuscarCredito(dm.CargaCOD_CLIENTE.AsInteger);

end;

procedure TfCarga.ListarUnidades;
var
  lUnidade: TdmUnidade;
begin
  ControleMetodo('ListarUnidades');
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

procedure TfCarga.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_F2: begin
               if butNovo.Enabled then
                  butNovoClick(self);
             end;
      vk_F4: begin
               if butExcluir.Enabled then
                  butExcluirClick(self);
             end;
      vk_F6: begin
               if butSalvar.Enabled then
                  butSalvarClick(self);
             end;
      vk_F7: begin
               if butCond.Enabled then
                  butCondClick(self);
             end;
      vk_F8: begin
               if butImprimir.Enabled then
                  butImprimirClick(self);
             end;
      vk_Escape: close;

   end;
end;

procedure TfCarga.butExcluirClick(Sender: TObject);
begin
   if Confirma('Confirma Exclusão desta Carga?','N')=idno then
      exit;
   try
      if dm.permite(vgUsuario,'E','CARGA') = false then
         exit;
      dmRegra.Excluir_Carga(dm.CargaID_CARGA.Text);
      dm.SalvaTrans;
   except
      dm.Carga.CancelUpdates;
      dm.CancelaTrans;
   end;
   close;
end;

procedure TfCarga.butImprimirClick(Sender: TObject);
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

procedure TfCarga.Calcula_Lucro(Tipo: String);
begin
// Tipo = T-Tudo
   ValorDif.Text:=dmRegra.Calcula_Lucro(Num_Pedido.Text,Tipo);
end;

procedure TfCarga.Valor_FreteExit(Sender: TObject);
begin
   if Valor_Frete.Modified then
   begin
      Calcula_Lucro('T');
      Valor_Frete.Modified:=false;
   end;
end;

procedure TfCarga.QtdeEnter(Sender: TObject);
begin
  Qtde.Modified:=false;
end;

procedure TfCarga.QtdeExit(Sender: TObject);
begin
   if Qtde.Modified then
   begin
      Calcula_Lucro('T');
      Saldo;
      MontarContas();
      Qtde.Modified:=false;
   end;
end;

procedure TfCarga.butCondClick(Sender: TObject);
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

procedure TfCarga.butConfigClick(Sender: TObject);
begin
   frCarga:=TfRCarga.create(Self);
   fRCarga.desRel.Show;

end;

procedure TfCarga.butVerPedidoClick(Sender: TObject);
begin
   if Num_Pedido.Text <> '' then
   begin
      fPedido:=TfPedido.create(self);
      fPedido.Num_Pedido.Text:=NUM_PEDIDO.Text;
      fPedido.Operacao.Text:='ALTERAR';
      fPedido.showModal;
      fPedido.free;
   end;
end;

procedure TfCarga.DataExit(Sender: TObject);
begin
   if dmRegra.VerificaData(Data.Text) = false then
      Data.SetFocus;
end;

procedure TfCarga.butAutorizaClick(Sender: TObject);
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

procedure TfCarga.btnExcluirParcelaClick(Sender: TObject);
begin
  if FDMVencto.cdsConsulta.IsEmpty then
    Exit;

  if Confirma('Confirma Exclusão desta Parcela?','N')=IDYES then
  begin
    FDMVencto.cdsConsulta.Delete;
    ModoEdicao();
  end;
end;

procedure TfCarga.btnGerarParcelasClick(Sender: TObject);
begin
  MontarContas();
end;

procedure TfCarga.btnUsinaClick(Sender: TObject);
begin
   if dmRegra.PesquisaFornecedor('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.CargaCOD_USINA.Text:=dm.FornecedorCOD_FOR.text;
      dm.CargaNOME_USINA.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.Close;
   fFornecedor.Free;

end;

procedure TfCarga.BuscarCredito(ACodCliente: Integer);
var
  PessoaCredito: TdmPessoaCredito;
begin
  edtCredito.Text := '0';
  if ACodCliente = 0 then
    Exit;

  PessoaCredito := TdmPessoaCredito.Create(Self);
  try
    PessoaCredito.localizarPessoa(ACodCliente);
    edtCredito.Text := FormatFloat(',###', PessoaCredito.cdsPessoaCreditoQTDE_SALDO.AsCurrency);
    PessoaCredito.cdsPessoaCredito.Close;
  finally
    FreeAndNil(PessoaCredito);
  end;
end;

procedure TfCarga.BuscarPedido;
var
  ldm: TdmCarga;
begin
  ldm := TdmCarga.Create(Self);
  try
    ldm.LocalizarPedido(DM.CargaNUM_PEDIDO.AsInteger);
    dm.CargaARMAZEM.AsString := ldm.QPedidoNOME.AsString;
  finally
    FreeAndNil(ldm);
  end;
end;

procedure TfCarga.BuscaTransportador(CodTrans: Integer);
var
  lTransp: TdmTransportadora;
begin
  if DM.Carga.State <> dsInsert then
    Exit;

  lTransp := TdmTransportadora.Create(Self);
  try
    lTransp.LocalizarCodigo(CodTrans);
    dm.CargaCOD_MANIFESTO.AsString := lTransp.CodigoStr;
    dm.CargaNOME_MANIFESTO.AsString := lTransp.Nome;
  finally
    FreeAndNil(lTransp);
  end;
end;

procedure TfCarga.Busca_Agencia;
begin
   if Cod_Motorista.text <> '' then
   begin
      Qmot.Close;
      Qmot.Params[0].Text:=Cod_Motorista.Text;
      Qmot.Open;
      dm.CargaCONTATO_INDICACAO.Text:=QMotCONTATO.Text;
      Qmot.close;
   end;
end;

function TfCarga.ValidaCarga: Boolean;
var
  id: string;
begin
  id := IntToStr(StrToIntDef(id_Carga.Text, 0));
   result:=true;
   if dmRegra.ContasCarga(id,'P') = false then
      result:=true;

end;

procedure TfCarga.Dados_Obs(Tipo: string);
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

procedure TfCarga.MemoObsEnter(Sender: TObject);
begin
   fCarga.KeyPreview:=false;
   MemoObs.Modified:=false;
end;

procedure TfCarga.MemoObsExit(Sender: TObject);
begin
   fCarga.KeyPreview:=true;
   if MemoObs.Modified then
      DM.ModoEdicao(dsCad);
end;

procedure TfCarga.ModoEdicao;
begin
  if not (dm.Carga.State in [dsEdit, dsInsert]) then
    dm.Carga.Edit;
end;

procedure TfCarga.SalvarParcelas;
begin
    if FDMVencto.cdsConsulta.State = dsInsert then
    begin
      FDMVencto.cdsConsulta.Cancel;
    end;

    if FDMVencto.cdsConsulta.State = dsEdit then
    begin
      FDMVencto.cdsConsulta.Post;
    end;

  if FDMVencto.cdsConsulta.ChangeCount > 0 then
  begin
    FDMVencto.cdsConsulta.First;
    while not FDMVencto.cdsConsulta.Eof do
    begin
      FDMVencto.cdsConsulta.Edit;
      FDMVencto.cdsConsultaCARGA_ID.AsInteger := dm.CargaID_CARGA.AsInteger;
      FDMVencto.cdsConsulta.Post;
      FDMVencto.cdsConsulta.Next;
    end;
    FDMVencto.cdsConsulta.ApplyUpdates(0);
  end;
  if dm.Carga.State in [dsEdit, dsInsert] then
    dm.Carga.Cancel;
end;

procedure TfCarga.MontarContas;
var
  iQtdeParcela: Integer;
  dValorUnitario: Currency;
  dValorBase: Currency;
  dValorPrimeira: Currency;
  dValorOutras: Currency;
  i: Integer;
begin
   if dm.CargaNUM_PEDIDO.AsInteger = 0 then
      raise Exception.Create('Informe o número do Pedido!');

   if not (FDMVencto.cdsConsulta.IsEmpty) then
   begin
     if Confirma('Carga possui parcelas, deseja atualizá-las?','S') = IDYES then
     begin
       FDMVencto.cdsConsulta.First;
       while not FDMVencto.cdsConsulta.Eof do
        FDMVencto.cdsConsulta.Delete;
     end;
   end;
   fParcelas:=TfParcelas.create(Self);
   fParcelas.ValorPedido.Text:=formatfloat(',#0.00',dm.CargaVALOR_CARREGA.AsFloat);
   fParcelas.DataEmissao.Text:=Data.Text;
   fParcelas.editNumPedido.Text:=Num_Pedido.Text;
   fParcelas.EditNumCarga.Text:=id_Carga.Text;
   fParcelas.editCarga.Text:='N';
   //fParcelas.showModal;

   fParcelas.PesquisaContas();
   iQtdeParcela := fParcelas.Contas.RecordCount;
   if iQtdeParcela <= 0 then
    iQtdeParcela := 1;

   FDMVencto.BuscarPedido(dm.CargaNUM_PEDIDO.AsInteger);
   dValorUnitario := FDMVencto.QItensPedidoVALOR.AsCurrency;

   dValorBase := dm.CargaQTDE.AsCurrency * dValorUnitario;
   dValorPrimeira := 0;
   dValorOutras := 0;
   TFinanceiro.CalcularParcelas(dValorBase, dValorPrimeira, dValorOutras, iQtdeParcela);

   i := 1;
   if FDMVencto.cdsConsulta.IsEmpty then
   begin
     while not fParcelas.Contas.Eof do
     begin
       FDMVencto.cdsConsulta.Append;
       FDMVencto.cdsConsultaCARGA_ID.AsInteger := dm.CargaID_CARGA.AsInteger;
       FDMVencto.cdsConsultaDIAS.AsInteger := fParcelas.ContasDIAS.AsInteger;
       FDMVencto.cdsConsultaFORMAPAGTO_ID.AsInteger := fParcelas.ContasCOD_PAGTO.AsInteger;
       FDMVencto.cdsConsultaDESC_PAGTO.AsString := fParcelas.ContasDESC_PAGTO.AsString;

       try
        FDMVencto.cdsConsultaVENCTO.AsDateTime := dm.CargaDATA_NF.AsDateTime + fParcelas.ContasDIAS.AsFloat;
       except
       end;

       if i = 1 then
        FDMVencto.cdsConsultaVALOR.AsCurrency := dValorPrimeira
       else
        FDMVencto.cdsConsultaVALOR.AsCurrency := dValorOutras;

        Inc(I);
       FDMVencto.cdsConsulta.Post;
       fParcelas.Contas.Next;
     end;
   end;
   fParcelas.free;
end;

procedure TfCarga.RelPreviewFormCreate(Sender: TObject);
begin
   TPPReport(Sender).PreviewForm.WindowState:=wsMaximized;
   TPPViewer(TPPReport(Sender).PreviewForm.Viewer).ZoomPercentage:=100; // .zoomSetting:=100;//zswholepage;
end;

procedure TfCarga.butConfigAutClick(Sender: TObject);
begin
  fImpressaoCarga := TfImpressaoCarga.Create(Self);
  fImpressaoCarga.desRel.Show;

//  frmImpressaoAutorizacao := TfrmImpressaoAutorizacao.Create(Self);
//  frmImpressaoAutorizacao.DesRel.Show;
end;

procedure TfCarga.CboUnidadeChange(Sender: TObject);
begin
   TipoUnidade;
end;

procedure TfCarga.DadosEmissorCTE;
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

procedure TfCarga.DadosTransportador;
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

procedure TfCarga.DataNFEnter(Sender: TObject);
begin
  DataNF.Modified := False;
end;

procedure TfCarga.DataNFExit(Sender: TObject);
begin
  if DataNF.Modified then
  begin
    MontarContas();
    DataNF.Modified := False;
  end;
end;

procedure TfCarga.DataNFKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_BACK then
    dm.CargaDATA_NF.Clear;
end;

function TfCarga.TipoRelatorio: string;
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

procedure TfCarga.TipoUnidade;
var
  lUnidade: TdmUnidade;
begin
  if dm.Carga.State in [dsEdit, dsInsert] then
  begin
    ControleMetodo('TipoUnidade');
    lUnidade := TdmUnidade.Create(Self);
    try
      ControleMetodo('LocalizarDescricao');
      lUnidade.LocalizarDescricao(StrToInt(vgCod_Empresa), CboUnidade.Text);
      dm.CargaID_UNIDADE.AsInteger := lUnidade.Id;
      dm.CargaCOMPLUNIDADE.AsString := lUnidade.Complemento;
    finally
      FreeAndNil(lUnidade);
    end;
  end;

//   if CboUnidade.Text = 'SACAS' then
//      dm.CargaCOMPLUNIDADE.Text := '50 KG CADA.'
//   else
//      dm.CargaCOMPLUNIDADE.Text := '30 KG CADA,'
end;

end.
