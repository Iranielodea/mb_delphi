unit udmParametros;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TdmParametros = class(TDataModule)
    sqlParametro: TSQLDataSet;
    sqlParametroCODIGO: TIntegerField;
    sqlParametroNOME: TStringField;
    sqlParametroOBSERVACAO: TStringField;
    sqlParametroPAR_ID: TIntegerField;
    sqlParametroVALOR: TStringField;
    dspParametro: TDataSetProvider;
    cdsParametro: TClientDataSet;
    cdsParametroPAR_ID: TIntegerField;
    cdsParametroCODIGO: TIntegerField;
    cdsParametroNOME: TStringField;
    cdsParametroOBSERVACAO: TStringField;
    cdsParametroVALOR: TStringField;
    sqlValor: TSQLDataSet;
    sqlValorVALOR: TStringField;
    sqlMax: TSQLDataSet;
    sqlMaxCODIGO: TLargeintField;
    procedure cdsParametroBeforePost(DataSet: TDataSet);
    procedure cdsParametroAfterPost(DataSet: TDataSet);
    procedure cdsParametroAfterDelete(DataSet: TDataSet);
    procedure cdsParametroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    function ProxCodigo: Integer;
    procedure GetCodigo(iCodigo: Integer);
  public
    { Public declarations }
    procedure LocalizarNome(pNome: string; pOpcao: Integer);
    function CaminhoAssinatura: string;
    function RetornoTipoRelatorioAutorizacao: string;
    function CaminhoPDFCarga: string;
  end;

var
  dmParametros: TdmParametros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDM;

{$R *.dfm}

{ TdmParametros }

function TdmParametros.CaminhoPDFCarga: string;
begin
  GetCodigo(3);
//  sqlValor.Close;
//  sqlValor.ParamByName('CODIGO').AsInteger := 1;
//  sqlValor.Open;

  if not DirectoryExists(sqlValorVALOR.AsString) then
    raise Exception.Create('Caminho PDF da Carga ' + #10 + sqlValorVALOR.AsString + #10 + ' não encontrado.');

  Result := sqlValorVALOR.AsString;
  sqlValor.Close;

end;

procedure TdmParametros.cdsParametroAfterDelete(DataSet: TDataSet);
begin
  DM.SalvaTab(cdsParametro);
end;

procedure TdmParametros.cdsParametroAfterPost(DataSet: TDataSet);
begin
  DM.SalvaTab(cdsParametro);
end;

procedure TdmParametros.cdsParametroBeforePost(DataSet: TDataSet);
begin
  if cdsParametro.State = dsInsert then
    cdsParametroPAR_ID.AsInteger:= DM.Incrementa('PARAMETROS','1');
end;

procedure TdmParametros.cdsParametroNewRecord(DataSet: TDataSet);
begin
  cdsParametroCODIGO.AsInteger := ProxCodigo;
end;

procedure TdmParametros.GetCodigo(iCodigo: Integer);
begin
  sqlValor.Close;
  sqlValor.ParamByName('CODIGO').AsInteger :=iCodigo;
  sqlValor.Open;
end;

procedure TdmParametros.LocalizarNome(pNome: string; pOpcao: Integer);
var
  a: String;
begin
  a := '' + pNome + '%';
  if pOpcao = 1 then
    a := '%' + pNome + '%';

  cdsParametro.Close;
  cdsParametro.Params[0].AsString := a;
  cdsParametro.Open;
end;

function TdmParametros.ProxCodigo: Integer;
begin
  sqlMax.Close;
  sqlMax.Open;
  if sqlMaxCODIGO.IsNull then
    Result := 1
  else
    Result := sqlMaxCODIGO.AsInteger;
  sqlMax.Close;
end;

function TdmParametros.RetornoTipoRelatorioAutorizacao: string;
begin
  GetCodigo(2);
//  sqlValor.Close;
//  sqlValor.ParamByName('CODIGO').AsInteger := 2;
//  sqlValor.Open;

  if sqlValor.IsEmpty then
    raise Exception.Create('Parâmetro Tipo de Relatório não Informado.');

  Result := sqlValorVALOR.AsString;
  sqlValor.Close;

end;

function TdmParametros.CaminhoAssinatura: string;
begin
  GetCodigo(1);
//  sqlValor.Close;
//  sqlValor.ParamByName('CODIGO').AsInteger := 1;
//  sqlValor.Open;

  if not DirectoryExists(sqlValorVALOR.AsString) then
    raise Exception.Create('Caminho para Assinatura do pedido ' + #10 + sqlValorVALOR.AsString + #10 + ' não encontrado.');

  Result := sqlValorVALOR.AsString;
  sqlValor.Close;
end;


end.
