unit uFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, DBClient;

type
  TfFornecedor = class(TfBase)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Cnpj: TDBEdit;
    Insc_Estadual: TDBEdit;
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
    butContato: TBitBtn;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    CPF1: TDBEdit;
    Label27: TLabel;
    Desc_Tipo: TDBEdit;
    IdTipoEmpresa: TDBEdit;
    SpeedButton2: TSpeedButton;
    edtCpfTransp: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    edtCNPJ: TMaskEdit;
    procedure CnpjExit(Sender: TObject);
    procedure Insc_EstadualExit(Sender: TObject);
    procedure Cod_CidadeExit(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure butContatoClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure CPF1Exit(Sender: TObject);
    procedure IdTipoEmpresaExit(Sender: TObject);
    procedure Desc_TipoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
  private
    { Private declarations }
    function Procura_Documento(Tipo: String): boolean;
    procedure PesquisaCidade(Tipo: String);
    procedure PesquisaTipoEmpresa(Tipo: string);
    procedure BuscarCPF;
    procedure BuscarCNPJ;
    procedure MostraSheet;

  public
    { Public declarations }
  end;

var
  fFornecedor: TfFornecedor;

implementation

uses uDM, UUtil, uCidade, uContato_Cliente, uDMRegra, uTipoFornecedor,
  udmFornecedor;

{$R *.dfm}

procedure TfFornecedor.CnpjExit(Sender: TObject);
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

function TfFornecedor.Procura_Documento(Tipo: String): boolean;
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
      if dm.Fornecedor.State = dsInsert then
         ComandoQsql('select CNPJ,COD_FOR,NOME from FORNECEDOR where CNPJ = '''+cnpj.Text+''' and COD_EMPRESA = '+vgCod_Empresa)
      else
         ComandoQsql('select CNPJ,COD_FOR,NOME from FORNECEDOR where CNPJ = '''+cnpj.Text+''' and COD_EMPRESA = '+vgCod_Empresa+' and COD_FOR <> '+Codigo.Text);
      if not dm.Qsql.IsEmpty then
      begin
         showmessage('CNPJ já Existe, Empresa: '+DM.Qsql.Fields[2].text);
         result:=false;
      end;
   end;
   dm.Qsql.Close;
end;

procedure TfFornecedor.IdTipoEmpresaExit(Sender: TObject);
begin
  inherited;
  if IdTipoEmpresa.Modified then
    PesquisaTipoEmpresa('C');
end;

procedure TfFornecedor.Insc_EstadualExit(Sender: TObject);
begin
  inherited;
   if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
      Insc_Estadual.SetFocus;
end;

procedure TfFornecedor.MostraSheet;
begin
   if not sheetCad.Showing then
      sheetCad.Show;
end;

procedure TfFornecedor.PesquisaCidade(Tipo: String);
var vreg: integer;
begin
   if (Cod_Cidade.Modified = false) and (Desc_Cidade.Modified = false) then
      exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Cidade.Text = '') and (Tipo = 'C')) or ((Desc_Cidade.Text = '') and (Tipo = 'D')) then
   begin
      dm.FornecedorCOD_CIDADE.Clear;
      dm.FornecedorDESC_CIDADE.Clear;
      dm.FornecedorSIGLA.Clear;
      dm.FornecedorCEP.Clear;
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
      dm.FornecedorCOD_CIDADE.Text:=dm.Qsql.Fields[0].Text;
      dm.FornecedorDESC_CIDADE.Text:=dm.Qsql.Fields[1].Text;
      dm.FornecedorCEP.Text:=dm.Qsql.Fields[2].Text;
      dm.FornecedorSIGLA.Text:=dm.Qsql.Fields[3].Text;
      if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text)=false then
         Insc_Estadual.SetFocus;
   end
   else begin
      fCidade:=TfCidade.create(Self);
      fCidade.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCidade.EditNome.Text:=Desc_Cidade.Text;
      if fCidade.ShowModal = mrOk then
      begin
         dm.FornecedorCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
         dm.FornecedorDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
         dm.FornecedorCEP.Text:=dm.CidadeCEP.Text;
         dm.FornecedorSIGLA.Text:=dm.CidadeSIGLA.Text;
         if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text)=false then
            Insc_Estadual.SetFocus;
      end
      else begin
         dm.FornecedorCOD_CIDADE.Clear;
         dm.FornecedorDESC_CIDADE.Clear;
         dm.FornecedorSIGLA.Clear;
         dm.FornecedorCEP.Clear;
      end;
      dm.Cidade.Close;
      fCidade.Free;
   end;
   dm.Qsql.close;
   Cod_Cidade.Modified:=false;
   Desc_Cidade.Modified:=false;
end;

procedure TfFornecedor.PesquisaTipoEmpresa(Tipo: string);
var vreg: integer;
begin
   if (IdTipoEmpresa.Modified = false) and (Desc_Tipo.Modified = false) then
      exit;
   dm.ModoEdicao(dsCad);
   if ((IdTipoEmpresa.Text = '') and (Tipo = 'C')) or ((Desc_Tipo.Text = '') and (Tipo = 'D')) then
   begin
      dm.FornecedorID_TIPO_EMPRESA.Clear;
      dm.FornecedorDESC_TIPO.Clear;
      IdTipoEmpresa.Modified:=false;
      Desc_Tipo.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select'
      +' ID_TIPO,'
      +' DESC_TIPO'
      +' from FORN_TIPO_EMPRESA'
      +' where ID_TIPO = '+IdTipoEmpresa.Text)
   else
      ComandoQSql('select'
      +' ID_TIPO,'
      +' DESC_TIPO'
      +' from FORN_TIPO_EMPRESA'
      +' where DESC_TIPO like '''+Desc_Tipo.Text+'%''');

   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.FornecedorID_TIPO_EMPRESA.Text:=dm.Qsql.Fields[0].Text;
      dm.FornecedorDESC_TIPO.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fTipoFornecedor:=TfTipoFornecedor.create(Self);
      fTipoFornecedor.TipoCad.Text:='P';
      if Tipo = 'D' then
         fTipoFornecedor.EditNome.Text:=Desc_Tipo.Text;
      if fTipoFornecedor.ShowModal = mrOk then
      begin
         dm.FornecedorID_TIPO_EMPRESA.Text:=dm.TipoFornecedorID_TIPO.text;
         dm.FornecedorDESC_TIPO.Text:=dm.TipoFornecedorDESC_TIPO.Text;
      end
      else begin
         dm.FornecedorID_TIPO_EMPRESA.Clear;
         dm.FornecedorDESC_TIPO.Clear;
      end;
      dm.TipoFornecedor.Close;
      fTipoFornecedor.Free;
   end;
   dm.Qsql.close;
   IdTipoEmpresa.Modified:=false;
   Desc_Tipo.Modified:=false;
end;

procedure TfFornecedor.Cod_CidadeExit(Sender: TObject);
begin
  inherited;
   PesquisaCidade('C');
end;

procedure TfFornecedor.Desc_CidadeExit(Sender: TObject);
begin
  inherited;
  PesquisaCidade('D');
end;

procedure TfFornecedor.Desc_TipoExit(Sender: TObject);
begin
  inherited;
  if Desc_Tipo.Modified then
    PesquisaTipoEmpresa('D');
end;

procedure TfFornecedor.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   fCidade:=TfCidade.create(Self);
   fCidade.TipoCad.Text:='P';
   if fCidade.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.FornecedorCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      dm.FornecedorDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.FornecedorCEP.Text:=dm.CidadeCEP.Text;
      dm.FornecedorSIGLA.Text:=dm.CidadeSIGLA.Text;
      if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text)=false then
         Insc_Estadual.SetFocus;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfFornecedor.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   fTipoFornecedor:=TfTipoFornecedor.create(Self);
   fTipoFornecedor.TipoCad.Text:='P';
   if fTipoFornecedor.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.FornecedorID_TIPO_EMPRESA.Text:=dm.TipoFornecedorID_TIPO.text;
      dm.FornecedorDESC_TIPO.Text:=dm.TipoFornecedorDESC_TIPO.Text;
   end;
   dm.TipoFornecedor.Close;
   fTipoFornecedor.Free;

end;

procedure TfFornecedor.butOkClick(Sender: TObject);
begin
   if Procura_Documento('J') = false then
      exit;
  inherited;

end;

procedure TfFornecedor.butPesqClick(Sender: TObject);
var a: String;
begin
   BuscarCPF();
   BuscarCNPJ();

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

procedure TfFornecedor.FormActivate(Sender: TObject);
begin
   if not sheetEnd.Showing then
      sheetEnd.Show;
{
   if (EditNome.Text = '') and (dsCad.DataSet.Active = false) then
      EditNome.Text:='ABCD';
}
   dm.Tamanho_Form(fFornecedor);
  inherited;
//  EditNome.Clear;
end;

procedure TfFornecedor.BuscarCNPJ;
var
  lFornecedor: TdmFornecedor;
begin
  if Trim(edtCNPJ.Text) <> '' then
  begin
    lFornecedor := TdmFornecedor.Create(Self);
    try
      EditNome.Text := lFornecedor.LocalizarCNPJ(StrToInt(vgCod_Empresa), edtCNPJ.Text);
    finally
      FreeAndNil(lFornecedor);
    end;
  end;
end;

procedure TfFornecedor.BuscarCPF;
var
  lFornecedor: TdmFornecedor;
begin
  if Trim(edtCpfTransp.Text) <> '' then
  begin
    lFornecedor := TdmFornecedor.Create(Self);
    try
      EditNome.Text := lFornecedor.LocalizarCPF(StrToInt(vgCod_Empresa), edtCpfTransp.Text);
    finally
      FreeAndNil(lFornecedor);
    end;
  end;
end;

procedure TfFornecedor.butContatoClick(Sender: TObject);
begin
  inherited;
   fContato_Cliente:=TfContato_Cliente.create(self);
   fContato_Cliente.EditTipo.Text:='FOR';
   fContato_Cliente.showModal;
   fContato_Cliente.free;
end;

procedure TfFornecedor.dsCadStateChange(Sender: TObject);
begin
  inherited;
   butContato.Enabled:=dsCad.DataSet.State = dsBrowse;
end;

procedure TfFornecedor.butExcluirClick(Sender: TObject);
begin
   if dsCad.DataSet.IsEmpty then
      exit;
   if Confirma('Confirma Exclusão?','N') = idNo then
      exit;
   dm.IniTrans;
   Executa('delete from CONTATO where CODIGO = '+dm.FornecedorCOD_FOR.Text+' and TIPO = ''F''');
   dm.Fornecedor.Delete;
   dm.SalvaTab(dm.Fornecedor);
   dm.SalvaTrans;

//  inherited;

end;

procedure TfFornecedor.CPF1Exit(Sender: TObject);
begin
  inherited;
   if ValidaCPF(Cpf1.Text) = False then
      CPF1.SetFocus;
end;

end.
