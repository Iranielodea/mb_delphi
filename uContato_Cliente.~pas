unit uContato_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,
  ComCtrls, DB;

type
  TfContato_Cliente = class(TForm)
    dsCad: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditContato: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Grade: TDBGrid;
    Panel1: TPanel;
    butExcItem: TBitBtn;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    butNovoItem: TBitBtn;
    butOk: TBitBtn;
    C_Item: TDBEdit;
    EditTipo: TEdit;
    butCancelar: TBitBtn;
    Label7: TLabel;
    DataNasc: TDBEdit;
    procedure butExcItemClick(Sender: TObject);
    procedure butNovoItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsCadStateChange(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure DataNascKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContato_Cliente: TfContato_Cliente;

implementation

uses uDM, UUtil;

{$R *.dfm}

procedure TfContato_Cliente.butExcItemClick(Sender: TObject);
begin
   if dsCad.DataSet.IsEmpty then exit;
   if Confirma('Confirma Exclusão deste Contato?','N') = idno then exit;
   dm.Contato.Delete;
   dm.SalvaTab(dm.Contato);
end;

procedure TfContato_Cliente.butNovoItemClick(Sender: TObject);
begin
   dm.Contato.Append;
   EditContato.SetFocus;
end;

procedure TfContato_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dscad.DataSet.state in [dsedit,dsinsert] then
      dscad.DataSet.Cancel;
   dscad.DataSet.Close;
end;

procedure TfContato_Cliente.dsCadStateChange(Sender: TObject);
begin
   butOk.Enabled:=dscad.DataSet.State in [dsedit,dsinsert];
   butNovoItem.Enabled:=dscad.DataSet.State in [dsBrowse];
   Grade.Enabled:=not (dscad.DataSet.State in [dsinsert]);
end;

procedure TfContato_Cliente.butOkClick(Sender: TObject);
begin
   if dm.Contato.State = dsInsert then
   begin
      if EditTipo.Text = 'CLI' then
      begin
         dm.ContatoCODIGO.Text:=dm.ClienteCOD_CLIENTE.Text;
         dm.ContatoTIPO.Text:='C';
      end;
      if EditTipo.Text = 'FOR' then
      begin
         dm.ContatoCODIGO.Text:=dm.FornecedorCOD_FOR.Text;
         dm.ContatoTIPO.Text:='F';
      end;
      if C_Item.Text = '' then
         dm.ContatoSEQ.AsInteger:=1
      else
         dm.ContatoSEQ.AsInteger:=strtoInt(C_Item.Text)+1;
   end;
   dm.Contato.Post;
   dm.SalvaTab(dm.Contato);
   dm.SalvaTrans;
   butNovoItem.SetFocus;
end;

procedure TfContato_Cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfContato_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F2 then
   begin
      if butNovoItem.Enabled then
         butNovoItemClick(self);
      exit;
   end;
   if key = vk_F4 then
   begin
      if butExcItem.Enabled then
         butExcItemClick(self);
      exit;
   end;
   if key = vk_F6 then
   begin
      if butOk.Enabled then
         butOkClick(self);
      exit;
   end;
   if key = vk_Escape then
      close;
end;

procedure TfContato_Cliente.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fContato_Cliente);
   dm.Contato.Close;
   if EditTipo.Text = 'CLI' then
   begin
      fContato_Cliente.Caption:='Contato Cliente';
      dm.Contato.Params[0].Text:=dm.ClienteCOD_CLIENTE.Text;
      dm.Contato.Params[1].Text:='C';
   end;
   if EditTipo.Text = 'FOR' then
   begin
      fContato_Cliente.Caption:='Contato Fornecedor';
      dm.Contato.Params[0].Text:=dm.FornecedorCOD_FOR.Text;
      dm.Contato.Params[1].Text:='F';
   end;
   dm.Contato.Open;
end;

procedure TfContato_Cliente.butCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfContato_Cliente.DataNascKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 8 then
   begin
      DM.ModoEdicao(dsCad);
      dm.ContatoDATANASC.Clear;
   end;
end;

end.
