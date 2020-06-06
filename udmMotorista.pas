unit udmMotorista;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmMotorista = class(TDataModule)
    QMotorista: TSQLQuery;
    QMotoristaNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function LocalizarCPF(pCodEmpresa: Integer; pCPF: string): string;
  end;

var
  dmMotorista: TdmMotorista;

implementation

uses uDM;

{$R *.dfm}

{ TdmMotorista }

function TdmMotorista.LocalizarCPF(pCodEmpresa: Integer; pCPF: string): string;
begin
  QMotorista.Close;
  QMotorista.ParamByName('CODEMPRESA').AsInteger := pCodEmpresa;
  QMotorista.ParamByName('CPF').AsString := pCPF;
  QMotorista.Open;

  Result := QMotoristaNOME.AsString;
  QMotorista.Close;

end;

end.
