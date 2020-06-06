unit uDMEntrega;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider;

type
  TDMEndereco = class(TDataModule)
    QEndEntrega: TSQLQuery;
    QEndEntregaCOD_CLIENTE: TIntegerField;
    QEndEntregaENDERECO: TStringField;
    QEndEntregaNUMERO: TStringField;
    QEndEntregaCOMPLEMENTO: TStringField;
    QEndEntregaBAIRRO: TStringField;
    QEndEntregaCOD_CIDADE: TIntegerField;
    QEndEntregaCEP: TStringField;
    QEndEntregaDESC_CIDADE: TStringField;
    QEndEntregaCID_CEP: TStringField;
    QEndEntregaSIGLA: TStringField;
    dspEndEntrega: TDataSetProvider;
    cdsEndEntrega: TClientDataSet;
    cdsEndEntregaCOD_CLIENTE: TIntegerField;
    cdsEndEntregaENDERECO: TStringField;
    cdsEndEntregaNUMERO: TStringField;
    cdsEndEntregaCOMPLEMENTO: TStringField;
    cdsEndEntregaBAIRRO: TStringField;
    cdsEndEntregaCOD_CIDADE: TIntegerField;
    cdsEndEntregaCEP: TStringField;
    cdsEndEntregaDESC_CIDADE: TStringField;
    cdsEndEntregaCID_CEP: TStringField;
    cdsEndEntregaSIGLA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LocalizarCliente(IdCliente: Integer);
    procedure Salvar(CodCliente: Integer);
  end;

var
  DMEndereco: TDMEndereco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMEndereco }

procedure TDMEndereco.LocalizarCliente(IdCliente: Integer);
begin
  cdsEndEntrega.Close;
  cdsEndEntrega.Params[0].AsInteger := IdCliente;
  cdsEndEntrega.Open;
end;

procedure TDMEndereco.Salvar(CodCliente: Integer);
begin
  if cdsEndEntrega.State in [dsEdit, dsInsert] then
  begin
    if cdsEndEntrega.State = dsInsert then
      cdsEndEntregaCOD_CLIENTE.AsInteger := CodCliente;
    cdsEndEntrega.Post;
  end;

  if cdsEndEntrega.ChangeCount > 0 then
    cdsEndEntrega.ApplyUpdates(0);
end;

end.
