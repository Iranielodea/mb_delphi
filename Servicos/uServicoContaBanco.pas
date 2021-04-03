unit uServicoContaBanco;

interface

uses
  System.SysUtils, uContaBancoModel,Data.DBXJSON, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient, REST.Types,
  udmParametros, uFuncoesJSON, System.Generics.Collections,
  uRepositorioContaBanco, Vcl.Dialogs, uDM;

type
  TServicoContaBanco = class
  private
    FUrlBase: string;
    procedure Gravar(ATipo: Integer; AModel: TObjectList<TContaBancoModel>);
  public
    procedure Incluir(AModel: TObjectList<TContaBancoModel>);
    procedure Alterar(AModel: TObjectList<TContaBancoModel>);

    function ObterPorCodigo(ACodigo: Integer): TContaBancoModel;

    procedure ExportarNET();
    constructor Create(); overload;
  end;

implementation

{ TServicoContaBanco }

procedure TServicoContaBanco.Alterar(AModel: TObjectList<TContaBancoModel>);
begin
  Gravar(1, AModel);
end;

constructor TServicoContaBanco.Create;
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

procedure TServicoContaBanco.Gravar(ATipo: Integer; AModel: TObjectList<TContaBancoModel>);
var
  json: TJSONObject;
  arrayItem: TJSONArray;
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  urlBase: string;
  sResultado: string;
  Model: TContaBancoModel;
  repositorio: TRepositorioContaBanco;
begin
  urlBase := FUrlBase; // 'http://localhost/mb/api_v2';
  arrayItem := TJSONArray.Create;

  Client := TRESTClient.Create(nil);
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  repositorio := TRepositorioContaBanco.Create;
  try
    for Model in AModel  do
    begin
      json := TJSONObject.Create;
      json.AddPair('id', TJSONNumber.Create(0));
      json.AddPair('codigo', TJSONNumber.Create(Model.Codigo));
      json.AddPair('nomeBanco', TJSONString.Create(Model.NomeBanco));
      json.AddPair('numConta', TJSONString.Create(Model.NumConta));
      json.AddPair('agencia', TJSONString.Create(Model.Agencia));
      json.AddPair('cnpjCpf', TJSONString.Create(Model.CnpjCpf));
      json.AddPair('ativo', TJSONString.Create(Model.Ativo));
      arrayItem.AddElement(json);
    end;
    Request.Client := Client;
    Request.Response := Response;

    Client.BaseURL := urlBase;
    Request.Resource := '/contaBanco';

    if ATipo = 0 then
      Request.Method := TRESTRequestMethod.rmPOST
    else
      Request.Method := TRESTRequestMethod.rmPUT;

    Request.AddBody(arrayItem.ToString, ContentTypeFromString('application/json'));
//    Request.AcceptCharset := 'UTF-8';
//    Request.AcceptEncoding := 'UTF-8';

//    Client.FallbackCharsetEncoding := 'UTF-8';
//    Client.AcceptCharset := 'UTF-8, *;q=0.8';
//    Client.ContentType := 'application/x-www-form-urlencoded';//'application/json';
//    raise Exception.Create(arrayItem.ToString);

    try
      Request.Execute;
      TFuncoesJSON.MensagemJson(Response.JSONValue.ToString);

      if AModel.Count = 1 then
        repositorio.AtualizarPorId(TContaBancoModel(AModel.Items[0]).Codigo);

      if AModel.Count > 1 then
        repositorio.DadosExportados();
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
    FreeAndNil(repositorio);
  end;
end;

procedure TServicoContaBanco.Incluir(AModel: TObjectList<TContaBancoModel>);
begin
  Gravar(0, AModel);
end;

function TServicoContaBanco.ObterPorCodigo(ACodigo: Integer): TContaBancoModel;
var
  repositorio: TRepositorioContaBanco;
begin
  Result := repositorio.ObterPorCodigo(ACodigo);
end;

procedure TServicoContaBanco.ExportarNET;
var
  repositorio: TRepositorioContaBanco;
  lista: TObjectList<TContaBancoModel>;
begin
  dm.BancoDados.ExecuteDirect('UPDATE CONTABANCO set EXPORTAR_NET = ''S''' );
  repositorio := TRepositorioContaBanco.Create;
  try
    lista := repositorio.ObterPorExportarNET();
    if lista.Count > 0 then
      Self.Incluir(lista);

    dm.BancoDados.ExecuteDirect('UPDATE CONTABANCO set EXPORTAR_NET = ''N'' where EXPORTAR_NET = ''S''' );
  finally
    FreeAndNil(repositorio);
    FreeAndNil(lista);
  end;
end;

end.
