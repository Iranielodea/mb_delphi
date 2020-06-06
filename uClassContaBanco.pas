unit uClassContaBanco;

interface

uses SysUtils, uDM, DBClient;

Type
  TContaBanco = class
  private
    function RetornoSQL: string;
  public
    procedure GetNumConta(ANumConta, AAtivo: string; AOpcao: Integer);
  end;


implementation

{ TContaBanco }

procedure TContaBanco.GetNumConta(ANumConta, AAtivo: string; AOpcao: Integer);
var
  a: string;
  sComando: string;
begin
  a := ' WHERE COD_EMPRESA = ' + vgCod_Empresa;

  if ANumConta.Trim <> '' then
  begin
    a := a + ' AND NUM_CONTA LIKE '+QuotedStr(ANumConta + '%');
    if AOpcao = 1 then
      a := a + ' AND NUM_CONTA LIKE '+QuotedStr('%' + ANumConta + '%');
  end;

  if AAtivo <> 'T' then
    a := a + ' AND ATIVO = ' + QuotedStr(AAtivo);

  sComando := RetornoSQL + a;

//  raise Exception.Create(sComando);

  DM.ContaBanco.Close;
  DM.dtContaBanco.CommandText := RetornoSQL + a;
  DM.ContaBanco.Open;
end;

function TContaBanco.RetornoSQL: string;
var
  sb: TStringBuilder;
begin
  try
    sb := TStringBuilder.Create;
    sb.Append(' select');
    sb.Append('  AGENCIA,');
    sb.Append('  BANCO,');
    sb.Append('  COD_EMPRESA,');
    sb.Append('  ID_CONTABANCO,');
    sb.Append('  NUM_CONTA,');
    sb.Append(' ATIVO,');
    sb.Append(' CNPJ_CPF');
    sb.Append(' from CONTABANCO');

    result := sb.ToString();
  finally
    FreeAndNil(sb);
  end;
end;

end.
