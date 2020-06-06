unit uItens_Condicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Mask, DBCtrls, ComCtrls;

type
  TfItens_Condicao = class(TForm)
    dsCad: TDataSource;
    Panel1: TPanel;
    butNovo: TBitBtn;
    butOk: TBitBtn;
    butCancelar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditDias: TDBEdit;
    Tot_Itens: TDBEdit;
    Sequencia: TDBEdit;
    Panel3: TPanel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBNavigator1: TDBNavigator;
    procedure butCancelarClick(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fItens_Condicao: TfItens_Condicao;

implementation

uses uDM;

{$R *.dfm}

procedure TfItens_Condicao.butCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfItens_Condicao.butNovoClick(Sender: TObject);
begin
   dsCad.DataSet.Append;
   Sequencia.SetFocus;
end;

procedure TfItens_Condicao.butOkClick(Sender: TObject);
begin
   if dm.Itens_Condicao.State = dsInsert then
   begin
      dm.Itens_CondicaoCOD_CONDICAO.Text:=dm.CondicaoCOD_CONDICAO.Text;
      if  Tot_Itens.Text = '' then
         dm.Itens_CondicaoSEQ.AsInteger:=1
      else
         dm.Itens_CondicaoSEQ.AsInteger:=strtoint(Tot_Itens.text)+1;
   end;
   dm.IniTrans;
   dsCad.DataSet.Post;
   dm.SalvaTab(dm.Itens_Condicao);
   dm.SalvaTrans;
   butNovo.SetFocus;
end;

procedure TfItens_Condicao.dsCadStateChange(Sender: TObject);
begin
   butNovo.Enabled:=dsCad.State = dsBrowse;
   butOk.Enabled:=dsCad.State in [dsedit,dsinsert];
end;

procedure TfItens_Condicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfItens_Condicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfItens_Condicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dscad.DataSet.State in [dsedit,dsinsert] then
      dscad.DataSet.Cancel;
end;

procedure TfItens_Condicao.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fItens_Condicao);
end;

end.
