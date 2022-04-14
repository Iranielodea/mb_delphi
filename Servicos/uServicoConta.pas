unit uServicoConta;

interface

uses
  System.SysUtils, uContaModel,Data.DBXJSON, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient, REST.Types,
  udmParametros, uFuncoesJSON, System.Generics.Collections, uRepositorioConta,
  Vcl.Dialogs, System.Classes, System.StrUtils, System.WideStrUtils, System.Math,
  uDM;

type
  TServicoConta = class
  private
    FUrlBase: string;
    procedure Gravar(ATipo: Integer; AModel: TObjectList<TContaModel>);
    procedure IncluirSomente(AModel: TObjectList<TContaModel>);
    procedure Incluir(AModel: TObjectList<TContaModel>);
    procedure Alterar(AModel: TObjectList<TContaModel>);
  public
    procedure ExportarNET();
    procedure ObterPorDataEmissao(ADataInicial, ADataFinal: TDateTime);

    constructor Create(); overload;
  end;


implementation

{ TServicoCarga }

procedure TServicoConta.Alterar(AModel: TObjectList<TContaModel>);
begin
  Gravar(1, AModel);
end;

constructor TServicoConta.Create;
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

procedure TServicoConta.Gravar(ATipo: Integer; AModel: TObjectList<TContaModel>);
var
  json: TJSONObject;
  arrayItem: TJSONArray;
  Client: TRESTClient;
  Request: TRESTRequest;
  Response: TRESTResponse;
  urlBase: string;
  sResultado: string;
  Model: TContaModel;
  arq: TextFile;
begin
  //ATipo = 0-Post 1-Put 2-Incluir
  urlBase := FUrlBase; // 'http://localhost/mb/api_v2';
  arrayItem := TJSONArray.Create;

  Client := TRESTClient.Create(nil);
  Request := TRESTRequest.Create(nil);
  Request.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  Request.AcceptCharset := 'UTF-8, *;q=0.8';

  Response := TRESTResponse.Create(nil);
  try
    for Model in AModel do
    begin
      if Model.Codigo <> 6811 then
        Continue;

      json := TJSONObject.Create;
      json.AddPair('id', TJSONNumber.Create(0));
      json.AddPair('codigo', TJSONNumber.Create(Model.Codigo));
      json.AddPair('numPedido', TJSONNumber.Create(Model.NumPedido));
      json.AddPair('nomeCliente', TJSONString.Create(Model.NomeCliente));
      json.AddPair('nomeFornecedor', TJSONString.Create(Model.NomeFornecedor));
      json.AddPair('dataEmissao', FormatDateTime('yyyy-mm-dd', Model.DataEmissao));
      json.AddPair('valorPagar', TJSONNumber.Create(Model.ValorPagar));
      json.AddPair('dataVencto', FormatDateTime('yyyy-mm-dd', Model.DataVencto));
      json.AddPair('dias', TJSONNumber.Create(Model.Dias));

      if Model.DataPago = 0 then
        json.AddPair('dataPago', TJSONNull.Create)
      else
        json.AddPair('dataPago', FormatDateTime('yyyy-mm-dd', Model.DataPago));

      json.AddPair('valorPago', TJSONNumber.Create(Model.ValorPago));
      json.AddPair('seqConta', TJSONNumber.Create(Model.SeqConta));
      json.AddPair('valorOriginal', TJSONNumber.Create(Model.ValorOriginal));
      json.AddPair('tipoConta', TJSONNumber.Create(Model.TipoConta));
      json.AddPair('situacao', TJSONString.Create(Model.Situacao));
      json.AddPair('documento', TJSONString.Create(Model.Documento));
      json.AddPair('nomeFormaPagto', TJSONString.Create(Model.NomeFormaPagto));

      if Model.ContaBancoId = 0 then
        json.AddPair('contaBancoId', TJSONNull.Create)
      else
        json.AddPair('contaBancoId', TJSONNumber.Create(Model.ContaBancoId));

      if Model.PedidoId = 0 then
        json.AddPair('pedidoId', TJSONNull.Create)
      else
        json.AddPair('pedidoId', TJSONNumber.Create(Model.PedidoId));

      if Model.CodCliente = 0 then
        json.AddPair('codCliente', TJSONNull.Create)
      else
        json.AddPair('codCliente', TJSONNumber.Create(Model.CodCliente));

      if Model.CodFor = 0 then
        json.AddPair('codFor', TJSONNull.Create)
      else
        json.AddPair('codFor', TJSONNumber.Create(Model.CodFor));

      arrayItem.AddElement(json);
    end;

    AssignFile(arq, 'json.txt');
    Rewrite(arq);
    Writeln(arq, arrayItem.ToString);
    CloseFile(arq);

    Request.Client := Client;
    Request.Response := Response;

    Client.BaseURL := urlBase;
    if ATipo = 2 then
    begin
      Request.Resource := '/conta/incluir';
      ATipo := 0;
    end
    else
      Request.Resource := '/conta';

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

procedure TServicoConta.Incluir(AModel: TObjectList<TContaModel>);
begin
  Gravar(0, AModel);
end;

procedure TServicoConta.IncluirSomente(AModel: TObjectList<TContaModel>);
begin
  Gravar(2, AModel);
end;

procedure TServicoConta.ObterPorDataEmissao(ADataInicial, ADataFinal: TDateTime);
var
  repositorio: TRepositorioConta;
  lista: TObjectList<TContaModel>;
begin
  repositorio := TRepositorioConta.Create;
  try
    lista := repositorio.ObterPorDataEmissao(ADataInicial, ADataFinal);
    if lista.Count > 0 then
      Self.IncluirSomente(lista);
  finally
    FreeAndNil(lista);
    FreeAndNil(repositorio);
  end;
end;

procedure TServicoConta.ExportarNET;
var
  repositorio: TRepositorioConta;
  lista: TObjectList<TContaModel>;
  arq: TextFile;
begin
  repositorio := TRepositorioConta.Create;
  try
    try
      lista := repositorio.ObterPorExportarNET();

      if lista.Count > 0 then
      begin
        Self.Incluir(lista);
        dm.BancoDados.ExecuteDirect('UPDATE CONTAS set EXPORTAR_NET = ''N'' where EXPORTAR_NET = ''S''' );
      end;
    except on E: Exception do
      begin
        AssignFile(arq, 'web_contas.txt');
        Rewrite(arq);
        Writeln(arq, E.Message);
        CloseFile(arq);
      end;
    end;
  finally
    FreeAndNil(repositorio);
    FreeAndNil(lista);
  end;
end;

end.
