unit uRepositorioCarga;

interface

uses
  System.SysUtils, System.Generics.Collections, uCargaModel, uDM, Data.SqlExpr;

type
  TRepositorioCarga = class
  private
    function RetornarCampos(): string;
    function RetornarDados(qry: TSQLQuery): TObjectList<TCargaModel>;
  public
    function ObterPorDataEmissao(ADataInicial, ADataFinal: TDateTime): TObjectList<TCargaModel>;
    function ObterPorExportarNET(): TObjectList<TCargaModel>;
  end;

implementation

{ TRepositorioCarga }

function TRepositorioCarga.ObterPorDataEmissao(ADataInicial,
  ADataFinal: TDateTime): TObjectList<TCargaModel>;
var
  qry: TSQLQuery;
begin
  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := dm.BancoDados;
  try
    qry.SQL.Text := RetornarCampos();
    qry.SQL.Add(' where car.data BETWEEN :dataini and :datafin');

    qry.ParamByName('DATAINI').AsDateTime := ADataInicial;
    qry.ParamByName('DATAFIN').AsDateTime := ADataFinal;
    qry.Open;

    Result := RetornarDados(qry);
  finally
    FreeAndNil(qry);
  end;
end;

function TRepositorioCarga.ObterPorExportarNET: TObjectList<TCargaModel>;
var
  qry: TSQLQuery;
  resultado: TObjectList<TCargaModel>;
begin
  qry := TSQLQuery.Create(nil);
  qry.SQLConnection := dm.BancoDados;
  try
    qry.SQL.Text := RetornarCampos();
    qry.SQL.Add(' where car.exportar_net = ''S''');
    qry.Open;
    resultado := RetornarDados(qry);
    Result := resultado;
  finally
    FreeAndNil(qry);
  end;
end;

function TRepositorioCarga.RetornarCampos: string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;

  sb.AppendLine(' select');
  sb.AppendLine('    CAR.ARMAZEM,');
  sb.AppendLine('    CAR.COD_AGENCIA,');
  sb.AppendLine('    CAR.COD_CLIENTE,');
  sb.AppendLine('    CAR.COD_CONTATO,');
  sb.AppendLine('    CAR.COD_EMPRESA,');
  sb.AppendLine('    CAR.COD_FOR,');
  sb.AppendLine('    CAR.COD_MOTORISTA,');
  sb.AppendLine('    CAR.COD_MANIFESTO,');
  sb.AppendLine('    CAR.DATA,');
  sb.AppendLine('    CAR.ID_CARGA,');
  sb.AppendLine('    CAR.QTDE_PEDIDO,');
  sb.AppendLine('    CAR.FINANCEIRO,');
  sb.AppendLine('    CAR.LETRA,');
  sb.AppendLine('    CAR.SITUACAO,');
  sb.AppendLine('    CAR.OBS,');
  sb.AppendLine('    CAR.NUM_CARGA,');
  sb.AppendLine('    CAR.NUM_PEDIDO,');
  sb.AppendLine('    CAR.QTDE,');
  sb.AppendLine('    CAR.USU_ALT,');
  sb.AppendLine('    CAR.USU_INC,');
  sb.AppendLine('    CAR.VALOR_CARREGA,');
  sb.AppendLine('    CAR.COMPLEMENTO,');
  sb.AppendLine('    CAR.VALOR_FRETE,');
  sb.AppendLine('    CAR.VALOR_PEDIDO,');
  sb.AppendLine('    CAR.VISTO,');
  sb.AppendLine('    CAR.PLACA,');
  sb.AppendLine('    CAR.SALDO,');
  sb.AppendLine('    CAR.UNIDADE,');
  sb.AppendLine('    CAR.COMPLUNIDADE,');
  sb.AppendLine('    CAR.CONTATO_INDICACAO,');
  sb.AppendLine('    CAR.OBS2,');
  sb.AppendLine('    CAR.NUM_NF,');
  sb.AppendLine('    CAR.DATA_NF,');
  sb.AppendLine('    CAR.QTDE_CADA,');
  sb.AppendLine('    CAR.ID_UNIDADE,');
  sb.AppendLine('    CAR.COD_MANIFESTO,');
  sb.AppendLine('    CAR.id_contabanco,');
  sb.AppendLine('    CAR.CNPJ_CPF,');
  sb.AppendLine('    CAR.CREDITO_NF,');
  sb.AppendLine('    CAR.IR,');
  sb.AppendLine('    CAR.NUM_NOTA2,');
  sb.AppendLine('    CAR.VALOR_NOTA2,');
  sb.AppendLine('    CAR.COD_USINA,');
  sb.AppendLine('    CLI.NOME AS NOME_CLIENTE,');
  sb.AppendLine('    CON.NOME AS NOME_CONTATO,');
  sb.AppendLine('    FO.NOME AS NOME_FORNECEDOR,');
  sb.AppendLine('    MOT.NOME AS NOME_MOTORISTA,');
  sb.AppendLine('    TRA.NOME AS NOME_MANIFESTO,');
  sb.AppendLine('    USI.NOME AS NOME_USINA,');
  sb.AppendLine('    un.sigla,');
  sb.AppendLine('    CTB.AGENCIA AS AGENCIA_BANCO,');
  sb.AppendLine('    CTB.AGENCIA,');
  sb.AppendLine('    CTB.BANCO,');
  sb.AppendLine('    CTB.NUM_CONTA,');
  sb.AppendLine('    CTB.CNPJ_CPF AS CTB_CNPJ');
  sb.AppendLine('from CARGA CAR');
  sb.AppendLine(' left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE');
  sb.AppendLine(' left join CLIENTE CON on CAR.COD_CONTATO = CON.COD_CLIENTE');
  sb.AppendLine(' left join FORNECEDOR FO on CAR.COD_FOR = FO.COD_FOR');
  sb.AppendLine(' left join MOTORISTA MOT on CAR.COD_MOTORISTA = MOT.COD_MOTORISTA');
  sb.AppendLine(' left join FORNECEDOR USI on CAR.COD_USINA = USI.COD_FOR');
  sb.AppendLine(' left join TRANSPORTADOR TRA on CAR.COD_MANIFESTO = TRA.COD_TRANS');
  sb.AppendLine(' left join CONTABANCO CTB on CAR.ID_CONTABANCO = CTB.ID_CONTABANCO');
  sb.AppendLine(' left join unidade un on car.id_unidade = un.id_unidade');

  Result := sb.ToString;
  FreeAndNil(sb);
end;

function TRepositorioCarga.RetornarDados(
  qry: TSQLQuery): TObjectList<TCargaModel>;
var
  lista: TObjectList<TCargaModel>;
  model: TCargaModel;
begin
  lista := TObjectList<TCargaModel>.Create();
  while not qry.Eof do
  begin
    model := TCargaModel.Create;
    model.Codigo := qry.FieldByName('id_carga').AsInteger;
    model.NomeCliente := qry.FieldByName('nome_cliente').AsString;
    model.NomeContato := qry.FieldByName('nome_contato').AsString;
    model.NumPedido := qry.FieldByName('num_pedido').AsInteger;
    model.NumCarga := qry.FieldByName('num_carga').AsInteger;
    model.Letra := qry.FieldByName('letra').AsString;
    model.Data := qry.FieldByName('data').AsDateTime;
    model.Visto := qry.FieldByName('visto').AsString;
    model.Qtde := qry.FieldByName('qtde').AsCurrency;
    model.ValorPedido := qry.FieldByName('valor_pedido').AsCurrency;
    model.ValorCarrega := qry.FieldByName('valor_carrega').AsCurrency;
    model.ValorFrete := qry.FieldByName('valor_frete').AsCurrency;
    model.NomeFornecedor := qry.FieldByName('nome_fornecedor').AsString;
    model.NomeMotorista := qry.FieldByName('nome_motorista').AsString;
    model.NomeAgencia := qry.FieldByName('agencia').AsString;
    model.QtdePedido := qry.FieldByName('qtde_pedido').AsCurrency;
    model.Placa := qry.FieldByName('placa').AsString;
    model.Obs := qry.FieldByName('obs').AsString;
    model.Situacao := qry.FieldByName('situacao').AsString;
    model.Financeiro := qry.FieldByName('financeiro').AsString;
    model.Complemento := qry.FieldByName('complemento').AsString;
    model.ContatoIndicacao := qry.FieldByName('contato_indicacao').AsString;
    model.Saldo := qry.FieldByName('saldo').AsCurrency;
    model.Armazen := qry.FieldByName('armazem').AsString;
    model.Unidade := qry.FieldByName('unidade').AsString;
    model.ComplUnidade := qry.FieldByName('COMPLUNIDADE').AsString;
    model.Obs2 := qry.FieldByName('obs2').AsString;
    model.NumNF := qry.FieldByName('num_nf').AsString;
    model.DataNF := qry.FieldByName('data_nf').AsDateTime;
    model.NomeManifesto := qry.FieldByName('nome_manifesto').AsString;
    model.QtdeCada := qry.FieldByName('qtde_cada').AsCurrency;
    model.SiglaUnidade := qry.FieldByName('sigla').AsString;
    model.AgenciaBanco := qry.FieldByName('agencia_banco').AsString;
    model.CNPJ_CPF := qry.FieldByName('CNPJ_CPF').AsString;
    model.CreditoNF := qry.FieldByName('Credito_nf').AsString;
    model.NumNota2 := qry.FieldByName('num_nota2').AsString;
    model.IR := qry.FieldByName('ir').AsCurrency;
    model.ValorNota2 := qry.FieldByName('valor_nota2').AsCurrency;
    model.NomeUsina := qry.FieldByName('nome_usina').AsString;
    model.CodCliente := qry.FieldByName('cod_cliente').AsInteger;
    model.CodFor := qry.FieldByName('cod_for').AsInteger;
    model.CodContato := qry.FieldByName('cod_contato').AsInteger;
    model.CodMotorista := qry.FieldByName('cod_motorista').AsInteger;
    model.CodManifesto := qry.FieldByName('cod_manifesto').AsInteger;
    model.IdUnidade := qry.FieldByName('id_unidade').AsInteger;
    model.IdContaBanco := qry.FieldByName('id_contaBanco').AsInteger;
    model.CodUsina := qry.FieldByName('cod_usina').AsInteger;

    lista.Add(model);
    qry.Next;
  end;
  Result := lista;
end;

end.
