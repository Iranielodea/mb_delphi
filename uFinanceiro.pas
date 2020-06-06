unit uFinanceiro;

interface

uses System.SysUtils, System.Classes;

type
  TFinanceiro = class
  public
    class procedure CalcularParcelas(AValorBase: Currency; var AValorPrimeira: Currency;
      var AValorOutras: Currency; AQtdeParcelas: Integer);
  end;

implementation

{ TFinanceiro }

class procedure TFinanceiro.CalcularParcelas(AValorBase: Currency;
  var AValorPrimeira, AValorOutras: Currency; AQtdeParcelas: Integer);
var
  dValor1, dValor2, dValor3: Currency;
begin
  {
    valorBase = 100
    QtdeParcelas = 3

    valor1 = trunc(100/3) = 33,00
    valor2 = valor1 * qtdeParcelas = 99,00
    valor3 = valorBase - valor2 = 1,00
    valorprimeira = valor1 + valor3
    valoroutras = valor1
  }
  dValor1 := Trunc(AValorBase / AQtdeParcelas);
  dValor2 := dValor1 * AQtdeParcelas;
  dValor3 := AValorBase - dValor2;
  AValorPrimeira := dValor1 + dValor3;
  AValorOutras := dValor1;
end;

end.
