unit uCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, DBClient, udmPessoaCredito, uExtratoCredito;

type
  TfCliente = class(TfBase)
    CboTipo: TDBComboBox;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Cnpj: TDBEdit;
    Insc_Estadual: TDBEdit;
    Cpf: TDBEdit;
    RG: TDBEdit;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    PageControl2: TPageControl;
    sheetEnd: TTabSheet;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Cod_Cidade: TDBEdit;
    Desc_Cidade: TDBEdit;
    DBEdit13: TDBEdit;
    editEstado: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    DBEdit18: TDBEdit;
    sheetCompl: TTabSheet;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    Cod_Pagto: TDBEdit;
    Desc_Pagto: TDBEdit;
    SpeedButton2: TSpeedButton;
    Label23: TLabel;
    Cod_Condicao: TDBEdit;
    Desc_Condicao: TDBEdit;
    SpeedButton3: TSpeedButton;
    Label24: TLabel;
    DBMemo1: TDBMemo;
    butContato: TBitBtn;
    butUltPedido: TBitBtn;
    Label25: TLabel;
    DBEdit1: TDBEdit;
    butFicha: TBitBtn;
    Label29: TLabel;
    edtCpfTransp: TMaskEdit;
    Label30: TLabel;
    edtCNPJ: TMaskEdit;
    dsPessoaCredito: TDataSource;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit4: TDBEdit;
    edtDataCredito: TDBEdit;
    Label28: TLabel;
    DBEdit6: TDBEdit;
    Label31: TLabel;
    DBEdit11: TDBEdit;
    btnExcluirCredito: TSpeedButton;
    TabSheet2: TTabSheet;
    GroupBox5: TGroupBox;
    Nome_Vendedor: TDBEdit;
    Cod_Vendedor: TDBEdit;
    Label32: TLabel;
    SpeedButton4: TSpeedButton;
    btnEndereco: TBitBtn;
    ts1: TTabSheet;
    pnl2: TPanel;
    Label33: TLabel;
    dbmmoEMAIL: TDBMemo;
    btnExtrato: TBitBtn;
    procedure CnpjExit(Sender: TObject);
    procedure Insc_EstadualExit(Sender: TObject);
    procedure Cod_CidadeExit(Sender: TObject);
    procedure CpfExit(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CboTipoClick(Sender: TObject);
    procedure sheetCadShow(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure Cod_PagtoExit(Sender: TObject);
    procedure Desc_PagtoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure butContatoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cod_CondicaoExit(Sender: TObject);
    procedure Desc_CondicaoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure butUltPedidoClick(Sender: TObject);
    procedure butFichaClick(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
    procedure dsPessoaCreditoStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sheetComplShow(Sender: TObject);
    procedure butIncluirClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnExcluirCreditoClick(Sender: TObject);
    procedure Nome_VendedorExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnEnderecoClick(Sender: TObject);
    procedure btnExtratoClick(Sender: TObject);
  private
    { Private declarations }
    FPessoaCredito: TdmPessoaCredito;
    procedure PesquisaCidade(Tipo: String);
    procedure PesquisaPagto(Tipo: String);
    procedure PesquisaCondicao(Tipo: String);
    procedure Tipo_Pessoa;
    function Procura_Documento(Tipo: String): boolean;
    procedure BuscarCPF;
    procedure BuscarCNPJ;
    procedure MostraSheet;
  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

uses uDM, UUtil, uCidade, uForma_Pagto, uContato_Cliente, uCondicao,
  uDMRegra, uUltPedido, uFicha, udmCliente, uVendedor, UEndereco;

{$R *.dfm}

procedure TfCliente.CnpjExit(Sender: TObject);
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

procedure TfCliente.Insc_EstadualExit(Sender: TObject);
begin
  inherited;
   if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
      Insc_Estadual.SetFocus;
end;

procedure TfCliente.MostraSheet;
begin
   if not sheetCad.Showing then
      sheetCad.Show;
end;

procedure TfCliente.Nome_VendedorExit(Sender: TObject);
begin
  inherited;
   if Nome_Vendedor.Modified then
   begin
      dm.ModoEdicao(dsCad);
      dmRegra.PesquisaVendedor(Nome_Vendedor.Text);
      dm.ClienteCOD_VENDEDOR.Text:=dm.VendedorCOD_VENDEDOR.Text;
      dm.ClienteVEN_NOME.Text:=dm.VendedorNOME.Text;
      dm.Vendedor.Close;
      fVendedor.Free;
      Nome_Vendedor.Modified := False;
   end;
end;

procedure TfCliente.Cod_CidadeExit(Sender: TObject);
begin
  inherited;
   PesquisaCidade('C');
end;

procedure TfCliente.CpfExit(Sender: TObject);
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

procedure TfCliente.PesquisaCidade(Tipo: String);
var vreg: integer;
begin
   if (Cod_Cidade.Modified = false) and (Desc_Cidade.Modified = false) then
      exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Cidade.Text = '') and (Tipo = 'C')) or ((Desc_Cidade.Text = '') and (Tipo = 'D')) then
   begin
      dm.ClienteCOD_CIDADE.Clear;
      dm.ClienteDESC_CIDADE.Clear;
      dm.ClienteSIGLA.Clear;
      dm.ClienteCEP.Clear;
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
      dm.ClienteCOD_CIDADE.Text:=dm.Qsql.Fields[0].Text;
      dm.ClienteDESC_CIDADE.Text:=dm.Qsql.Fields[1].Text;
      dm.ClienteCEP.Text:=dm.Qsql.Fields[2].Text;
      dm.ClienteSIGLA.Text:=dm.Qsql.Fields[3].Text;
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
         dm.ClienteCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
         dm.ClienteDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
         dm.ClienteCEP.Text:=dm.CidadeCEP.Text;
         dm.ClienteSIGLA.Text:=dm.CidadeSIGLA.Text;
         if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
            Insc_Estadual.SetFocus;
      end
      else begin
         dm.ClienteCOD_CIDADE.Clear;
         dm.ClienteDESC_CIDADE.Clear;
         dm.ClienteSIGLA.Clear;
         dm.ClienteCEP.Clear;
      end;
      dm.Cidade.Close;
      fCidade.Free;
   end;
   dm.Qsql.close;
   Cod_Cidade.Modified:=false;
   Desc_Cidade.Modified:=false;
end;

procedure TfCliente.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  FPessoaCredito.localizarPessoa(DM.ClienteCOD_CLIENTE.AsInteger);
end;

procedure TfCliente.Desc_CidadeExit(Sender: TObject);
begin
  inherited;
  PesquisaCidade('D');
end;

procedure TfCliente.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   fCidade:=TfCidade.create(Self);
   fCidade.TipoCad.Text:='P';
   if fCidade.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.ClienteCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      dm.ClienteDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.ClienteCEP.Text:=dm.CidadeCEP.Text;
      dm.ClienteSIGLA.Text:=dm.CidadeSIGLA.Text;
      if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.Text,editEstado.Text) = false then
         Insc_Estadual.SetFocus;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfCliente.CboTipoClick(Sender: TObject);
begin
  inherited;
   Tipo_Pessoa;
end;

procedure TfCliente.Tipo_Pessoa;
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

procedure TfCliente.sheetCadShow(Sender: TObject);
begin
   Tipo_Pessoa;
  inherited;
end;

procedure TfCliente.sheetComplShow(Sender: TObject);
begin
  inherited;
  if (FPessoaCredito.cdsPessoaCredito.Active = False) or (FPessoaCredito.cdsPessoaCredito.State = dsBrowse) then
    FPessoaCredito.localizarPessoa(DM.ClienteCOD_CLIENTE.AsInteger);
end;

procedure TfCliente.dsCadStateChange(Sender: TObject);
begin
  inherited;
   butContato.Enabled:=dsCad.DataSet.State = dsBrowse;
   butUltPedido.Enabled:=dsCad.DataSet.State = dsBrowse;
   butFicha.Enabled:=dsCad.DataSet.State = dsBrowse;
   btnEndereco.Enabled:=dsCad.DataSet.State = dsBrowse;
end;

procedure TfCliente.dsPessoaCreditoStateChange(Sender: TObject);
begin
  inherited;
  butOk.Enabled := dsPessoaCredito.State in [dsEdit, dsInsert];
end;

procedure TfCliente.PesquisaPagto(Tipo: String);
var vreg: integer;
begin
   if (Cod_Pagto.Modified = false) and (Desc_Pagto.Modified = false) then
      exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Pagto.Text = '') and (Tipo = 'C')) or ((Desc_Pagto.Text = '') and (Tipo = 'D')) then
   begin
      dm.ClienteCOD_PAGTO.Clear;
      dm.ClienteDESC_PAGTO.Clear;
      Cod_Pagto.Modified:=false;
      Desc_Pagto.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select COD_PAGTO, DESC_PAGTO from FORMA_PAGTO where COD_PAGTO = '+Cod_Pagto.Text)
   else
      ComandoQSql('select COD_PAGTO, DESC_PAGTO from FORMA_PAGTO where DESC_PAGTO like '''+Desc_Pagto.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.ClienteCOD_PAGTO.Text:=dm.Qsql.Fields[0].Text;
      dm.ClienteDESC_PAGTO.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fForma_Pagto:=TfForma_Pagto.create(Self);
      fForma_Pagto.TipoCad.Text:='P';
      if Tipo = 'D' then
         fForma_Pagto.EditNome.Text:=Desc_Pagto.Text;
      if fForma_Pagto.ShowModal = mrOk then
      begin
         dm.ClienteCOD_PAGTO.Text:=dm.Forma_PagtoCOD_PAGTO.text;
         dm.ClienteDESC_PAGTO.Text:=dm.Forma_PagtoDESC_PAGTO.Text;
      end
      else begin
         dm.ClienteCOD_PAGTO.Clear;
         dm.ClienteDESC_PAGTO.Clear;
      end;
      dm.Forma_Pagto.Close;
      fForma_Pagto.Free;
   end;
   dm.Qsql.close;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfCliente.Cod_PagtoExit(Sender: TObject);
begin
  inherited;
   PesquisaPagto('C');
end;

procedure TfCliente.Desc_PagtoExit(Sender: TObject);
begin
  inherited;
   PesquisaPagto('D');
end;

procedure TfCliente.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   fForma_Pagto:=TfForma_Pagto.create(Self);
   fForma_Pagto.TipoCad.Text:='P';
   if fForma_Pagto.ShowModal = mrOk then
   begin
      dm.ModoEdicao(dsCad);
      dm.ClienteCOD_PAGTO.Text:=dm.Forma_PagtoCOD_PAGTO.text;
      dm.ClienteDESC_PAGTO.Text:=dm.Forma_PagtoDESC_PAGTO.Text;
   end;
   dm.Forma_Pagto.Close;
   fForma_Pagto.Free;
end;

function TfCliente.Procura_Documento(Tipo: String): boolean;
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
      if dm.Cliente.State = dsInsert then
         ComandoQsql('select CNPJ,COD_CLIENTE from CLIENTE where CNPJ = '''+cnpj.Text+''' and COD_EMPRESA = '+vgCod_Empresa)
      else
         ComandoQsql('select CNPJ,COD_CLIENTE from CLIENTE where CNPJ = '''+cnpj.Text+''' and COD_EMPRESA = '+vgCod_Empresa+' and COD_CLIENTE <> '+Codigo.Text);
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
      if dm.Cliente.State = dsInsert then
         ComandoQsql('select CPF,COD_CLIENTE from CLIENTE where CPF = '''+cpf.Text+''' and COD_EMPRESA = '+vgCod_Empresa)
      else
         ComandoQsql('select CPF,COD_CLIENTE from CLIENTE where CPF = '''+cpf.Text+''' and COD_EMPRESA = '+vgCod_Empresa+' and COD_CLIENTE <> '+Codigo.Text);
      if not dm.Qsql.IsEmpty then
      begin
         mensagem('CPF já Existe');
         result:=false;
      end;
   end;
   dm.Qsql.Close;
end;

procedure TfCliente.butOkClick(Sender: TObject);
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

  if dsCad.DataSet.State in [dsEdit, dsInsert] then
    inherited;

  FPessoaCredito.Salvar(DM.ClienteCOD_CLIENTE.AsInteger);

  sheetEnd.Show;
end;

procedure TfCliente.butPesqClick(Sender: TObject);
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

procedure TfCliente.btnEnderecoClick(Sender: TObject);
var
  Formulario: TfrmEndereco;
begin
  inherited;
  Formulario := TfrmEndereco.Create(DM.ClienteCOD_CLIENTE.AsInteger);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfCliente.btnExcluirCreditoClick(Sender: TObject);
begin
  inherited;
  if Confirma('Confirma Exclusão?','N') = IDYES then
    FPessoaCredito.cdsPessoaCredito.Delete
end;

procedure TfCliente.btnExtratoClick(Sender: TObject);
var
  Formulario: TfrmExtratoCredito;
begin
  if edtDataCredito.Text = '' then
    Exit;

  try
    if FPessoaCredito.cdsPessoaCreditoCOD_CLIENTE.AsInteger > 0 then
    begin
      Formulario := TfrmExtratoCredito.Create(dm.ClienteCOD_EMPRESA.AsInteger, DM.ClienteCOD_CLIENTE.AsInteger, StrToDateDef(edtDataCredito.Text, Date));
      Formulario.ShowModal;
      FreeAndNil(Formulario);
    end
    else
      ShowMessage('Não há registro para analisar o extrato.');
  except
    On E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfCliente.BuscarCNPJ;
var
  lCliente: TdmCliente;
begin
  if Trim(edtCNPJ.Text) <> '' then
  begin
    lCliente := TdmCliente.Create(Self);
    try
      EditNome.Text := lCliente.LocalizarCNPJ(StrToInt(vgCod_Empresa), edtCNPJ.Text);
    finally
      FreeAndNil(lCliente);
    end;
  end;
end;

procedure TfCliente.BuscarCPF;
var
  lCliente: TdmCliente;
begin
  if Trim(edtCpfTransp.Text) <> '' then
  begin
    lCliente := TdmCliente.Create(Self);
    try
      EditNome.Text := lCliente.LocalizarCPF(StrToInt(vgCod_Empresa), edtCpfTransp.Text);
    finally
      FreeAndNil(lCliente);
    end;
  end;
end;

procedure TfCliente.butContatoClick(Sender: TObject);
begin
  inherited;
   fContato_Cliente:=TfContato_Cliente.create(self);
   fContato_Cliente.EditTipo.Text:='CLI';
   fContato_Cliente.showModal;
   fContato_Cliente.free;
end;

procedure TfCliente.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fCliente);
   if not sheetEnd.Showing then
      sheetEnd.Show;

{
   if (EditNome.Text = '') and (dsCad.DataSet.Active = false) then
      EditNome.Text:='ABCD';
}
   inherited;
//   EditNome.Clear;

end;

procedure TfCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FPessoaCredito);
  dmRegra.ExportarClienteWEB();
end;

procedure TfCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FPessoaCredito := TdmPessoaCredito.Create(Self);
  dsPessoaCredito.DataSet := FPessoaCredito.cdsPessoaCredito;
end;

procedure TfCliente.PesquisaCondicao(Tipo: String);
var vreg: integer;
begin
   if (Cod_Condicao.Modified = false) and (Desc_Condicao.Modified = false) then
      exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Condicao.Text = '') and (Tipo = 'C')) or ((Desc_Condicao.Text = '') and (Tipo = 'D')) then
   begin
      dm.ClienteCOD_CONDICAO.Clear;
      dm.ClienteDESC_CONDICAO.Clear;
      Cod_Condicao.Modified:=false;
      Desc_Condicao.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select COD_CONDICAO, DESC_CONDICAO from CONDICAO where COD_CONDICAO = '+Cod_Condicao.Text)
   else
      ComandoQSql('select COD_CONDICAO, DESC_CONDICAO from CONDICAO where DESC_CONDICAO like '''+Desc_Condicao.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.ClienteCOD_CONDICAO.Text:=dm.Qsql.Fields[0].Text;
      dm.ClienteDESC_CONDICAO.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fCondicao:=TfCondicao.create(Self);
      fCondicao.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCondicao.EditNome.Text:=Desc_Condicao.Text;
      if fCondicao.ShowModal = mrOk then
      begin
         dm.ClienteCOD_CONDICAO.Text:=dm.CondicaoCOD_CONDICAO.text;
         dm.ClienteDESC_CONDICAO.Text:=dm.CondicaoDESC_CONDICAO.Text;
      end
      else begin
         dm.ClienteCOD_CONDICAO.Clear;
         dm.ClienteDESC_CONDICAO.Clear;
      end;
      dm.Condicao.Close;
      fCondicao.Free;
   end;
   dm.Qsql.close;
   Cod_Condicao.Modified:=false;
   Desc_Condicao.Modified:=false;
end;

procedure TfCliente.Cod_CondicaoExit(Sender: TObject);
begin
  inherited;
   PesquisaCondicao('C');
end;

procedure TfCliente.Desc_CondicaoExit(Sender: TObject);
begin
  inherited;
   PesquisaCondicao('D');
end;

procedure TfCliente.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   fCondicao:=TfCondicao.create(Self);
   fCondicao.TipoCad.Text:='P';
   if fCondicao.ShowModal = mrOk then
   begin
      dm.ModoEdicao(dsCad);
      dm.ClienteCOD_CONDICAO.Text:=dm.CondicaoCOD_CONDICAO.text;
      dm.ClienteDESC_CONDICAO.Text:=dm.CondicaoDESC_CONDICAO.Text;
   end;
   dm.Condicao.Close;
   fCondicao.Free;
   Cod_Condicao.Modified:=false;
   Desc_Condicao.Modified:=false;
end;

procedure TfCliente.SpeedButton4Click(Sender: TObject);
begin
  inherited;
   if dmRegra.PesquisaVendedor('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.ClienteCOD_VENDEDOR.Text:=dm.VendedorCOD_VENDEDOR.text;
      dm.ClienteVEN_NOME.Text:=dm.VendedorNOME.Text;
   end;
   dm.Vendedor.Close;
   fVendedor.Free;
   Cod_Vendedor.Modified := False;
end;

procedure TfCliente.butExcluirClick(Sender: TObject);
begin
   if dsCad.DataSet.IsEmpty then
      exit;
   if Confirma('Confirma Exclusão?','N') = idNo then
      exit;
   dm.IniTrans;
   Executa('delete from CONTATO where CODIGO = '+dm.ClienteCOD_CLIENTE.Text+' and TIPO = ''C''');
   Executa('delete from CAD_OBS where CODIGO = '+dm.ClienteCOD_CLIENTE.Text+' and TIPO = ''CLI''');
   Executa('delete from DIRETOR where COD_CLIENTE = '+dm.ClienteCOD_CLIENTE.Text);
   Executa('delete from REF_BANCARIA where COD_CLIENTE = '+dm.ClienteCOD_CLIENTE.Text);
   Executa('delete from REF_COMERCIAL where COD_CLIENTE = '+dm.ClienteCOD_CLIENTE.Text);
   dm.Cliente.Delete;
   dm.SalvaTab(dm.Cliente);
   dm.SalvaTrans;

//  inherited;

end;

procedure TfCliente.butUltPedidoClick(Sender: TObject);
begin
  inherited;
   fUltPedido:=TfUltPedido.create(self);
   fUltPedido.Cod_Cliente.Text:=Codigo.Text;
   fUltPedido.PNome.Caption:=Nome.Text;
   fUltPedido.showModal;
   fUltPedido.free;
end;

procedure TfCliente.butFichaClick(Sender: TObject);
begin
  inherited;
   fFicha:=TfFicha.create(self);
   fFicha.CodCliente.text:=dm.ClienteCOD_CLIENTE.Text;
   fFicha.showModal;
   fFicha.free;
end;

procedure TfCliente.butIncluirClick(Sender: TObject);
begin
  inherited;
  sheetEnd.Show;
end;

end.






