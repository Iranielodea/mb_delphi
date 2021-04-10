unit uRepositorioFornecedor;

interface

uses
  System.SysUtils, System.Generics.Collections, uFornecedorModel, uDM, Data.SqlExpr;

type
  TRepositorioFornecedor = class
  private
    function RetornarCampos(): string;
    function RetornarDados(qry: TSQLQuery): TObjectList<TFornecedorModel>;
  public
    function ObterPorExportarNET(): TObjectList<TFornecedorModel>;
  end;

implementation

{ TRepositorioFornecedor }

function TRepositorioFornecedor.ObterPorExportarNET: TObjectList<TFornecedorModel>;
var
  qry: TSQLQuery;
  resultado: TObjectList<TFornecedorModel>;
begin
  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := dm.BancoDados;
  try
    qry.SQL.Text := RetornarCampos();
    qry.SQL.Add(' where CON.exportar_net = ''S''');
    qry.Open;

    resultado := RetornarDados(qry);
    Result := resultado;
  finally
    FreeAndNil(qry);
  end;
end;

function TRepositorioFornecedor.RetornarCampos: string;
var
  qry: TStringBuilder;
begin
  qry := TStringBuilder.Create;
  try
    qry.AppendLine('select');
    qry.AppendLine('    con.cod_for as codigo,');
    qry.AppendLine('    con.nome,');
    qry.AppendLine('    con.fantasia,');
    qry.AppendLine('    con.endereco,');
    qry.AppendLine('    con.numero,');
    qry.AppendLine('    con.complemento,');
    qry.AppendLine('    cid.desc_cidade,');
    qry.AppendLine('    con.cep,');
    qry.AppendLine('    con.bairro,');
    qry.AppendLine('    con.cnpj,');
    qry.AppendLine('    con.insc_estadual,');
    qry.AppendLine('    con.fone,');
    qry.AppendLine('    con.fax,');
    qry.AppendLine('    con.email,');
    qry.AppendLine('    con.obs,');
    qry.AppendLine('    est.sigla');
    qry.AppendLine('from FORNECEDOR CON');
    qry.AppendLine('    left join CIDADE CID on CON.cod_cidade = CID.cod_cidade');
    qry.AppendLine('    left join ESTADO EST on CID.id_estado = EST.id_estado');

    Result := qry.ToString();
  finally
    FreeAndNil(qry);
  end;
end;

function TRepositorioFornecedor.RetornarDados(
  qry: TSQLQuery): TObjectList<TFornecedorModel>;
var
  lista: TObjectList<TFornecedorModel>;
  model: TFornecedorModel;
begin
  lista := TObjectList<TFornecedorModel>.Create();
  while not qry.Eof do
  begin
    model := TFornecedorModel.Create;
    model.Codigo := qry.FieldByName('codigo').AsInteger;
    model.Nome := qry.FieldByName('nome').AsString;
    model.Fantasia := qry.FieldByName('fantasia').AsString;
    model.Endereco := qry.FieldByName('endereco').AsString;
    model.Numero := qry.FieldByName('numero').AsString;
    model.Complemento := qry.FieldByName('complemento').AsString;
    model.Bairro := qry.FieldByName('bairro').AsString;
    model.NomeCidade := qry.FieldByName('desc_cidade').AsString;
    model.Cep := qry.FieldByName('cep').AsString;
    model.UF := qry.FieldByName('sigla').AsString;
    model.CNPJ := qry.FieldByName('cnpj').AsString;
    model.InscEstadual := qry.FieldByName('insc_estadual').AsString;
    model.Email := qry.FieldByName('email').AsString;
    model.Fone := qry.FieldByName('fone').AsString;
    model.Fax := qry.FieldByName('fax').AsString;
    model.Obs := ''; //qry.FieldByName('obs').AsString;

    lista.Add(model);
    qry.Next;
  end;
  Result := Lista;
end;

end.
