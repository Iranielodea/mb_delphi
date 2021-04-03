unit uRepositorioConta;

interface

uses
  System.SysUtils, System.Generics.Collections, uContaModel, uDM, Data.SqlExpr;

type
  TRepositorioConta = class
  private
    function RetornarCampos(): string;
    function RetornarDados(qry: TSQLQuery): TObjectList<TContaModel>;
  public
    function ObterPorDataEmissao(ADataInicial, ADataFinal: TDateTime): TObjectList<TContaModel>;
    function ObterPorExportarNET(): TObjectList<TContaModel>;
  end;

implementation

{ TRepositorioConta }

function TRepositorioConta.ObterPorDataEmissao(ADataInicial,
  ADataFinal: TDateTime): TObjectList<TContaModel>;
var
  qry: TSQLQuery;
begin
  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := dm.BancoDados;
  try
    qry.SQL.Text := RetornarCampos();
    qry.SQL.Add(' where CON.data_emissao BETWEEN :dataini and :datafin');

    qry.ParamByName('DATAINI').AsDateTime := ADataInicial;
    qry.ParamByName('DATAFIN').AsDateTime := ADataFinal;
    qry.Open;

    Result := RetornarDados(qry);
  finally
    FreeAndNil(qry);
  end;
end;

function TRepositorioConta.ObterPorExportarNET: TObjectList<TContaModel>;
var
  qry: TSQLQuery;
  resultado: TObjectList<TContaModel>;
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

function TRepositorioConta.RetornarCampos: string;
var
  qry: TStringBuilder;
begin
  qry := TStringBuilder.Create;
  try
    qry.AppendLine('select');
    qry.AppendLine('    con.id_conta as codigo,');
    qry.AppendLine('    con.num_pedido,');
    qry.AppendLine('    cli.nome as Nome_Cliente,');
    qry.AppendLine('    FO.nome as Nome_Fornecedor,');
    qry.AppendLine('    con.data_emissao,');
    qry.AppendLine('    con.valor_pagar,');
    qry.AppendLine('    con.data_vencto,');
    qry.AppendLine('    con.dias,');
    qry.AppendLine('    con.data_pago,');
    qry.AppendLine('    con.valor_pago,');
    qry.AppendLine('    con.seq_conta,');
    qry.AppendLine('    con.valor_original,');
    qry.AppendLine('    con.tipo_conta,');
    qry.AppendLine('    con.situacao,');
    qry.AppendLine('    con.documento,');
    qry.AppendLine('    con.cod_cliente,');
    qry.AppendLine('    con.cod_for,');
    qry.AppendLine('    pgt.desc_pagto as nome_forma_pagto,');
    qry.AppendLine('    con.id_contabanco as conta_banco_id,');
    qry.AppendLine('    con.id_pedido as pedido_id');
    qry.AppendLine('from CONTAS CON');
    qry.AppendLine('    left join CLIENTE CLI on CON.cod_cliente = CLI.cod_cliente');
    qry.AppendLine('    left join FORNECEDOR FO on CON.cod_for = FO.cod_for');
    qry.AppendLine('    left join forma_pagto PGT on CON.cod_pagto = PGT.cod_pagto');

    Result := qry.ToString();
  finally
    FreeAndNil(qry);
  end;
end;

function TRepositorioConta.RetornarDados(qry: TSQLQuery): TObjectList<TContaModel>;
var
  lista: TObjectList<TContaModel>;
  model: TContaModel;
begin
  lista := TObjectList<TContaModel>.Create();
  while not qry.Eof do
  begin
    model := TContaModel.Create;
    model.Codigo := qry.FieldByName('codigo').AsInteger;
    model.NumPedido := qry.FieldByName('num_pedido').AsInteger;
    model.NomeCliente := qry.FieldByName('nome_cliente').AsString;
    model.NomeFornecedor := qry.FieldByName('nome_fornecedor').AsString;
    model.DataEmissao := qry.FieldByName('data_emissao').AsDateTime;
    model.ValorPagar := qry.FieldByName('valor_pagar').AsCurrency;
    model.DataVencto := qry.FieldByName('data_vencto').AsDateTime;
    model.Dias := qry.FieldByName('dias').AsInteger;
    model.DataPago := qry.FieldByName('data_pago').AsDateTime;
    model.ValorPago := qry.FieldByName('valor_pago').AsCurrency;
    model.SeqConta := qry.FieldByName('seq_conta').AsInteger;
    model.ValorOriginal := qry.FieldByName('valor_original').AsCurrency;
    model.TipoConta := qry.FieldByName('tipo_conta').AsInteger;
    model.Situacao := qry.FieldByName('situacao').AsString;
    model.Documento := qry.FieldByName('documento').AsString;
    model.NomeFormaPagto := qry.FieldByName('nome_forma_pagto').AsString;
    model.ContaBancoId := qry.FieldByName('conta_banco_id').AsInteger;
    model.PedidoId := qry.FieldByName('pedido_id').AsInteger;
    model.CodCliente := qry.FieldByName('cod_cliente').AsInteger;
    model.CodFor := qry.FieldByName('cod_for').AsInteger;

    lista.Add(model);
    qry.Next;
  end;
  Result := Lista;
end;

end.
