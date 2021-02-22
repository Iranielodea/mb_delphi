unit uDMContas;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TdmContas = class(TDataModule)
    QExpNuvem: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExportarNuvem(AId: Integer);
  end;

var
  dmContas: TdmContas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmContas }

procedure TdmContas.ExportarNuvem(AId: Integer);
begin
  QExpNuvem.Close;
  QExpNuvem.Params[0].AsInteger := AId;
  QExpNuvem.ExecSQL();
end;

end.
