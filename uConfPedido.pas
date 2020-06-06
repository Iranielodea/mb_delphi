unit uConfPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBCtrls, Mask, Buttons, ExtCtrls, FMTBcd, SqlExpr;

type
  TfConfPedido = class(TForm)
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    dsCad: TDataSource;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    butSair: TSpeedButton;
    butSalvar: TBitBtn;
    butImprimir: TSpeedButton;
    edtValorFreteUnitario: TEdit;
    QPedido: TSQLQuery;
    QPedidoPRECO_VENDA: TFloatField;
    QPedidoVALOR_PEDIDO: TFloatField;
    butConfig: TBitBtn;
    procedure butConfigClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure butSalvarClick(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FNumPedido: Integer;
    { Private declarations }
  public
    property NumPedido: Integer read FNumPedido write FNumPedido;
    { Public declarations }
  end;

var
  fConfPedido: TfConfPedido;

implementation

uses uDM, uClassConfPedido, uFRConfPedido;

{$R *.dfm}

procedure TfConfPedido.butConfigClick(Sender: TObject);
var
  lImpPedido: TFRConfPedido;
begin
  lImpPedido := TFRConfPedido.Create(Self);
  lImpPedido.DesPedido.Show;
end;

procedure TfConfPedido.butImprimirClick(Sender: TObject);
var
  lImpPedido: TFRConfPedido;
begin
  lImpPedido := TFRConfPedido.Create(Self);
  try
    lImpPedido.Impressao(dm.ConfPedidoNUM_PEDIDO.AsInteger);
  finally
    FreeAndNil(lImpPedido);
  end;
end;

procedure TfConfPedido.butSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfConfPedido.butSalvarClick(Sender: TObject);
begin
  if (dm.ConfPedido.State = dsInsert) then
    dm.ConfPedidoNUM_PEDIDO.AsInteger := FNumPedido;
  dm.ConfPedido.Post;
  dm.SalvaTab(dm.ConfPedido);
end;

procedure TfConfPedido.DBMemo1Enter(Sender: TObject);
begin
  fConfPedido.KeyPreview := False;
end;

procedure TfConfPedido.DBMemo1Exit(Sender: TObject);
begin
  fConfPedido.KeyPreview := True;
end;

procedure TfConfPedido.dsCadStateChange(Sender: TObject);
begin
  butSalvar.Enabled := dsCad.DataSet.State in [dsEdit, dsInsert];
  butImprimir.Enabled := dsCad.DataSet.State = dsBrowse;
end;

procedure TfConfPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dm.ConfPedido.State in [dsEdit, dsInsert] then
    dm.ConfPedido.Cancel;
  dm.ConfPedido.Close;
end;

procedure TfConfPedido.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
   case key of
      vk_F6: begin
               if butSalvar.Enabled then
                  butSalvarClick(self);
             end;
      vk_F8: begin
               if butImprimir.Enabled then
                  butImprimirClick(self);
             end;
      vk_Escape: close;
   end
end;

procedure TfConfPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfConfPedido.FormShow(Sender: TObject);
var
  Calc: TConfPedido;
  sb: TStringBuilder;
begin
  dm.ConfPedido.Close;
  dm.ConfPedido.Params.ParamByName('NUM_PEDIDO').AsInteger := FNumPedido;
  dm.ConfPedido.Open;

  if dm.ConfPedido.IsEmpty then
  begin
    dm.ConfPedido.Append;
    sb := TStringBuilder.Create;
    sb.AppendLine('PEDIDO SUJEITO A APROVAÇÃO ');
    sb.AppendLine('APÓS CARREGAMENTO NÃO SERÁ ACEITO ');
    sb.AppendLine('CANCELAMENTO DO PEDIDO ');
    sb.AppendLine('AS CONDIÇÕES DESTE PEDIDO NÃO PODERÃO SER ALTERADAS.');
    DM.ConfPedidoTEXTO.AsString := sb.ToString;
    FreeAndNil(sb);
  end;


  QPedido.Close;
  Qpedido.ParamByName('num_pedido').AsInteger := FNumPedido;
  QPedido.Open;

  Calc := TConfPedido.Create;
  edtValorFreteUnitario.Text := FormatFloat(',##0.00', Calc.CalcularValorFreteUnitario(QPedidoVALOR_PEDIDO.AsCurrency, QPedidoPRECO_VENDA.AsCurrency));
  FreeAndNil(Calc);
  QPedido.Close;
end;

end.
