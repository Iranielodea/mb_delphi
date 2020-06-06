unit uProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfProduto = class(TfBase)
    Label4: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    ID_UNIDADE: TDBEdit;
    SIGLA: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    Cod_Grupo: TDBEdit;
    Desc_Grupo: TDBEdit;
    SpeedButton2: TSpeedButton;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    procedure Cod_GrupoExit(Sender: TObject);
    procedure Desc_GrupoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ID_UNIDADEExit(Sender: TObject);
    procedure SIGLAExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaGrupo(Tipo: string);
    procedure PesquisaUnidade(Tipo: String);
  public
    { Public declarations }
  end;

var
  fProduto: TfProduto;

implementation

uses uDM, uGrupo, UUtil, uUnidade;

{$R *.dfm}

{ TfProduto }

procedure TfProduto.PesquisaGrupo(Tipo: string);
var vreg: integer;
begin
   if (Cod_Grupo.Modified = false) and (Desc_Grupo.Modified = false) then exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Grupo.Text = '') and (Tipo = 'C')) or ((Desc_Grupo.Text = '') and (Tipo = 'D')) then
   begin
      dm.ProdutoCOD_GRUPO.Clear;
      dm.ProdutoDESC_GRUPO.Clear;
      Cod_Grupo.Modified:=false;
      Desc_Grupo.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select COD_GRUPO, DESC_GRUPO from GRUPO where COD_GRUPO = '+Cod_Grupo.Text)
   else
      ComandoQSql('select COD_GRUPO, DESC_GRUPO from GRUPO where DESC_GRUPO like  '''+Desc_Grupo.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.ProdutoCOD_GRUPO.Text:=dm.Qsql.Fields[0].Text;
      dm.ProdutoDESC_GRUPO.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fGrupo:=TfGrupo.create(Self);
      fGrupo.TipoCad.Text:='P';
      if Tipo = 'D' then
         fGrupo.EditNome.Text:=Desc_Grupo.Text;
      if fGrupo.ShowModal = mrOk then
      begin
         dm.ProdutoCOD_GRUPO.Text:=dm.GrupoCOD_GRUPO.text;
         dm.ProdutoDESC_GRUPO.Text:=dm.GrupoDESC_GRUPO.Text;
      end
      else begin
         dm.ProdutoCOD_GRUPO.Clear;
         dm.ProdutoDESC_GRUPO.Clear;
      end;
      dm.Grupo.Close;
      fGrupo.Free;
   end;
   dm.Qsql.close;
   Cod_Grupo.Modified:=false;
   Desc_Grupo.Modified:=false;
end;

procedure TfProduto.PesquisaUnidade(Tipo: String);
var vreg: integer;
begin
   if (ID_UNIDADE.Modified = false) and (sigla.Modified=false) then exit;
   dm.ModoEdicao(dsCad);
   if ((ID_UNIDADE.Text = '') and (Tipo = 'C')) or ((SIGLA.Text = '') and (Tipo = 'D')) then
   begin
      dm.ProdutoID_UNIDADE.Clear;
      dm.ProdutoSIGLA.Clear;
      ID_UNIDADE.Modified:=false;
      SIGLA.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select ID_UNIDADE, SIGLA from UNIDADE where ID_UNIDADE = '+ID_UNIDADE.Text)
   else
      ComandoQSql('select ID_UNIDADE, SIGLA from UNIDADE where SIGLA like  '''+SIGLA.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.ProdutoID_UNIDADE.Text:=dm.Qsql.Fields[0].Text;
      dm.ProdutoSIGLA.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fUnidade:=TfUnidade.create(Self);
      fUnidade.TipoCad.Text:='P';
      if Tipo = 'D' then
         fUnidade.EditNome.Text:=SIGLA.Text;
      if fUnidade.ShowModal = mrOk then
      begin
         dm.ProdutoID_UNIDADE.Text:=dm.UnidadeID_UNIDADE.text;
         dm.ProdutoSIGLA.Text:=dm.UnidadeSIGLA.Text;
      end
      else begin
         dm.ProdutoID_UNIDADE.Clear;
         dm.ProdutoSIGLA.Clear;
      end;
      dm.Unidade.Close;
      fUnidade.Free;
   end;
   dm.Qsql.close;
   ID_UNIDADE.Modified:=false;
   SIGLA.Modified:=false;
end;

procedure TfProduto.Cod_GrupoExit(Sender: TObject);
begin
  inherited;
   PesquisaGrupo('C');
end;

procedure TfProduto.Desc_GrupoExit(Sender: TObject);
begin
  inherited;
   PesquisaGrupo('D');
end;

procedure TfProduto.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   fGrupo:=TfGrupo.create(Self);
   fGrupo.TipoCad.Text:='P';
   if fGrupo.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.ProdutoCOD_GRUPO.Text:=dm.GrupoCOD_GRUPO.text;
      dm.ProdutoDESC_GRUPO.Text:=dm.GrupoDESC_GRUPO.Text;
      Cod_Grupo.Modified:=false;
      Desc_Grupo.Modified:=false;
   end;
   dm.Grupo.Close;
   fGrupo.Free;
end;

procedure TfProduto.ID_UNIDADEExit(Sender: TObject);
begin
  inherited;
   PesquisaUnidade('C');
end;

procedure TfProduto.SIGLAExit(Sender: TObject);
begin
  inherited;
   PesquisaUnidade('D');
end;

procedure TfProduto.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   fUnidade:=TfUnidade.create(Self);
   fUnidade.TipoCad.Text:='P';
   if fUnidade.ShowModal = mrOk then
   begin
      dm.ModoEdicao(dsCad);
      dm.ProdutoID_UNIDADE.Text:=dm.UnidadeID_UNIDADE.text;
      dm.ProdutoSIGLA.Text:=dm.UnidadeSIGLA.Text;
      ID_UNIDADE.Modified:=false;
      SIGLA.Modified:=false;
   end;
   dm.Unidade.Close;
   fUnidade.Free;
end;

procedure TfProduto.FormActivate(Sender: TObject);
begin
{
   if (EditNome.Text = '') and (dsCad.DataSet.Active = false) then
      editNome.Text:='ABCD';
}
   dm.Tamanho_Form(fProduto);
   inherited;
//   editNome.Clear;
end;

end.
