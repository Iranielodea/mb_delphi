unit uTerceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfTerceiro = class(TfBase)
    CboTipo: TDBComboBox;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit18: TDBEdit;
    Label21: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Cnpj: TDBEdit;
    Insc_Estadual: TDBEdit;
    Cpf: TDBEdit;
    RG: TDBEdit;
    PageControl2: TPageControl;
    sheetEnd: TTabSheet;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton1: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Cod_Cidade: TDBEdit;
    Desc_Cidade: TDBEdit;
    DBEdit13: TDBEdit;
    editEstado: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit1: TDBEdit;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    DBMemo1: TDBMemo;
    procedure CnpjExit(Sender: TObject);
    procedure Insc_EstadualExit(Sender: TObject);
    procedure Cod_CidadeExit(Sender: TObject);
    procedure CpfExit(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CboTipoClick(Sender: TObject);
    procedure sheetCadShow(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaCidade(Tipo: String);
    procedure Tipo_Pessoa;
    function Procura_Documento(Tipo: String): boolean;
  public
    { Public declarations }
  end;

var
  fTerceiro: TfTerceiro;

implementation

uses uDM, UUtil, uDMRegra, uCidade; 

{$R *.dfm}

{ TfTerceiro }

procedure TfTerceiro.PesquisaCidade(Tipo: String);
var vreg: integer;
begin
   if (Cod_Cidade.Modified = false) and (Desc_Cidade.Modified = false) then
      exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Cidade.Text = '') and (Tipo = 'C')) or ((Desc_Cidade.Text = '') and (Tipo = 'D')) then
   begin
      dm.TerceiroCOD_CIDADE.Clear;
      dm.TerceiroDESC_CIDADE.Clear;
      dm.TerceiroSIGLA.Clear;
      dm.TerceiroCEP.Clear;
      Cod_Cidade.Modified:=false;
      Desc_Cidade.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select'
      +' CID.COD_CIDADE,'
      +' CID.DESC_CIDADE,'
      +' CID.CEP,'
      +' EST.SIGLA'
      +' from CIDADE CID'
      +' left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      +' where CID.COD_CIDADE = '+Cod_Cidade.Text)
   else
      ComandoQSql('select'
      +' CID.COD_CIDADE,'
      +' CID.DESC_CIDADE,'
      +' CID.CEP,'
      +' EST.SIGLA'
      +' from CIDADE CID'
      +' left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      +' where CID.DESC_CIDADE like '''+Desc_Cidade.Text+'%''');

   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.TerceiroCOD_CIDADE.Text:=dm.Qsql.Fields[0].Text;
      dm.TerceiroDESC_CIDADE.Text:=dm.Qsql.Fields[1].Text;
      dm.TerceiroCEP.Text:=dm.Qsql.Fields[2].Text;
      dm.TerceiroSIGLA.Text:=dm.Qsql.Fields[3].Text;
      if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
         Insc_Estadual.SetFocus;
   end
   else begin
      fCidade:=TfCidade.create(Self);
      fCidade.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCidade.EditNome.Text:=Desc_Cidade.Text;
      if fCidade.ShowModal = mrOk then
      begin
         dm.TerceiroCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
         dm.TerceiroDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
         dm.TerceiroCEP.Text:=dm.CidadeCEP.Text;
         dm.TerceiroSIGLA.Text:=dm.CidadeSIGLA.Text;
         if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
            Insc_Estadual.SetFocus;
      end
      else begin
         dm.TerceiroCOD_CIDADE.Clear;
         dm.TerceiroDESC_CIDADE.Clear;
         dm.TerceiroSIGLA.Clear;
         dm.TerceiroCEP.Clear;
      end;
      dm.Cidade.Close;
      fCidade.Free;
   end;
   dm.Qsql.close;
   Cod_Cidade.Modified:=false;
   Desc_Cidade.Modified:=false;
end;

function TfTerceiro.Procura_Documento(Tipo: String): boolean;
begin
{
   Tipo: F-Fisica
   J-Juridica
}
   result:=true;
   if Tipo = 'J' then
   begin
      if copy(cnpj.Text,1,1)= ' ' then
         exit;
      if dm.Terceiro.State = dsInsert then
         ComandoQsql('select CNPJ,COD_TERCEIRO from TERCEIRO where CNPJ = '''+cnpj.Text+''' and COD_EMPRESA = '+vgCod_Empresa)
      else
         ComandoQsql('select CNPJ,COD_TERCEIRO from TERCEIRO where CNPJ = '''+cnpj.Text+''' and COD_EMPRESA = '+vgCod_Empresa+' and COD_TERCEIRO <> '+Codigo.Text);
      if not dm.Qsql.IsEmpty then
      begin
         mensagem('CNPJ já Existe');
         result:=false;
      end;
   end;

   if Tipo = 'F' then
   begin
      if copy(cpf.Text,1,1)= ' ' then
         exit;
      if dm.Terceiro.State = dsInsert then
         ComandoQsql('select CPF,COD_TERCEIRO from TERCEIRO where CPF = '''+cpf.Text+''' and COD_EMPRESA = '+vgCod_Empresa)
      else
         ComandoQsql('select CPF,COD_TERCEIRO from TERCEIRO where CPF = '''+cpf.Text+''' and COD_EMPRESA = '+vgCod_Empresa+' and COD_TERCEIRO <> '+Codigo.Text);
      if not dm.Qsql.IsEmpty then
      begin
         mensagem('CPF já Existe');
         result:=false;
      end;
   end;
   dm.Qsql.Close;
end;

procedure TfTerceiro.Tipo_Pessoa;
begin
   if CboTipo.Text = 'F' then
   begin
      cnpj.Enabled:=false;
      Insc_Estadual.Enabled:=false;
      Cpf.Enabled:=true;
      rg.Enabled:=true;
   end
   else begin
      cnpj.Enabled:=true;
      Insc_Estadual.Enabled:=true;
      Cpf.Enabled:=false;
      rg.Enabled:=false;
   end;
end;

procedure TfTerceiro.CnpjExit(Sender: TObject);
begin
  inherited;
   if cnpj.Modified then
   begin
      if dmRegra.Valida_CNPJ(Cnpj.Text) = false then
      begin
         cnpj.SetFocus;
         exit;
      end;
   end;
   Procura_Documento('J');
   cnpj.Modified:=false;
end;

procedure TfTerceiro.Insc_EstadualExit(Sender: TObject);
begin
  inherited;
   if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
      Insc_Estadual.SetFocus;
end;

procedure TfTerceiro.Cod_CidadeExit(Sender: TObject);
begin
  inherited;
   PesquisaCidade('C');
end;

procedure TfTerceiro.CpfExit(Sender: TObject);
begin
  inherited;
   if cpf.Modified then
   begin
      if dmRegra.Valida_CPF(cpf.Text)=false then
      begin
         cpf.SetFocus;
         exit;
      end;
   end;
   Procura_Documento('F');
   cpf.Modified:=false;
end;

procedure TfTerceiro.Desc_CidadeExit(Sender: TObject);
begin
  inherited;
   PesquisaCidade('D');
end;

procedure TfTerceiro.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   fCidade:=TfCidade.create(Self);
   fCidade.TipoCad.Text:='P';
   if fCidade.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.TerceiroCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      dm.TerceiroDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.TerceiroCEP.Text:=dm.CidadeCEP.Text;
      dm.TerceiroSIGLA.Text:=dm.CidadeSIGLA.Text;
      if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
         Insc_Estadual.SetFocus;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfTerceiro.CboTipoClick(Sender: TObject);
begin
  inherited;
   Tipo_Pessoa;
end;

procedure TfTerceiro.sheetCadShow(Sender: TObject);
begin
   Tipo_Pessoa;
  inherited;

end;

procedure TfTerceiro.butOkClick(Sender: TObject);
begin

   if CboTipo.Text = 'F' then
   begin
      if Procura_Documento('F') = false then
         exit;
   end
   else begin
      if Procura_Documento('J') = false then
         exit;
   end;
   inherited;
end;

procedure TfTerceiro.FormActivate(Sender: TObject);
begin

   //dm.Tamanho_Form(fTerceiro);
   if not sheetEnd.Showing then
      sheetEnd.Show;

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

procedure TfTerceiro.butExcluirClick(Sender: TObject);
begin
  inherited;
   if dsCad.DataSet.IsEmpty then
      exit;
   if Confirma('Confirma Exclusão?','N') = idNo then
      exit;
   dm.IniTrans;
   dm.Terceiro.Delete;
   dm.SalvaTab(dm.Terceiro);
   dm.SalvaTrans;

end;

procedure TfTerceiro.butNovoClick(Sender: TObject);
begin
  inherited;
   Tipo_Pessoa;
end;

end.
