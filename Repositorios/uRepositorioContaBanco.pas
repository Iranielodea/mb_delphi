unit uRepositorioContaBanco;

interface

uses
  System.SysUtils, uContaBancoModel, uDM, Data.SqlExpr, System.Generics.Collections;

type
  TRepositorioContaBanco = class
  private
    function RetornarCampos(): string;
  public
    function ObterPorCodigo(ACodigo: Integer): TContaBancoModel;
    function ObterPorExportarNET(): TObjectList<TContaBancoModel>;
    procedure DadosExportados;
    procedure AtualizarPorId(AId: Integer);
  end;

implementation

{ TRepositorioContaBanco }

procedure TRepositorioContaBanco.AtualizarPorId(AId: Integer);
begin
  dm.BancoDados.ExecuteDirect('UPDATE CONTABANCO set EXPORTAR_NET = ''N'' where ID_CONTABANCO = ' + AId.ToString());
end;

procedure TRepositorioContaBanco.DadosExportados;
begin
  dm.BancoDados.ExecuteDirect('UPDATE CONTABANCO set EXPORTAR_NET = ''N'' where EXPORTAR_NET = ''S''');
end;

function TRepositorioContaBanco.ObterPorCodigo(
  ACodigo: Integer): TContaBancoModel;
var
  qry: TSQLQuery;
  model: TContaBancoModel;
begin
  qry := TSQLQuery.Create(nil);
  try
    qry.SQLConnection := dm.BancoDados;
    qry.SQL.Add(RetornarCampos);
    qry.SQL.Add(' where ID_CONTABANCO = ' + ACodigo.ToString());
    qry.Open;

    model := TContaBancoModel.Create;
    model.Id := 0;
    model.Codigo := qry.FieldByName('ID_CONTABANCO').AsInteger;
    model.Agencia := qry.FieldByName('AGENCIA').AsString;
    model.NumConta := qry.FieldByName('NUM_CONTA').AsString;
    model.Agencia := qry.FieldByName('AGENCIA').AsString;
    model.NomeBanco := qry.FieldByName('BANCO').AsString;
    model.Ativo := qry.FieldByName('ATIVO').AsString;
    model.CnpjCpf := qry.FieldByName('CNPJ_CPF').AsString;

    Result := model;
  finally
    FreeAndNil(qry);
  end;
end;

function TRepositorioContaBanco.RetornarCampos: string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.AppendLine('select');
    sb.AppendLine(' AGENCIA,');
    sb.AppendLine(' BANCO,');
    sb.AppendLine(' COD_EMPRESA,');
    sb.AppendLine(' ID_CONTABANCO,');
    sb.AppendLine(' NUM_CONTA,');
    sb.AppendLine(' ATIVO,');
    sb.AppendLine(' CNPJ_CPF');
    sb.AppendLine(' from CONTABANCO');
    Result := sb.ToString;
  finally
    FreeAndNil(sb);
  end;
end;

function TRepositorioContaBanco.ObterPorExportarNET: TObjectList<TContaBancoModel>;
var
  qry: TSQLQuery;
  model: TContaBancoModel;
  lista: TObjectList<TContaBancoModel>;
begin
  qry := TSQLQuery.Create(nil);
  try
    qry.SQLConnection := dm.BancoDados;
    qry.SQL.Add(RetornarCampos);
    qry.SQL.Add(' where EXPORTAR_NET = ''S''');
    qry.Open;

    lista := TObjectList<TContaBancoModel>.Create();

    while not qry.Eof do
    begin
      model := TContaBancoModel.Create;
      model.Id := 0;
      model.Codigo := qry.FieldByName('ID_CONTABANCO').AsInteger;
      model.Agencia := qry.FieldByName('AGENCIA').AsString;
      model.NumConta := qry.FieldByName('NUM_CONTA').AsString;
      model.Agencia := qry.FieldByName('AGENCIA').AsString;
      model.NomeBanco := qry.FieldByName('BANCO').AsString;
      model.Ativo := qry.FieldByName('ATIVO').AsString;
      model.CnpjCpf := qry.FieldByName('CNPJ_CPF').AsString;

      lista.Add(model);
      qry.Next;
    end;

    Result := lista;
  finally
    FreeAndNil(qry);
  end;
end;

end.
