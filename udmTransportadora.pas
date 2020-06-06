unit udmTransportadora;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmTransportadora = class(TDataModule)
    QTransportadora: TSQLQuery;
    QTransportadoraCOD_TRANS: TIntegerField;
    QTransportadoraNOME: TStringField;
    QCnpj: TSQLQuery;
    QCnpjNOME: TStringField;
    QCpf: TSQLQuery;
    QCpfNOME: TStringField;
  private
    { Private declarations }
    FCodigo: Integer;
    FNome: string;
    FCodigoStr: string;
  public
    { Public declarations }
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property CodigoStr: string read FCodigoStr write FCodigoStr;
    procedure LocalizarCodigo(Codigo: integer);
    function LocalizarCNPJ(CodEmpresa: Integer; CNPJ: string): string;
    function LocalizarCPF(CodEmpresa: Integer; CPF: string): string;
  end;

var
  dmTransportadora: TdmTransportadora;

implementation

uses uDM;

{$R *.dfm}

{ TdmTransportadora }

function TdmTransportadora.LocalizarCNPJ(CodEmpresa: Integer;
  CNPJ: string): string;
begin
  QCnpj.Close;
  QCnpj.ParamByName('CODEMPRESA').AsInteger := CodEmpresa;
  QCnpj.ParamByName('CNPJ').AsString := CNPJ;
  QCnpj.Open;

  Result := QCnpjNOME.AsString;
  QCnpj.Close;
end;

procedure TdmTransportadora.LocalizarCodigo(Codigo: integer);
begin
  QTransportadora.Close;
  QTransportadora.ParamByName('COD_TRANS').AsInteger := Codigo;
  QTransportadora.Open;

  FCodigoStr := QTransportadoraCOD_TRANS.AsString;
  FNome := QTransportadoraNOME.AsString;

  QTransportadora.Close;

end;

function TdmTransportadora.LocalizarCPF(CodEmpresa: Integer;
  CPF: string): string;
begin
  QCpf.Close;
  QCpf.ParamByName('CODEMPRESA').AsInteger := CodEmpresa;
  QCpf.ParamByName('CPF').AsString := CPF;
  QCpf.Open;

  Result := QcpfNOME.AsString;
  QCpf.Close;
end;

end.
