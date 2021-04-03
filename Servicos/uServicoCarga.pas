unit uServicoCarga;

interface

uses
  System.SysUtils, uCargaModel,Data.DBXJSON, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient, REST.Types,
  udmParametros, uFuncoesJSON, System.Generics.Collections,
  uRepositorioCarga, Vcl.Dialogs, uDM;

type
  TServicoCarga = class
  private
    FUrlBase: string;
    procedure Gravar(ATipo: Integer; AModel: TObjectList<TCargaModel>);
  public
    procedure Incluir(AModel: TObjectList<TCargaModel>);
    procedure Alterar(AModel: TObjectList<TCargaModel>);
    procedure ExportarNET();

    function ObterPorDataEmissao(ADataInicial, ADataFinal: TDateTime): TObjectList<TCargaModel>;
    constructor Create(); overload;
  end;


implementation

{ TServicoCarga }

procedure TServicoCarga.Alterar(AModel: TObjectList<TCargaModel>);
begin
  Gravar(1, AModel);
end;

constructor TServicoCarga.Create;
var
  parametro: TdmParametros;
begin
  parametro := TdmParametros.Create(nil);
  try
    FUrlBase := parametro.URLBase();
  finally
    FreeAndNil(parametro);
  end;
end;

procedure TServicoCarga.Gravar(ATipo: Integer; AModel: TObjectList<TCargaModel>);
var
  json: TJSONObject;
  arrayItem: TJSONArray;
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  urlBase: string;
  sResultado: string;
  Model: TCargaModel;
begin
  urlBase := FUrlBase; // 'http://localhost/mb/api_v2';
  arrayItem := TJSONArray.Create;

  Client := TRESTClient.Create(nil);
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  try
    for Model in AModel do
    begin
      json := TJSONObject.Create;
      json.AddPair('id', TJSONNumber.Create(0));
      json.AddPair('codigo', TJSONNumber.Create(Model.Codigo));
      json.AddPair('nomeCliente', TJSONString.Create(Model.NomeCliente));
      json.AddPair('nomeContato', TJSONString.Create(Model.NomeContato));
      json.AddPair('numPedido', TJSONNumber.Create(Model.NumPedido));
      json.AddPair('numCarga', TJSONNumber.Create(Model.NumCarga));
      json.AddPair('letra', TJSONString.Create(Model.Letra));

      if Model.Data = 0 then
        json.AddPair('data', TJSONNull.Create)
      else
        json.AddPair('data', FormatDateTime('yyyy-mm-dd', Model.Data));

      json.AddPair('visto', TJSONString.Create(Model.Visto));
      json.AddPair('qtde', TJSONNumber.Create(Model.Qtde));
      json.AddPair('valorPedido', TJSONNumber.Create(Model.ValorPedido));
      json.AddPair('valorCarrega', TJSONNumber.Create(Model.ValorCarrega));
      json.AddPair('valorFrete', TJSONNumber.Create(Model.ValorFrete));
      json.AddPair('nomeFornecedor', TJSONString.Create(Model.NomeFornecedor));
      json.AddPair('nomeMotorista', TJSONString.Create(Model.NomeMotorista));
      json.AddPair('nomeAgencia', TJSONString.Create(Model.NomeAgencia));
      json.AddPair('qtdePedido', TJSONNumber.Create(Model.QtdePedido));
      json.AddPair('placa', TJSONString.Create(Model.Placa));
      json.AddPair('obs', TJSONString.Create(Model.Obs));
      json.AddPair('situacao', TJSONString.Create(Model.Situacao));
      json.AddPair('financeiro', TJSONString.Create(Model.Financeiro));
      json.AddPair('complemento', TJSONString.Create(Model.Complemento));
      json.AddPair('contatoIndicacao', TJSONString.Create(Model.ContatoIndicacao));
      json.AddPair('saldo', TJSONNumber.Create(Model.Saldo));
      json.AddPair('armazen', TJSONString.Create(Model.Armazen));
      json.AddPair('unidade', TJSONString.Create(Model.Unidade));
      json.AddPair('complUnidade', TJSONString.Create(Model.ComplUnidade));
      json.AddPair('obs2', TJSONString.Create(Model.Obs2));
      json.AddPair('numNf', TJSONString.Create(Model.NumNF));

      if Model.DataNF = 0 then
        json.AddPair('dataNf', TJSONNull.Create)
      else
        json.AddPair('dataNf', FormatDateTime('yyyy-mm-dd', Model.DataNF));

      json.AddPair('nomeManifesto', TJSONString.Create(Model.NomeManifesto));
      json.AddPair('qtdeCada', TJSONNumber.Create(Model.QtdeCada));
      json.AddPair('siglaUnidade', TJSONString.Create(Model.SiglaUnidade));
      json.AddPair('agenciaBanco', TJSONString.Create(Model.AgenciaBanco));
      json.AddPair('cnpjCpf', TJSONString.Create(Model.CNPJ_CPF));
      json.AddPair('creditoNf', TJSONString.Create(Model.CreditoNF));
      json.AddPair('numNota2', TJSONString.Create(Model.NumNota2));
      json.AddPair('ir', TJSONNumber.Create(Model.IR));
      json.AddPair('valorNota2', TJSONNumber.Create(Model.ValorNota2));
      json.AddPair('nomeUsina', TJSONString.Create(Model.NomeUsina));

      if Model.CodCliente = 0 then
        json.AddPair('codCliente', TJSONNull.Create)
      else
        json.AddPair('codCliente', TJSONNumber.Create(Model.CodCliente));

      if Model.CodFor = 0 then
        json.AddPair('codFor', TJSONNull.Create)
      else
        json.AddPair('codFor', TJSONNumber.Create(Model.CodFor));

      if Model.CodContato = 0 then
        json.AddPair('codContato', TJSONNull.Create)
      else
        json.AddPair('codContato', TJSONNumber.Create(Model.CodContato));

      if Model.CodMotorista = 0 then
        json.AddPair('codMotorista', TJSONNull.Create)
      else
        json.AddPair('codMotorista', TJSONNumber.Create(Model.CodMotorista));

      if Model.CodManifesto = 0 then
        json.AddPair('codManifesto', TJSONNull.Create)
      else
        json.AddPair('codManifesto', TJSONNumber.Create(Model.CodManifesto));

      if Model.IdUnidade = 0 then
        json.AddPair('idUnidade', TJSONNull.Create)
      else
        json.AddPair('idUnidade', TJSONNumber.Create(Model.IdUnidade));

      if Model.IdContaBanco = 0 then
        json.AddPair('idContaBanco', TJSONNull.Create)
      else
        json.AddPair('idContaBanco', TJSONNumber.Create(Model.IdContaBanco));

      if Model.CodUsina = 0 then
        json.AddPair('codUsina', TJSONNull.Create)
      else
        json.AddPair('codUsina', TJSONNumber.Create(Model.CodUsina));

      arrayItem.AddElement(json);
    end;
//    ShowMessage(arrayItem.ToString);
    Request.Client := Client;
    Request.Response := Response;

    Client.BaseURL := urlBase;
    Request.Resource := '/carga';

    if ATipo = 0 then
      Request.Method := TRESTRequestMethod.rmPOST
    else
      Request.Method := TRESTRequestMethod.rmPUT;

    Request.AddBody(arrayItem.ToString, ContentTypeFromString('application/json'));

    try
      Request.Execute;
      TFuncoesJSON.MensagemJson(Response.JSONValue.ToString);
    except on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;

    sResultado := Response.StatusText;

    if not sResultado.Contains('OK') then
      raise Exception.Create(Response.StatusCode.ToString + sLineBreak + Response.StatusText);

  finally
    FreeAndNil(arrayItem);
    FreeAndNil(Client);
    FreeAndNil(Request);
    FreeAndNil(Response);
  end;
end;

procedure TServicoCarga.Incluir(AModel: TObjectList<TCargaModel>);
begin
  Gravar(0, AModel);
end;

function TServicoCarga.ObterPorDataEmissao(ADataInicial,
  ADataFinal: TDateTime): TObjectList<TCargaModel>;
var
  repositorio: TRepositorioCarga;
begin
  Result := repositorio.ObterPorDataEmissao(ADataInicial, ADataFinal);
end;

procedure TServicoCarga.ExportarNET;
var
  repositorio: TRepositorioCarga;
  lista: TObjectList<TCargaModel>;
begin
  repositorio := TRepositorioCarga.Create;
  try
    lista := repositorio.ObterPorExportarNET();
    if lista.Count > 0 then
      Self.Incluir(lista);

    dm.BancoDados.ExecuteDirect('UPDATE CARGA set EXPORTAR_NET = ''N'' where EXPORTAR_NET = ''S''' );
  finally
    FreeAndNil(repositorio);
    FreeAndNil(lista);
  end;
end;

end.
