unit udmPedido;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr, uDM;

type
  TdmPedido = class(TDataModule)
    QExpNuvem: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExportarNuvem(ANumPedido: Integer);
  end;

var
  dmPedido: TdmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPedido }

procedure TdmPedido.ExportarNuvem(ANumPedido: Integer);
begin
  QExpNuvem.Close;
  QExpNuvem.Params[0].AsInteger := ANumPedido;
  QExpNuvem.ExecSQL();
end;

end.
