unit uDMContaBanco;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TdmContaBanco = class(TDataModule)
    QExpNuvem: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExportarNuvem(AId: Integer);
  end;

var
  dmContaBanco: TdmContaBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmContaBanco }

procedure TdmContaBanco.ExportarNuvem(AId: Integer);
begin
  QExpNuvem.Close;
  QExpNuvem.Params[0].AsInteger := AId;
  QExpNuvem.ExecSQL();
end;

end.
