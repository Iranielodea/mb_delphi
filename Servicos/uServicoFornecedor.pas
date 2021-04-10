unit uServicoFornecedor;

interface

uses
  System.SysUtils, uFornecedorModel,Data.DBXJSON, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient, REST.Types,
  udmParametros, uFuncoesJSON, System.Generics.Collections, uRepositorioFornecedor,
  Vcl.Dialogs, System.Classes, System.StrUtils, System.WideStrUtils, System.Math,
  uDM;

type
  TServicoFornecedor = class
  private
    FUrlBase: string;
    procedure Gravar(ATipo: Integer; AModel: TObjectList<TFornecedorModel>);
    procedure Incluir(AModel: TObjectList<TFornecedorModel>);
    procedure IncluirSomente(AModel: TObjectList<TFornecedorModel>);
    procedure Alterar(AModel: TObjectList<TFornecedorModel>);
  public
    procedure ExportarNET();
    procedure IncluirFornecedores();

    constructor Create(); overload;
  end;

implementation

{ TServicoFornecedor }

procedure TServicoFornecedor.Alterar(AModel: TObjectList<TFornecedorModel>);
begin
  Gravar(1, AModel);
end;

constructor TServicoFornecedor.Create;
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

procedure TServicoFornecedor.ExportarNET;
var
  repositorio: TRepositorioFornecedor;
  lista: TObjectList<TFornecedorModel>;
begin
  repositorio := TRepositorioFornecedor.Create;
  try
    lista := repositorio.ObterPorExportarNET();

    if lista.Count > 0 then
    begin
      Self.Incluir(lista);
      dm.BancoDados.ExecuteDirect('UPDATE FORNECEDOR set EXPORTAR_NET = ''N'' where EXPORTAR_NET = ''S''' );
    end;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(lista);
  end;
end;

procedure TServicoFornecedor.Gravar(ATipo: Integer;
  AModel: TObjectList<TFornecedorModel>);
var
  json: TJSONObject;
  arrayItem: TJSONArray;
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  urlBase: string;
  sResultado: string;
  Model: TFornecedorModel;
//  arq: TextFile;
begin
  //ATipo = 0-Post 1-Put 2-Incluir
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
      json.AddPair('nome', TJSONString.Create(Model.Nome));
      json.AddPair('bairro', TJSONString.Create(Model.Bairro));
      json.AddPair('cep', TJSONString.Create(Model.Cep));
      json.AddPair('cnpj', TJSONString.Create(Model.CNPJ));
      json.AddPair('email', TJSONString.Create(Model.Email));
      json.AddPair('endereco', TJSONString.Create(Model.Endereco));
      json.AddPair('fax', TJSONString.Create(Model.Fax));
      json.AddPair('inscEstadual', TJSONString.Create(Model.InscEstadual));
      json.AddPair('nomeCidade', TJSONString.Create(Model.NomeCidade));
      json.AddPair('obs', TJSONString.Create(Model.Obs));
      json.AddPair('uf', TJSONString.Create(Model.UF));
      json.AddPair('complemento', TJSONString.Create(Model.Complemento));
      json.AddPair('fantasia', TJSONString.Create(Model.Fantasia));
      json.AddPair('fone', TJSONString.Create(Model.Fone));
      json.AddPair('numero', TJSONString.Create(Model.Numero));
      arrayItem.AddElement(json);
    end;
    Request.Client := Client;
    Request.Response := Response;

//    AssignFile(arq, '_temp.txt');
//    Rewrite(arq);
//    Writeln(arq, arrayItem.ToString);
//    CloseFile(arq);

    Client.BaseURL := urlBase;
    if ATipo = 2 then
    begin
      Request.Resource := '/fornecedor/incluir';
      ATipo := 0;
    end
    else
      Request.Resource := '/fornecedor';

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

procedure TServicoFornecedor.Incluir(AModel: TObjectList<TFornecedorModel>);
begin
  Gravar(0, AModel);
end;

procedure TServicoFornecedor.IncluirFornecedores;
var
  repositorio: TRepositorioFornecedor;
  lista: TObjectList<TFornecedorModel>;
begin
  repositorio := TRepositorioFornecedor.Create;
  try
    lista := repositorio.ObterPorExportarNET();

    if lista.Count > 0 then
    begin
      Self.IncluirSomente(lista);
      dm.BancoDados.ExecuteDirect('UPDATE FORNECEDOR set EXPORTAR_NET = ''N'' where EXPORTAR_NET = ''S''' );
    end;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(lista);
  end;
end;

procedure TServicoFornecedor.IncluirSomente(AModel: TObjectList<TFornecedorModel>);
begin
  Gravar(2, AModel);
end;

end.
