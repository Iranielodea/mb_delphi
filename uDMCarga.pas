unit uDMCarga;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TdmCarga = class(TDataModule)
    QPedido: TSQLQuery;
    QPedidoNOME: TStringField;
    QExpNuvem: TSQLQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LocalizarPedido(IdPedido: integer);
    procedure ExportarNuvem(AId: Integer);
  end;

var
  dmCarga: TdmCarga;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCarga }

procedure TdmCarga.DataModuleDestroy(Sender: TObject);
begin
  QPedido.Close;
end;

procedure TdmCarga.ExportarNuvem(AId: Integer);
begin
  QExpNuvem.Close;
  QExpNuvem.Params[0].AsInteger := AId;
  QExpNuvem.ExecSQL();
end;

procedure TdmCarga.LocalizarPedido(IdPedido: integer);
begin
  QPedido.Close;
  QPedido.Params[0].AsInteger := IdPedido;
  QPedido.Open;
end;

end.
