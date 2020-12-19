unit uMenuPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Buttons, ToolWin, uCargaTeste, uCargaII, uDMRegra;

type
  TfMenuPrin = class(TForm)
    MainMenu1: TMainMenu;
    M_Cadastro: TMenuItem;
    Clientes: TMenuItem;
    Fonecedores: TMenuItem;
    Cadastros_Gerais: TMenuItem;
    Estados: TMenuItem;
    Cidades: TMenuItem;
    N1: TMenuItem;
    Forma_Pagto: TMenuItem;
    Grupo: TMenuItem;
    Unidade: TMenuItem;
    Produtos: TMenuItem;
    M_Configuracao: TMenuItem;
    Empresa1: TMenuItem;
    Usuario: TMenuItem;
    Permissao: TMenuItem;
    Condicao_Pagto: TMenuItem;
    Emissao_Pedido: TMenuItem;
    ToolBar1: TToolBar;
    butSair: TSpeedButton;
    butFornecedor: TSpeedButton;
    butCliente: TSpeedButton;
    butProduto: TSpeedButton;
    butPedido: TSpeedButton;
    Regua: TStatusBar;
    Tab_Codigo: TMenuItem;
    Expurgos: TMenuItem;
    Contas_Receber: TMenuItem;
    ransportadoras: TMenuItem;
    Motoristas: TMenuItem;
    Cargas: TMenuItem;
    butCarga: TSpeedButton;
    Relatorios: TMenuItem;
    Cadastros1: TMenuItem;
    Transportes: TMenuItem;
    Lista_de_Venda: TMenuItem;
    butListaVenda: TSpeedButton;
    N2: TMenuItem;
    Conta_Banco: TMenuItem;
    Financeiro1: TMenuItem;
    Relatrios1: TMenuItem;
    ContasaPagar1: TMenuItem;
    RelatriosdeContasaPagar1: TMenuItem;
    Faturamento1: TMenuItem;
    RelatriosdePedidos1: TMenuItem;
    RelatriosdeCargas1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Caixa1: TMenuItem;
    Clientes1: TMenuItem;
    ExtratoBancos1: TMenuItem;
    ClientessemCompras1: TMenuItem;
    ExtratoBancos2: TMenuItem;
    ResumoBancos1: TMenuItem;
    RelatriosGerais1: TMenuItem;
    N5: TMenuItem;
    Envelopes1: TMenuItem;
    Vendedor1: TMenuItem;
    Motoristas1: TMenuItem;
    Terceiros: TMenuItem;
    TipoFornecedor1: TMenuItem;
    N6: TMenuItem;
    RelatriodeComisses1: TMenuItem;
    Parametros: TMenuItem;
    ExecutarComandos: TMenuItem;
    extosdeUnidades1: TMenuItem;
    este1: TMenuItem;
    procedure EstadosClick(Sender: TObject);
    procedure CidadesClick(Sender: TObject);
    procedure Forma_PagtoClick(Sender: TObject);
    procedure GrupoClick(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure ProdutosClick(Sender: TObject);
    procedure UnidadeClick(Sender: TObject);
    procedure UsuarioClick(Sender: TObject);
    procedure ClientesClick(Sender: TObject);
    procedure FonecedoresClick(Sender: TObject);
    procedure Condicao_PagtoClick(Sender: TObject);
    procedure PermissaoClick(Sender: TObject);
    procedure Emissao_PedidoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Tab_CodigoClick(Sender: TObject);
    procedure ExpurgosClick(Sender: TObject);
    procedure Contas_ReceberClick(Sender: TObject);
    procedure AgenciadoresClick(Sender: TObject);
    procedure ransportadorasClick(Sender: TObject);
    procedure MotoristasClick(Sender: TObject);
    procedure CargasClick(Sender: TObject);
    procedure TransportesClick(Sender: TObject);
    procedure Lista_de_VendaClick(Sender: TObject);
    procedure Conta_BancoClick(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure RelatriosdeContasaPagar1Click(Sender: TObject);
    procedure RelatriosdePedidos1Click(Sender: TObject);
    procedure RelatriosdeCargas1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure ClientessemCompras1Click(Sender: TObject);
    procedure ExtratoBancos2Click(Sender: TObject);
    procedure ResumoBancos1Click(Sender: TObject);
    procedure RelatriosGerais1Click(Sender: TObject);
    procedure Envelopes1Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure Motoristas1Click(Sender: TObject);
    procedure RelatriodeComisses1Click(Sender: TObject);
    procedure TerceirosClick(Sender: TObject);
    procedure TipoFornecedor1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ParametrosClick(Sender: TObject);
    procedure ExecutarComandosClick(Sender: TObject);
    procedure extosdeUnidades1Click(Sender: TObject);
    procedure este1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarWEB;
  public
    { Public declarations }
  end;

var
  fMenuPrin: TfMenuPrin;

implementation

uses uEstado, uCidade, uForma_Pagto, uGrupo, uEmpresa, uProduto, uUnidade,
  uCadUsuario, uCliente, uFornecedor, uCondicao, uPermissao, uDM,
  uPesqPedido, uTabCodigo, uExpurgo, uContas, uAgenciador, uTransportador,
  uMotorista, uPesqCarga, uITransporte, uListaVenda, uContaBanco, UUtil,
  UIReceber, uContasPagar, UIPagar, uIPedido, uICarga, uICaixa, uICliente,
  uExtratoBanco, uISemCompras, uIResumoBanco, uIGeral, uIEnvelope,
  uVendedor, uIMotorista, uTerceiro, uTipoFornecedor, uIComissao,
  ufrmParametros, ufrmExecutarComando, uUnidadeTexto;

{$R *.dfm}

procedure TfMenuPrin.EstadosClick(Sender: TObject);
begin
   if application.FindComponent('fEstado') = nil then
      fEstado:=TfEstado.create(application);
   fEstado.TipoCad.Text:='C';
   fEstado.show;
end;

procedure TfMenuPrin.este1Click(Sender: TObject);
var
  F: TfrmCargaTeste;
begin
  F := TfrmCargaTeste.Create(Self);
  F.ShowModal;
  F.Free;
end;

procedure TfMenuPrin.CidadesClick(Sender: TObject);
begin
   if application.FindComponent('fCidade') = nil then
      fCidade:=TfCidade.create(application);
   fCidade.TipoCad.Text:='C';
   fCidade.show;
end;

procedure TfMenuPrin.Forma_PagtoClick(Sender: TObject);
begin
   if application.FindComponent('fForma_Pagto') = nil then
      fForma_Pagto:=TfForma_Pagto.create(application);
   fForma_Pagto.TipoCad.Text:='C';
   fForma_Pagto.show;
end;

procedure TfMenuPrin.GrupoClick(Sender: TObject);
begin
   if application.FindComponent('fGrupo') = nil then
      fGrupo:=TfGrupo.create(application);
   fGrupo.TipoCad.Text:='C';
   fGrupo.show;
end;

procedure TfMenuPrin.Empresa1Click(Sender: TObject);
begin
   if application.FindComponent('fEmpresa') = nil then
      fEmpresa:=TfEmpresa.create(application);
   fEmpresa.TipoCad.Text:='C';
   fEmpresa.show;
end;

procedure TfMenuPrin.ProdutosClick(Sender: TObject);
begin
   if application.FindComponent('fProduto') = nil then
      fProduto:=TfProduto.create(application);
   fProduto.TipoCad.Text:='C';
   fProduto.show;
end;

procedure TfMenuPrin.UnidadeClick(Sender: TObject);
begin
   if application.FindComponent('fUnidade') = nil then
      fUnidade:=TfUnidade.create(application);
   fUnidade.TipoCad.Text:='C';
   fUnidade.show;
end;

procedure TfMenuPrin.UsuarioClick(Sender: TObject);
begin
   if application.FindComponent('fCadUsuario') = nil then
      fCadUsuario:=TfCadUsuario.create(application);
   fCadUsuario.TipoCad.Text:='C';
   fCadUsuario.show;
end;

procedure TfMenuPrin.ClientesClick(Sender: TObject);
begin
   if application.FindComponent('fCliente') = nil then
      fCliente:=TfCliente.create(application);
   fCliente.TipoCad.Text:='C';
   fCliente.show;
end;

procedure TfMenuPrin.FonecedoresClick(Sender: TObject);
begin
   if application.FindComponent('fFornecedor') = nil then
      fFornecedor:=TfFornecedor.create(application);
   fFornecedor.TipoCad.Text:='C';
   fFornecedor.show;
end;

procedure TfMenuPrin.Condicao_PagtoClick(Sender: TObject);
begin
   if application.FindComponent('fCondicao') = nil then
      fCondicao:=TfCondicao.create(application);
   fCondicao.TipoCad.Text:='C';
   fCondicao.show;
end;

procedure TfMenuPrin.ParametrosClick(Sender: TObject);
begin
   if application.FindComponent('frmParametros') = nil then
      frmParametros:=TfrmParametros.create(application);
   frmParametros.show;
end;

procedure TfMenuPrin.PermissaoClick(Sender: TObject);
begin
   if application.FindComponent('fPermissao') = nil then
      fPermissao:=TfPermissao.create(application);
   fPermissao.show;
end;

procedure TfMenuPrin.Emissao_PedidoClick(Sender: TObject);
begin
   fPesqPedido:=TfPesqPedido.create(self);
   fpesqPedido.showModal;
   fpesqPedido.Pedido.Close;
   fPesqPedido.free;
end;

procedure TfMenuPrin.FormActivate(Sender: TObject);
begin
   fMenuprin.Width:=screen.WorkAreaWidth;
   if fMenuprin.Top <> 0 then
   begin
      fMenuprin.Top:=0;
      fmenuprin.Left:=0;
   end;
end;

procedure TfMenuPrin.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfMenuPrin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if confirma('Deseja sair do sistema?','S') = idyes then
      application.Terminate
   else
      action:=canone;
end;

procedure TfMenuPrin.FormShow(Sender: TObject);
begin
  Parametros.Visible := (vgUsuario = 'SUPERVISOR');


end;

procedure TfMenuPrin.Tab_CodigoClick(Sender: TObject);
begin
   if application.FindComponent('fTabCodigo') = nil then
      fTabCodigo:=TfTabCodigo.create(application);
   fTabCodigo.show;
end;

procedure TfMenuPrin.ExecutarComandosClick(Sender: TObject);
begin
    frmExecutarComando := TfrmExecutarComando.Create(Self);
    frmExecutarComando.ShowModal;
    frmExecutarComando.free;
end;

procedure TfMenuPrin.ExportarWEB;
begin
  dmRegra.ExportarClienteWEB;
  dmRegra.ExportarTransportadorWEB;
  dmRegra.ExportarPedidoWEB;
end;

procedure TfMenuPrin.ExpurgosClick(Sender: TObject);
begin
   fExpurgo:=TfExpurgo.create(Self);
   fExpurgo.showModal;
   fExpurgo.free;
end;

procedure TfMenuPrin.extosdeUnidades1Click(Sender: TObject);
begin
   if application.FindComponent('fUnidadeTexto') = nil then
      fUnidadeTexto:=TfUnidadeTexto.create(application);
   fUnidadeTexto.show;
end;

procedure TfMenuPrin.Contas_ReceberClick(Sender: TObject);
begin
   if application.FindComponent('fContas') = nil then
      fContas:=TfContas.create(application);
   fContas.show;
end;

procedure TfMenuPrin.AgenciadoresClick(Sender: TObject);
begin
{
   if application.FindComponent('fAgenciador') = nil then
      fAgenciador:=TfAgenciador.create(application);
   fAgenciador.show;
}
end;

procedure TfMenuPrin.ransportadorasClick(Sender: TObject);
begin
   if application.FindComponent('fTransportador') = nil then
      fTransportador:=TfTransportador.create(application);
   fTransportador.show;
end;

procedure TfMenuPrin.MotoristasClick(Sender: TObject);
begin
   if application.FindComponent('fMotorista') = nil then
      fMotorista:=TfMotorista.create(application);
   fMotorista.show;
end;

procedure TfMenuPrin.CargasClick(Sender: TObject);
begin
  if UpperCase(vgUsuario) = 'MARCOS' then
  begin
    ShowMessage('Clique no Botão Lista de Venda');
    Exit;
  end;
  fPesqCarga:=TfPesqCarga.create(self);
  fpesqCarga.showModal;
  fPesqCarga.free;
end;

procedure TfMenuPrin.TransportesClick(Sender: TObject);
begin
   if application.FindComponent('fITransporte') = nil then
      fITransporte:=TfITransporte.create(application);
   fITransporte.show;
end;

procedure TfMenuPrin.Lista_de_VendaClick(Sender: TObject);
begin
 if application.FindComponent('fListaVenda') = nil then
    fListaVenda:=TfListaVenda.create(application);
 fListaVenda.show;
end;

procedure TfMenuPrin.Conta_BancoClick(Sender: TObject);
begin
   if application.FindComponent('fContaBanco') = nil then
      fContaBanco:=TfContaBanco.create(application);
   fContaBanco.show;
end;

procedure TfMenuPrin.Relatrios1Click(Sender: TObject);
begin
   if application.FindComponent('fIReceber') = nil then
      fIReceber:=TfIReceber.create(application);
   fIReceber.show;
end;

procedure TfMenuPrin.ContasaPagar1Click(Sender: TObject);
begin
   if application.FindComponent('fContasPagar') = nil then
      fContasPagar:=TfContasPagar.create(application);
   fContasPagar.show;
end;

procedure TfMenuPrin.RelatriosdeContasaPagar1Click(Sender: TObject);
begin
   if application.FindComponent('fIPagar') = nil then
      fIPagar:=TfIPagar.create(application);
   fIPagar.show;
end;

procedure TfMenuPrin.RelatriosdePedidos1Click(Sender: TObject);
begin
   if application.FindComponent('fIPedido') = nil then
      fIPedido:=TfIPedido.create(application);
   fIPedido.show;
end;

procedure TfMenuPrin.RelatriosdeCargas1Click(Sender: TObject);
begin
   if application.FindComponent('fICarga') = nil then
      fICarga:=TfICarga.create(application);
   fICarga.show;
end;

procedure TfMenuPrin.Caixa1Click(Sender: TObject);
begin
   if application.FindComponent('fICaixa') = nil then
      fICaixa:=TfICaixa.create(application);
   fICaixa.show;
end;

procedure TfMenuPrin.Clientes1Click(Sender: TObject);
begin
   if application.FindComponent('fICliente') = nil then
      fICliente:=TfICliente.create(application);
   fICliente.show;
end;

procedure TfMenuPrin.ClientessemCompras1Click(Sender: TObject);
begin
   if application.FindComponent('fISemCompras') = nil then
      fISemCompras:=TfISemCompras.create(application);
   fISemCompras.show;
end;

procedure TfMenuPrin.ExtratoBancos2Click(Sender: TObject);
begin
   if application.FindComponent('fExtratoBanco') = nil then
      fExtratoBanco:=TfExtratoBanco.create(application);
   fExtratoBanco.show;
end;

procedure TfMenuPrin.ResumoBancos1Click(Sender: TObject);
begin
   if application.FindComponent('fIResumoBanco') = nil then
      fIResumoBanco:=TfIResumoBanco.create(application);
   fIResumoBanco.show;
end;

procedure TfMenuPrin.RelatriosGerais1Click(Sender: TObject);
begin
   if application.FindComponent('fIGeral') = nil then
      fIGeral:=TfIGeral.create(application);
   fIGeral.show;
end;

procedure TfMenuPrin.Envelopes1Click(Sender: TObject);
begin
   if application.FindComponent('fIEnvelope') = nil then
      fIEnvelope:=TfIEnvelope.create(application);
   fIEnvelope.show;
end;

procedure TfMenuPrin.Vendedor1Click(Sender: TObject);
begin
   if application.FindComponent('fVendedor') = nil then
      fVendedor:=TfVendedor.create(application);
   fVendedor.TipoCad.Text:='C';
   fVendedor.show;
end;

procedure TfMenuPrin.Motoristas1Click(Sender: TObject);
begin
   if application.FindComponent('fIMotorista') = nil then
      fIMotorista:=TfIMotorista.create(application);
   fIMotorista.show;

end;

procedure TfMenuPrin.RelatriodeComisses1Click(Sender: TObject);
begin
   if application.FindComponent('fIComissao') = nil then
      fiComissao:=TfiComissao.create(application);
   fiComissao.show;
end;

procedure TfMenuPrin.TerceirosClick(Sender: TObject);
begin
   if application.FindComponent('fTerceiro') = nil then
      fTerceiro:=TfTerceiro.create(application);
   fTerceiro.TipoCad.Text:='C';
   fTerceiro.show;
end;

procedure TfMenuPrin.TipoFornecedor1Click(Sender: TObject);
begin
   if application.FindComponent('fTipoFornecedor') = nil then
      fTipoFornecedor:=TfTipoFornecedor.create(application);
   fTipoFornecedor.TipoCad.Text:='C';
   fTipoFornecedor.show;
end;

end.
