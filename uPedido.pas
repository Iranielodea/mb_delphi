unit uPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, DB, Grids, DBGrids, ComCtrls,
  Buttons;

type
  TfPedido = class(TForm)
    dsCad: TDataSource;
    PageControl1: TPageControl;
    sheetPedido: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    NumPedido: TDBEdit;
    Data: TDBEdit;
    Cod_Cliente: TDBEdit;
    Nome: TDBEdit;
    Cod_For: TDBEdit;
    Nome_For: TDBEdit;
    ValorPedido: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Grade: TDBGrid;
    TabSheet2: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dsItens: TDataSource;
    Num_Pedido: TEdit;
    Operacao: TEdit;
    butNovoItem: TBitBtn;
    butExcItem: TBitBtn;
    butSalvar: TBitBtn;
    butSair: TSpeedButton;
    butNovo: TBitBtn;
    butImprimir: TSpeedButton;
    butCond: TSpeedButton;
    Panel3: TPanel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    butAlterar: TBitBtn;
    butConfig: TBitBtn;
    butExcluir: TBitBtn;
    Label9: TLabel;
    Cod_Contato: TDBEdit;
    Nome_Contato: TEdit;
    SpeedButton3: TSpeedButton;
    Label10: TLabel;
    ValorComissao: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    chImpLogo: TDBCheckBox;
    Cod_Vendedor: TDBEdit;
    Nome_Vendedor: TDBEdit;
    Label13: TLabel;
    SpeedButton4: TSpeedButton;
    Label14: TLabel;
    TotalComissao: TDBEdit;
    btnConfPedido: TSpeedButton;
    chkPDF: TCheckBox;
    Cod_Usina: TDBEdit;
    Nome_Usina: TDBEdit;
    SpeedButton5: TSpeedButton;
    Label15: TLabel;
    procedure btnConfPedidoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butExcItemClick(Sender: TObject);
    procedure Cod_ClienteExit(Sender: TObject);
    procedure NomeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Cod_ForExit(Sender: TObject);
    procedure Nome_ForExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure butSalvarClick(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure butNovoItemClick(Sender: TObject);
    procedure butCondClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butConfigClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure Cod_UsinaExit(Sender: TObject);
    procedure DataExit(Sender: TObject);
    procedure Nome_ContatoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure Nome_VendedorExit(Sender: TObject);
    procedure Nome_VendedorEnter(Sender: TObject);
    procedure Nome_ContatoEnter(Sender: TObject);
    procedure Nome_UsinaExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ValorComissaoExit(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaPedido(inPedido: String);
    procedure PesquisaCliente(Tipo: String);
    procedure PesquisaFor(Tipo: String);
    procedure PesquisaUsina(Tipo: String);
    procedure PesquisaVendedor(Tipo: String);
    function PodeSalvar: boolean;
    procedure MostraSheet;
    procedure Calculo;
    procedure Dados_Anterior;
    procedure Altera_Carga;
    procedure CalculaComissao;
  public
    { Public declarations }
  end;

var
  fPedido: TfPedido;

implementation

uses uDM, UUtil, uCliente, uFornecedor, uItensPedido, uTabela_Prazo,
  uRPedido, uParcelas, uDMRegra, uVendedor, uConfPedido, udmParametros;

  var vu_Cliente, vu_Forn, vu_Contato, vu_Altera_Carga: String;
      vu_Valor, vu_Qtde: double;

{$R *.dfm}

procedure TfPedido.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fPedido);
   butConfig.Visible:=vgUsuario = 'SUPERVISOR';
   if Operacao.Text = 'INCLUIR' then
   begin
      PesquisaPedido('0');
      dm.Pedido.Append;
      Dados_Anterior;
      grade.TabStop:=false;
      MostraSheet;
      Data.SetFocus;
   end;
   if Operacao.Text = 'ALTERAR' then
   begin
      PesquisaPedido(Num_Pedido.Text);
      Dados_Anterior;
      grade.TabStop:=true;
      if Cod_Contato.Text <> '' then
      begin
         dmRegra.Get_Codigo(dm.QCliente,Cod_Contato.Text);
         Nome_Contato.Text:=dm.QClienteNOME.Text;
         dm.QCliente.Close;
      end;
   end;

end;

procedure TfPedido.PesquisaPedido(inPedido: String);
begin
   dm.Pedido.close;
   dm.Pedido.Params[0].Text:=vgCod_Empresa;
   dm.Pedido.Params[1].Text:=inPedido;
   dm.Pedido.Open;

   dm.ItensPedido.close;
   dm.ItensPedido.Params[0].Text:=inPedido;
   dm.ItensPedido.Open;
end;

procedure TfPedido.PesquisaUsina(Tipo: String);
var vreg: integer;
begin
   if (Cod_Usina.Modified = false) and (Nome_Usina.Modified = false) then exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Usina.Text = '') and (Tipo = 'C')) or ((Nome_Usina.Text = '') and (Tipo = 'D')) then
   begin
      dm.PedidoCOD_USINA.Clear;
      dm.PedidoNOME_USINA.Clear;
      Cod_Usina.Modified:=false;
      Nome_Usina.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where Cod_For = '+Cod_Usina.Text)
   else
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where NOME like  '''+Nome_Usina.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.PedidoCOD_USINA.Text:=dm.Qsql.Fields[0].Text;
      dm.PedidoNOME_USINA.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fFornecedor:=TfFornecedor.create(Self);
      fFornecedor.TipoCad.Text:='P';
      if Tipo = 'D' then
         fFornecedor.EditNome.Text := Nome_Usina.Text;
      if fFornecedor.ShowModal = mrOk then
      begin
         dm.PedidoCOD_USINA.Text:=dm.FornecedorCOD_FOR.Text;
         dm.PedidoNOME_USINA.Text:=dm.FornecedorNOME.Text;
      end
      else begin
         dm.PedidoCOD_USINA.Clear;
         dm.PedidoNOME_USINA.Clear;
      end;
      dm.Fornecedor.close;
      fFornecedor.Free;
   end;
   dm.Qsql.close;
   Cod_Usina.Modified:=false;
   Nome_Usina.Modified:=false;
end;

procedure TfPedido.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfPedido.dsCadStateChange(Sender: TObject);
begin
   butNovo.Enabled:=dsCad.DataSet.State in [dsBrowse];
   butImprimir.Enabled:=dsCad.DataSet.State in [dsBrowse];
   butSalvar.Enabled:=dsCad.DataSet.State in [dsEdit, dsInsert];
   butCond.Enabled:=dsCad.DataSet.State in [dsBrowse];
   butExcluir.Enabled:=dsCad.DataSet.State in [dsBrowse];
end;

procedure TfPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if dsCad.DataSet.State in [dsedit,dsinsert] then
      dscad.DataSet.Cancel;
   dscad.DataSet.Close;
   dsItens.DataSet.Close;
end;

procedure TfPedido.butExcItemClick(Sender: TObject);
begin
   if dm.permite(vgUsuario,'E','PEDIDO') = false then
      exit;
   if dsItens.DataSet.IsEmpty then
      exit;
   if dsitens.DataSet.RecordCount = 1 then
   begin
      mensagem('Não será possível excluir este Registro, será necessário excluir o Pedido');
      exit;
   end;
   if Confirma('Confirma Exclusão deste Ítem ?','N')=idno then
      exit;
   dm.ItensPedido.Delete;
   dm.SalvaTab(dm.ItensPedido);
   Calculo;
   Altera_Carga;
end;

procedure TfPedido.PesquisaCliente(Tipo: String);
var
  vreg: integer;
  sql: string;
begin
  sql := ' select';
  sql := sql + ' CLI.COD_CLIENTE, CLI.NOME, CLI.COD_VENDEDOR, VEN.NOME AS NOME_VENDEDOR';
  sql := sql + ' FROM CLIENTE CLI';
  sql := sql + ' LEFT JOIN VENDEDOR VEN ON CLI.COD_VENDEDOR = VEN.COD_VENDEDOR';


   if (Cod_Cliente.Modified = false) and (Nome.Modified = false) then exit;
   DM.ModoEdicao(dsCad);
   if ((Cod_Cliente.Text = '') and (Tipo = 'C')) or ((Nome.Text = '') and (Tipo = 'D')) then
   begin
      dm.PedidoCOD_CLIENTE.Clear;
      dm.PedidoNOME.Clear;
      dm.PedidoCOD_VENDEDOR.Clear;
      dm.PedidoNOME_VENDEDOR.Clear;
      Cod_Cliente.Modified:=false;
      Nome.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql(sql + ' where CLI.COD_CLIENTE = '+Cod_Cliente.Text)
   else
      ComandoQSql(sql + ' where CLI.NOME like  '''+Nome.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.PedidoCod_Cliente.Text:=dm.Qsql.Fields[0].Text;
      dm.PedidoNome.Text:=dm.Qsql.Fields[1].Text;
      DM.PedidoCOD_VENDEDOR.AsString := dm.Qsql.FieldByName('COD_VENDEDOR').AsString;
      DM.PedidoNOME_VENDEDOR.AsString := dm.Qsql.FieldByName('NOME_VENDEDOR').AsString;
   end
   else begin
      fCliente:=TfCliente.create(Self);
      fCliente.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCliente.EditNome.Text:=Nome.Text;
      if fCliente.ShowModal = mrOk then
      begin
         dm.PedidoCod_Cliente.Text:=dm.ClienteCOD_CLIENTE.Text;
         dm.PedidoNome.Text:=dm.ClienteNOME.Text;
         dm.PedidoCOD_VENDEDOR.Text:=dm.ClienteCOD_VENDEDOR.Text;
         dm.PedidoNOME_VENDEDOR.Text:=dm.ClienteVEN_NOME.Text;
      end
      else begin
         dm.PedidoCod_Cliente.Clear;
         dm.PedidoNome.Clear;
         dm.PedidoCOD_VENDEDOR.Clear;
         dm.PedidoNOME_VENDEDOR.Clear;
      end;
      dm.Cliente.close;
      fCliente.Free;
   end;
   dm.Qsql.close;
   Cod_Cliente.Modified:=false;
   Nome.Modified:=false;
end;

procedure TfPedido.Cod_ClienteExit(Sender: TObject);
begin
   PesquisaCliente('C');
end;

procedure TfPedido.NomeExit(Sender: TObject);
begin
   PesquisaCliente('D');
end;

procedure TfPedido.SpeedButton1Click(Sender: TObject);
begin
   fCliente:=TfCliente.create(Self);
   fCliente.TipoCad.Text:='P';
   if fCliente.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.PedidoCod_Cliente.Text:=dm.ClienteCOD_CLIENTE.Text;
      dm.PedidoNome.Text:=dm.ClienteNOME.Text;
      dm.PedidoCOD_VENDEDOR.Text:=dm.ClienteCOD_VENDEDOR.Text;
      dm.PedidoNOME_VENDEDOR.Text:=dm.ClienteVEN_NOME.Text;
   end;
   dm.Cliente.close;
   fCliente.Free;
   dm.Qsql.close;
   Cod_Cliente.Modified:=false;
   Nome.Modified:=false;
end;

procedure TfPedido.PesquisaFor(Tipo: String);
var vreg: integer;
begin
   if (Cod_For.Modified = false) and (Nome_For.Modified = false) then exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_For.Text = '') and (Tipo = 'C')) or ((Nome_For.Text = '') and (Tipo = 'D')) then
   begin
      dm.PedidoCOD_FOR.Clear;
      dm.PedidoNome_For.Clear;
      Cod_For.Modified:=false;
      Nome_For.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where Cod_For = '+Cod_For.Text)
   else
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where NOME like  '''+Nome_For.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.PedidoCod_For.Text:=dm.Qsql.Fields[0].Text;
      dm.PedidoNome_For.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fFornecedor:=TfFornecedor.create(Self);
      fFornecedor.TipoCad.Text:='P';
      if Tipo = 'D' then
         fFornecedor.EditNome.Text:=Nome_For.Text;
      if fFornecedor.ShowModal = mrOk then
      begin
         dm.PedidoCod_For.Text:=dm.FornecedorCOD_FOR.Text;
         dm.PedidoNome_For.Text:=dm.FornecedorNOME.Text;
      end
      else begin
         dm.PedidoCod_For.Clear;
         dm.PedidoNome_For.Clear;
      end;
      dm.Fornecedor.close;
      fFornecedor.Free;
   end;
   dm.Qsql.close;
   Cod_For.Modified:=false;
   Nome_For.Modified:=false;
end;

procedure TfPedido.Cod_ForExit(Sender: TObject);
begin
   PesquisaFor('C');
end;

procedure TfPedido.Nome_ForExit(Sender: TObject);
begin
   PesquisaFor('D');
end;

procedure TfPedido.SpeedButton2Click(Sender: TObject);
begin
   fFornecedor:=TfFornecedor.create(Self);
   fFornecedor.TipoCad.Text:='P';
   if fFornecedor.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.PedidoCod_For.Text:=dm.FornecedorCOD_FOR.Text;
      dm.PedidoNome_For.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.close;
   fFornecedor.Free;
   dm.Qsql.close;
   Cod_For.Modified:=false;
   Nome_For.Modified:=false;

end;

procedure TfPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_F2: begin
               if butNovo.Enabled then
                  butNovoClick(self);
             end;
      vk_F3: begin
               if butAlterar.Enabled then
                  butAlterarClick(self);
             end;
      vk_F4: begin
               if butExcluir.Enabled then
                  butExcluirClick(self);
             end;
      vk_F5: begin
               if butNovoItem.Enabled then
                  butNovoItemClick(self);
             end;
      vk_F6: begin
               if butSalvar.Enabled then
                  butSalvarClick(self);
             end;
      vk_F7: begin
               if butCond.Enabled then
                  butCondClick(self);
             end;
      vk_F8: begin
               if butImprimir.Enabled then
                  butImprimirClick(self);
             end;
      vk_F9: begin
               if btnConfPedido.Enabled then
                  btnConfPedidoClick(self);
             end;
      vk_Escape: close;

   end;
end;

procedure TfPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfPedido.butSalvarClick(Sender: TObject);
var vTm: String[1];
begin
   with dm do
   begin
      if PodeSalvar = false then
         exit;
   end;

   if dsItens.DataSet.RecordCount = 0 then
    raise Exception.Create('Informe o Produto!');

   vTm:='I';
   if dsCad.DataSet.State = dsEdit then
   begin
      vTm:='A';
      dmRegra.Troca_Cliente_Venda;
   end;
   dm.Pedido.Post;
   dm.IniTrans;
   dm.SalvaTab(dm.Pedido);
   if vtm = 'A' then
      Altera_Carga;
   dm.SalvaTrans;
   Dados_Anterior;

   MostraSheet;
   butNovo.SetFocus;
end;

function TfPedido.PodeSalvar: boolean;
begin
   result:=true;
   if Data.Text = '' then
   begin
      mensagem('Informe a Data');
      MostraSheet;
      Data.SetFocus;
      result:=false;
      exit;
   end;
   if Cod_Cliente.Text = '' then
   begin
      mensagem('Informe o Cliente');
      MostraSheet;
      Cod_Cliente.SetFocus;
      result:=false;
      exit;
   end;
   if dmRegra.VerificaData(Data.Text) = false then
   begin
      data.SetFocus;
      result:=false;
      exit;
   end;
end;

procedure TfPedido.butNovoClick(Sender: TObject);
begin
   if dm.permite(vgUsuario,'I','PEDIDO') = false then
      exit;
   PesquisaPedido('0');
   dm.Pedido.Append;
   Dados_Anterior;
   
   MostraSheet;
   Data.SetFocus;
end;

procedure TfPedido.butNovoItemClick(Sender: TObject);
begin
   if dm.permite(vgUsuario,'I','PEDIDO') = false then
      exit;
   if PodeSalvar = false then
      exit;
   fItensPedido:=TfItensPedido.create(self);
   dm.ItensPedido.Append;
   fItensPedido.showModal;
   if fItensPedido.EditOk.Text = 'S' then
   begin
      Calculo;
      butCondClick(self);
   end;
   fItensPedido.free;

end;

procedure TfPedido.Calculo;
begin
   if dscad.DataSet.State in [dsedit,dsinsert] then
   begin
      dm.PedidoTOTAL_LIQUIDO.Value:=dm.ItensPedidoC_TOTAL.Value;
      dm.PedidoTOTAL_VENDA.Value:=dm.ItensPedidoSOMAR_VENDA.Value;
      dm.PedidoTOTAL_LUCRO.Value:=dm.ItensPedidoSOMAR_LUCRO.Value;
      dm.PedidoTOTAL_QTDE.Value:= dm.ItensPedidoSOMAR_QTDE.Value;
      dm.PedidoVALOR_LUCRO.Value:=dm.ItensPedidoSOMAR_VALORLUCRO.Value;
      CalculaComissao;
   end;
   dm.SalvaTab(dm.Pedido);
   dmRegra.Troca_Cliente_Venda;
   dm.SalvaTrans;
end;

procedure TfPedido.butCondClick(Sender: TObject);
begin
   fParcelas:=TfParcelas.create(Self);
   fParcelas.ValorPedido.Text:=formatfloat(',#0.00',dm.PedidoTOTAL_LIQUIDO.AsFloat);
   fParcelas.DataEmissao.Text:=Data.Text;
   fParcelas.Cod_Cliente.Text:=dm.PedidoCOD_CLIENTE.Text;
   fParcelas.editNumPedido.Text:=NumPedido.Text;
   fParcelas.editCarga.Text:='N';
   fParcelas.showModal;
   fParcelas.free;
{
   fTabela_Prazo:=TfTabela_Prazo.create(self);
   fTabela_Prazo.showModal;
   fTabela_Prazo.free;
}
end;

procedure TfPedido.butImprimirClick(Sender: TObject);
var
  lparam: TdmParametros;
  arq: string;
begin
  if chkPDF.Checked then
  begin
     lparam := TdmParametros.Create(nil);
     try
        arq := lparam.CaminhoAssinatura();
        arq := arq + '\PED-' + NumPedido.Text;
     finally
       FreeAndNil(lparam);
     end;
  end;


   frPedido:=TfrPedido.create(self);
   with frPedido do
   begin
      Ped.Close;
      Qped.Params[0].Text:=dm.PedidoNUM_PEDIDO.Text;
      ped.Open;

      if dm.PedidoIMP_LOGO.Text = 'S' then
         RelPed.Template.FileName:='Pedido.rtm'
      else
         RelPed.Template.FileName:='PedidoSLogo.rtm';
      RelPed.Template.LoadFromFile;

      if chkPDF.Checked then
      begin
        RelPed.AllowPrintToFile := True;
        RelPed.TextFileName := arq;
        RelPed.DeviceType := 'PDF';
      end
      else begin
        relped.AllowPrintToArchive := False;
        RelPed.TextFileName := '';
        RelPed.DeviceType := 'Screen';
      end;
      
      relPed.Print;
      Ped.Close;
   end;
   frPedido.free;
end;

procedure TfPedido.butAlterarClick(Sender: TObject);
begin
   if dscad.DataSet.State = dsInsert then
      exit;
   if dsItens.DataSet.IsEmpty then
      exit;
   if PodeSalvar = false then
      exit;
   fItensPedido:=TfItensPedido.create(self);
   fItensPedido.showModal;
   if fItensPedido.EditOk.Text = 'S' then
   begin
      Calculo;
      Altera_Carga;
   end;
   fItensPedido.free;

end;

procedure TfPedido.GradeDblClick(Sender: TObject);
begin
   butAlterarClick(self);
end;

procedure TfPedido.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
      butAlterarClick(self);
end;

procedure TfPedido.MostraSheet;
begin
   if not sheetPedido.Showing then
      sheetPedido.Show;
end;

procedure TfPedido.butConfigClick(Sender: TObject);
begin
   frPedido:=TfRPedido.create(Self);
   fRPedido.desRel.Show;
end;

procedure TfPedido.butExcluirClick(Sender: TObject);
begin
   if dm.permite(vgUsuario,'E','PEDIDO') = false then
      exit;
   if Confirma('Confirma Exclusão deste Pedido?','N')=idno then
      exit;
   try
      if dm.permite(vgUsuario,'E','PEDIDO') = false then
         Exit;
      if dmRegra.Excluir_Pedido(dm.PedidoNUM_PEDIDO.Text) = false then
         exit;
   except
      dm.Pedido.CancelUpdates;
      dm.CancelaTrans;
   end;
   dm.SalvaTrans;
   close;
end;

procedure TfPedido.DataExit(Sender: TObject);
begin
   if dmRegra.VerificaData(Data.Text) = false then
      data.SetFocus;
end;

procedure TfPedido.Nome_ContatoExit(Sender: TObject);
begin
   if Nome_Contato.Modified then
   begin
      dm.ModoEdicao(dsCad);
      dmRegra.PesquisaCliente(Nome_Contato.Text);
      dm.PedidoCOD_CONTATO.Text:=dm.ClienteCOD_CLIENTE.Text;
      Nome_Contato.Text:=dm.ClienteNOME.Text;
      dm.Cliente.Close;
      fCliente.Free;
      Nome_Contato.Modified:=false;
   end;
end;

procedure TfPedido.SpeedButton3Click(Sender: TObject);
begin
   if dmRegra.PesquisaCliente('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.PedidoCOD_CONTATO.Text:=dm.ClienteCOD_CLIENTE.text;
      Nome_Contato.Text:=dm.ClienteNOME.Text;
   end;
   dm.Cliente.Close;
   fCliente.Free;
end;

procedure TfPedido.DBMemo1Enter(Sender: TObject);
begin
   fPedido.KeyPreview:=false;
end;

procedure TfPedido.DBMemo1Exit(Sender: TObject);
begin
   fPedido.KeyPreview:=True;
end;

procedure TfPedido.Dados_Anterior;
begin
   if dsCad.DataSet.State = dsInsert then
   begin
      vu_Cliente:='';
      vu_Forn:='';
      vu_Contato:='';
      vu_valor:=0;
      vu_Qtde:=0;
      vu_Altera_Carga:='N';
      exit;
   end;
   vu_Cliente:=Cod_Cliente.Text;
   vu_Forn:=Cod_For.Text;
   vu_Contato:=Cod_Contato.Text;
   vu_Valor:=DM.PedidoVALOR_LUCRO.AsFloat;
   vu_Qtde:=dm.PedidoTOTAL_QTDE.AsFloat;
   vu_Altera_Carga:='S';
end;

procedure TfPedido.Altera_Carga;
begin
   dmRegra.QCarga.close;
   dmRegra.QCarga.Params[0].Text:=NumPedido.Text;
   dmRegra.QCarga.Open;
   while not dmRegra.QCarga.Eof do
   begin
      dm.Carga.Close;
      dm.Carga.Params[0].Text:=vgCod_Empresa;
      dm.Carga.Params[1].Text:=dmRegra.QCargaID_CARGA.Text;
      dm.Carga.Open;
      if not dm.Carga.IsEmpty then
      begin
        dm.Carga.Edit;
        if Cod_Cliente.Text <> vu_Cliente then
        begin
           dm.CargaCOD_CLIENTE.Text:=Cod_Cliente.Text;
           Executa('update CONTAS set COD_CLIENTE = '+Cod_Cliente.Text+' where NUM_PEDIDO = '+NumPedido.Text+' and TIPO_CONTA = 1');
           //dmRegra.Altera_Visto(Cod_Cliente.Text,Cod_Contato.Text);
        end;

        if Cod_For.Text <> vu_Forn then
           dm.CargaCOD_FOR.Text:=Cod_For.Text;

        //dm.CargaCOD_CONTATO.Text:=Cod_Contato.Text;
        //dmRegra.Altera_Visto(Cod_Cliente.Text,Cod_Contato.Text);
        dm.CargaVALOR_PEDIDO.AsFloat:=dm.PedidoTOTAL_LIQUIDO.AsFloat;

        if dm.PedidoTOTAL_QTDE.AsFloat <> vu_Qtde then
           dm.CargaQTDE_PEDIDO.AsFloat:=dm.PedidoTOTAL_QTDE.AsFloat;

        if DM.PedidoVALOR_LUCRO.AsFloat <> vu_Valor then
        begin
           dmRegra.Calcula_Lucro(NumPedido.Text,'T');
           Executa('update CONTAS set VALOR_PAGAR = '+CVal(dm.CargaVALOR_CARREGA.Text)+' where NUM_PEDIDO = '+dm.CargaID_CARGA.Text+' and TIPO_CONTA = 2');
        end;
        dm.Carga.Post;
        dm.SalvaTab(dm.Carga);
        dm.Carga.Close;
      end;
      dmRegra.QCarga.Next;
   end;
   //Executa('update CONTAS set COD_CLIENTE = '+Cod_Contato.Text+' where ID_PEDIDO = '+NumPedido.Text+' and TIPO_CONTA = 2');
   dmRegra.QCarga.Close;
end;

procedure TfPedido.btnConfPedidoClick(Sender: TObject);
begin
  fConfPedido := TfConfPedido.Create(Self);
  fConfPedido.NumPedido := dm.PedidoNUM_PEDIDO.AsInteger;
  fConfPedido.ShowModal;
  fConfPedido.Free;
end;

procedure TfPedido.PesquisaVendedor(Tipo: String);
begin
   
end;

procedure TfPedido.Nome_VendedorExit(Sender: TObject);
begin
   if Nome_Vendedor.Modified then
   begin
      dm.ModoEdicao(dsCad);
      dmRegra.PesquisaVendedor(Nome_Vendedor.Text);
      dm.PedidoCOD_VENDEDOR.Text:=dm.VendedorCOD_VENDEDOR.Text;
      dm.PedidoNOME_VENDEDOR.Text:=dm.VendedorNOME.Text;
//      dm.PedidoPERC_COMISSAO.AsFloat:=dm.VendedorPERC_COMISSAO.AsFloat;
      dm.Vendedor.Close;
      fVendedor.Free;
   end;
end;

procedure TfPedido.Nome_VendedorEnter(Sender: TObject);
begin
   Nome_Vendedor.Modified:=false;
end;

procedure TfPedido.Nome_ContatoEnter(Sender: TObject);
begin
   Nome_Contato.Modified:=false;
end;

procedure TfPedido.SpeedButton4Click(Sender: TObject);
begin
   if dmRegra.PesquisaVendedor('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.PedidoCOD_VENDEDOR.Text:=dm.VendedorCOD_VENDEDOR.text;
      dm.PedidoNOME_VENDEDOR.Text:=dm.VendedorNOME.Text;
//      dm.PedidoPERC_COMISSAO.AsFloat:=dm.VendedorPERC_COMISSAO.AsFloat;
   end;
   dm.Vendedor.Close;
   fVendedor.Free;
end;

procedure TfPedido.CalculaComissao;
begin
   dm.PedidoTOTAL_COMISSAO.AsFloat:=(arredonda(dm.PedidoTOTAL_QTDE.AsFloat,2) * arredonda(dm.PedidoVALOR_COMISSAO.AsFloat,2));
end;

procedure TfPedido.Cod_UsinaExit(Sender: TObject);
begin
  PesquisaUsina('C');
end;

procedure TfPedido.Nome_UsinaExit(Sender: TObject);
begin
  PesquisaUsina('D');
end;

procedure TfPedido.SpeedButton5Click(Sender: TObject);
begin
   fFornecedor:=TfFornecedor.create(Self);
   fFornecedor.TipoCad.Text:='P';
   if fFornecedor.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.PedidoCOD_USINA.Text:=dm.FornecedorCOD_FOR.Text;
      dm.PedidoNOME_USINA.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.close;
   fFornecedor.Free;
   dm.Qsql.close;
   Cod_For.Modified:=false;
   Nome_For.Modified:=false;
end;

procedure TfPedido.ValorComissaoExit(Sender: TObject);
begin
//   if ValorComissao.Modified then
//   begin
//    if DM.PedidoOBS.AsString = '' then
//      DM.PedidoOBS.AsString := 'COMISSÃO DE ' + DM.PedidoPERC_COMISSAO.AsString + '%';
//   end;
//
//   ValorComissao.Modified := False;
//      CalculaComissao;
end;

end.
