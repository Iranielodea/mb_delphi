unit uServicoContaBanco;

interface

uses
  System.SysUtils, uContaBancoModel,Data.DBXJSON, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient, REST.Types,
  udmParametros, uFuncoesJSON, System.Generics.Collections;

type
  TServicoContaBanco = class
  private
    FUrlBase: string;
    procedure Gravar(ATipo: Integer; AModel: TObjectList<TContaBancoModel>);
  public
    procedure Incluir(AModel: TObjectList<TContaBancoModel>);
    procedure Alterar(AModel: TObjectList<TContaBancoModel>);
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
begin
  urlBase := FUrlBase; // 'http://localhost/mb/api_v2';
  arrayItem := TJSONArray.Create;

  Client := TRESTClient.Create(nil);
  Request := TRESTRequest.Create(nil);
  Response := TRESTResponse.Create(nil);
  try
    for Model in AModel  do
    begin
      json := TJSONObject.Create;
      json.AddPair('id', TJSONNumber.Create(0));
      json.AddPair('codigo', TJSONNumber.Create(Model.Codigo));
      json.AddPair('nomeBanco', Model.NomeBanco);
      json.AddPair('numConta', Model.NumConta);
      json.AddPair('agencia', Model.Agencia);
      json.AddPair('cnpjCpf', Model.CnpjCpf);
      json.AddPair('ativo', Model.Ativo);
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
//    raise Exception.Create(arrayItem.ToString);
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

procedure TServicoContaBanco.Incluir(AModel: TObjectList<TContaBancoModel>);
begin
  Gravar(0, AModel);
end;

end.
