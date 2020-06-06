unit uUltPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ExtCtrls, Grids,
  DBGrids, StdCtrls, Buttons, Menus, Mask, DBCtrls;

type
  TfUltPedido = class(TForm)
    Grade: TDBGrid;
    Panel1: TPanel;
    Qpedido: TSQLQuery;
    dspPedido: TDataSetProvider;
    Pedido: TClientDataSet;
    dsPedido: TDataSource;
    PedidoNUM_PEDIDO: TIntegerField;
    PedidoDATA: TSQLTimeStampField;
    PedidoCOD_CLIENTE: TIntegerField;
    PedidoNOME: TStringField;
    PedidoCOD_PRODUTO: TIntegerField;
    PedidoDESC_PRODUTO: TStringField;
    PedidoSIGLA: TStringField;
    PedidoQTDE: TFloatField;
    PedidoVALOR: TFloatField;
    PedidoPRECO_VENDA: TFloatField;
    Cod_Cliente: TEdit;
    butSair: TBitBtn;
    PedidoC_QTDE: TAggregateField;
    Menu_Auxiliar: TPopupMenu;
    VerPedido1: TMenuItem;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    PNome: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VerPedido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUltPedido: TfUltPedido;

implementation

uses uDM, uPedido;

{$R *.dfm}

procedure TfUltPedido.FormActivate(Sender: TObject);
begin
   Pedido.close;
   Pedido.params[0].Text:=Cod_Cliente.Text;
   Pedido.Open;
end;

procedure TfUltPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Pedido.close;
end;

procedure TfUltPedido.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfUltPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfUltPedido.VerPedido1Click(Sender: TObject);
begin
   if Pedido.IsEmpty then
      exit;
   fPedido:=TfPedido.create(self);
   fPedido.Num_Pedido.Text:=PedidoNUM_PEDIDO.text;
   fPedido.Operacao.Text:='ALTERAR';
   fPedido.showModal;
   fPedido.free;
end;

end.
