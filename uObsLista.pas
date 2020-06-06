unit uObsLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls;

type
  TfListaObs = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCad: TDataSource;
    Panel1: TPanel;
    Id: TEdit;
    butSalvar: TBitBtn;
    butCancelar: TBitBtn;
    DBMemo1: TDBMemo;
    procedure butSalvarClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure butCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListaObs: TfListaObs;

implementation

uses uDM;

{$R *.dfm}

procedure TfListaObs.butSalvarClick(Sender: TObject);
begin
   dm.Carga.Post;
   dm.IniTrans;
   dm.SalvaTab(dm.Carga);
   dm.SalvaTrans;
   close;
end;

procedure TfListaObs.dsCadStateChange(Sender: TObject);
begin
   butSalvar.Enabled:=dsCad.State in [dsedit,dsinsert];
end;

procedure TfListaObs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm.Carga.close;
end;

procedure TfListaObs.FormActivate(Sender: TObject);
begin
   dm.Get_Codigo(dm.Carga,id.Text);
end;

procedure TfListaObs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
   if key = vk_f6 then
   begin
      if butSalvar.Enabled then
         butSalvarClick(self);
   end;
end;

procedure TfListaObs.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfListaObs.butCancelarClick(Sender: TObject);
begin
   close;
end;

end.
