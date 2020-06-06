unit uExtratoCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Data.FMTBcd, Datasnap.Provider,
  Data.SqlExpr, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, UUtil, Vcl.Buttons;

type
  TfrmExtratoCredito = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    dsCredito: TClientDataSet;
    ds2: TDataSource;
    QCredito: TSQLQuery;
    dspCredito: TDataSetProvider;
    dsCreditoDATA_CREDITO: TDateField;
    dsCreditoQTDE_CREDITO: TFloatField;
    dsCreditoQTDE_USADO: TFloatField;
    dsCreditoQTDE_SALDO: TFloatField;
    dsCreditoID_CARGA: TIntegerField;
    dsCreditoNUM_PEDIDO: TIntegerField;
    dsCreditoDATA: TSQLTimeStampField;
    dsCreditoQTDE: TFloatField;
    dsCreditoNOME: TStringField;
    dbedtCOD_CLIENTE: TDBEdit;
    dbedtNOME: TDBEdit;
    dbedtDATA_CREDITO: TDBEdit;
    dbedtQTDE_CREDITO: TDBEdit;
    dbedtQTDE_USADO: TDBEdit;
    dbedtQTDE_SALDO: TDBEdit;
    dsCreditoCOD_CLIENTE: TIntegerField;
    dsCreditoCTotalQtde: TAggregateField;
    dbedtCTotalQtde: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtDiferenca: TEdit;
    btnAjustarSaldo: TBitBtn;
    QAtualizaQtde: TSQLQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAjustarSaldoClick(Sender: TObject);
  private
    { Private declarations }
    FCodEmpresa: Integer;
    FCodCliente: Integer;
    FData: TDateTime;
    procedure AjustarQuantidade;
    procedure CalcularDiferenca;
  public
    { Public declarations }
    procedure Filtrar(ACodEmpresa, ACodCliente: Integer; AData: TDateTime);
    constructor Create(ACodEmpresa, ACodCliente: Integer; AData: TDateTime); overload;

  end;

var
  frmExtratoCredito: TfrmExtratoCredito;

implementation

{$R *.dfm}

{ TfrmExtratoCredito }

procedure TfrmExtratoCredito.AjustarQuantidade;
var
  Qtde: string;
begin
  if UUtil.Confirma('Confirmar ajuste?', 'S') = IDYES then
  begin
    Qtde := UUtil.CVal(dbedtCTotalQtde.Text);
    QAtualizaQtde.Close;
    QAtualizaQtde.ParamByName('CODCLIENTE').AsInteger := dsCreditoCOD_CLIENTE.AsInteger;
    QAtualizaQtde.ParamByName('QTDE').AsCurrency := StrToCurr(Qtde);
    QAtualizaQtde.ExecSQL();
  end;
end;

procedure TfrmExtratoCredito.btnAjustarSaldoClick(Sender: TObject);
begin
  AjustarQuantidade();
  Filtrar(FCodEmpresa, FCodCliente, FData);
end;

procedure TfrmExtratoCredito.CalcularDiferenca;
begin
  try
    edtDiferenca.Text := FormatFloat(',##0', dsCreditoQTDE_USADO.Value - dsCreditoCTotalQtde.Value);
  except
    edtDiferenca.Text := '0';
  end;
end;

constructor TfrmExtratoCredito.Create(ACodEmpresa, ACodCliente: Integer;
  AData: TDateTime);
begin
  inherited Create(nil);
  FCodEmpresa := ACodEmpresa;
  FCodCliente := ACodCliente;
  FData := AData;
  Filtrar(ACodEmpresa, ACodCliente, AData);
end;

procedure TfrmExtratoCredito.Filtrar(ACodEmpresa, ACodCliente: Integer; AData: TDateTime);
begin
  dsCredito.Close;
  dsCredito.Params.ParamByName('CODEMPRESA').AsInteger := ACodEmpresa;
  dsCredito.Params.ParamByName('CODCLIENTE').AsInteger := ACodCliente;
  dsCredito.Params.ParamByName('DATA').AsDateTime := AData;
  dsCredito.Open;
  CalcularDiferenca();
end;

procedure TfrmExtratoCredito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
