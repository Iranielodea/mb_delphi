unit ufrmImpressaoAutorizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr, Data.DB,
  Datasnap.Provider, Datasnap.DBClient, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppBands,
  ppCache, ppDesignLayer, ppParameter, System.MaskUtils, ppEndUsr, ppRichTx;

type
  TfrmImpressaoAutorizacao = class(TForm)
    cdsCarga: TClientDataSet;
    dsCarga: TDataSource;
    QCarga: TSQLQuery;
    dbCarga: TppDBPipeline;
    Rel: TppReport;
    cdsCargaCIDADE_DATA: TStringField;
    cdsCargaUSINA: TStringField;
    cdsCargaNUM_PEDIDO: TStringField;
    cdsCargaTEXTO: TStringField;
    QCargaCLI_ENDERECO: TStringField;
    QCargaCLI_NUMERO: TStringField;
    QCargaCLI_COMPL: TStringField;
    QCargaCLI_CEP: TStringField;
    QCargaCLI_CNPJ: TStringField;
    QCargaCLI_IE: TStringField;
    QCargaCLI_NOME: TStringField;
    QCargaCLI_CIDADE: TStringField;
    QCargaCLI_UF: TStringField;
    QCargaTRANS_CONTATO: TStringField;
    QCargaTRANS_IE: TStringField;
    QCargaMOT_CPF: TStringField;
    QCargaMOT_ESTADO_CPF: TStringField;
    QCargaMOT_PLACA_REB1: TStringField;
    QCargaMOT_PLACA_REB2: TStringField;
    QCargaMOT_CNH: TStringField;
    QCargaMOT_NOME: TStringField;
    QCargaCAR_DATA: TSQLTimeStampField;
    QCargaCAR_QTDE: TFloatField;
    QCargaCAR_PLACA: TStringField;
    QCargaCAR_QTDE_TONELAGEM: TFloatField;
    QCargaCAR_UNIDADE: TStringField;
    QCargaCAR_COMP_UNIDADE: TStringField;
    QCargaCAR_ARMAZEN: TStringField;
    QCargaTEXTO: TStringField;
    cdsCargaNOME_CLIENTE: TStringField;
    ppParameterList1: TppParameterList;
    QCargaCAR_NUM_PEDIDO: TIntegerField;
    cdsCargaENDERECO_CLIENTE: TStringField;
    cdsCargaDOCUMENTO_CLIENTE: TStringField;
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
    QCargaCAR_OBS2: TStringField;
    cdsCargaOBS2: TStringField;
    DesRel: TppDesigner;
    QCargaMOT_PLACA_REB3: TStringField;
    QCargaCLI_BAIRRO: TStringField;
    ppTitleBand1: TppTitleBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    mmTransp: TppMemo;
    mmCte: TppMemo;
    ppDBRichText1: TppDBRichText;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PreecheDataSet;
    function MontaTexto: string;
    function EnderecoCliente: string;
    function DocumentoCliente: string;
    procedure DadosTransportador;
    procedure DadosEmissorCTE;
  public
    { Public declarations }
    procedure Impressao(IdCarga: Integer);
  end;

var
  frmImpressaoAutorizacao: TfrmImpressaoAutorizacao;

implementation

{$R *.dfm}

uses uDM;

{ TfrmImpressaoAutorizacao }

procedure TfrmImpressaoAutorizacao.DadosEmissorCTE;
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

procedure TfrmImpressaoAutorizacao.DadosTransportador;
var
  lNome: string;
  lEndereco: string;
  lCidade: string;
  lLocal: string;
  lIE: string;
begin
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

function TfrmImpressaoAutorizacao.DocumentoCliente: string;
var
  sCNPJ: string;
begin
  sCNPJ := FormatMaskText('##.###.###/####-##;0;_', QCargaCLI_CNPJ.AsString);
  Result := 'CNPJ: ' + sCNPJ + '   I.E: ' + QCargaCLI_IE.AsString;
end;

function TfrmImpressaoAutorizacao.EnderecoCliente: string;
var
  sRua: string;
  sNumero: string;
  sCep: string;
  sCidade: string;
  sUF: string;
begin
  sRua := QCargaCLI_ENDERECO.AsString;

  sNumero := '';
  if QCargaCLI_NUMERO.AsString <> '' then
    sNumero := ' ' + QCargaCLI_NUMERO.AsString;

  sCep := '';
  if QCargaCLI_CEP.AsString <> '' then
    sCep := ' - CEP ' + FormatMaskText('#####-###;0;_', QCargaCLI_CEP.AsString);

  sCidade := QCargaCLI_CIDADE.AsString;
  sUF := ' - ' + QCargaCLI_UF.AsString;

  Result := sRua + sNumero + sCep + ' - ' + sCidade + sUF;
end;

procedure TfrmImpressaoAutorizacao.FormCreate(Sender: TObject);
begin
  cdsCarga.CreateDataSet;
end;

procedure TfrmImpressaoAutorizacao.Impressao(IdCarga: Integer);
begin
  QCarga.Close;
  QCarga.Params[0].AsInteger := IdCarga;
  QCarga.Open;

  Rel.Template.FileName:='Autoriza2.rtm';
  Rel.Template.LoadFromFile;

  PreecheDataSet();

  DadosTransportador();

  Rel.Print;
end;

function TfrmImpressaoAutorizacao.MontaTexto: string;
var
  sTexto: string;
  sCpf: string;
  sTonelagem: string;
  sQtde: string;
  sPlaca1: string;
  sEndereco: string;
begin
  sCpf := formatMaskText('###.###.###-##;0;_',QCargaMOT_CPF.AsString);
  sTonelagem := FormatFloat(',##0',QCargaCAR_QTDE_TONELAGEM.AsFloat);
  sQtde := QCargaCAR_QTDE.AsString;

  if sPlaca1 <> '' then
    sPlaca1 := QCargaCAR_PLACA.AsString;

  sEndereco := QCargaCLI_ENDERECO.AsString;
  if Trim(QCargaCLI_NUMERO.AsString) <> '' then
    sEndereco := sEndereco + ', ' +QCargaCLI_NUMERO.AsString;

  if Trim(QCargaCLI_COMPL.AsString) <> '' then
    sEndereco := sEndereco + QCargaCLI_COMPL.AsString;

  if Trim(QCargaCLI_COMPL.AsString) <> '' then
    sEndereco := sEndereco + QCargaCLI_COMPL.AsString;

  sTexto := QCargaTEXTO.AsString;
  sTexto := StringReplace(sTexto, '<$CLI_NOME$>', QCargaCLI_NOME.AsString, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CLI_RUA$>', sEndereco, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CLI_CEP$>', FormatMaskText('#####-###;0;_', QCargaCLI_CEP.AsString), [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CLI_BAIRRO$>', QCargaCLI_BAIRRO.AsString, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CLI_CIDADE$>', QCargaCLI_CIDADE.AsString, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CLI_UF$>', QCargaCLI_UF.AsString, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CLI_CNPJ$>', FormatMaskText('##.###.###/####-##;0;_', QCargaCLI_CNPJ.AsString), [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CLI_IE$>', QCargaCLI_IE.AsString, [rfReplaceAll]);

  sTexto := StringReplace(sTexto, '<$SR$>', QCargaMOT_NOME.AsString, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CPF$>', sCpf, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$CNH$>', QCargaMOT_CNH.AsString, [rfReplaceAll]);

  if QCargaCAR_PLACA.AsString <> '' then
    sTexto := StringReplace(sTexto, '<$PLACA1$>', QCargaCAR_PLACA.AsString, [rfReplaceAll])
  else
    sTexto := StringReplace(sTexto, '<$PLACA1$>', '', [rfReplaceAll]);

  if QCargaMOT_PLACA_REB1.AsString <> '' then
    sTexto := ' ' + StringReplace(sTexto, '<$PLACA2$>', QCargaMOT_PLACA_REB1.AsString, [rfReplaceAll])
  else
    sTexto := StringReplace(sTexto, '<$PLACA2$>', '', [rfReplaceAll]);

  if QCargaMOT_PLACA_REB2.AsString <> '' then
    sTexto := ' ' + StringReplace(sTexto, '<$PLACA3$>', QCargaMOT_PLACA_REB2.AsString, [rfReplaceAll])
  else
    sTexto := StringReplace(sTexto, '<$PLACA3$>', '', [rfReplaceAll]);

  if QCargaMOT_PLACA_REB3.AsString <> '' then
    sTexto := ' ' + StringReplace(sTexto, '<$PLACA4$>', QCargaMOT_PLACA_REB3.AsString, [rfReplaceAll])
  else
    sTexto := StringReplace(sTexto, '<$PLACA4$>', '', [rfReplaceAll]);

  sTexto := StringReplace(sTexto, '<$TONELAGEM$>', sTonelagem, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$QTDE$>', sQtde, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$UNIDADE$>', QCargaCAR_UNIDADE.AsString, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<$KG_COMPL$>', QCargaCAR_COMP_UNIDADE.AsString, [rfReplaceAll]);

  Result := sTexto;
end;

procedure TfrmImpressaoAutorizacao.PreecheDataSet;
var
  sData: string;
  sCidade: string;
begin
  sData := formatdateTime('dd" de " mmmm "de" yyyy', QCargaCAR_DATA.AsDateTime);
  sCidade := QCargaCLI_CIDADE.AsString + ' - ' + QCargaCLI_UF.AsString;

  cdsCarga.Append;
  cdsCargaCIDADE_DATA.AsString := sCidade + ', ' + sData;
  cdsCargaNUM_PEDIDO.AsString := 'P-' + QCargaCAR_NUM_PEDIDO.AsString;
  cdsCargaUSINA.AsString := QCargaCAR_ARMAZEN.AsString;
  cdsCargaTEXTO.AsString := MontaTexto;
  cdsCargaNOME_CLIENTE.AsString := QCargaCLI_NOME.AsString;
  cdsCargaENDERECO_CLIENTE.AsString := EnderecoCliente;
  cdsCargaDOCUMENTO_CLIENTE.AsString := DocumentoCliente;
  cdsCargaOBS2.AsString := QCargaCAR_OBS2.AsString;
  cdsCarga.Post;
end;

end.
