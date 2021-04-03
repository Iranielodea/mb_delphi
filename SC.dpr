program SC;

uses
  Forms,
  uMenuPrin in 'uMenuPrin.pas' {fMenuPrin},
  uDM in 'uDM.pas' {DM: TDataModule},
  UUtil in 'UUtil.pas',
  uBase in 'uBase.pas' {fBase},
  uEstado in 'uEstado.pas' {fEstado},
  uCidade in 'uCidade.pas' {fCidade},
  uForma_Pagto in 'uForma_Pagto.pas' {fForma_Pagto},
  uGrupo in 'uGrupo.pas' {fGrupo},
  uEmpresa in 'uEmpresa.pas' {fEmpresa},
  uProduto in 'uProduto.pas' {fProduto},
  uUnidade in 'uUnidade.pas' {fUnidade},
  uCadUsuario in 'uCadUsuario.pas' {fCadUsuario},
  uCliente in 'uCliente.pas' {fCliente},
  uContato_Cliente in 'uContato_Cliente.pas' {fContato_Cliente},
  uFornecedor in 'uFornecedor.pas' {fFornecedor},
  uCondicao in 'uCondicao.pas' {fCondicao},
  uItens_Condicao in 'uItens_Condicao.pas' {fItens_Condicao},
  uPermissao in 'uPermissao.pas' {fPermissao},
  uPesqPedido in 'uPesqPedido.pas' {fPesqPedido},
  uPedido in 'uPedido.pas' {fPedido},
  uItensPedido in 'uItensPedido.pas' {fItensPedido},
  uTabela_Prazo in 'uTabela_Prazo.pas' {fTabela_Prazo},
  uRPedido in 'uRPedido.pas' {fRPedido},
  USenha in 'USenha.pas' {fSenha},
  uTabCodigo in 'uTabCodigo.pas' {fTabCodigo},
  uParcelas in 'uParcelas.pas' {fParcelas},
  uBaixaConta in 'uBaixaConta.pas' {fBaixaConta},
  uExpurgo in 'uExpurgo.pas' {fExpurgo},
  uDMRegra in 'uDMRegra.pas' {dmRegra: TDataModule},
  uContasPagar in 'uContasPagar.pas' {fContasPagar},
  uAgenciador in 'uAgenciador.pas' {fAgenciador},
  uTransportador in 'uTransportador.pas' {fTransportador},
  uMotorista in 'uMotorista.pas' {fMotorista},
  uPesqCarga in 'uPesqCarga.pas' {fPesqCarga},
  uCarga in 'uCarga.pas' {fCarga},
  uRCarga in 'uRCarga.pas' {FRCarga},
  uITransporte in 'uITransporte.pas' {fITransporte},
  uRTransporte in 'uRTransporte.pas' {FRTransporte},
  uListaVenda in 'uListaVenda.pas' {fListaVenda},
  uObsLista in 'uObsLista.pas' {fListaObs},
  uContaBanco in 'uContaBanco.pas' {fContaBanco},
  UIPagar in 'UIPagar.pas' {fIPagar},
  uRContasPagar in 'uRContasPagar.pas' {fRContasPagar},
  uContas in 'uContas.pas' {fContas},
  uNovaConta in 'uNovaConta.pas' {fNovaConta},
  UIReceber in 'UIReceber.pas' {fIReceber},
  uRContas in 'uRContas.pas' {fRContas},
  uICarga in 'uICarga.pas' {fICarga},
  uRPedido1 in 'uRPedido1.pas' {FrPedido1},
  uIPedido in 'uIPedido.pas' {fIPedido},
  uRCarga1 in 'uRCarga1.pas' {fRCarga1},
  uICaixa in 'uICaixa.pas' {fICaixa},
  uUltPedido in 'uUltPedido.pas' {fUltPedido},
  uICliente in 'uICliente.pas' {fICliente},
  uRCliente in 'uRCliente.pas' {FRCliente},
  uExtratoBanco in 'uExtratoBanco.pas' {fExtratoBanco},
  uISemCompras in 'uISemCompras.pas' {fISemCompras},
  uIResumoBanco in 'uIResumoBanco.pas' {fIResumoBanco},
  uIGeral in 'uIGeral.pas' {fIGeral},
  UPesqDoc in 'UPesqDoc.pas' {fPesqDoc},
  uFicha in 'uFicha.pas' {fFicha},
  uItensFicha in 'uItensFicha.pas' {fItensFicha},
  uIEnvelope in 'uIEnvelope.pas' {fIEnvelope},
  uVendedor in 'uVendedor.pas' {fVendedor},
  uIMotorista in 'uIMotorista.pas' {fIMotorista},
  uRMotorista in 'uRMotorista.pas' {fRMotorista},
  uTerceiro in 'uTerceiro.pas' {fTerceiro},
  uTipoFornecedor in 'uTipoFornecedor.pas' {fTipoFornecedor},
  uIComissao in 'uIComissao.pas' {fIComissao},
  uRComissao in 'uRComissao.pas' {frComissao},
  uConfPedido in 'uConfPedido.pas' {fConfPedido},
  uClassConfPedido in 'uClassConfPedido.pas',
  uFRConfPedido in 'uFRConfPedido.pas' {FRConfPedido},
  udmTransportadora in 'udmTransportadora.pas' {dmTransportadora: TDataModule},
  udmMotorista in 'udmMotorista.pas' {dmMotorista: TDataModule},
  udmCliente in 'udmCliente.pas' {dmCliente: TDataModule},
  udmFornecedor in 'udmFornecedor.pas' {dmFornecedor: TDataModule},
  udmPessoaCredito in 'udmPessoaCredito.pas' {dmPessoaCredito: TDataModule},
  uVersao in 'uVersao.pas',
  udmParametros in 'udmParametros.pas' {dmParametros: TDataModule},
  ufrmParametros in 'ufrmParametros.pas' {frmParametros},
  ufrmExecutarComando in 'ufrmExecutarComando.pas' {frmExecutarComando},
  Vcl.Themes,
  Vcl.Styles,
  uDMCarga in 'uDMCarga.pas' {dmCarga: TDataModule},
  uDMUnidade in 'uDMUnidade.pas' {dmUnidade: TDataModule},
  uUnidadeTexto in 'uUnidadeTexto.pas' {FUnidadeTexto},
  ufrmImpressaoAutorizacao in 'ufrmImpressaoAutorizacao.pas' {frmImpressaoAutorizacao},
  uDMEntrega in 'uDMEntrega.pas' {DMEndereco: TDataModule},
  UEndereco in 'UEndereco.pas' {frmEndereco},
  UImpressaoCarga in 'UImpressaoCarga.pas' {fImpressaoCarga},
  uCargaTeste in 'uCargaTeste.pas' {frmCargaTeste},
  uCargaII in 'uCargaII.pas' {fCargaII},
  uClassContaBanco in 'uClassContaBanco.pas',
  uDMCargaVencto in 'uDMCargaVencto.pas' {dmCargaVencto: TDataModule},
  uFinanceiro in 'uFinanceiro.pas',
  uExtratoCredito in 'uExtratoCredito.pas' {frmExtratoCredito},
  udmPedido in 'udmPedido.pas' {dmPedido: TDataModule},
  uDMContaBanco in 'uDMContaBanco.pas' {dmContaBanco: TDataModule},
  uDMContas in 'uDMContas.pas' {dmContas: TDataModule},
  uContaBancoModel in 'Entidades\uContaBancoModel.pas',
  uRepositorioContaBanco in 'Repositorios\uRepositorioContaBanco.pas',
  uServicoContaBanco in 'Servicos\uServicoContaBanco.pas',
  uContaModel in 'Entidades\uContaModel.pas',
  uFuncoesJSON in 'uFuncoesJSON.pas',
  uServicoConta in 'Servicos\uServicoConta.pas',
  uRepositorioConta in 'Repositorios\uRepositorioConta.pas',
  uCargaModel in 'Entidades\uCargaModel.pas',
  uRepositorioCarga in 'Repositorios\uRepositorioCarga.pas',
  uServicoCarga in 'Servicos\uServicoCarga.pas',
  uExportarWEB in 'uExportarWEB.pas' {fExportarWEB};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfSenha, fSenha);
  Application.CreateForm(TfMenuPrin, fMenuPrin);
  Application.CreateForm(TdmRegra, dmRegra);
  Application.Run;
end.
