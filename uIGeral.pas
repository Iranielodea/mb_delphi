unit uIGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfIGeral = class(TForm)
    butPedido: TBitBtn;
    butCarga: TBitBtn;
    butReceber: TBitBtn;
    butPagar: TBitBtn;
    butCaixa: TBitBtn;
    butExtrato: TBitBtn;
    butResumo: TBitBtn;
    butInativo: TBitBtn;
    Panel1: TPanel;
    butSair: TBitBtn;
    procedure butSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butPedidoClick(Sender: TObject);
    procedure butCargaClick(Sender: TObject);
    procedure butReceberClick(Sender: TObject);
    procedure butPagarClick(Sender: TObject);
    procedure butCaixaClick(Sender: TObject);
    procedure butExtratoClick(Sender: TObject);
    procedure butResumoClick(Sender: TObject);
    procedure butInativoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fIGeral: TfIGeral;

implementation

uses uIPedido, uICarga, UIReceber, UIPagar, uICaixa, uExtratoBanco,
  uIResumoBanco, uISemCompras;

{$R *.dfm}

procedure TfIGeral.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfIGeral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfIGeral.butPedidoClick(Sender: TObject);
begin
   if application.FindComponent('fIPedido') = nil then
      fIPedido:=TfIPedido.create(application);
   fIPedido.show;
end;

procedure TfIGeral.butCargaClick(Sender: TObject);
begin
   if application.FindComponent('fICarga') = nil then
      fICarga:=TfICarga.create(application);
   fICarga.show;
end;

procedure TfIGeral.butReceberClick(Sender: TObject);
begin
   if application.FindComponent('fIReceber') = nil then
      fIReceber:=TfIReceber.create(application);
   fIReceber.show;
end;

procedure TfIGeral.butPagarClick(Sender: TObject);
begin
   if application.FindComponent('fIPagar') = nil then
      fIPagar:=TfIPagar.create(application);
   fIPagar.show;
end;

procedure TfIGeral.butCaixaClick(Sender: TObject);
begin
   if application.FindComponent('fICaixa') = nil then
      fICaixa:=TfICaixa.create(application);
   fICaixa.show;
end;

procedure TfIGeral.butExtratoClick(Sender: TObject);
begin
   if application.FindComponent('fExtratoBanco') = nil then
      fExtratoBanco:=TfExtratoBanco.create(application);
   fExtratoBanco.show;
end;

procedure TfIGeral.butResumoClick(Sender: TObject);
begin
   if application.FindComponent('fIResumoBanco') = nil then
      fIResumoBanco:=TfIResumoBanco.create(application);
   fIResumoBanco.show;
end;

procedure TfIGeral.butInativoClick(Sender: TObject);
begin
   if application.FindComponent('fISemCompras') = nil then
      fISemCompras:=TfISemCompras.create(application);
   fISemCompras.show;
end;

procedure TfIGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=cafree;
end;

end.
