unit uDMCargaVencto;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider;

type
  TdmCargaVencto = class(TDataModule)
    QConsulta: TSQLDataSet;
    QConsultaCARGA_ID: TIntegerField;
    QConsultaDIAS: TIntegerField;
    QConsultaFORMAPAGTO_ID: TIntegerField;
    QConsultaID: TIntegerField;
    QConsultaVALOR: TFloatField;
    QConsultaVENCTO: TSQLTimeStampField;
    QConsultaDESC_PAGTO: TStringField;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    cdsConsultaCARGA_ID: TIntegerField;
    cdsConsultaDIAS: TIntegerField;
    cdsConsultaFORMAPAGTO_ID: TIntegerField;
    cdsConsultaID: TIntegerField;
    cdsConsultaVALOR: TFloatField;
    cdsConsultaVENCTO: TSQLTimeStampField;
    cdsConsultaDESC_PAGTO: TStringField;
    QItensPedido: TSQLDataSet;
    QItensPedidoVALOR: TFloatField;
    QIncrementa: TSQLQuery;
    QIncrementaCODIGO: TIntegerField;
    procedure cdsConsultaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuscarPorCarga(AIdCarga: Integer);
    procedure BuscarPedido(AIdPedido: Integer);
  end;

var
  dmCargaVencto: TdmCargaVencto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCargaVencto }

procedure TdmCargaVencto.BuscarPedido(AIdPedido: Integer);
begin
  QItensPedido.Close;
  QItensPedido.Params[0].AsInteger := AIdPedido;
  QItensPedido.Open;
end;

procedure TdmCargaVencto.BuscarPorCarga(AIdCarga: Integer);
begin
  cdsConsulta.Close;
  cdsConsulta.Params[0].AsInteger := AIdCarga;
  cdsConsulta.Open;
end;

procedure TdmCargaVencto.cdsConsultaBeforePost(DataSet: TDataSet);
begin
  if cdsConsulta.State = dsInsert then
  begin
    QIncrementa.Open;
    cdsConsultaID.AsInteger := QIncrementaCODIGO.AsInteger;
    QIncrementa.Close;
  end;
end;

end.
