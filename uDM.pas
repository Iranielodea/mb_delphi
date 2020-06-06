unit uDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, FMTBcd, DBClient, Provider, Dialogs,
  MidasLib, Forms, ExtCtrls, WideStrings, DBXFirebird, IniFiles;

type
  TDM = class(TDataModule)
    dtEstado: TSQLDataSet;
    dtEstadoCOD_EMPRESA: TIntegerField;
    dtEstadoDESC_ESTADO: TStringField;
    dtEstadoICMS: TFloatField;
    dtEstadoID_ESTADO: TIntegerField;
    dtEstadoSIGLA: TStringField;
    dtEstadoUSU_ALT: TStringField;
    dtEstadoUSU_INC: TStringField;
    dspEstado: TDataSetProvider;
    Estado: TClientDataSet;
    EstadoID_ESTADO: TIntegerField;
    EstadoCOD_EMPRESA: TIntegerField;
    EstadoDESC_ESTADO: TStringField;
    EstadoICMS: TFloatField;
    EstadoSIGLA: TStringField;
    EstadoUSU_ALT: TStringField;
    EstadoUSU_INC: TStringField;
    Qsql: TSQLQuery;
    dtCidade: TSQLDataSet;
    Cidade: TClientDataSet;
    dspCidade: TDataSetProvider;
    dtCidadeCEP: TStringField;
    dtCidadeCOD_CIDADE: TIntegerField;
    dtCidadeCOD_EMPRESA: TIntegerField;
    dtCidadeDESC_CIDADE: TStringField;
    dtCidadeID_ESTADO: TIntegerField;
    dtCidadeUSU_ALT: TStringField;
    dtCidadeUSU_INC: TStringField;
    dtCidadeDESC_ESTADO: TStringField;
    CidadeCOD_CIDADE: TIntegerField;
    CidadeCEP: TStringField;
    CidadeCOD_EMPRESA: TIntegerField;
    CidadeDESC_CIDADE: TStringField;
    CidadeID_ESTADO: TIntegerField;
    CidadeUSU_ALT: TStringField;
    CidadeUSU_INC: TStringField;
    CidadeDESC_ESTADO: TStringField;
    dtCliente: TSQLDataSet;
    dtEmpresa: TSQLDataSet;
    dtCad_Usuario: TSQLDataSet;
    dtPermissao: TSQLDataSet;
    dtFornecedor: TSQLDataSet;
    dtContato: TSQLDataSet;
    dtCondicao: TSQLDataSet;
    dtItens_Condicao: TSQLDataSet;
    dtForma_Pagto: TSQLDataSet;
    dtGrupo: TSQLDataSet;
    dtUnidade: TSQLDataSet;
    dtProduto: TSQLDataSet;
    dtPedido: TSQLDataSet;
    dtTabela_Prazo: TSQLDataSet;
    dtItensPedido: TSQLDataSet;
    dtContas: TSQLDataSet;
    dspForma_Pagto: TDataSetProvider;
    Forma_Pagto: TClientDataSet;
    dtForma_PagtoCOD_EMPRESA: TIntegerField;
    dtForma_PagtoCOD_PAGTO: TIntegerField;
    dtForma_PagtoDESC_PAGTO: TStringField;
    dtForma_PagtoSIGLA: TStringField;
    dtForma_PagtoUSU_ALT: TStringField;
    dtForma_PagtoUSU_INC: TStringField;
    Forma_PagtoCOD_PAGTO: TIntegerField;
    Forma_PagtoCOD_EMPRESA: TIntegerField;
    Forma_PagtoDESC_PAGTO: TStringField;
    Forma_PagtoSIGLA: TStringField;
    Forma_PagtoUSU_ALT: TStringField;
    Forma_PagtoUSU_INC: TStringField;
    dspGrupo: TDataSetProvider;
    Grupo: TClientDataSet;
    dtGrupoCOD_EMPRESA: TIntegerField;
    dtGrupoCOD_GRUPO: TIntegerField;
    dtGrupoDESC_GRUPO: TStringField;
    dtGrupoUSU_ALT: TStringField;
    dtGrupoUSU_INC: TStringField;
    GrupoCOD_GRUPO: TIntegerField;
    GrupoCOD_EMPRESA: TIntegerField;
    GrupoDESC_GRUPO: TStringField;
    GrupoUSU_ALT: TStringField;
    GrupoUSU_INC: TStringField;
    dspUnidade: TDataSetProvider;
    Unidade: TClientDataSet;
    dtUnidadeCOD_EMPRESA: TIntegerField;
    dtUnidadeDESC_UNIDADE: TStringField;
    dtUnidadeID_UNIDADE: TIntegerField;
    dtUnidadeSIGLA: TStringField;
    dtUnidadeUSU_ALT: TStringField;
    dtUnidadeUSU_INC: TStringField;
    UnidadeID_UNIDADE: TIntegerField;
    UnidadeCOD_EMPRESA: TIntegerField;
    UnidadeDESC_UNIDADE: TStringField;
    UnidadeSIGLA: TStringField;
    UnidadeUSU_ALT: TStringField;
    UnidadeUSU_INC: TStringField;
    dspEmpresa: TDataSetProvider;
    Empresa: TClientDataSet;
    dtEmpresaBAIRRO: TStringField;
    dtEmpresaCEP: TStringField;
    dtEmpresaCNPJ: TStringField;
    dtEmpresaCOD_EMPRESA: TIntegerField;
    dtEmpresaDESC_CIDADE: TStringField;
    dtEmpresaEMAIL: TStringField;
    dtEmpresaENDERECO: TStringField;
    dtEmpresaESTADO: TStringField;
    dtEmpresaFAX: TStringField;
    dtEmpresaFONE: TStringField;
    dtEmpresaINSC_ESTADUAL: TStringField;
    dtEmpresaNOME: TStringField;
    dtEmpresaNUMERO: TStringField;
    dtEmpresaUSU_ALT: TStringField;
    dtEmpresaUSU_INC: TStringField;
    EmpresaCOD_EMPRESA: TIntegerField;
    EmpresaBAIRRO: TStringField;
    EmpresaCEP: TStringField;
    EmpresaCNPJ: TStringField;
    EmpresaDESC_CIDADE: TStringField;
    EmpresaEMAIL: TStringField;
    EmpresaENDERECO: TStringField;
    EmpresaESTADO: TStringField;
    EmpresaFAX: TStringField;
    EmpresaFONE: TStringField;
    EmpresaINSC_ESTADUAL: TStringField;
    EmpresaNOME: TStringField;
    EmpresaNUMERO: TStringField;
    EmpresaUSU_ALT: TStringField;
    EmpresaUSU_INC: TStringField;
    dspProduto: TDataSetProvider;
    Produto: TClientDataSet;
    dtProdutoCOD_EMPRESA: TIntegerField;
    dtProdutoCOD_GRUPO: TIntegerField;
    dtProdutoCOD_PRODUTO: TIntegerField;
    dtProdutoDESC_PRODUTO: TStringField;
    dtProdutoID_UNIDADE: TIntegerField;
    dtProdutoREFERENCIA: TStringField;
    dtProdutoUSU_ALT: TStringField;
    dtProdutoUSU_INC: TStringField;
    dtProdutoVALOR_VENDA: TFloatField;
    dtProdutoDESC_GRUPO: TStringField;
    ProdutoCOD_PRODUTO: TIntegerField;
    ProdutoCOD_EMPRESA: TIntegerField;
    ProdutoCOD_GRUPO: TIntegerField;
    ProdutoDESC_PRODUTO: TStringField;
    ProdutoID_UNIDADE: TIntegerField;
    ProdutoREFERENCIA: TStringField;
    ProdutoUSU_ALT: TStringField;
    ProdutoUSU_INC: TStringField;
    ProdutoVALOR_VENDA: TFloatField;
    ProdutoDESC_GRUPO: TStringField;
    dtProdutoSIGLA: TStringField;
    ProdutoSIGLA: TStringField;
    dtCad_UsuarioCOD_EMPRESA: TIntegerField;
    dtCad_UsuarioGERENTE: TStringField;
    dtCad_UsuarioNOME: TStringField;
    dtCad_UsuarioSENHA: TStringField;
    dtCad_UsuarioUSU_ALT: TStringField;
    dtCad_UsuarioUSU_INC: TStringField;
    dspCad_Usuario: TDataSetProvider;
    Cad_Usuario: TClientDataSet;
    Cad_UsuarioNOME: TStringField;
    Cad_UsuarioCOD_EMPRESA: TIntegerField;
    Cad_UsuarioGERENTE: TStringField;
    Cad_UsuarioSENHA: TStringField;
    Cad_UsuarioUSU_ALT: TStringField;
    Cad_UsuarioUSU_INC: TStringField;
    dtCad_UsuarioID_USUARIO: TIntegerField;
    Cad_UsuarioID_USUARIO: TIntegerField;
    dspCliente: TDataSetProvider;
    Cliente: TClientDataSet;
    dtClienteBAIRRO: TStringField;
    dtClienteCEP: TStringField;
    dtClienteCNPJ: TStringField;
    dtClienteCOD_CIDADE: TIntegerField;
    dtClienteCOD_CLIENTE: TIntegerField;
    dtClienteCOD_CONDICAO: TIntegerField;
    dtClienteCOD_EMPRESA: TIntegerField;
    dtClienteCOD_PAGTO: TIntegerField;
    dtClienteCOMPLEMENTO: TStringField;
    dtClienteCPF: TStringField;
    dtClienteENDERECO: TStringField;
    dtClienteFANTASIA: TStringField;
    dtClienteFAX: TStringField;
    dtClienteFONE: TStringField;
    dtClienteINSC_ESTADUAL: TStringField;
    dtClienteNOME: TStringField;
    dtClienteNUMERO: TStringField;
    dtClienteOBS: TStringField;
    dtClienteRG: TStringField;
    dtClienteTIPO_PESSOA: TStringField;
    dtClienteUSU_ALT: TStringField;
    dtClienteUSU_INC: TStringField;
    dtClienteDESC_PAGTO: TStringField;
    dtClienteDESC_CONDICAO: TStringField;
    dtClienteDESC_CIDADE: TStringField;
    dtClienteCEP_CIDADE: TStringField;
    dtClienteSIGLA: TStringField;
    ClienteCOD_CLIENTE: TIntegerField;
    ClienteBAIRRO: TStringField;
    ClienteCEP: TStringField;
    ClienteCNPJ: TStringField;
    ClienteCOD_CIDADE: TIntegerField;
    ClienteCOD_CONDICAO: TIntegerField;
    ClienteCOD_EMPRESA: TIntegerField;
    ClienteCOD_PAGTO: TIntegerField;
    ClienteCOMPLEMENTO: TStringField;
    ClienteCPF: TStringField;
    ClienteENDERECO: TStringField;
    ClienteFANTASIA: TStringField;
    ClienteFAX: TStringField;
    ClienteFONE: TStringField;
    ClienteINSC_ESTADUAL: TStringField;
    ClienteNOME: TStringField;
    ClienteNUMERO: TStringField;
    ClienteOBS: TStringField;
    ClienteRG: TStringField;
    ClienteTIPO_PESSOA: TStringField;
    ClienteUSU_ALT: TStringField;
    ClienteUSU_INC: TStringField;
    ClienteDESC_PAGTO: TStringField;
    ClienteDESC_CONDICAO: TStringField;
    ClienteDESC_CIDADE: TStringField;
    ClienteCEP_CIDADE: TStringField;
    ClienteSIGLA: TStringField;
    dtCidadeSIGLA: TStringField;
    CidadeSIGLA: TStringField;
    dtClienteDATA_CADASTRO: TSQLTimeStampField;
    ClienteDATA_CADASTRO: TSQLTimeStampField;
    dspContato: TDataSetProvider;
    Contato: TClientDataSet;
    ContatoC_ITEM: TAggregateField;
    dtContatoCODIGO: TIntegerField;
    dtContatoCOD_EMPRESA: TIntegerField;
    dtContatoCONTATO: TStringField;
    dtContatoEMAIL: TStringField;
    dtContatoFAX: TStringField;
    dtContatoFONE: TStringField;
    dtContatoSEQ: TIntegerField;
    dtContatoTIPO: TStringField;
    dtContatoUSU_ALT: TStringField;
    dtContatoUSU_INC: TStringField;
    ContatoCODIGO: TIntegerField;
    ContatoSEQ: TIntegerField;
    ContatoTIPO: TStringField;
    ContatoCOD_EMPRESA: TIntegerField;
    ContatoCONTATO: TStringField;
    ContatoEMAIL: TStringField;
    ContatoFAX: TStringField;
    ContatoFONE: TStringField;
    ContatoUSU_ALT: TStringField;
    ContatoUSU_INC: TStringField;
    dtFornecedorBAIRRO: TStringField;
    dtFornecedorCEP: TStringField;
    dtFornecedorCNPJ: TStringField;
    dtFornecedorCOD_CIDADE: TIntegerField;
    dtFornecedorCOD_EMPRESA: TIntegerField;
    dtFornecedorCOD_FOR: TIntegerField;
    dtFornecedorCOMPLEMENTO: TStringField;
    dtFornecedorEMAIL: TStringField;
    dtFornecedorENDERECO: TStringField;
    dtFornecedorFANTASIA: TStringField;
    dtFornecedorFAX: TStringField;
    dtFornecedorFONE: TStringField;
    dtFornecedorINSC_ESTADUAL: TStringField;
    dtFornecedorNOME: TStringField;
    dtFornecedorNUMERO: TStringField;
    dtFornecedorOBS: TStringField;
    dtFornecedorUSU_ALT: TStringField;
    dtFornecedorUSU_INC: TStringField;
    dtFornecedorDESC_CIDADE: TStringField;
    dtFornecedorSIGLA: TStringField;
    Fornecedor: TClientDataSet;
    dspFornecedor: TDataSetProvider;
    FornecedorCOD_FOR: TIntegerField;
    FornecedorBAIRRO: TStringField;
    FornecedorCEP: TStringField;
    FornecedorCNPJ: TStringField;
    FornecedorCOD_CIDADE: TIntegerField;
    FornecedorCOD_EMPRESA: TIntegerField;
    FornecedorCOMPLEMENTO: TStringField;
    FornecedorEMAIL: TStringField;
    FornecedorENDERECO: TStringField;
    FornecedorFANTASIA: TStringField;
    FornecedorFAX: TStringField;
    FornecedorFONE: TStringField;
    FornecedorINSC_ESTADUAL: TStringField;
    FornecedorNOME: TStringField;
    FornecedorNUMERO: TStringField;
    FornecedorOBS: TStringField;
    FornecedorUSU_ALT: TStringField;
    FornecedorUSU_INC: TStringField;
    FornecedorDESC_CIDADE: TStringField;
    FornecedorSIGLA: TStringField;
    dtCondicaoCOD_CONDICAO: TIntegerField;
    dtCondicaoCOD_EMPRESA: TIntegerField;
    dtCondicaoDESC_CONDICAO: TStringField;
    dtCondicaoUSU_ALT: TStringField;
    dtCondicaoUSU_INC: TStringField;
    dspCondicao: TDataSetProvider;
    Condicao: TClientDataSet;
    CondicaoCOD_CONDICAO: TIntegerField;
    CondicaoCOD_EMPRESA: TIntegerField;
    CondicaoDESC_CONDICAO: TStringField;
    CondicaoUSU_ALT: TStringField;
    CondicaoUSU_INC: TStringField;
    dspItens_Condicao: TDataSetProvider;
    Itens_Condicao: TClientDataSet;
    dtItens_CondicaoCOD_CONDICAO: TIntegerField;
    dtItens_CondicaoCOD_EMPRESA: TIntegerField;
    dtItens_CondicaoDIAS: TIntegerField;
    dtItens_CondicaoSEQ: TIntegerField;
    dtItens_CondicaoSEQUENCIA: TStringField;
    dtItens_CondicaoUSU_ALT: TStringField;
    dtItens_CondicaoUSU_INC: TStringField;
    Itens_CondicaoCOD_CONDICAO: TIntegerField;
    Itens_CondicaoSEQ: TIntegerField;
    Itens_CondicaoCOD_EMPRESA: TIntegerField;
    Itens_CondicaoDIAS: TIntegerField;
    Itens_CondicaoSEQUENCIA: TStringField;
    Itens_CondicaoUSU_ALT: TStringField;
    Itens_CondicaoUSU_INC: TStringField;
    Itens_CondicaoC_TOTITENS: TAggregateField;
    dtPermissaoALT: TStringField;
    dtPermissaoCOD_EMPRESA: TIntegerField;
    dtPermissaoCON: TStringField;
    dtPermissaoEXC: TStringField;
    dtPermissaoID_PER: TIntegerField;
    dtPermissaoINC: TStringField;
    dtPermissaoNOME: TStringField;
    dtPermissaoTABELA: TStringField;
    dtPermissaoUSU_ALT: TStringField;
    dtPermissaoUSU_INC: TStringField;
    dspPermissao: TDataSetProvider;
    Permissao: TClientDataSet;
    PermissaoID_PER: TIntegerField;
    PermissaoCOD_EMPRESA: TIntegerField;
    PermissaoTABELA: TStringField;
    PermissaoALT: TStringField;
    PermissaoCON: TStringField;
    PermissaoEXC: TStringField;
    PermissaoINC: TStringField;
    PermissaoNOME: TStringField;
    PermissaoUSU_ALT: TStringField;
    PermissaoUSU_INC: TStringField;
    dspPedido: TDataSetProvider;
    Pedido: TClientDataSet;
    dtPedidoCOD_CLIENTE: TIntegerField;
    dtPedidoCOD_EMPRESA: TIntegerField;
    dtPedidoCOD_FOR: TIntegerField;
    dtPedidoDATA: TSQLTimeStampField;
    dtPedidoNUM_PEDIDO: TIntegerField;
    dtPedidoPERC_DESCONTO: TFloatField;
    dtPedidoSITUACAO: TStringField;
    dtPedidoTOTAL_BRUTO: TFloatField;
    dtPedidoTOTAL_LIQUIDO: TFloatField;
    dtPedidoUSU_ALT: TStringField;
    dtPedidoUSU_INC: TStringField;
    dtPedidoVALOR_DESCONTO: TFloatField;
    dtPedidoNOME: TStringField;
    PedidoNUM_PEDIDO: TIntegerField;
    PedidoCOD_CLIENTE: TIntegerField;
    PedidoCOD_EMPRESA: TIntegerField;
    PedidoCOD_FOR: TIntegerField;
    PedidoDATA: TSQLTimeStampField;
    PedidoPERC_DESCONTO: TFloatField;
    PedidoSITUACAO: TStringField;
    PedidoTOTAL_BRUTO: TFloatField;
    PedidoTOTAL_LIQUIDO: TFloatField;
    PedidoUSU_ALT: TStringField;
    PedidoUSU_INC: TStringField;
    PedidoVALOR_DESCONTO: TFloatField;
    PedidoNOME: TStringField;
    ItensPedido: TClientDataSet;
    dspItensPedido: TDataSetProvider;
    dtItensPedidoCOD_PRODUTO: TIntegerField;
    dtItensPedidoID_UNIDADE: TIntegerField;
    dtItensPedidoNUM_PEDIDO: TIntegerField;
    dtItensPedidoQTDE: TFloatField;
    dtItensPedidoSEQ: TIntegerField;
    dtItensPedidoUSU_ALT: TStringField;
    dtItensPedidoUSU_INC: TStringField;
    dtItensPedidoVALOR: TFloatField;
    dtItensPedidoVALOR_TOTAL: TFloatField;
    dtItensPedidoDESC_PRODUTO: TStringField;
    dtItensPedidoSIGLA: TStringField;
    ItensPedidoNUM_PEDIDO: TIntegerField;
    ItensPedidoSEQ: TIntegerField;
    ItensPedidoCOD_PRODUTO: TIntegerField;
    ItensPedidoID_UNIDADE: TIntegerField;
    ItensPedidoQTDE: TFloatField;
    ItensPedidoUSU_ALT: TStringField;
    ItensPedidoUSU_INC: TStringField;
    ItensPedidoVALOR: TFloatField;
    ItensPedidoVALOR_TOTAL: TFloatField;
    ItensPedidoDESC_PRODUTO: TStringField;
    ItensPedidoSIGLA: TStringField;
    ItensPedidoC_SEQ: TAggregateField;
    dtItensPedidoCOD_EMPRESA: TIntegerField;
    ItensPedidoCOD_EMPRESA: TIntegerField;
    dtPedidoNOME_FOR: TStringField;
    PedidoNOME_FOR: TStringField;
    ItensPedidoC_TOTAL: TAggregateField;
    dspTabela_Prazo: TDataSetProvider;
    Tabela_Prazo: TClientDataSet;
    dtTabela_PrazoCOD_CONDICAO: TIntegerField;
    dtTabela_PrazoCOD_PAGTO: TIntegerField;
    dtTabela_PrazoNUM_PEDIDO: TIntegerField;
    dtTabela_PrazoSEQ: TIntegerField;
    dtTabela_PrazoUSU_ALT: TStringField;
    dtTabela_PrazoUSU_INC: TStringField;
    dtTabela_PrazoDESC_PAGTO: TStringField;
    Tabela_PrazoNUM_PEDIDO: TIntegerField;
    Tabela_PrazoSEQ: TIntegerField;
    Tabela_PrazoCOD_CONDICAO: TIntegerField;
    Tabela_PrazoCOD_PAGTO: TIntegerField;
    Tabela_PrazoUSU_ALT: TStringField;
    Tabela_PrazoUSU_INC: TStringField;
    Tabela_PrazoDESC_PAGTO: TStringField;
    dtTabela_PrazoSEQUENCIA: TStringField;
    dtTabela_PrazoDIAS: TIntegerField;
    Tabela_PrazoSEQUENCIA: TStringField;
    Tabela_PrazoDIAS: TIntegerField;
    dtPedidoOBS: TStringField;
    PedidoOBS: TStringField;
    dtContasCOD_CLIENTE: TIntegerField;
    dtContasCOD_CONDICAO: TIntegerField;
    dtContasCOD_EMPRESA: TIntegerField;
    dtContasCOD_FOR: TIntegerField;
    dtContasCOD_PAGTO: TIntegerField;
    dtContasDATA_EMISSAO: TSQLTimeStampField;
    dtContasDATA_PAGO: TSQLTimeStampField;
    dtContasDATA_VENCTO: TSQLTimeStampField;
    dtContasDIAS: TIntegerField;
    dtContasDOCUMENTO: TStringField;
    dtContasID_CONTA: TIntegerField;
    dtContasNUM_PEDIDO: TIntegerField;
    dtContasSEQ_CONTA: TIntegerField;
    dtContasSITUACAO: TStringField;
    dtContasTIPO_CONTA: TIntegerField;
    dtContasUSU_ALT: TStringField;
    dtContasUSU_INC: TStringField;
    dtContasVALOR_ORIGINAL: TFloatField;
    dtContasVALOR_PAGAR: TFloatField;
    dtContasVALOR_PAGO: TFloatField;
    dspContas: TDataSetProvider;
    Contas: TClientDataSet;
    ContasID_CONTA: TIntegerField;
    ContasNUM_PEDIDO: TIntegerField;
    ContasCOD_CLIENTE: TIntegerField;
    ContasCOD_CONDICAO: TIntegerField;
    ContasCOD_EMPRESA: TIntegerField;
    ContasCOD_FOR: TIntegerField;
    ContasCOD_PAGTO: TIntegerField;
    ContasDATA_EMISSAO: TSQLTimeStampField;
    ContasDATA_PAGO: TSQLTimeStampField;
    ContasDATA_VENCTO: TSQLTimeStampField;
    ContasDIAS: TIntegerField;
    ContasDOCUMENTO: TStringField;
    ContasSEQ_CONTA: TIntegerField;
    ContasSITUACAO: TStringField;
    ContasTIPO_CONTA: TIntegerField;
    ContasUSU_ALT: TStringField;
    ContasUSU_INC: TStringField;
    ContasVALOR_ORIGINAL: TFloatField;
    ContasVALOR_PAGAR: TFloatField;
    ContasVALOR_PAGO: TFloatField;
    ContasC_VALORTOTAL: TAggregateField;
    ContasC_NUMPARCELA: TAggregateField;
    dtMotorista: TSQLDataSet;
    dspMotorista: TDataSetProvider;
    Motorista: TClientDataSet;
    MotoristaCOD_MOTORISTA: TIntegerField;
    MotoristaBAIRRO: TStringField;
    MotoristaCEP: TStringField;
    MotoristaCOD_CIDADE: TIntegerField;
    MotoristaCOD_EMPRESA: TIntegerField;
    MotoristaCOD_TRANS: TIntegerField;
    MotoristaENDERECO: TStringField;
    MotoristaFONE1: TStringField;
    MotoristaFONE2: TStringField;
    MotoristaNOME: TStringField;
    MotoristaOBS: TStringField;
    MotoristaUSU_ALT: TStringField;
    MotoristaUSU_INC: TStringField;
    MotoristaDESC_CIDADE: TStringField;
    MotoristaSIGLA: TStringField;
    dtTransportador: TSQLDataSet;
    dspTransportador: TDataSetProvider;
    Transportador: TClientDataSet;
    dtTransportadorBAIRRO: TStringField;
    dtTransportadorCEP: TStringField;
    dtTransportadorCNPJ: TStringField;
    dtTransportadorCOD_AGENCIA: TIntegerField;
    dtTransportadorCOD_CIDADE: TIntegerField;
    dtTransportadorCOD_EMPRESA: TIntegerField;
    dtTransportadorCOD_TRANS: TIntegerField;
    dtTransportadorCONTATO: TStringField;
    dtTransportadorDDD: TStringField;
    dtTransportadorDESTAQUE: TStringField;
    dtTransportadorENDERECO: TStringField;
    dtTransportadorFONE1: TStringField;
    dtTransportadorFONE2: TStringField;
    dtTransportadorINSC_ESTADUAL: TStringField;
    dtTransportadorNOME: TStringField;
    dtTransportadorOBS: TStringField;
    dtTransportadorUSU_ALT: TStringField;
    dtTransportadorUSU_INC: TStringField;
    dtTransportadorDESC_CIDADE: TStringField;
    dtTransportadorSIGLA: TStringField;
    TransportadorCOD_TRANS: TIntegerField;
    TransportadorBAIRRO: TStringField;
    TransportadorCEP: TStringField;
    TransportadorCNPJ: TStringField;
    TransportadorCOD_AGENCIA: TIntegerField;
    TransportadorCOD_CIDADE: TIntegerField;
    TransportadorCOD_EMPRESA: TIntegerField;
    TransportadorCONTATO: TStringField;
    TransportadorDDD: TStringField;
    TransportadorDESTAQUE: TStringField;
    TransportadorENDERECO: TStringField;
    TransportadorFONE1: TStringField;
    TransportadorFONE2: TStringField;
    TransportadorINSC_ESTADUAL: TStringField;
    TransportadorNOME: TStringField;
    TransportadorOBS: TStringField;
    TransportadorUSU_ALT: TStringField;
    TransportadorUSU_INC: TStringField;
    TransportadorDESC_CIDADE: TStringField;
    TransportadorSIGLA: TStringField;
    dtAgenciador: TSQLDataSet;
    dspAgenciador: TDataSetProvider;
    Agenciador: TClientDataSet;
    dtAgenciadorAGENCIA: TStringField;
    dtAgenciadorBAIRRO: TStringField;
    dtAgenciadorCEP: TStringField;
    dtAgenciadorCNPJ: TStringField;
    dtAgenciadorCOD_AGENCIA: TIntegerField;
    dtAgenciadorCOD_CIDADE: TIntegerField;
    dtAgenciadorCOD_EMPRESA: TIntegerField;
    dtAgenciadorCONTA_BANCO: TStringField;
    dtAgenciadorEMAIL: TStringField;
    dtAgenciadorENDERECO: TStringField;
    dtAgenciadorFONE1: TStringField;
    dtAgenciadorFONE2: TStringField;
    dtAgenciadorINSC_ESTADUAL: TStringField;
    dtAgenciadorNOME: TStringField;
    dtAgenciadorNOME_BANCO: TStringField;
    dtAgenciadorOBS: TStringField;
    dtAgenciadorPERC_COMISSAO: TFloatField;
    dtAgenciadorUSU_ALT: TStringField;
    dtAgenciadorUSU_INC: TStringField;
    dtAgenciadorDESC_CIDADE: TStringField;
    dtAgenciadorSIGLA: TStringField;
    AgenciadorCOD_AGENCIA: TIntegerField;
    AgenciadorAGENCIA: TStringField;
    AgenciadorBAIRRO: TStringField;
    AgenciadorCEP: TStringField;
    AgenciadorCNPJ: TStringField;
    AgenciadorCOD_CIDADE: TIntegerField;
    AgenciadorCOD_EMPRESA: TIntegerField;
    AgenciadorCONTA_BANCO: TStringField;
    AgenciadorEMAIL: TStringField;
    AgenciadorENDERECO: TStringField;
    AgenciadorFONE1: TStringField;
    AgenciadorFONE2: TStringField;
    AgenciadorINSC_ESTADUAL: TStringField;
    AgenciadorNOME: TStringField;
    AgenciadorNOME_BANCO: TStringField;
    AgenciadorOBS: TStringField;
    AgenciadorPERC_COMISSAO: TFloatField;
    AgenciadorUSU_ALT: TStringField;
    AgenciadorUSU_INC: TStringField;
    AgenciadorDESC_CIDADE: TStringField;
    AgenciadorSIGLA: TStringField;
    dtTransportadorNOME_AGENCIADOR: TStringField;
    TransportadorNOME_AGENCIADOR: TStringField;
    MotoristaNOME_TRANS: TStringField;
    Qcidade: TSQLDataSet;
    QcidadeCEP: TStringField;
    QcidadeDESC_CIDADE: TStringField;
    QcidadeSIGLA: TStringField;
    dtItensPedidoPRECO_VENDA: TFloatField;
    dtItensPedidoVALOR_LUCRO: TFloatField;
    ItensPedidoPRECO_VENDA: TFloatField;
    ItensPedidoVALOR_LUCRO: TFloatField;
    dtPedidoCOD_CONTATO: TIntegerField;
    dtPedidoENCERRADO: TStringField;
    dtPedidoPERC_COMISSAO: TFloatField;
    dtPedidoTOTAL_LUCRO: TFloatField;
    dtPedidoTOTAL_VENDA: TFloatField;
    PedidoCOD_CONTATO: TIntegerField;
    PedidoENCERRADO: TStringField;
    PedidoPERC_COMISSAO: TFloatField;
    PedidoTOTAL_LUCRO: TFloatField;
    PedidoTOTAL_VENDA: TFloatField;
    ItensPedidoSOMAR_VENDA: TAggregateField;
    ItensPedidoSOMAR_LUCRO: TAggregateField;
    dtItensPedidoTOTAL_LUCRO: TFloatField;
    ItensPedidoTOTAL_LUCRO: TFloatField;
    QCliente: TSQLDataSet;
    QClienteBAIRRO: TStringField;
    QClienteCEP: TStringField;
    QClienteCNPJ: TStringField;
    QClienteCOMPLEMENTO: TStringField;
    QClienteCPF: TStringField;
    QClienteDATA_CADASTRO: TSQLTimeStampField;
    QClienteENDERECO: TStringField;
    QClienteFANTASIA: TStringField;
    QClienteFAX: TStringField;
    QClienteFONE: TStringField;
    QClienteINSC_ESTADUAL: TStringField;
    QClienteNOME: TStringField;
    QClienteNUMERO: TStringField;
    QClienteOBS: TStringField;
    QClienteRG: TStringField;
    QClienteTIPO_PESSOA: TStringField;
    dtItensPedidoTOTAL_VENDA: TFloatField;
    ItensPedidoTOTAL_VENDA: TFloatField;
    dtPedidoTOTAL_QTDE: TFloatField;
    PedidoTOTAL_QTDE: TFloatField;
    ItensPedidoSOMAR_QTDE: TAggregateField;
    dtCarga: TSQLDataSet;
    dspCarga: TDataSetProvider;
    Carga: TClientDataSet;
    CargaID_CARGA: TIntegerField;
    CargaCOD_AGENCIA: TIntegerField;
    CargaCOD_CLIENTE: TIntegerField;
    CargaCOD_CONTATO: TIntegerField;
    CargaCOD_EMPRESA: TIntegerField;
    CargaCOD_FOR: TIntegerField;
    CargaCOD_MOTORISTA: TIntegerField;
    CargaDATA: TSQLTimeStampField;
    CargaLETRA: TStringField;
    CargaNUM_CARGA: TIntegerField;
    CargaNUM_PEDIDO: TIntegerField;
    CargaQTDE: TFloatField;
    CargaUSU_ALT: TStringField;
    CargaUSU_INC: TStringField;
    CargaVALOR_CARREGA: TFloatField;
    CargaVALOR_FRETE: TFloatField;
    CargaVALOR_PEDIDO: TFloatField;
    CargaVISTO: TStringField;
    CargaNOME_CLIENTE: TStringField;
    CargaNOME_CONTATO: TStringField;
    CargaNOME_FORNECEDOR: TStringField;
    CargaNOME_MOTORISTA: TStringField;
    dtPedidoNUM_CARGA: TIntegerField;
    PedidoNUM_CARGA: TIntegerField;
    CargaQTDE_PEDIDO: TFloatField;
    dtPedidoVALOR_LUCRO: TFloatField;
    PedidoVALOR_LUCRO: TFloatField;
    ItensPedidoSOMAR_VALORLUCRO: TAggregateField;
    CargaPLACA: TStringField;
    CargaOBS: TStringField;
    dtTransportadorFAX: TStringField;
    TransportadorFAX: TStringField;
    CargaSITUACAO: TStringField;
    MotoristaPLACA: TStringField;
    CargaFINANCEIRO: TStringField;
    CargaCONTATO_INDICACAO: TStringField;
    dtContasID_CONTABANCO: TIntegerField;
    ContasID_CONTABANCO: TIntegerField;
    dtContaBanco: TSQLDataSet;
    dspContaBanco: TDataSetProvider;
    ContaBanco: TClientDataSet;
    dtContaBancoAGENCIA: TStringField;
    dtContaBancoCOD_EMPRESA: TIntegerField;
    dtContaBancoID_CONTABANCO: TIntegerField;
    dtContaBancoNUM_CONTA: TStringField;
    ContaBancoID_CONTABANCO: TIntegerField;
    ContaBancoAGENCIA: TStringField;
    ContaBancoCOD_EMPRESA: TIntegerField;
    ContaBancoNUM_CONTA: TStringField;
    dtContaBancoBANCO: TStringField;
    ContaBancoBANCO: TStringField;
    CargaARMAZEM: TStringField;
    CargaSALDO: TFloatField;
    dtCad_Obs: TSQLDataSet;
    dtCad_ObsCODEMPRESA: TIntegerField;
    dtCad_ObsCODIGO: TIntegerField;
    dtCad_ObsNUM_LINHA: TIntegerField;
    dtCad_ObsTEXTO: TStringField;
    dtCad_ObsTIPO: TStringField;
    dsCad_Obs: TDataSetProvider;
    Cad_Obs: TClientDataSet;
    Cad_ObsCODIGO: TIntegerField;
    Cad_ObsTIPO: TStringField;
    Cad_ObsNUM_LINHA: TIntegerField;
    Cad_ObsCODEMPRESA: TIntegerField;
    Cad_ObsTEXTO: TStringField;
    CargaCOMPLEMENTO: TStringField;
    dtObs_Conta: TSQLDataSet;
    dtObs_ContaCOD_EMPRESA: TIntegerField;
    dtObs_ContaID_CONTA: TIntegerField;
    dtObs_ContaID_OBS: TIntegerField;
    dtObs_ContaTEXTO: TStringField;
    dspObs_Conta: TDataSetProvider;
    ObsConta: TClientDataSet;
    ObsContaID_OBS: TIntegerField;
    ObsContaCOD_EMPRESA: TIntegerField;
    ObsContaID_CONTA: TIntegerField;
    ObsContaTEXTO: TStringField;
    dtClienteEMAIL: TStringField;
    ClienteEMAIL: TStringField;
    QClienteEMAIL: TStringField;
    dtContasID_PEDIDO: TIntegerField;
    ContasID_PEDIDO: TIntegerField;
    dtPedidoIMP_LOGO: TStringField;
    PedidoIMP_LOGO: TStringField;
    dtClienteDATA_ABERTURA: TSQLTimeStampField;
    dtClienteCOMPRADOR: TStringField;
    dtClienteNUM_FUNC: TIntegerField;
    dtClienteNOME_ANTERIOR: TStringField;
    dtClienteEND_PAGAMENTO: TStringField;
    dtClienteEND_ENTREGA: TStringField;
    dtClientePREDIO_PROPRIO: TStringField;
    dtClienteVALOR_ALUGUEL: TFloatField;
    dtClienteSEGMENTO: TStringField;
    dtClienteCATEGORIA: TStringField;
    dtClienteCLASSIFICACAO: TStringField;
    dtClienteQTDE_COMPRA_SEMANA: TFloatField;
    dtClienteDIAS_APRAZO: TIntegerField;
    dtClienteVALOR_PEDIDO: TFloatField;
    dtClienteFICHA_CADASTRAL: TStringField;
    dtClienteCARTAO_CADASTRAL: TStringField;
    dtClienteCONTRATO_SOCIAL: TStringField;
    dtClienteDOC_PROPRIETARIO: TStringField;
    dtClienteTIPO_FICHA: TStringField;
    ClienteDATA_ABERTURA: TSQLTimeStampField;
    ClienteCOMPRADOR: TStringField;
    ClienteNUM_FUNC: TIntegerField;
    ClienteNOME_ANTERIOR: TStringField;
    ClienteEND_PAGAMENTO: TStringField;
    ClienteEND_ENTREGA: TStringField;
    ClientePREDIO_PROPRIO: TStringField;
    ClienteVALOR_ALUGUEL: TFloatField;
    ClienteSEGMENTO: TStringField;
    ClienteCATEGORIA: TStringField;
    ClienteCLASSIFICACAO: TStringField;
    ClienteQTDE_COMPRA_SEMANA: TFloatField;
    ClienteDIAS_APRAZO: TIntegerField;
    ClienteVALOR_PEDIDO: TFloatField;
    ClienteFICHA_CADASTRAL: TStringField;
    ClienteCARTAO_CADASTRAL: TStringField;
    ClienteCONTRATO_SOCIAL: TStringField;
    ClienteDOC_PROPRIETARIO: TStringField;
    ClienteTIPO_FICHA: TStringField;
    dtClienteCONSUMO_MENSAL: TFloatField;
    ClienteCONSUMO_MENSAL: TFloatField;
    dtDiretor: TSQLDataSet;
    dtDiretorCOD_CLIENTE: TIntegerField;
    dtDiretorCOD_EMPRESA: TIntegerField;
    dtDiretorCPF: TStringField;
    dtDiretorDATANASC: TSQLTimeStampField;
    dtDiretorENDERECO: TStringField;
    dtDiretorFONE: TStringField;
    dtDiretorID_DIRETOR: TIntegerField;
    dtDiretorNOME: TStringField;
    dtRefBanco: TSQLDataSet;
    dtRefComercio: TSQLDataSet;
    dtRefBancoCOD_CLIENTE: TIntegerField;
    dtRefBancoCOD_EMPRESA: TIntegerField;
    dtRefBancoFONE: TStringField;
    dtRefBancoID_BANCO: TIntegerField;
    dtRefBancoNOME_AGENCIA: TStringField;
    dtRefBancoNOME_BANCO: TStringField;
    dtRefBancoNUMERO: TStringField;
    dtRefBancoNUM_CONTA: TStringField;
    dtRefBancoTIPO_PESSOA: TStringField;
    dtRefComercioCNPJ: TStringField;
    dtRefComercioCOD_CLIENTE: TIntegerField;
    dtRefComercioCOD_EMPRESA: TIntegerField;
    dtRefComercioFONE: TStringField;
    dtRefComercioID_COMERCIO: TIntegerField;
    dtRefComercioNOME_FORNECEDOR: TStringField;
    dspDiretor: TDataSetProvider;
    dspRefBanco: TDataSetProvider;
    dspRefComercio: TDataSetProvider;
    Diretor: TClientDataSet;
    RefBanco: TClientDataSet;
    RefComercio: TClientDataSet;
    DiretorID_DIRETOR: TIntegerField;
    DiretorCOD_CLIENTE: TIntegerField;
    DiretorCOD_EMPRESA: TIntegerField;
    DiretorCPF: TStringField;
    DiretorDATANASC: TSQLTimeStampField;
    DiretorENDERECO: TStringField;
    DiretorFONE: TStringField;
    DiretorNOME: TStringField;
    RefBancoID_BANCO: TIntegerField;
    RefBancoCOD_CLIENTE: TIntegerField;
    RefBancoCOD_EMPRESA: TIntegerField;
    RefBancoFONE: TStringField;
    RefBancoNOME_AGENCIA: TStringField;
    RefBancoNOME_BANCO: TStringField;
    RefBancoNUMERO: TStringField;
    RefBancoNUM_CONTA: TStringField;
    RefBancoTIPO_PESSOA: TStringField;
    RefComercioID_COMERCIO: TIntegerField;
    RefComercioCNPJ: TStringField;
    RefComercioCOD_CLIENTE: TIntegerField;
    RefComercioCOD_EMPRESA: TIntegerField;
    RefComercioFONE: TStringField;
    RefComercioNOME_FORNECEDOR: TStringField;
    dtClienteMARCAR: TStringField;
    ClienteMARCAR: TStringField;
    dtVendedor: TSQLDataSet;
    dtVendedorCOD_EMPRESA: TIntegerField;
    dtVendedorCOD_VENDEDOR: TIntegerField;
    dtVendedorNOME: TStringField;
    dtVendedorPERC_COMISSAO: TFloatField;
    dtVendedorUSU_ALT: TStringField;
    dtVendedorUSU_INC: TStringField;
    dspVendedor: TDataSetProvider;
    Vendedor: TClientDataSet;
    VendedorCOD_VENDEDOR: TIntegerField;
    VendedorCOD_EMPRESA: TIntegerField;
    VendedorNOME: TStringField;
    VendedorPERC_COMISSAO: TFloatField;
    VendedorUSU_ALT: TStringField;
    VendedorUSU_INC: TStringField;
    dtPedidoCOD_VENDEDOR: TIntegerField;
    dtPedidoNOME_VENDEDOR: TStringField;
    PedidoCOD_VENDEDOR: TIntegerField;
    PedidoNOME_VENDEDOR: TStringField;
    dtPedidoTOTAL_COMISSAO: TFloatField;
    dtPedidoVALOR_COMISSAO: TFloatField;
    PedidoTOTAL_COMISSAO: TFloatField;
    PedidoVALOR_COMISSAO: TFloatField;
    MotoristaESTADO_CPF: TStringField;
    MotoristaPLACA_REBOQUE1: TStringField;
    MotoristaPLACA_REBOQUE2: TStringField;
    MotoristaCPF: TStringField;
    dtTransportadorDATANASC: TDateField;
    TransportadorDATANASC: TDateField;
    dtContatoDATANASC: TDateField;
    ContatoDATANASC: TDateField;
    MotoristaDATANASC: TDateField;
    CargaUNIDADE: TStringField;
    CargaCOMPLUNIDADE: TStringField;
    dtFornecedorNUM_BANCO: TStringField;
    dtFornecedorNOME_BANCO: TStringField;
    dtFornecedorNUM_AGENCIA: TStringField;
    dtFornecedorNUM_CONTA: TStringField;
    dtFornecedorNOME_TITULAR: TStringField;
    dtFornecedorCPF: TStringField;
    dtFornecedorNOME_DESPOSITANTE: TStringField;
    FornecedorNUM_BANCO: TStringField;
    FornecedorNOME_BANCO: TStringField;
    FornecedorNUM_AGENCIA: TStringField;
    FornecedorNUM_CONTA: TStringField;
    FornecedorNOME_TITULAR: TStringField;
    FornecedorCPF: TStringField;
    FornecedorNOME_DESPOSITANTE: TStringField;
    dtTransportadorNUM_BANCO: TStringField;
    dtTransportadorNOME_BANCO: TStringField;
    dtTransportadorNUM_AGENCIA: TStringField;
    dtTransportadorNUM_CONTA: TStringField;
    dtTransportadorNOME_TITULAR: TStringField;
    dtTransportadorCPF: TStringField;
    dtTransportadorNOME_DESPOSITANTE: TStringField;
    TransportadorNUM_BANCO: TStringField;
    TransportadorNOME_BANCO: TStringField;
    TransportadorNUM_AGENCIA: TStringField;
    TransportadorNUM_CONTA: TStringField;
    TransportadorNOME_TITULAR: TStringField;
    TransportadorCPF: TStringField;
    TransportadorNOME_DESPOSITANTE: TStringField;
    MotoristaPLACA_REBOQUE3: TStringField;
    MotoristaTONELAGEM: TFloatField;
    dtTerceiro: TSQLDataSet;
    dtTerceiroBAIRRO: TStringField;
    dtTerceiroCEP: TStringField;
    dtTerceiroCNPJ: TStringField;
    dtTerceiroCOD_CIDADE: TIntegerField;
    dtTerceiroCOD_EMPRESA: TIntegerField;
    dtTerceiroCOD_TERCEIRO: TIntegerField;
    dtTerceiroCOMPLEMENTO: TStringField;
    dtTerceiroCPF: TStringField;
    dtTerceiroDATA_ABERTURA: TSQLTimeStampField;
    dtTerceiroDATA_CADASTRO: TSQLTimeStampField;
    dtTerceiroEMAIL: TStringField;
    dtTerceiroENDERECO: TStringField;
    dtTerceiroFANTASIA: TStringField;
    dtTerceiroFAX: TStringField;
    dtTerceiroFONE: TStringField;
    dtTerceiroINSC_ESTADUAL: TStringField;
    dtTerceiroMARCAR: TStringField;
    dtTerceiroNOME: TStringField;
    dtTerceiroNUMERO: TStringField;
    dtTerceiroOBS: TStringField;
    dtTerceiroRG: TStringField;
    dtTerceiroTIPO_PESSOA: TStringField;
    dtTerceiroUSU_ALT: TStringField;
    dtTerceiroUSU_INC: TStringField;
    dspTerceiro: TDataSetProvider;
    Terceiro: TClientDataSet;
    TerceiroCOD_EMPRESA: TIntegerField;
    TerceiroCOD_TERCEIRO: TIntegerField;
    TerceiroBAIRRO: TStringField;
    TerceiroCEP: TStringField;
    TerceiroCNPJ: TStringField;
    TerceiroCOD_CIDADE: TIntegerField;
    TerceiroCOMPLEMENTO: TStringField;
    TerceiroCPF: TStringField;
    TerceiroDATA_ABERTURA: TSQLTimeStampField;
    TerceiroDATA_CADASTRO: TSQLTimeStampField;
    TerceiroEMAIL: TStringField;
    TerceiroENDERECO: TStringField;
    TerceiroFANTASIA: TStringField;
    TerceiroFAX: TStringField;
    TerceiroFONE: TStringField;
    TerceiroINSC_ESTADUAL: TStringField;
    TerceiroMARCAR: TStringField;
    TerceiroNOME: TStringField;
    TerceiroNUMERO: TStringField;
    TerceiroOBS: TStringField;
    TerceiroRG: TStringField;
    TerceiroTIPO_PESSOA: TStringField;
    TerceiroUSU_ALT: TStringField;
    TerceiroUSU_INC: TStringField;
    dtTerceiroDESC_CIDADE: TStringField;
    dtTerceiroCEP_CIDADE: TStringField;
    dtTerceiroSIGLA: TStringField;
    TerceiroDESC_CIDADE: TStringField;
    TerceiroCEP_CIDADE: TStringField;
    TerceiroSIGLA: TStringField;
    dtFornecedorMARCAR: TStringField;
    FornecedorMARCAR: TStringField;
    dtTipoFornecedor: TSQLDataSet;
    dtTipoFornecedorCOD_EMPRESA: TIntegerField;
    dtTipoFornecedorDESC_TIPO: TStringField;
    dtTipoFornecedorID_TIPO: TIntegerField;
    dtTipoFornecedorSIGLA: TStringField;
    dtTipoFornecedorUSU_ALT: TStringField;
    dtTipoFornecedorUSU_INC: TStringField;
    dspTipoFornecedor: TDataSetProvider;
    TipoFornecedor: TClientDataSet;
    TipoFornecedorID_TIPO: TIntegerField;
    TipoFornecedorCOD_EMPRESA: TIntegerField;
    TipoFornecedorDESC_TIPO: TStringField;
    TipoFornecedorSIGLA: TStringField;
    TipoFornecedorUSU_ALT: TStringField;
    TipoFornecedorUSU_INC: TStringField;
    CargaOBS2: TStringField;
    dtFornecedorID_TIPO_EMPRESA: TIntegerField;
    dtFornecedorDESC_TIPO: TStringField;
    FornecedorID_TIPO_EMPRESA: TIntegerField;
    FornecedorDESC_TIPO: TStringField;
    dtEmpresaVERSAO: TStringField;
    EmpresaVERSAO: TStringField;
    dtTransportadorEMAIL: TStringField;
    BancoDados: TSQLConnection;
    TransportadorEMAIL: TStringField;
    CargaDATA_NF: TDateField;
    dtTransportadorCPF_TRANSP: TStringField;
    TransportadorCPF_TRANSP: TStringField;
    dtConfPedido: TSQLDataSet;
    dtConfPedidoCOM_DESCARGA: TStringField;
    dtConfPedidoCOM_MANIFESTO: TStringField;
    dtConfPedidoFRETE_PAGO_DESCARGA: TStringField;
    dtConfPedidoNUM_PEDIDO: TIntegerField;
    dtConfPedidoPRAZO: TStringField;
    dtConfPedidoTEXTO: TStringField;
    dtConfPedidoVENCIMENTO: TStringField;
    dspConfPedido: TDataSetProvider;
    ConfPedido: TClientDataSet;
    ConfPedidoNUM_PEDIDO: TIntegerField;
    ConfPedidoCOM_DESCARGA: TStringField;
    ConfPedidoCOM_MANIFESTO: TStringField;
    ConfPedidoFRETE_PAGO_DESCARGA: TStringField;
    ConfPedidoPRAZO: TStringField;
    ConfPedidoTEXTO: TStringField;
    ConfPedidoVENCIMENTO: TStringField;
    CargaNUM_NF: TStringField;
    CargaCOD_MANIFESTO: TIntegerField;
    CargaNOME_MANIFESTO: TStringField;
    CargaQTDE_CADA: TFMTBCDField;
    dtPedidoCOD_USINA: TIntegerField;
    dtPedidoNOME_USINA: TStringField;
    PedidoCOD_USINA: TIntegerField;
    PedidoNOME_USINA: TStringField;
    dtMotoristaBAIRRO: TStringField;
    dtMotoristaCEP: TStringField;
    dtMotoristaCOD_CIDADE: TIntegerField;
    dtMotoristaCOD_EMPRESA: TIntegerField;
    dtMotoristaCOD_MOTORISTA: TIntegerField;
    dtMotoristaCOD_TRANS: TIntegerField;
    dtMotoristaENDERECO: TStringField;
    dtMotoristaFONE1: TStringField;
    dtMotoristaPLACA: TStringField;
    dtMotoristaFONE2: TStringField;
    dtMotoristaNOME: TStringField;
    dtMotoristaCPF: TStringField;
    dtMotoristaOBS: TStringField;
    dtMotoristaDATANASC: TDateField;
    dtMotoristaESTADO_CPF: TStringField;
    dtMotoristaPLACA_REBOQUE1: TStringField;
    dtMotoristaPLACA_REBOQUE2: TStringField;
    dtMotoristaPLACA_REBOQUE3: TStringField;
    dtMotoristaTONELAGEM: TFloatField;
    dtMotoristaUSU_ALT: TStringField;
    dtMotoristaUSU_INC: TStringField;
    dtMotoristaDESC_CIDADE: TStringField;
    dtMotoristaSIGLA: TStringField;
    dtMotoristaNOME_TRANS: TStringField;
    dtMotoristaCNH: TStringField;
    MotoristaCNH: TStringField;
    dtClienteCOD_VENDEDOR: TIntegerField;
    dtClienteVEN_NOME: TStringField;
    ClienteCOD_VENDEDOR: TIntegerField;
    ClienteVEN_NOME: TStringField;
    dtUnidadeFATOR_CONVERSAO: TFMTBCDField;
    dtUnidadeID_TEXTO: TIntegerField;
    UnidadeFATOR_CONVERSAO: TFMTBCDField;
    UnidadeID_TEXTO: TIntegerField;
    dtUnidadeCOMPL_UNIDADE: TStringField;
    UnidadeCOMPL_UNIDADE: TStringField;
    dtUnidadeOBSERVACAO: TStringField;
    UnidadeOBSERVACAO: TStringField;
    QUnidadeTexto: TSQLQuery;
    dspUnidadeTexto: TDataSetProvider;
    QUnidadeTextoID: TIntegerField;
    QUnidadeTextoOBSERVACAO: TStringField;
    QUnidadeTextoTEXTO: TStringField;
    UnidadeTexto: TClientDataSet;
    UnidadeTextoID: TIntegerField;
    UnidadeTextoOBSERVACAO: TStringField;
    UnidadeTextoTEXTO: TStringField;
    QUnidadeTextoUSU_INC: TStringField;
    QUnidadeTextoUSU_ALT: TStringField;
    UnidadeTextoUSU_INC: TStringField;
    UnidadeTextoUSU_ALT: TStringField;
    CargaID_UNIDADE: TIntegerField;
    dtTransportadorANTT: TStringField;
    dtTransportadorRENAVAN: TStringField;
    TransportadorANTT: TStringField;
    TransportadorRENAVAN: TStringField;
    dtMotoristaRENAVAN: TStringField;
    MotoristaRENAVAN: TStringField;
    dtCargaARMAZEM: TStringField;
    dtCargaCOD_AGENCIA: TIntegerField;
    dtCargaCOD_CLIENTE: TIntegerField;
    dtCargaCOD_CONTATO: TIntegerField;
    dtCargaCOD_EMPRESA: TIntegerField;
    dtCargaCOD_FOR: TIntegerField;
    dtCargaCOD_MOTORISTA: TIntegerField;
    dtCargaDATA: TSQLTimeStampField;
    dtCargaID_CARGA: TIntegerField;
    dtCargaQTDE_PEDIDO: TFloatField;
    dtCargaFINANCEIRO: TStringField;
    dtCargaLETRA: TStringField;
    dtCargaSITUACAO: TStringField;
    dtCargaOBS: TStringField;
    dtCargaNUM_CARGA: TIntegerField;
    dtCargaNUM_PEDIDO: TIntegerField;
    dtCargaQTDE: TFloatField;
    dtCargaUSU_ALT: TStringField;
    dtCargaUSU_INC: TStringField;
    dtCargaVALOR_CARREGA: TFloatField;
    dtCargaCOMPLEMENTO: TStringField;
    dtCargaVALOR_FRETE: TFloatField;
    dtCargaVALOR_PEDIDO: TFloatField;
    dtCargaVISTO: TStringField;
    dtCargaPLACA: TStringField;
    dtCargaSALDO: TFloatField;
    dtCargaUNIDADE: TStringField;
    dtCargaCOMPLUNIDADE: TStringField;
    dtCargaCONTATO_INDICACAO: TStringField;
    dtCargaOBS2: TStringField;
    dtCargaNUM_NF: TStringField;
    dtCargaDATA_NF: TDateField;
    dtCargaQTDE_CADA: TFMTBCDField;
    dtCargaID_UNIDADE: TIntegerField;
    dtCargaCOD_MANIFESTO: TIntegerField;
    dtCargaID_CONTABANCO: TIntegerField;
    dtCargaNOME_CLIENTE: TStringField;
    dtCargaNOME_CONTATO: TStringField;
    dtCargaNOME_FORNECEDOR: TStringField;
    dtCargaNOME_MOTORISTA: TStringField;
    dtCargaNOME_MANIFESTO: TStringField;
    dtCargaAGENCIA: TStringField;
    dtCargaBANCO: TStringField;
    dtCargaNUM_CONTA: TStringField;
    CargaID_CONTABANCO: TIntegerField;
    CargaAGENCIA: TStringField;
    CargaBANCO: TStringField;
    CargaNUM_CONTA: TStringField;
    dtCargaCNPJ_CPF: TStringField;
    dtCargaCREDITO_NF: TStringField;
    CargaCNPJ_CPF: TStringField;
    CargaCREDITO_NF: TStringField;
    dtContaBancoATIVO: TStringField;
    dtContaBancoCNPJ_CPF: TStringField;
    ContaBancoATIVO: TStringField;
    ContaBancoCNPJ_CPF: TStringField;
    dtCargaCTB_CNPJ: TStringField;
    CargaCTB_CNPJ: TStringField;
    dtCargaIR: TFloatField;
    dtCargaNUM_NOTA2: TStringField;
    dtCargaVALOR_NOTA2: TFloatField;
    CargaIR: TFloatField;
    CargaNUM_NOTA2: TStringField;
    CargaVALOR_NOTA2: TFloatField;
    dtCargaCOD_USINA: TIntegerField;
    dtCargaNOME_USINA: TStringField;
    CargaCOD_USINA: TIntegerField;
    CargaNOME_USINA: TStringField;
    procedure EstadoBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure EstadoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CidadeBeforePost(DataSet: TDataSet);
    procedure CidadeReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Forma_PagtoBeforePost(DataSet: TDataSet);
    procedure Forma_PagtoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure GrupoBeforePost(DataSet: TDataSet);
    procedure GrupoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure UnidadeReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure UnidadeBeforePost(DataSet: TDataSet);
    procedure EmpresaBeforePost(DataSet: TDataSet);
    procedure EmpresaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ProdutoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ProdutoBeforePost(DataSet: TDataSet);
    procedure Cad_UsuarioBeforePost(DataSet: TDataSet);
    procedure Cad_UsuarioReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Cad_UsuarioNewRecord(DataSet: TDataSet);
    procedure ClienteBeforePost(DataSet: TDataSet);
    procedure ClienteReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ClienteNewRecord(DataSet: TDataSet);
    procedure ContatoBeforePost(DataSet: TDataSet);
    procedure ContatoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FornecedorBeforePost(DataSet: TDataSet);
    procedure FornecedorReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleDestroy(Sender: TObject);
    procedure CondicaoBeforePost(DataSet: TDataSet);
    procedure CondicaoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure Itens_CondicaoBeforePost(DataSet: TDataSet);
    procedure Itens_CondicaoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure PermissaoBeforePost(DataSet: TDataSet);
    procedure EstadoBeforeDelete(DataSet: TDataSet);
    procedure CidadeBeforeDelete(DataSet: TDataSet);
    procedure ClienteBeforeDelete(DataSet: TDataSet);
    procedure EmpresaBeforeDelete(DataSet: TDataSet);
    procedure FornecedorBeforeDelete(DataSet: TDataSet);
    procedure ContatoBeforeDelete(DataSet: TDataSet);
    procedure CondicaoBeforeDelete(DataSet: TDataSet);
    procedure Forma_PagtoBeforeDelete(DataSet: TDataSet);
    procedure GrupoBeforeDelete(DataSet: TDataSet);
    procedure UnidadeBeforeDelete(DataSet: TDataSet);
    procedure ProdutoBeforeDelete(DataSet: TDataSet);
    procedure EstadoBeforeInsert(DataSet: TDataSet);
    procedure CidadeBeforeInsert(DataSet: TDataSet);
    procedure ClienteBeforeInsert(DataSet: TDataSet);
    procedure EmpresaBeforeInsert(DataSet: TDataSet);
    procedure FornecedorBeforeInsert(DataSet: TDataSet);
    procedure ContatoBeforeInsert(DataSet: TDataSet);
    procedure CondicaoBeforeInsert(DataSet: TDataSet);
    procedure Forma_PagtoBeforeInsert(DataSet: TDataSet);
    procedure GrupoBeforeInsert(DataSet: TDataSet);
    procedure UnidadeBeforeInsert(DataSet: TDataSet);
    procedure ProdutoBeforeInsert(DataSet: TDataSet);
    procedure PedidoBeforeDelete(DataSet: TDataSet);
    procedure PedidoBeforePost(DataSet: TDataSet);
    procedure PedidoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ItensPedidoBeforeDelete(DataSet: TDataSet);
    procedure ItensPedidoBeforeInsert(DataSet: TDataSet);
    procedure ItensPedidoBeforePost(DataSet: TDataSet);
    procedure PedidoNewRecord(DataSet: TDataSet);
    procedure Tabela_PrazoBeforeDelete(DataSet: TDataSet);
    procedure Tabela_PrazoBeforePost(DataSet: TDataSet);
    procedure Cad_UsuarioBeforeDelete(DataSet: TDataSet);
    procedure Cad_UsuarioBeforeInsert(DataSet: TDataSet);
    procedure ContasBeforeDelete(DataSet: TDataSet);
    procedure ContasBeforeInsert(DataSet: TDataSet);
    procedure ContasBeforePost(DataSet: TDataSet);
    procedure MotoristaBeforeDelete(DataSet: TDataSet);
    procedure MotoristaBeforeInsert(DataSet: TDataSet);
    procedure MotoristaBeforePost(DataSet: TDataSet);
    procedure TransportadorBeforeDelete(DataSet: TDataSet);
    procedure TransportadorBeforeInsert(DataSet: TDataSet);
    procedure TransportadorBeforePost(DataSet: TDataSet);
    procedure ContasReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ItensPedidoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure TransportadorReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure AgenciadorBeforeDelete(DataSet: TDataSet);
    procedure AgenciadorBeforeInsert(DataSet: TDataSet);
    procedure AgenciadorBeforePost(DataSet: TDataSet);
    procedure AgenciadorReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure TransportadorNewRecord(DataSet: TDataSet);
    procedure CargaBeforeDelete(DataSet: TDataSet);
    procedure CargaBeforeInsert(DataSet: TDataSet);
    procedure CargaBeforePost(DataSet: TDataSet);
    procedure CargaNewRecord(DataSet: TDataSet);
    procedure PedidoBeforeInsert(DataSet: TDataSet);
    procedure CargaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ConfPedidoNewRecord(DataSet: TDataSet);
    procedure ContaBancoBeforeDelete(DataSet: TDataSet);
    procedure ContaBancoBeforeInsert(DataSet: TDataSet);
    procedure ContaBancoBeforePost(DataSet: TDataSet);
    procedure ContaBancoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ContaBancoNewRecord(DataSet: TDataSet);
    procedure ObsContaBeforePost(DataSet: TDataSet);
    procedure ObsContaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ObsContaNewRecord(DataSet: TDataSet);
    procedure DiretorBeforePost(DataSet: TDataSet);
    procedure RefBancoBeforePost(DataSet: TDataSet);
    procedure RefComercioBeforePost(DataSet: TDataSet);
    procedure VendedorReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure VendedorBeforeDelete(DataSet: TDataSet);
    procedure VendedorBeforeInsert(DataSet: TDataSet);
    procedure VendedorBeforePost(DataSet: TDataSet);
    procedure TerceiroBeforeInsert(DataSet: TDataSet);
    procedure TerceiroBeforePost(DataSet: TDataSet);
    procedure TerceiroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure TerceiroBeforeDelete(DataSet: TDataSet);
    procedure TerceiroNewRecord(DataSet: TDataSet);
    procedure TipoFornecedorBeforeDelete(DataSet: TDataSet);
    procedure TipoFornecedorBeforeInsert(DataSet: TDataSet);
    procedure TipoFornecedorBeforePost(DataSet: TDataSet);
    procedure TipoFornecedorNewRecord(DataSet: TDataSet);
    procedure UnidadeNewRecord(DataSet: TDataSet);
    procedure UnidadeTextoBeforePost(DataSet: TDataSet);
    procedure UnidadeTextoBeforeDelete(DataSet: TDataSet);
    procedure UnidadeTextoBeforeInsert(DataSet: TDataSet);
    procedure UnidadeTextoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
    procedure Integridade(Mensagem: String);
    function Arredonda2Casas(Tabela:TClientDataSet; Campo: String ): real;
  public
    { Public declarations }
    function Incrementa(Tabela, Tipo: String): Integer;
    function Incrementa1(Tabela, Campo: String): Integer;
    Procedure Grava_Usuario(Tabela: String);
    procedure Get_Codigo(Tabela: TClientDataSet; Codigo: String);
    procedure Get_Contas(Codigo: String);
    procedure Get_ObsConta(Codigo: String);
    procedure Get_Diretor(Codigo: String);
    procedure Get_RefBanco(Codigo: String);
    procedure Get_RefComercio(Codigo: String);
    procedure SalvaTab(Tabela: TClientDataSet);
    procedure IniTrans;
    procedure SalvaTrans;
    procedure CancelaTrans;
    function Conta_Reg(Query: TSqlQuery): integer;
    procedure ModoEdicao(Tabela: TDataSource);
    function permite(inUsuario, inTipo, inTabela: String): boolean;
    procedure Tamanho_Form(Formulario: TForm);
    procedure Tamanho_Painel(Painel: TPanel);
    procedure ListarUnidadeTexto(Texto: string);

  end;

var
  DM: TDM;
  vgUsuario       : String;
  vgCod_Empresa   : String;
  TransDesc: TTransactionDesc;

implementation

uses UUtil;
   var vuSql: TSqlQuery;

{$R *.dfm}

{ TDM }

procedure TDM.IniTrans;
begin
   if not BancoDados.InTransaction then
      BancoDados.StartTransaction(TransDesc);
end;

procedure TDM.SalvaTrans;
begin
   if BancoDados.InTransaction then
      BancoDados.Commit(TransDesc);
end;

procedure TDM.CancelaTrans;
begin
   if BancoDados.InTransaction then
      BancoDados.Rollback(TransDesc);
end;

function TDM.Conta_Reg(Query: TSqlQuery): integer;
var i: integer;
begin
   Query.First;
   i:=0;
   while not Query.Eof do
   begin
      i:=i+1;
      Query.Next;
   end;
   Query.First;
   result:=i;
end;

procedure TDM.ModoEdicao(Tabela: TDataSource);
begin
   if not (Tabela.DataSet.State in [dsedit,dsinsert]) then
      Tabela.DataSet.Edit;
end;

procedure TDM.Get_Codigo(Tabela: TClientDataSet; Codigo: String);
begin
   Tabela.Close;
   Tabela.Params[0].Text:=vgCod_Empresa;
   Tabela.Params[1].Text:=Codigo;
   Tabela.Open;
end;

procedure TDM.SalvaTab(Tabela: TClientDataSet);
var iRetorno: integer;
begin
   iRetorno:=Tabela.ApplyUpdates(0);
   if iRetorno <> 0 then
      mensagem('Erro ao Salvar dados');
end;

function TDM.Incrementa(Tabela, Tipo: String): Integer;
begin
{
   parametros:
   Tabela: Nome da Tabela
   Tipo: 0,1
}
   vuSql:=TSQLQuery.Create(nil);
   vuSql.SQLConnection:=BancoDados;
   vuSql.Close;
   vuSql.SQL.Clear;
   if Tabela = 'ESTADO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_ESTADO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'CIDADE' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_CIDADE,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'FORMA_PAGTO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_FORMAPAGTO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'GRUPO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_GRUPO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'UNIDADE' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_UNIDADE,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'PRODUTO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_PRODUTO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'CAD_USUARIO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_USUARIO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'CLIENTE' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_CLIENTE,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'FORNECEDOR' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_FORNECEDOR,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'CONDICAO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_CONDICAO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'PERMISSAO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_PERMISSAO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'PEDIDO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_PEDIDO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'CONTAS' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_CONTAS,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'MOTORISTA' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_MOTORISTA,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'TRANSPORTADOR' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_TRANSPORTADOR,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'AGENCIADOR' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_AGENCIADOR,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'CARGA' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_CARGA,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'OBS_CONTA' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_OBSCONTA,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'DIRETOR' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_DIRETOR,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'REF_BANCO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_REF_BANCARIA,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'REF_COMERCIO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_REF_COMERCIO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'VENDEDOR' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_VENDEDOR,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'TERCEIRO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_TERCEIRO,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'FORN_TIPO_EMPRESA' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_FORN_TIPO_EMPRESA,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'PARAMETROS' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_PARAMETROS,'+Tipo+') as Integer) as CODIGO from rdb$database');
   if Tabela = 'UNIDADE_TEXTO' then
      vuSql.SQL.Add(' select cast(gen_id(GEN_UNIDADE_TEXTO,'+Tipo+') as Integer) as CODIGO from rdb$database');


   vuSql.Open;
   if Tipo = '0' then
      result:=vuSql.fieldbyname('CODIGO').AsInteger + 1
   else
      result:=vuSql.fieldbyname('CODIGO').AsInteger;
   vuSql.Close;

   FreeAndNil(vuSql);
end;

procedure TDM.EstadoBeforePost(DataSet: TDataSet);
begin
   if (Estado.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','ESTADO') = false) then
         Abort;
   end;

   if Estado.State = dsInsert then
      EstadoID_ESTADO.AsInteger:=Incrementa('ESTADO','1');
   Grava_Usuario('ESTADO');
end;

procedure TDM.DataModuleCreate(Sender: TObject);
//var
//  IniFile: TIniFile;
//  reg: string;
begin
//  IniFile := TIniFile.Create('dbxconnections.ini');
//  reg := IniFile.ReadString('Main')

   if BancoDados.Connected = true then
      BancoDados.Connected:=false;
//   BancoDados.Params.Values['database'] := 'C:\Projetos\mb\Banco\loja.fdb';
   BancoDados.LoadParamsFromIniFile('dbxconnections.ini');
   if BancoDados.Connected = false then
      BancoDados.Connected:=true;


   TransDesc.TransactionID:=1;
   TransDesc.IsolationLevel:=xilREADCOMMITTED;

   vgCod_Empresa:='1';
   vgUsuario:='IRANI';
end;


procedure TDM.Grava_Usuario(Tabela: String);
var vldata,vlhora,vldados: String;
begin
   vldata:=formatDateTime('dd/mm/yy',date);
   vlhora:=formatDateTime('hh:mm',time);
   vlDados:=copy(vgUsuario,1,5)+'-'+vlData+'-'+vlHora;

   if Tabela = 'ESTADO' then
   begin
      if Estado.State = dsInsert then EstadoUSU_INC.Text:=vlDados;
      if Estado.State = dsEdit then EstadoUSU_ALT.Text:=vlDados;
      EstadoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'CIDADE' then
   begin
      if Cidade.State = dsInsert then CidadeUSU_INC.Text:=vlDados;
      if Cidade.State = dsEdit then CidadeUSU_ALT.Text:=vlDados;
      CidadeCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'FORMA_PAGTO' then
   begin
      if Forma_Pagto.State = dsInsert then Forma_PagtoUSU_INC.Text:=vlDados;
      if Forma_Pagto.State = dsEdit then Forma_PagtoUSU_ALT.Text:=vlDados;
      Forma_PagtoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'GRUPO' then
   begin
      if Grupo.State = dsInsert then GrupoUSU_INC.Text:=vlDados;
      if Grupo.State = dsEdit then GrupoUSU_ALT.Text:=vlDados;
      GrupoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'UNIDADE' then
   begin
      if Unidade.State = dsInsert then UnidadeUSU_INC.Text:=vlDados;
      if Unidade.State = dsEdit then UnidadeUSU_ALT.Text:=vlDados;
      UnidadeCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'EMPRESA' then
   begin
      if Empresa.State = dsInsert then EmpresaUSU_INC.Text:=vlDados;
      if Empresa.State = dsEdit then EmpresaUSU_ALT.Text:=vlDados;
   end;
   if Tabela = 'PRODUTO' then
   begin
      if Produto.State = dsInsert then ProdutoUSU_INC.Text:=vlDados;
      if Produto.State = dsEdit then ProdutoUSU_ALT.Text:=vlDados;
      ProdutoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'CAD_USUARIO' then
   begin
      if Cad_Usuario.State = dsInsert then Cad_UsuarioUSU_INC.Text:=vlDados;
      if Cad_Usuario.State = dsEdit then Cad_UsuarioUSU_ALT.Text:=vlDados;
      Cad_UsuarioCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'CLIENTE' then
   begin
      if Cliente.State = dsInsert then ClienteUSU_INC.Text:=vlDados;
      if Cliente.State = dsEdit then ClienteUSU_ALT.Text:=vlDados;
      ClienteCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'CONTATO_CLIENTE' then
   begin
      if Contato.State = dsInsert then ContatoUSU_INC.Text:=vlDados;
      if Contato.State = dsEdit then ContatoUSU_ALT.Text:=vlDados;
      ContatoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'FORNECEDOR' then
   begin
      if Fornecedor.State = dsInsert then FornecedorUSU_INC.Text:=vlDados;
      if Fornecedor.State = dsEdit then FornecedorUSU_ALT.Text:=vlDados;
      FornecedorCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'CONDICAO' then
   begin
      if Condicao.State = dsInsert then CondicaoUSU_INC.Text:=vlDados;
      if Condicao.State = dsEdit then CondicaoUSU_ALT.Text:=vlDados;
      CondicaoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'ITENS_CONDICAO' then
   begin
      if Itens_Condicao.State = dsInsert then Itens_CondicaoUSU_INC.Text:=vlDados;
      if Itens_Condicao.State = dsEdit then Itens_CondicaoUSU_ALT.Text:=vlDados;
      Itens_CondicaoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'PERMISSAO' then
   begin
      if Permissao.State = dsInsert then PermissaoUSU_INC.Text:=vlDados;
      if Permissao.State = dsEdit then PermissaoUSU_ALT.Text:=vlDados;
      PermissaoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'PEDIDO' then
   begin
      if Pedido.State = dsInsert then PedidoUSU_INC.Text:=vlDados;
      if Pedido.State = dsEdit then PedidoUSU_ALT.Text:=vlDados;
      PedidoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'ITENSPEDIDO' then
   begin
      if ItensPedido.State = dsInsert then ItensPedidoUSU_INC.Text:=vlDados;
      if ItensPedido.State = dsEdit then ItensPedidoUSU_ALT.Text:=vlDados;
      ItensPedidoCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'CONTAS' then
   begin
      if Contas.State = dsInsert then ContasUSU_INC.Text:=vlDados;
      if Contas.State = dsEdit then ContasUSU_ALT.Text:=vlDados;
      ContasCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'MOTORISTA' then
   begin
      if Motorista.State = dsInsert then MotoristaUSU_INC.Text:=vlDados;
      if Motorista.State = dsEdit then MotoristaUSU_ALT.Text:=vlDados;
      MotoristaCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'AGENCIADOR' then
   begin
      if Agenciador.State = dsInsert then AgenciadorUSU_INC.Text:=vlDados;
      if Agenciador.State = dsEdit then AgenciadorUSU_ALT.Text:=vlDados;
      AgenciadorCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'TRANSPORTADOR' then
   begin
      if Transportador.State = dsInsert then TransportadorUSU_INC.Text:=vlDados;
      if Transportador.State = dsEdit then TransportadorUSU_ALT.Text:=vlDados;
      TransportadorCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'CARGA' then
   begin
      if Carga.State = dsInsert then CargaUSU_INC.Text:=vlDados;
      if Carga.State = dsEdit then CargaUSU_ALT.Text:=vlDados;
      CargaCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'VENDEDOR' then
   begin
      if Vendedor.State = dsInsert then VendedorUSU_INC.Text:=vlDados;
      if Vendedor.State = dsEdit then VendedorUSU_ALT.Text:=vlDados;
      VendedorCOD_EMPRESA.Text:=vgCod_Empresa;
   end;
   if Tabela = 'USUARIO_TEXTO' then
   begin
      if UnidadeTexto.State = dsInsert then UnidadeTextoUSU_INC.Text:=vlDados;
      if UnidadeTexto.State = dsEdit then UnidadeTextoUSU_ALT.Text:=vlDados;
   end;
   if Tabela = 'FORN_TIPO_EMPRESA' then
   begin
      if TipoFornecedor.State = dsInsert then TipoFornecedorUSU_INC.Text:=vlDados;
      if TipoFornecedor.State = dsEdit then TipoFornecedorUSU_ALT.Text:=vlDados;
   end;
end;

procedure TDM.EstadoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.CidadeBeforePost(DataSet: TDataSet);
begin
   if (Cidade.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','CIDADE') = false) then
         Abort;
   end;
   if Cidade.State = dsInsert then
      CidadeCOD_CIDADE.AsInteger:=Incrementa('CIDADE','1');
   Grava_Usuario('CIDADE');
end;

procedure TDM.CidadeReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   //MensagemErro(e.Message);
   Integridade(e.Message);
   ClienteTIPO_FICHA.Text:='N';
   ClienteFICHA_CADASTRAL.Text:='N';
   ClienteCONTRATO_SOCIAL.text:='N';
   ClienteCARTAO_CADASTRAL.text:='N';
   ClienteDOC_PROPRIETARIO.text:='N';
   ClientePREDIO_PROPRIO.text:='S';

end;

procedure TDM.Forma_PagtoBeforePost(DataSet: TDataSet);
begin
   if (Forma_Pagto.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','FORMA_PAGTO') = false) then
         Abort;
   end;
   if Forma_Pagto.State = dsInsert then
      Forma_PagtoCOD_PAGTO.AsInteger:=Incrementa('FORMA_PAGTO','1');
   Grava_Usuario('FORMA_PAGTO');
end;

procedure TDM.Forma_PagtoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.GrupoBeforePost(DataSet: TDataSet);
begin
   if (Grupo.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','GRUPO') = false) then
         Abort;
   end;
   if Grupo.State = dsInsert then
      GrupoCOD_GRUPO.AsInteger:=Incrementa('GRUPO','1');
   Grava_Usuario('GRUPO');
end;

procedure TDM.GrupoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.UnidadeReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.UnidadeTextoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','UNIDADE_TEXTO') = false then
      Abort;
end;

procedure TDM.UnidadeTextoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','UNIDADE_TEXTO') = false then
      Abort;
end;

procedure TDM.UnidadeTextoBeforePost(DataSet: TDataSet);
begin
   if (UnidadeTexto.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','UNIDADE_TEXTO') = false) then
         Abort;
   end;
   if UnidadeTexto.State = dsInsert then
      UnidadeTextoID.AsInteger:=Incrementa('UNIDADE_TEXTO','1');

   Grava_Usuario('UNIDADE_TEXTO');
end;

procedure TDM.UnidadeTextoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Integridade(e.Message);
end;

procedure TDM.UnidadeBeforePost(DataSet: TDataSet);
begin
   if (Unidade.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','UNIDADE') = false) then
         Abort;
   end;
   if Unidade.State = dsInsert then
      UnidadeID_UNIDADE.AsInteger:=Incrementa('UNIDADE','1');

   if UnidadeFATOR_CONVERSAO.AsFloat <= 0 then
      UnidadeFATOR_CONVERSAO.AsFloat := 1;

   Grava_Usuario('UNIDADE');
end;

procedure TDM.UnidadeNewRecord(DataSet: TDataSet);
begin
  UnidadeFATOR_CONVERSAO.AsFloat := 1;
end;

procedure TDM.EmpresaBeforePost(DataSet: TDataSet);
begin
   if (Empresa.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','EMPRESA') = false) then
         Abort;
   end;
   if Empresa.State = dsInsert then
      EmpresaCOD_EMPRESA.AsInteger:=Incrementa('EMPRESA','1');
   Grava_Usuario('EMPRESA');
end;

procedure TDM.EmpresaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ProdutoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ProdutoBeforePost(DataSet: TDataSet);
begin
   if (Produto.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','PRODUTO') = false) then
         Abort;
   end;
   if Produto.State = dsInsert then
      ProdutoCOD_Produto.AsInteger:=Incrementa('PRODUTO','1');
   Grava_Usuario('PRODUTO');
end;

procedure TDM.Cad_UsuarioBeforePost(DataSet: TDataSet);
begin
   if (Cad_Usuario.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','CAD_USUARIO') = false) then
         Abort;
   end;

   if Cad_Usuario.State = dsInsert then
      Cad_UsuarioID_USUARIO.AsInteger:=Incrementa('CAD_USUARIO','1');
    Grava_Usuario('CAD_USUARIO');
end;

procedure TDM.Cad_UsuarioReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.Cad_UsuarioNewRecord(DataSet: TDataSet);
begin
   Cad_UsuarioGERENTE.Text:='N';
end;

procedure TDM.ClienteBeforePost(DataSet: TDataSet);
begin
   if (Cliente.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','CLIENTE') = false) then
         Abort;
   end;
   if Cliente.State = dsInsert then
      ClienteCOD_CLIENTE.AsInteger:=Incrementa('CLIENTE','1');
   Grava_Usuario('CLIENTE');
end;

procedure TDM.ClienteReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ClienteNewRecord(DataSet: TDataSet);
begin
   ClienteDATA_CADASTRO.AsDateTime:=date;
   ClienteTIPO_PESSOA.Text:='J';
end;

procedure TDM.ContatoBeforePost(DataSet: TDataSet);
begin
   if (Contato.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','CONTATO') = false) then
         Abort;
   end;

   Grava_Usuario('CONTATO_CLIENTE');
end;

procedure TDM.ContatoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.FornecedorBeforePost(DataSet: TDataSet);
begin
   if (Fornecedor.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','FORNECEDOR') = false) then
         Abort;
   end;

   if Fornecedor.State = dsInsert then
      FornecedorCOD_FOR.AsInteger:=Incrementa('FORNECEDOR','1');
   Grava_Usuario('FORNECEDOR');
end;

procedure TDM.FornecedorReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   if BancoDados.Connected = true then
      BancoDados.Connected:=false;
end;

procedure TDM.CondicaoBeforePost(DataSet: TDataSet);
begin
   if (Condicao.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','CONDICAO') = false) then
         Abort;
   end;

   if Condicao.State = dsInsert then
      CondicaoCOD_CONDICAO.AsInteger:=Incrementa('CONDICAO','1');
   Grava_Usuario('CONDICAO');
end;

procedure TDM.CondicaoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.Itens_CondicaoBeforePost(DataSet: TDataSet);
begin
   Grava_Usuario('ITENS_CONDICAO');
end;

procedure TDM.Itens_CondicaoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ListarUnidadeTexto(Texto: string);
begin
  UnidadeTexto.Close;
  UnidadeTexto.Params[0].AsString := '%' + Texto + '%';
  UnidadeTexto.Open;
end;

procedure TDM.PermissaoBeforePost(DataSet: TDataSet);
begin
   if Permissao.State = dsInsert then
      PermissaoID_PER.AsInteger:=Incrementa('PERMISSAO','1');
   Grava_Usuario('PERMISSAO');
end;

function TDM.permite(inUsuario, inTipo, inTabela: String): boolean;
var vSql: TSQLQuery;
var vmens: String;
begin
   result:=true;
   vSql:=TSQLQuery.create(nil);
   vsql.SQLConnection:=dm.BancoDados;
   vSql.Close;
   vSql.SQL.Add(' select');
   vSql.SQL.Add(' INC,ALT,EXC,CON');
   vSql.SQL.Add(' from PERMISSAO');
   vSql.SQL.Add(' where COD_EMPRESA = '+vgCod_Empresa);
   vSql.SQL.Add(' and NOME = '''+inUsuario+'''');
   vSql.SQL.Add(' and TABELA = '''+inTabela+'''');
   vSql.Open;
   vmens:='Usu�rio sem Permiss�o';
   if (inTipo = 'I') and (vSql.FieldByName('INC').Text = 'N') then
   begin
      mensagem(pchar(vmens));
      result:=false;
   end;
   if (inTipo = 'A') and (vSql.FieldByName('ALT').Text = 'N') then
   begin
      mensagem(pchar(vmens));
      result:=false;
   end;
   if (inTipo = 'E') and (vSql.FieldByName('EXC').Text = 'N') then
   begin
      mensagem(pchar(vmens));
      result:=false;
   end;
   if (inTipo = 'C') and (vSql.FieldByName('CON').Text = 'N') then
   begin
      mensagem(pchar(vmens));
      result:=false;
   end;
   vsql.Close;
   FreeAndNil(vSql);
end;

procedure TDM.EstadoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','ESTADO') = false then
      Abort;
end;

procedure TDM.CidadeBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CIDADE') = false then
      Abort;
end;

procedure TDM.ClienteBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CLIENTE') = false then
      Abort;
end;

procedure TDM.EmpresaBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','EMPRESA') = false then
      Abort;
end;

procedure TDM.FornecedorBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','FORNECEDOR') = false then
      Abort;
end;

procedure TDM.ContatoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CONTATO') = false then
      Abort;
end;

procedure TDM.CondicaoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CONDICAO') = false then
      Abort;
end;

procedure TDM.Forma_PagtoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','FORMA_PAGTO') = false then
      Abort;
end;

procedure TDM.GrupoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','GRUPO') = false then
      Abort;
end;

procedure TDM.UnidadeBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','UNIDADE') = false then
      Abort;
end;

procedure TDM.ProdutoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','PRODUTO') = false then
      Abort;
end;

procedure TDM.EstadoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','ESTADO') = false then
      Abort;
end;

procedure TDM.CidadeBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CIDADE') = false then
      Abort;
end;

procedure TDM.ClienteBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CLIENTE') = false then
      Abort;
end;

procedure TDM.EmpresaBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','EMPRESA') = false then
      Abort;
end;

procedure TDM.FornecedorBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','FORNECEDOR') = false then
      Abort;
end;

procedure TDM.ContatoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CONTATO') = false then
      Abort;
end;

procedure TDM.CondicaoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CONDICAO') = false then
      Abort;
end;

procedure TDM.Forma_PagtoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','FORMA_PAGTO') = false then
      Abort;
end;

procedure TDM.GrupoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','GRUPO') = false then
      Abort;
end;

procedure TDM.UnidadeBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','UNIDADE') = false then
      Abort;
end;

procedure TDM.ProdutoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','PRODUTO') = false then
      Abort;
end;

procedure TDM.PedidoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','PEDIDO') = false then
      Abort;
end;

procedure TDM.PedidoBeforePost(DataSet: TDataSet);
var
  sTemp: string;
begin
   if (Pedido.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','PEDIDO') = false) then
         Abort;
   end;

   if Pedido.State = dsInsert then
   begin
      PedidoNUM_PEDIDO.AsInteger:=Incrementa('PEDIDO','1');

      sTemp := '';
      if DM.PedidoOBS.AsString = '' then
      begin
        if dm.PedidoPERC_COMISSAO.AsCurrency > 0 then
          sTemp := sTemp + 'COMISS�O DE ' + DM.PedidoPERC_COMISSAO.AsString + '%';

        if dm.PedidoCOD_USINA.AsInteger > 0 then
          sTemp := sTemp + ' RETIRA NA USINA ' + DM.PedidoNOME_USINA.AsString;
      end;

      if sTemp <> '' then
        DM.PedidoOBS.AsString := sTemp;

   end;
   Grava_Usuario('PEDIDO');
   //Arredonda2Casas(Pedido,'TOTAL_COMISSAO');
   //Arredonda2Casas(Pedido,'VALOR_COMISSAO');
   Arredonda2Casas(Pedido,'TOTAL_QTDE');

end;

procedure TDM.PedidoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ItensPedidoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','PEDIDO') = false then
      Abort;
end;

procedure TDM.ItensPedidoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','PEDIDO') = false then
      Abort;
end;

procedure TDM.ItensPedidoBeforePost(DataSet: TDataSet);
begin
   if (ItensPedido.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','PEDIDO') = false) then
         Abort;
   end;
   Grava_Usuario('ITENSPEDIDO');
end;

procedure TDM.PedidoNewRecord(DataSet: TDataSet);
begin
   PedidoDATA.AsDateTime:=date;
   PedidoSITUACAO.Text:='A';
   PedidoIMP_LOGO.text:='S';
   PedidoNUM_PEDIDO.AsInteger:=Incrementa('PEDIDO','0');
end;

procedure TDM.Tabela_PrazoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','TABELA_PRAZO') = false then
      Abort;
end;

procedure TDM.Tabela_PrazoBeforePost(DataSet: TDataSet);
begin
   if (Tabela_Prazo.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','TABELA_PRAZO') = false) then
         Abort;
   end;
   Grava_Usuario('TABELA_PRAZO');
end;

procedure TDM.Tamanho_Form(Formulario: TForm);
begin
   Formulario.Height:=520;
   Formulario.Width:=780;
end;

procedure TDM.Tamanho_Painel(Painel: TPanel);
begin
//   Painel.Width:=745;
   Painel.Width:=775;
   Painel.Top:=0;
   Painel.Height:=490;
   Painel.Left:=0;
end;

procedure TDM.Cad_UsuarioBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CAD_USUARIO') = false then
      Abort;
end;

procedure TDM.Cad_UsuarioBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CAD_USUARIO') = false then
      Abort;
end;

procedure TDM.ContasBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CONTAS') = false then
      Abort;
end;

procedure TDM.ContasBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CONTAS') = false then
      Abort;
end;

procedure TDM.ContasBeforePost(DataSet: TDataSet);
begin
   if (Contas.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','CONTAS') = false) then
         Abort;
   end;
   if Contas.State = dsInsert then
      ContasID_CONTA.AsInteger:=Incrementa('CONTAS','1');
   Grava_Usuario('CONTAS');
end;

procedure TDM.Get_Contas(Codigo: String);
begin
   Contas.Close;
   Contas.Params[0].Text:=Codigo;
   contas.Open;
end;

procedure TDM.MotoristaBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','MOTORISTA') = false then
      Abort;
end;

procedure TDM.MotoristaBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','MOTORISTA') = false then
      Abort;
end;

procedure TDM.MotoristaBeforePost(DataSet: TDataSet);
begin
   if (Motorista.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','MOTORISTA') = false) then
         Abort;
   end;
   if MOTORISTA.State = dsInsert then
      MotoristaCOD_MOTORISTA.AsInteger:=Incrementa('MOTORISTA','1');
   Grava_Usuario('MOTORISTA');
end;

procedure TDM.TransportadorBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','TRANSPORTADOR') = false then
      Abort;
end;

procedure TDM.TransportadorBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','TRANSPORTADOR') = false then
      Abort;
end;

procedure TDM.TransportadorBeforePost(DataSet: TDataSet);
begin
   if (Transportador.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','TRANSPORTADOR') = false) then
         Abort;
   end;
   if Transportador.State = dsInsert then
      TransportadorCOD_TRANS.AsInteger:=Incrementa('TRANSPORTADOR','1');
   Grava_Usuario('TRANSPORTADOR');
end;

procedure TDM.ContasReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ItensPedidoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.TransportadorReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.AgenciadorBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','AGENCIADOR') = false then
      Abort;
end;

procedure TDM.AgenciadorBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','AGENCIADOR') = false then
      Abort;
end;

procedure TDM.AgenciadorBeforePost(DataSet: TDataSet);
begin
   if (Agenciador.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','AGENCIADOR') = false) then
         Abort;
   end;
   if Agenciador.State = dsInsert then
      AgenciadorCOD_AGENCIA.AsInteger:=Incrementa('AGENCIADOR','1');
   Grava_Usuario('AGENCIADOR');
end;

procedure TDM.AgenciadorReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.TransportadorNewRecord(DataSet: TDataSet);
begin
   TransportadorDESTAQUE.Text:='N';
end;

procedure TDM.CargaBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CARGA') = false then
      Abort;
end;

procedure TDM.CargaBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CARGA') = false then
      Abort;

end;

procedure TDM.CargaBeforePost(DataSet: TDataSet);
begin
  if CargaID_UNIDADE.AsString = '' then
    raise Exception.Create('Informe a Unidade.');

   if (Carga.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','CARGA') = false) then
         Abort;
   end;
   if Carga.State = dsInsert then
      CargaID_CARGA.AsInteger:=Incrementa('CARGA','1');
   Grava_Usuario('CARGA');
end;

procedure TDM.CargaNewRecord(DataSet: TDataSet);
begin
   CargaDATA.AsDateTime:=date;
   CargaID_CARGA.AsInteger:=Incrementa('CARGA','0');
   CargaSITUACAO.Text:='A';
   CargaFINANCEIRO.Text:='A';
   dm.CargaCOMPLUNIDADE.Text := '50 KILOS CADA.';
   dm.CargaUNIDADE.Text := 'SACAS';
   CargaOBS2.AsString := '"A�UCAR ADIQUIRIDO DA EMPRESA CANEX LTDA"';
   CargaQTDE_CADA.AsFloat := 50;
end;

procedure TDM.Integridade(Mensagem: String);
var i: integer;
var j: Integer;
var a: String;
begin
   try
      if pos('PRIMARY',uppercase(Mensagem)) > 0 then
      begin
         showMessage('Erro: duplica��o de Registro');
         exit;
      end;

      if pos('FOREIGN',uppercase(Mensagem)) > 0 then
      begin
         i:=pos('table "',Mensagem)+5;
         a:='';
         for j:=i to length(Mensagem) do
            a:=a + copy(mensagem,j,1);
         showMessage('Erro: Possui ' + a);
         showmessage(Mensagem);
      end;
   except
      showmessage('Erro');
   end;
end;

procedure TDM.PedidoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','PEDIDO') = false then
      Abort;
end;

procedure TDM.CargaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ContaBancoBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','CONTABANCO') = false then
      Abort;
end;

procedure TDM.ContaBancoBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','CONTABANCO') = false then
      Abort;
end;

procedure TDM.ContaBancoBeforePost(DataSet: TDataSet);
begin
   if (ContaBanco.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','CONTABANCO') = false) then
         Abort;
   end;

   if ContaBanco.State = dsInsert then
      ContaBancoID_CONTABANCO.AsInteger:=Incrementa1('CONTABANCO','ID_CONTABANCO');
   //Grava_Usuario('CONTABANCO');
end;

procedure TDM.ContaBancoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

function TDM.Incrementa1(Tabela, Campo: String): Integer;
begin
   Qsql.Close;
   Qsql.SQL.Clear;
   Qsql.SQL.Add('select max('+Campo+') as CODIGO from '+Tabela);
   Qsql.Open;
   if Qsql.Fields[0].IsNull then
      Result:=1
   else
      Result:=Qsql.Fields[0].AsInteger + 1;
   Qsql.Close;
end;

procedure TDM.ContaBancoNewRecord(DataSet: TDataSet);
begin
   ContaBancoCOD_EMPRESA.Text:=vgCod_Empresa;
   ContaBancoATIVO.AsString := 'S';
end;

procedure TDM.ObsContaBeforePost(DataSet: TDataSet);
begin
   if ObsConta.State = dsInsert then
      ObsContaID_OBS.AsInteger:=Incrementa('OBS_CONTA','1');
end;

procedure TDM.ObsContaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.ObsContaNewRecord(DataSet: TDataSet);
begin
   ObsContaCOD_EMPRESA.Text:=vgCod_Empresa;
end;

procedure TDM.Get_ObsConta(Codigo: String);
begin
   ObsConta.Close;
   ObsConta.Params[0].Text:=Codigo;
   ObsConta.Open;
end;

procedure TDM.Get_Diretor(Codigo: String);
begin
   Diretor.Close;
   Diretor.Params[0].Text:=Codigo;
   Diretor.Open;
end;

procedure TDM.Get_RefBanco(Codigo: String);
begin
   RefBanco.Close;
   RefBanco.Params[0].Text:=Codigo;
   RefBanco.Open;
end;

procedure TDM.Get_RefComercio(Codigo: String);
begin
   RefComercio.Close;
   RefComercio.Params[0].Text:=Codigo;
   RefComercio.Open;
end;

procedure TDM.DiretorBeforePost(DataSet: TDataSet);
begin
   if Diretor.State = dsInsert then
      DiretorID_DIRETOR.AsInteger:=Incrementa('DIRETOR','1');
end;

procedure TDM.RefBancoBeforePost(DataSet: TDataSet);
begin
   if RefBanco.State = dsInsert then
      RefBancoID_BANCO.AsInteger:=Incrementa('REF_BANCO','1');
end;

procedure TDM.RefComercioBeforePost(DataSet: TDataSet);
begin
   if RefComercio.State = dsInsert then
      RefComercioID_COMERCIO.AsInteger:=Incrementa('REF_COMERCIO','1');
end;

procedure TDM.VendedorReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.VendedorBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','VENDEDOR') = false then
      Abort;
end;

procedure TDM.VendedorBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','VENDEDOR') = false then
      Abort;
end;

procedure TDM.VendedorBeforePost(DataSet: TDataSet);
begin
   if (Estado.State = dsEdit) then
   begin
      if (permite(vgUsuario,'A','VENDEDOR') = false) then
         Abort;
   end;

   if Vendedor.State = dsInsert then
      VendedorCOD_VENDEDOR.AsInteger:=Incrementa('VENDEDOR','1');
   Grava_Usuario('VENDEDOR');
end;

function TDM.Arredonda2Casas(Tabela: TClientDataSet; Campo: String): real;
begin
   Tabela.FieldByName(Campo).AsFloat:=Arredonda(Tabela.fieldbyname(Campo).AsFloat,2);
end;

procedure TDM.ConfPedidoNewRecord(DataSet: TDataSet);
begin
  ConfPedidoCOM_DESCARGA.AsString := 'N';
  ConfPedidoCOM_MANIFESTO.AsString := 'N';
  ConfPedidoFRETE_PAGO_DESCARGA.AsString := 'N';
end;

procedure TDM.TerceiroBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','TERCEIRO') = false then
      Abort;
end;

procedure TDM.TerceiroBeforePost(DataSet: TDataSet);
begin
   if (Terceiro.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','TERCEIRO') = false) then
         Abort;
   end;
   if Terceiro.State = dsInsert then
      TerceiroCOD_TERCEIRO.AsInteger:=Incrementa('TERCEIRO','1');
   Grava_Usuario('TERCEIRO');
end;

procedure TDM.TerceiroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Integridade(e.Message);
end;

procedure TDM.TerceiroBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','TERCEIRO') = false then
      Abort;

end;

procedure TDM.TerceiroNewRecord(DataSet: TDataSet);
begin
   TerceiroTIPO_PESSOA.text := 'F';
   TerceiroDATA_CADASTRO.AsDateTime := date;
   TerceiroCOD_EMPRESA.Text := vgCod_Empresa;
end;

procedure TDM.TipoFornecedorBeforeDelete(DataSet: TDataSet);
begin
   if permite(vgUsuario,'E','FORN_TIPO_EMPRESA') = false then
      Abort
end;

procedure TDM.TipoFornecedorBeforeInsert(DataSet: TDataSet);
begin
   if permite(vgUsuario,'I','FORN_TIPO_EMPRESA') = false then
      Abort;
end;

procedure TDM.TipoFornecedorBeforePost(DataSet: TDataSet);
begin
   if (TipoFornecedor.State = dsEdit)  then
   begin
      if (permite(vgUsuario,'A','FORN_TIPO_EMPRESA') = false) then
         Abort;
   end;
   if TipoFornecedor.State = dsInsert then
      TipoFornecedorID_TIPO.AsInteger:=Incrementa('FORN_TIPO_EMPRESA','1');
   Grava_Usuario('FORN_TIPO_EMPRESA');
end;

procedure TDM.TipoFornecedorNewRecord(DataSet: TDataSet);
begin
  TipoFornecedorCOD_EMPRESA.AsString := vgCod_Empresa;
end;

end.
