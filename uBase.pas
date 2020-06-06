unit uBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  Mask, DB, DBClient;

type
  TfBase = class(TForm)
    P_Rodape: TPanel;
    butNovo: TSpeedButton;
    butAlterar: TSpeedButton;
    butExcluir: TSpeedButton;
    P_Cabec: TGroupBox;
    Label1: TLabel;
    EditNome: TEdit;
    butPesq: TBitBtn;
    Grade: TDBGrid;
    P_Cad: TPanel;
    PageControl1: TPageControl;
    sheetCad: TTabSheet;
    butSair: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    butOk: TBitBtn;
    butCancelar: TBitBtn;
    DBNavigator1: TDBNavigator;
    ROpcao: TRadioGroup;
    Codigo: TDBEdit;
    Nome: TDBEdit;
    TipoCad: TEdit;
    butImprimir: TSpeedButton;
    dsCad: TDataSource;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    butIncluir: TBitBtn;
    lblFiltro: TLabel;
    procedure butNovoClick(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GradeDblClick(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dsCadStateChange(Sender: TObject);
    procedure GradeTitleClick(Column: TColumn);
    procedure butIncluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita(Tipo: String);
    procedure Verifica_Estado;
    procedure MostraSheet;
  public
    { Public declarations }
  end;

var
  fBase: TfBase;

implementation

uses uDM, UUtil;

{$R *.dfm}

procedure TfBase.butNovoClick(Sender: TObject);
begin
   Habilita('N');
   (dsCad.DataSet as TClientDataSet).Append;
end;

procedure TfBase.butAlterarClick(Sender: TObject);
begin
   if dsCad.DataSet.IsEmpty then exit;
   Habilita('A');
end;

procedure TfBase.butOkClick(Sender: TObject);
begin
   dm.IniTrans;
   (dsCad.DataSet as TClientDataSet).Post;
   dm.SalvaTab((dsCad.DataSet as TClientDataSet));
   dm.SalvaTrans;
   MostraSheet;
   butIncluir.SetFocus;
end;

procedure TfBase.butCancelarClick(Sender: TObject);
begin
   if (dsCad.DataSet as TClientDataSet).State in [dsedit,dsinsert] then
      (dsCad.DataSet as TClientDataSet).Cancel;
   Habilita('C');
end;

procedure TfBase.Habilita(Tipo: String);
begin
{
   parametro Tipo:   N-Novo
                     A-Alterar
                     O-Ok
                     C-Cancelar
}
   if (Tipo = 'N') or (Tipo = 'A') then
   begin
      P_Cabec.Enabled:=false;
      P_Cad.Visible:=true;
      Grade.Enabled:=false;
      butNovo.Enabled:=false;
      butAlterar.Enabled:=false;
      butExcluir.Enabled:=false;
      butImprimir.Enabled:=false;
      butSair.Enabled:=false;
      MostraSheet;
      Nome.SetFocus;
   end;
   if (Tipo = 'O') or (Tipo = 'C') then
   begin
      P_Cabec.Enabled:=true;
      P_Cad.Visible:=false;
      Grade.Enabled:=true;
      butNovo.Enabled:=true;
      butAlterar.Enabled:=true;
      butExcluir.Enabled:=true;
      butImprimir.Enabled:=true;
      butSair.Enabled:=true;
      MostraSheet;
      Grade.SetFocus;
   end;
end;

procedure TfBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F1 then
   begin
      if P_Cad.Visible = false then
         EditNome.SetFocus;
      exit;
   end;

   if key = vk_F2 then
   begin
      if P_Cad.Visible then
      begin
         if butIncluir.Enabled then
            butIncluirClick(self);
      end;
      if butNovo.Enabled then
         butNovoClick(self);
      exit;
   end;

   if key = vk_F3 then
   begin
      if butAlterar.Enabled then
         butAlterarClick(self);
      exit;
   end;

   if key = vk_F4 then
   begin
      if butExcluir.Enabled then
         butExcluirClick(self);
      exit;
   end;
   {
   if key = vk_F5 then
   begin
      if butImprimir.Enabled then
         butImprimir(self);
      exit;
   end;
   }

   if key = vk_F6 then
   begin
      if butOk.Enabled then
         butOkClick(self);
      exit;
   end;

   if key = vk_F7 then
   begin
      if butPesq.Enabled then
         butPesqClick(self);
      exit;
   end;

   if key = vk_Escape then
   begin
      if P_Cad.Visible then
      begin
         Verifica_Estado;
         butCancelarClick(self);
         Habilita('O');
         MostraSheet;
         Grade.SetFocus;
      end
      else
         close;
   end;
end;

procedure TfBase.GradeDblClick(Sender: TObject);
begin
   if TipoCad.Text = 'P' then
   begin
      close;
      ModalResult:=mrOk;
   end
   else 
      butAlterarClick(Self);
end;

procedure TfBase.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
   begin
      GradeDblClick(Self);
      if not (dsCad.DataSet.IsEmpty) then
      begin
         if TipoCad.Text = 'C' then
            Codigo.SetFocus;
      end;
   end;
end;

procedure TfBase.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfBase.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Painel(P_Cad);
   if not P_Cad.Visible then
   begin
      butPesqClick(Self);
      if (dscad.DataSet.IsEmpty) and (EditNome.Text <> '') then
      begin
         EditNome.Clear;
         butPesqClick(self);
      end;
   end;
end;

procedure TfBase.butPesqClick(Sender: TObject);
var a: String;
begin
   a:=''+EditNome.Text+'%';
   if ROpcao.ItemIndex = 1 then
      a:='%'+EditNome.Text+'%';
   try
      dm.Get_Codigo((dsCad.DataSet as TClientDataSet),a);
   except
      (dsCad.DataSet as TClientDataSet).Close;
      (dsCad.DataSet as TClientDataSet).Params[0].Text:=vgCod_Empresa;
      (dsCad.DataSet as TClientDataSet).Open;
   end;
   MostraSheet;
   Grade.SetFocus;
end;

procedure TfBase.butExcluirClick(Sender: TObject);
begin
   if (dsCad.DataSet as TClientDataSet).IsEmpty then
      exit;
   if Confirma('Confirma Exclusão?','N') = idNo then
      exit;
   dm.IniTrans;
   (dsCad.DataSet as TClientDataSet).Delete;
   dm.SalvaTab((dsCad.DataSet as TClientDataSet));
   dm.SalvaTrans;
end;

procedure TfBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if TipoCad.Text <> 'P' then
   begin
      dsCad.DataSet.Close;
      action:=cafree;
   end;
end;

procedure TfBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfBase.dsCadStateChange(Sender: TObject);
begin
   butOk.Enabled:=dscad.DataSet.State in [dsedit,dsinsert];
   butIncluir.Enabled:=dscad.DataSet.State in [dsBrowse];
end;

procedure TfBase.GradeTitleClick(Column: TColumn);
begin
   (dscad.DataSet as TClientDataSet).IndexFieldNames:=Column.FieldName;
end;

procedure TfBase.Verifica_Estado;
begin
   if dsCad.DataSet.State in [dsedit] then
   begin
      if Confirma('Deseja Salvar as Alterações?','S')=idYes then
         butOkClick(Self)
      else
         dsCad.DataSet.Cancel;
   end;
end;

procedure TfBase.butIncluirClick(Sender: TObject);
begin
   (dsCad.DataSet as TClientDataSet).Append;
   MostraSheet;
   Nome.SetFocus;
end;

procedure TfBase.MostraSheet;
begin
   if not sheetCad.Showing then
      sheetCad.Show;
end;

end.
