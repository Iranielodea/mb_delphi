unit uRepositorioContaBanco;

interface

uses
  System.SysUtils, uContaBancoModel, uDM, Data.SqlExpr;

type
  TRepositorioContaBanco = class
  public
    function ObterPorCodigo(ACodigo: Integer): TContaBancoModel;
  end;

implementation

{ TRepositorioContaBanco }

function TRepositorioContaBanco.ObterPorCodigo(
  ACodigo: Integer): TContaBancoModel;
var
  qry: TSQLQuery;
  model: TContaBancoModel;
begin
  qry := TSQLQuery.Create(nil);
  try
    qry.SQLConnection := dm.BancoDados;
    qry.SQL.Add('select');
    qry.SQL.Add(' AGENCIA,');
    qry.SQL.Add(' BANCO,');
    qry.SQL.Add(' COD_EMPRESA,');
    qry.SQL.Add(' ID_CONTABANCO,');
    qry.SQL.Add(' NUM_CONTA,');
    qry.SQL.Add(' ATIVO,');
    qry.SQL.Add(' CNPJ_CPF');
    qry.SQL.Add(' from CONTABANCO');
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

end.
