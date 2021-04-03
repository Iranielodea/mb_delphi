unit uContaModel;

interface

uses
  System.SysUtils, UUtil;

type
  TContaModel = class
  private
    FNomeFormaPagto: string;
    FValorOriginal: Currency;
    FContaBancoId: Integer;
    FNomeCliente: string;
    FCodigo: Integer;
    FNumPedido: Integer;
    FDocumento: string;
    FId: Integer;
    FNomeFornecedor: string;
    FDataPago: TDate;
    FDias: Integer;
    FTipoConta: Integer;
    FDataVencto: TDate;
    FSituacao: string;
    FValorPagar: Currency;
    FPedidoId: Integer;
    FSeqConta: Integer;
    FDataEmissao: TDate;
    FValorPago: Currency;
    FCodCliente: Integer;
    FCodFor: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetContaBancoId(const Value: Integer);
    procedure SetDataPago(const Value: TDate);
    procedure SetDataVencto(const Value: TDate);
    procedure SetDateEmissao(const Value: TDate);
    procedure SetDias(const Value: Integer);
    procedure SetDocumento(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetNomeCliente(const Value: string);
    procedure SetNomeFormaPagto(const Value: string);
    procedure SetNomeFornecedor(const Value: string);
    procedure SetNumPedido(const Value: Integer);
    procedure SetPedidoId(const Value: Integer);
    procedure SetSeqConta(const Value: Integer);
    procedure SetSituacao(const Value: string);
    procedure SetTipoConta(const Value: Integer);
    procedure SetValorOriginal(const Value: Currency);
    procedure SetValorPagar(const Value: Currency);
    procedure SetValorPago(const Value: Currency);
    procedure SetCodCliente(const Value: Integer);
    procedure SetCodFor(const Value: Integer);
    function GetNomeCliente: string;
    function GetNomeFornecedor: string;
    function GetDocumento: string;
  public
    property Id: Integer read FId write SetId;
    property Codigo: Integer read FCodigo write SetCodigo;
    property NumPedido: Integer read FNumPedido write SetNumPedido;
    property NomeCliente: string read GetNomeCliente write SetNomeCliente;
    property NomeFornecedor: string read GetNomeFornecedor write SetNomeFornecedor;
    property DataEmissao: TDate read FDataEmissao write SetDateEmissao;
    property ValorPagar: Currency read FValorPagar write SetValorPagar;
    property DataVencto: TDate read FDataVencto write SetDataVencto;
    property Dias: Integer read FDias write SetDias;
    property DataPago: TDate read FDataPago write SetDataPago;
    property ValorPago: Currency read FValorPago write SetValorPago;
    property SeqConta: Integer read FSeqConta write SetSeqConta;
    property ValorOriginal: Currency read FValorOriginal write SetValorOriginal;
    property TipoConta: Integer read FTipoConta write SetTipoConta;
    property Situacao: string read FSituacao write SetSituacao;
    property Documento: string read GetDocumento write SetDocumento;
    property NomeFormaPagto: string read FNomeFormaPagto write SetNomeFormaPagto;
    property ContaBancoId: Integer read FContaBancoId write SetContaBancoId;
    property PedidoId: Integer read FPedidoId write SetPedidoId;
    property CodCliente: Integer read FCodCliente write SetCodCliente;
    property CodFor: Integer read FCodFor write SetCodFor;
  end;

implementation

{ TCargaModel }

function TContaModel.GetDocumento: string;
begin
  Result := TiraAcento(FDocumento);
end;

function TContaModel.GetNomeCliente: string;
begin
  Result := TiraAcento(FNomeCliente);
end;

function TContaModel.GetNomeFornecedor: string;
begin
  Result := TiraAcento(FNomeFornecedor);
end;

procedure TContaModel.SetCodCliente(const Value: Integer);
begin
  FCodCliente := Value;
end;

procedure TContaModel.SetCodFor(const Value: Integer);
begin
  FCodFor := Value;
end;

procedure TContaModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TContaModel.SetContaBancoId(const Value: Integer);
begin
  FContaBancoId := Value;
end;

procedure TContaModel.SetDataPago(const Value: TDate);
begin
  FDataPago := Value;
end;

procedure TContaModel.SetDataVencto(const Value: TDate);
begin
  FDataVencto := Value;
end;

procedure TContaModel.SetDateEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure TContaModel.SetDias(const Value: Integer);
begin
  FDias := Value;
end;

procedure TContaModel.SetDocumento(const Value: string);
begin
  FDocumento := Value;
end;

procedure TContaModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TContaModel.SetNomeCliente(const Value: string);
begin
  FNomeCliente := Value;
end;

procedure TContaModel.SetNomeFormaPagto(const Value: string);
begin
  FNomeFormaPagto := Value;
end;

procedure TContaModel.SetNomeFornecedor(const Value: string);
begin
  FNomeFornecedor := Value;
end;

procedure TContaModel.SetNumPedido(const Value: Integer);
begin
  FNumPedido := Value;
end;

procedure TContaModel.SetPedidoId(const Value: Integer);
begin
  FPedidoId := Value;
end;

procedure TContaModel.SetSeqConta(const Value: Integer);
begin
  FSeqConta := Value;
end;

procedure TContaModel.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TContaModel.SetTipoConta(const Value: Integer);
begin
  FTipoConta := Value;
end;

procedure TContaModel.SetValorOriginal(const Value: Currency);
begin
  FValorOriginal := Value;
end;

procedure TContaModel.SetValorPagar(const Value: Currency);
begin
  FValorPagar := Value;
end;

procedure TContaModel.SetValorPago(const Value: Currency);
begin
  FValorPago := Value;
end;

end.
