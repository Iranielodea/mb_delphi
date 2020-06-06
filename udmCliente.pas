unit udmCliente;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmCliente = class(TDataModule)
    QCnpj: TSQLQuery;
    QCpf: TSQLQuery;
    QCnpjNOME: TStringField;
    QCpfNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function LocalizarCNPJ(CodEmpresa: Integer; CNPJ: string): string;
    function LocalizarCPF(CodEmpresa: Integer; CPF: string): string;
  end;

var
  dmCliente: TdmCliente;

implementation

uses uDM;

{$R *.dfm}

{ TdmCliente }

function TdmCliente.LocalizarCNPJ(CodEmpresa: Integer; CNPJ: string): string;
begin
  QCnpj.Close;
  QCnpj.ParamByName('CODEMPRESA').AsInteger := CodEmpresa;
  QCnpj.ParamByName('CNPJ').AsString := CNPJ;
  QCnpj.Open;

  Result := QCnpjNOME.AsString;
  QCnpj.Close;

end;

function TdmCliente.LocalizarCPF(CodEmpresa: Integer; CPF: string): string;
begin
  QCpf.Close;
  QCpf.ParamByName('CODEMPRESA').AsInteger := CodEmpresa;
  QCpf.ParamByName('CPF').AsString := CPF;
  QCpf.Open;

  Result := QcpfNOME.AsString;
  QCpf.Close;
end;

end.
