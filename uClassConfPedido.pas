unit uClassConfPedido;

interface

uses SysUtils;

type
  TConfPedido = class
  private

  public
    function CalcularValorFreteUnitario(ValorPedido, ValorVenda: Currency): Currency;
  end;

implementation

{ TConfPedido }

function TConfPedido.CalcularValorFreteUnitario(ValorPedido,
  ValorVenda: Currency): Currency;
begin
  Result := ValorVenda - ValorPedido;
end;

end.
