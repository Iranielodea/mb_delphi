unit uDMCarga;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TdmCarga = class(TDataModule)
    QPedido: TSQLQuery;
    QPedidoNOME: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LocalizarPedido(IdPedido: integer);
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

procedure TdmCarga.LocalizarPedido(IdPedido: integer);
begin
  QPedido.Close;
  QPedido.Params[0].AsInteger := IdPedido;
  QPedido.Open;
end;

end.
