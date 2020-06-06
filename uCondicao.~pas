unit uCondicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfCondicao = class(TfBase)
    Grade1: TDBGrid;
    dsItens: TDataSource;
    butIncItem: TBitBtn;
    EditTm: TEdit;
    butExcItem: TBitBtn;
    BitBtn2: TBitBtn;
    procedure butIncClick(Sender: TObject);
    procedure butIncItemClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butAlterarClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure butExcluirClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure butIncluirClick(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure Grade1DblClick(Sender: TObject);
    procedure Grade1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure P_CadEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Procura_Itens;
    procedure Fecha_Itens;
  public
    { Public declarations }
  end;

var
  fCondicao: TfCondicao;

implementation

uses uDM, UUtil, uItens_Condicao;

{$R *.dfm}

procedure TfCondicao.butIncClick(Sender: TObject);
begin
  inherited;
   dsItens.DataSet.Post;
   dm.SalvaTab(dm.Itens_Condicao);
   dm.SalvaTrans;
end;


procedure TfCondicao.butIncItemClick(Sender: TObject);
begin
  inherited;
   fItens_Condicao:=TfItens_Condicao.create(self);
   dsItens.DataSet.Append;
   fItens_Condicao.ShowModal;
   fItens_Condicao.free;
end;

procedure TfCondicao.dsCadStateChange(Sender: TObject);
begin
  inherited;
   butIncItem.Enabled:=dsCad.DataSet.State = dsBrowse;
   butExcItem.Enabled:=dsCad.DataSet.State = dsBrowse;
end;

procedure TfCondicao.Procura_Itens;
begin
   dm.Itens_Condicao.Close;
   if EditTm.Text = 'I' then
      dm.Itens_Condicao.Params[0].Text:='0'
   else
      dm.Itens_Condicao.Params[0].Text:=dm.CondicaoCOD_CONDICAO.Text;
   dm.Itens_Condicao.Open;
end;

procedure TfCondicao.Fecha_Itens;
begin
   if dm.Itens_Condicao.Active = false then exit;
   if dm.Itens_Condicao.state in [dsedit,dsInsert] then
      dm.Itens_Condicao.Cancel;
   dm.Itens_Condicao.Close;
end;

procedure TfCondicao.butCancelarClick(Sender: TObject);
begin
  inherited;
   Fecha_Itens;
end;

procedure TfCondicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
   begin
      if P_Cad.Visible then
         Fecha_Itens;
   end;

  inherited;
end;

procedure TfCondicao.butAlterarClick(Sender: TObject);
begin
   EditTm.Text := 'A';
   Procura_Itens;
  inherited;
end;

procedure TfCondicao.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
   Procura_Itens;
end;

procedure TfCondicao.butExcluirClick(Sender: TObject);
begin
   if dm.Condicao.IsEmpty then
      exit;
   if Confirma('Confirma Exclusão?','N') = idNo then
      exit;
   dm.IniTrans;
   Executa('delete from ITENS_CONDICAO where COD_CONDICAO = '+dm.CondicaoCOD_CONDICAO.Text);
   dm.Condicao.Delete;
   dm.SalvaTab(dm.Condicao);
   dm.SalvaTrans;

  //inherited;

end;

procedure TfCondicao.GradeDblClick(Sender: TObject);
begin
   EditTm.Text := 'A';
   Procura_Itens;
  inherited;
end;

procedure TfCondicao.butIncluirClick(Sender: TObject);
begin
  inherited;
   Procura_Itens;
end;

procedure TfCondicao.butNovoClick(Sender: TObject);
begin
   EditTm.Text := 'I';
   Procura_Itens;
  inherited;
end;

procedure TfCondicao.Grade1DblClick(Sender: TObject);
begin
  inherited;
   if dm.Itens_CondicaoSEQ.IsNull then exit;
   fItens_Condicao:=TfItens_Condicao.create(self);
   fItens_Condicao.ShowModal;
   fItens_Condicao.free;

end;

procedure TfCondicao.Grade1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if key = vk_Return then
      Grade1DblClick(self);
end;

procedure TfCondicao.butOkClick(Sender: TObject);
begin
  inherited;
   butIncItem.SetFocus;
end;

procedure TfCondicao.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fCondicao);
  inherited;
end;

procedure TfCondicao.P_CadEnter(Sender: TObject);
begin
  inherited;
   Procura_Itens;
end;

procedure TfCondicao.BitBtn1Click(Sender: TObject);
begin
  inherited;
   if confirma('Deseja Excluir Este ítem?','N') = idNo then exit;
   dm.IniTrans;
   dsItens.DataSet.Delete;
   dm.SalvaTab(dm.Itens_Condicao);
   dm.SalvaTrans;
end;

procedure TfCondicao.BitBtn2Click(Sender: TObject);
begin
  inherited;
   Grade1DblClick(self);   
end;

end.
