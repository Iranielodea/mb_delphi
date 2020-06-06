unit uAgenciador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfAgenciador = class(TfBase)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Cnpj: TDBEdit;
    Cod_Cidade: TDBEdit;
    DBEdit8: TDBEdit;
    Desc_Cidade: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Insc_Estadual: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    UF: TDBEdit;
    DBMemo1: TDBMemo;
    SpeedButton1: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CnpjExit(Sender: TObject);
    procedure Insc_EstadualExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAgenciador: TfAgenciador;

implementation

uses uDM, uDMRegra, uCidade, UUtil;

{$R *.dfm}

procedure TfAgenciador.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fAgenciador);
  inherited;

end;

procedure TfAgenciador.Desc_CidadeExit(Sender: TObject);
begin
  inherited;
   if Desc_Cidade.Modified then
   begin
      dmRegra.PesquisaCidade(Desc_Cidade.Text);
      dm.AgenciadorCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.Text;
      dm.AgenciadorDESC_CIDADE.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.AgenciadorCEP.Text:=dm.CidadeCEP.Text;
      dm.AgenciadorSIGLA.Text:=dm.CidadeSIGLA.Text;
      dm.Cidade.Close;
      if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.text,UF.text) = false then
         Insc_Estadual.SetFocus;
      fCidade.Free;
      Desc_Cidade.Modified:=false;
   end;
end;

procedure TfAgenciador.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   if dmRegra.PesquisaCidade('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.AgenciadorCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      dm.AgenciadorDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.AgenciadorCEP.Text:=dm.CidadeCEP.Text;
      dm.AgenciadorSIGLA.Text:=dm.CidadeSIGLA.Text;
      if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.text,UF.text) = false then
         Insc_Estadual.SetFocus;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfAgenciador.CnpjExit(Sender: TObject);
begin
  inherited;
   if dmRegra.Valida_cnpj(Cnpj.Text)= false then
      cnpj.SetFocus;
end;

procedure TfAgenciador.Insc_EstadualExit(Sender: TObject);
begin
  inherited;
   if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,uf.Text) = false then
      Insc_Estadual.SetFocus;
end;

end.

