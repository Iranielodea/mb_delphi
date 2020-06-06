unit udmPessoaCredito;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmPessoaCredito = class(TDataModule)
    sqlPessoaCredito: TSQLDataSet;
    dspPessoaCredito: TDataSetProvider;
    cdsPessoaCredito: TClientDataSet;
    sqlPessoaCreditoCOD_CLIENTE: TIntegerField;
    sqlPessoaCreditoDATA_CREDITO: TDateField;
    sqlPessoaCreditoQTDE_CREDITO: TFloatField;
    sqlPessoaCreditoQTDE_SALDO: TFloatField;
    sqlPessoaCreditoQTDE_USADO: TFloatField;
    cdsPessoaCreditoCOD_CLIENTE: TIntegerField;
    cdsPessoaCreditoDATA_CREDITO: TDateField;
    cdsPessoaCreditoQTDE_CREDITO: TFloatField;
    cdsPessoaCreditoQTDE_USADO: TFloatField;
    cdsPessoaCreditoQTDE_SALDO: TFloatField;
    procedure cdsPessoaCreditoDATA_CREDITOSetText(Sender: TField;
      const Text: string);
    procedure cdsPessoaCreditoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure localizarPessoa(pCodPessoa: Integer);
    procedure Salvar(CodPessoa: integer);
  end;

var
  dmPessoaCredito: TdmPessoaCredito;

implementation

uses uDM;

{$R *.dfm}

{ TdmPessoaCredito }

procedure TdmPessoaCredito.cdsPessoaCreditoAfterDelete(DataSet: TDataSet);
begin
  cdsPessoaCredito.ApplyUpdates(0);
end;

procedure TdmPessoaCredito.cdsPessoaCreditoDATA_CREDITOSetText(Sender: TField;
  const Text: string);
begin
  if Trim(Text) = '/  /' then
    Sender.Clear
  else
    Sender.AsString := Text;

end;

procedure TdmPessoaCredito.localizarPessoa(pCodPessoa: Integer);
begin
  cdsPessoaCredito.Close;
  cdsPessoaCredito.Params[0].AsInteger := pCodPessoa;
  cdsPessoaCredito.Open;
end;

procedure TdmPessoaCredito.Salvar(CodPessoa: integer);
begin
  if cdsPessoaCredito.State in [dsEdit, dsInsert] then
  begin
    if cdsPessoaCredito.State = dsInsert then
    begin
      cdsPessoaCreditoCOD_CLIENTE.AsInteger := CodPessoa;
      cdsPessoaCreditoQTDE_USADO.AsFloat := 0;
    end;

    cdsPessoaCredito.Post;
  end;

  if cdsPessoaCredito.ChangeCount > 0 then
    cdsPessoaCredito.ApplyUpdates(0);
end;

end.
