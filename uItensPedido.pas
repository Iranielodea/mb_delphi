unit uItensPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, DB, Buttons, udmPessoaCredito,
  udmPedido;

type
  TfItensPedido = class(TForm)
    dsCad: TDataSource;
    PageControl1: TPageControl;
    sheetDados: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Cod_Produto: TDBEdit;
    Desc_Produto: TDBEdit;
    id_unidade: TDBEdit;
    Sigla: TDBEdit;
    Qtde: TDBEdit;
    Valor: TDBEdit;
    Valor_Total: TDBEdit;
    Seq: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    butOk: TBitBtn;
    butIncluir: TBitBtn;
    butCancelar: TBitBtn;
    SpeedButton2: TSpeedButton;
    DBNavigator1: TDBNavigator;
    SpeedButton1: TSpeedButton;
    EditOk: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Valor_Venda: TDBEdit;
    Valor_Lucro: TDBEdit;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtQtde: TEdit;
    edtUsada: TEdit;
    edtSaldo: TEdit;
    procedure Cod_ProdutoEnter(Sender: TObject);
    procedure Desc_ProdutoEnter(Sender: TObject);
    procedure id_unidadeEnter(Sender: TObject);
    procedure SiglaEnter(Sender: TObject);
    procedure Valor_TotalEnter(Sender: TObject);
    procedure Cod_ProdutoExit(Sender: TObject);
    procedure Desc_ProdutoExit(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QtdeExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure Valor_TotalExit(Sender: TObject);
    procedure butIncluirClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SiglaExit(Sender: TObject);
    procedure id_unidadeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Valor_VendaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaProduto(Tipo: String);
    procedure Calculo;
    procedure PesquisaUnidade(Tipo: String);
    procedure MostraSheet;
  public
    { Public declarations }
  end;

var
  fItensPedido: TfItensPedido;

implementation

uses uDM, UUtil, uProduto, uUnidade, uDMRegra;

{$R *.dfm}

procedure TfItensPedido.Cod_ProdutoEnter(Sender: TObject);
begin
   Cod_Produto.Modified:=false;
end;

procedure TfItensPedido.Desc_ProdutoEnter(Sender: TObject);
begin
   Desc_Produto.Modified:=false;
end;

procedure TfItensPedido.id_unidadeEnter(Sender: TObject);
begin
   id_unidade.Modified:=false;
end;

procedure TfItensPedido.SiglaEnter(Sender: TObject);
begin
   Sigla.Modified:=false;
end;

procedure TfItensPedido.Valor_TotalEnter(Sender: TObject);
begin
   Valor_Total.Modified:=false;
end;

procedure TfItensPedido.PesquisaProduto(Tipo: String);
var vreg: integer;
   vlSql: String;
begin
   if (Cod_Produto.Modified = false) and (Desc_Produto.Modified = false) then exit;
   DM.ModoEdicao(dsCad);
   if ((Cod_Produto.Text = '') and (Tipo = 'C')) or ((Desc_Produto.Text = '') and (Tipo = 'D')) then
   begin
      dm.ItensPedidoCod_Produto.Clear;
      dm.ItensPedidoDesc_Produto.Clear;
      Cod_Produto.Modified:=false;
      Desc_Produto.Modified:=false;
      exit;
   end;
   vlSql:='select PRO.COD_PRODUTO, PRO.DESC_PRODUTO, PRO.VALOR_VENDA, UN.SIGLA, PRO.ID_UNIDADE from PRODUTO PRO'
   +' left join UNIDADE UN on PRO.ID_UNIDADE = UN.ID_UNIDADE'
   +' where';
   if Tipo = 'C' then
      vlSql:=vlSql + ' PRO.Cod_Produto = '+Cod_Produto.Text
   else
      vlSql:=vlSql + ' PRO.Desc_Produto like  '''+Desc_Produto.Text+'%''';

   ComandoQSql(vlSql);
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.ItensPedidoCod_Produto.Text:=dm.Qsql.fieldbyname('COD_PRODUTO').Text;
      dm.ItensPedidoDesc_Produto.Text:=dm.Qsql.fieldbyname('DESC_PRODUTO').Text;
      dm.ItensPedidoID_UNIDADE.Text:=dm.Qsql.fieldbyname('ID_UNIDADE').Text;
      dm.ItensPedidoSIGLA.Text:=dm.Qsql.fieldbyname('SIGLA').Text;
      dm.ItensPedidoVALOR.AsFloat:=dm.Qsql.fieldbyname('VALOR_VENDA').AsFloat;
   end
   else begin
      fProduto:=TfProduto.create(Self);
      fProduto.TipoCad.Text:='P';
      if Tipo = 'D' then
         fProduto.EditNome.Text:=Desc_Produto.Text;
      if fProduto.ShowModal = mrOk then
      begin
         dm.ItensPedidoCod_Produto.Text:=dm.ProdutoCOD_PRODUTO.Text;
         dm.ItensPedidoDesc_Produto.Text:=dm.ProdutoDESC_PRODUTO.Text;
         dm.ItensPedidoID_UNIDADE.Text:=dm.ProdutoID_UNIDADE.Text;
         dm.ItensPedidoSIGLA.Text:=dm.ProdutoSIGLA.Text;
         dm.ItensPedidoVALOR.AsFloat:=dm.ProdutoVALOR_VENDA.AsFloat;
      end
      else begin
         dm.ItensPedidoCod_Produto.Clear;
         dm.ItensPedidoDesc_Produto.Clear;
         dm.ItensPedidoID_UNIDADE.Clear;
         dm.ItensPedidoSIGLA.Clear;
         dm.ItensPedidoVALOR.AsFloat:=0;
      end;
      dm.Produto.close;
      fProduto.Free;
   end;
   dm.Qsql.close;
   Cod_Produto.Modified:=false;
   Desc_Produto.Modified:=false;
   MostraSheet;
   Qtde.SetFocus;
end;

procedure TfItensPedido.Cod_ProdutoExit(Sender: TObject);
begin
   PesquisaProduto('C');
end;

procedure TfItensPedido.Desc_ProdutoExit(Sender: TObject);
begin
   PesquisaProduto('D');
end;

procedure TfItensPedido.dsCadStateChange(Sender: TObject);
begin
   butOk.Enabled:=dsCad.DataSet.State in [dsedit,dsinsert];
   butIncluir.Enabled:=dsCad.DataSet.State in [dsBrowse];
end;

procedure TfItensPedido.SpeedButton2Click(Sender: TObject);
begin
   fProduto:=TfProduto.create(Self);
   fProduto.TipoCad.Text:='P';
   if fProduto.ShowModal = mrOk then
   begin
      dm.ModoEdicao(dsCad);
      dm.ItensPedidoCod_Produto.Text:=dm.ProdutoCOD_PRODUTO.Text;
      dm.ItensPedidoDesc_Produto.Text:=dm.ProdutoDESC_PRODUTO.Text;
      dm.ItensPedidoID_UNIDADE.Text:=dm.ProdutoID_UNIDADE.Text;
      dm.ItensPedidoSIGLA.Text:=dm.ProdutoSIGLA.Text;
      dm.ItensPedidoVALOR.AsFloat:=dm.ProdutoVALOR_VENDA.AsFloat;
   end;
   dm.Produto.close;
   fProduto.Free;
   Cod_Produto.Modified:=false;
   Desc_Produto.Modified:=false;

end;

procedure TfItensPedido.butCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfItensPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dsCad.DataSet.State in [dsedit,dsinsert] then
      dscad.DataSet.Cancel;
end;

procedure TfItensPedido.Calculo;
begin
   dm.ModoEdicao(dsCad);
   dm.ItensPedidoVALOR_TOTAL.AsFloat:=dm.ItensPedidoQTDE.AsFloat * dm.ItensPedidoVALOR.AsFloat;
   dm.ItensPedidoVALOR_LUCRO.AsFloat:=dm.ItensPedidoPRECO_VENDA.AsFloat - dm.ItensPedidoVALOR.AsFloat;
   dm.ItensPedidoTOTAL_LUCRO.AsFloat:=dm.ItensPedidoVALOR_LUCRO.AsFloat * dm.ItensPedidoQTDE.AsFloat;
   dm.ItensPedidoTOTAL_VENDA.AsFloat:=dm.ItensPedidoPRECO_VENDA.AsFloat * dm.ItensPedidoQTDE.AsFloat;
end;

procedure TfItensPedido.QtdeExit(Sender: TObject);
begin
   if qtde.Modified then
   begin
      Calculo;
      Qtde.Modified:=false;
   end;
end;

procedure TfItensPedido.ValorExit(Sender: TObject);
begin
   if Valor.Modified then
   begin
      Calculo;
      Valor.Modified:=false;
   end;
end;

procedure TfItensPedido.Valor_TotalExit(Sender: TObject);
begin
   if Valor_Total.Modified then
   begin
      dm.ModoEdicao(dsCad);
      if dm.ItensPedidoQTDE.AsFloat > 0 then
         dm.ItensPedidoVALOR.AsFloat:=casas2(dm.ItensPedidoVALOR_TOTAL.AsFloat / dm.ItensPedidoQTDE.AsFloat);
      dm.ItensPedidoVALOR_TOTAL.AsFloat:=dm.ItensPedidoQTDE.AsFloat * dm.ItensPedidoVALOR.AsFloat;
   end;
end;

procedure TfItensPedido.butIncluirClick(Sender: TObject);
begin
   if dm.permite(vgUsuario,'I','PEDIDO') = false then
      exit;
   dm.ItensPedido.Append;
   MostraSheet;
   Desc_Produto.SetFocus;
end;

procedure TfItensPedido.butOkClick(Sender: TObject);
var
  lPedido: TdmPedido;
  bIncluindo: Boolean;
begin
   if dm.permite(vgUsuario,'A','PEDIDO') = false then
      exit;

   if cod_Produto.Text = '' then
   begin
      mensagem('Informe o Produto');
      Desc_Produto.SetFocus;
      exit;
   end;

   if dm.ItensPedidoQTDE.AsFloat = 0 then
   begin
      mensagem('Informe a Quantidade');
      Qtde.SetFocus;
      exit;
   end;

   if dm.ItensPedidoVALOR.AsFloat = 0 then
   begin
      mensagem('Informe o Valor');
      Valor.SetFocus;
      exit;
   end;

   if dm.ItensPedidoPRECO_VENDA.AsFloat = 0 then
   begin
      mensagem('Informe o Valor Venda');
      Valor_Venda.SetFocus;
      exit;
   end;

   if dm.ItensPedidoVALOR.AsFloat > dm.ItensPedidoPRECO_VENDA.AsFloat then
   begin
      mensagem('Preço de Compra maior que Preço de Venda');
   end;

   bIncluindo := False;
   if dm.Pedido.State = dsInsert then
   begin
      bIncluindo := True;

      dm.Pedido.Post;
      dm.SalvaTab(dm.Pedido);
      dmRegra.Troca_Cliente_Venda;
   end;
   if dm.ItensPedido.State = dsInsert then
   begin
      dm.ItensPedidoNUM_PEDIDO.AsInteger:=dm.PedidoNUM_PEDIDO.AsInteger;
      if seq.Text = '' then
         dm.ItensPedidoSEQ.AsInteger:=1
      else
         dm.ItensPedidoSEQ.AsInteger:=strtoint(seq.Text)+1;
   end;
   dm.SalvaTab(dm.ItensPedido);

   if bIncluindo then
   begin
      lPedido := TdmPedido.Create(Self);
      try
        lPedido.ExportarNuvem(DM.PedidoNUM_PEDIDO.AsInteger);
      finally
        FreeAndNil(lPedido);
      end;
   end;

   dm.SalvaTrans;
   if not (dm.Pedido.state in [dsedit,dsinsert]) then
      dm.Pedido.Edit;
   MostraSheet;
   butIncluir.SetFocus;
   EditOk.Text:='S';
end;

procedure TfItensPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_F2: begin
               if butIncluir.Enabled then
               begin
                  MostraSheet;
                  butIncluir.SetFocus;
                  butIncluirClick(self);
               end;
             end;
      vk_F6: begin
               if butOk.Enabled then
               begin
                  MostraSheet;
                  butOk.SetFocus;
                  butOkClick(self);
               end;
             end;
      vk_Escape: close;
   end;
end;

procedure TfItensPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfItensPedido.FormShow(Sender: TObject);
var
  PessoaCredito: TdmPessoaCredito;
begin
  PessoaCredito := TdmPessoaCredito.Create(self);
  try
    PessoaCredito.localizarPessoa(dm.PedidoCOD_CLIENTE.AsInteger);
    edtQtde.Text := FormatFloat(',#000', PessoaCredito.cdsPessoaCreditoQTDE_CREDITO.AsFloat);
    edtUsada.Text := FormatFloat(',#000', PessoaCredito.cdsPessoaCreditoQTDE_USADO.AsFloat);
    edtSaldo.Text := FormatFloat(',#000', PessoaCredito.cdsPessoaCreditoQTDE_SALDO.AsFloat);
  finally
    FreeAndNil(PessoaCredito);
  end;
end;

procedure TfItensPedido.PesquisaUnidade(Tipo: String);
var vreg: integer;
begin
   if (ID_UNIDADE.Modified = false) and (sigla.Modified=false) then exit;
   dm.ModoEdicao(dsCad);
   if ((ID_UNIDADE.Text = '') and (Tipo = 'C')) or ((SIGLA.Text = '') and (Tipo = 'D')) then
   begin
      dm.ItensPedidoID_UNIDADE.Clear;
      dm.ItensPedidoSIGLA.Clear;
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
      dm.ItensPedidoID_UNIDADE.Text:=dm.Qsql.Fields[0].Text;
      dm.ItensPedidoSIGLA.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fUnidade:=TfUnidade.create(Self);
      fUnidade.TipoCad.Text:='P';
      if Tipo = 'D' then
         fUnidade.EditNome.Text:=SIGLA.Text;
      if fUnidade.ShowModal = mrOk then
      begin
         dm.ItensPedidoID_UNIDADE.Text:=dm.UnidadeID_UNIDADE.text;
         dm.ItensPedidoSIGLA.Text:=dm.UnidadeSIGLA.Text;
      end
      else begin
         dm.ItensPedidoID_UNIDADE.Clear;
         dm.ItensPedidoSIGLA.Clear;
      end;
      dm.Unidade.Close;
      fUnidade.Free;
   end;
   dm.Qsql.close;
   ID_UNIDADE.Modified:=false;
   SIGLA.Modified:=false;
end;

procedure TfItensPedido.SiglaExit(Sender: TObject);
begin
   PesquisaUnidade('D');
end;

procedure TfItensPedido.id_unidadeExit(Sender: TObject);
begin
   PesquisaUnidade('C');
end;

procedure TfItensPedido.SpeedButton1Click(Sender: TObject);
begin
   fUnidade:=TfUnidade.create(Self);
   fUnidade.TipoCad.Text:='P';
   if fUnidade.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.ItensPedidoID_UNIDADE.Text:=dm.UnidadeID_UNIDADE.text;
      dm.ItensPedidoSIGLA.Text:=dm.UnidadeSIGLA.Text;
   end;
   dm.Unidade.Close;
   fUnidade.Free;
   ID_UNIDADE.Modified:=false;
   SIGLA.Modified:=false;
end;

procedure TfItensPedido.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fItensPedido);
   MostraSheet;
   Desc_Produto.SetFocus;
end;

procedure TfItensPedido.MostraSheet;
begin
   if not sheetDados.Showing then
      sheetDados.Show;
end;

procedure TfItensPedido.Valor_VendaExit(Sender: TObject);
begin
   if Valor_Venda.Modified then
   begin
      Calculo;
      Valor_Venda.Modified:=false;
   end;
end;

end.
