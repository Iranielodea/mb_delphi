object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 638
  Width = 722
  object dtEstado: TSQLDataSet
    CommandText = 
      'select COD_EMPRESA, DESC_ESTADO, ICMS, ID_ESTADO, SIGLA, USU_ALT' +
      ', USU_INC from ESTADO'#13#10' where COD_EMPRESA = :COD_EMPRESA'#13#10' and D' +
      'ESC_ESTADO like :DESC_ESTADO'#13#10' order by DESC_ESTADO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_ESTADO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 72
    object dtEstadoID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtEstadoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtEstadoDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dtEstadoICMS: TFloatField
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
    end
    object dtEstadoSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object dtEstadoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtEstadoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspEstado: TDataSetProvider
    DataSet = dtEstado
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 72
  end
  object Estado: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_ESTADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstado'
    BeforeInsert = EstadoBeforeInsert
    BeforePost = EstadoBeforePost
    BeforeDelete = EstadoBeforeDelete
    OnReconcileError = EstadoReconcileError
    Left = 144
    Top = 72
    object EstadoID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EstadoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object EstadoDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object EstadoICMS: TFloatField
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',##0.00'
    end
    object EstadoSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object EstadoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object EstadoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object Qsql: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados
    Left = 128
    Top = 8
  end
  object dtCidade: TSQLDataSet
    CommandText = 
      'select '#13#10'CID.CEP, '#13#10'CID.COD_CIDADE, '#13#10'CID.COD_EMPRESA, '#13#10'CID.DES' +
      'C_CIDADE, '#13#10'CID.ID_ESTADO, '#13#10'CID.USU_ALT, '#13#10'CID.USU_INC ,'#13#10'EST.S' +
      'IGLA,'#13#10'EST.DESC_ESTADO'#13#10'from CIDADE CID'#13#10' left join ESTADO EST o' +
      'n CID.ID_ESTADO = EST.ID_ESTADO'#13#10' where CID.COD_EMPRESA = :COD_E' +
      'MPRESA'#13#10' and CID.DESC_CIDADE like :DESC_CIDADE'#13#10' order by CID.DE' +
      'SC_CIDADE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_CIDADE'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 120
    object dtCidadeCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtCidadeCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dtCidadeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCidadeDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dtCidadeID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCidadeUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtCidadeUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtCidadeDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      ProviderFlags = []
      Size = 50
    end
    object dtCidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
  end
  object Cidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_CIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspCidade'
    BeforeInsert = CidadeBeforeInsert
    BeforePost = CidadeBeforePost
    BeforeDelete = CidadeBeforeDelete
    OnReconcileError = CidadeReconcileError
    Left = 144
    Top = 120
    object CidadeCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object CidadeCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object CidadeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CidadeDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object CidadeID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Required = True
    end
    object CidadeUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object CidadeUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object CidadeDESC_ESTADO: TStringField
      FieldName = 'DESC_ESTADO'
      Size = 50
    end
    object CidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = dtCidade
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 120
  end
  object dtCliente: TSQLDataSet
    CommandText = 
      'select '#13#10'CLI.BAIRRO, '#13#10'CLI.CEP, '#13#10'CLI.CNPJ, '#13#10'CLI.COD_CIDADE, '#13#10 +
      'CLI.COD_CLIENTE, '#13#10'CLI.COD_CONDICAO, '#13#10'CLI.COD_EMPRESA, '#13#10'CLI.CO' +
      'D_PAGTO, '#13#10'CLI.COMPLEMENTO, '#13#10'CLI.CPF, '#13#10'CLI.DATA_CADASTRO,'#13#10'CLI' +
      '.ENDERECO, '#13#10'CLI.EMAIL,'#13#10'CLI.FANTASIA, '#13#10'CLI.FAX, '#13#10'CLI.FONE, '#13#10 +
      'CLI.INSC_ESTADUAL, '#13#10'CLI.NOME, '#13#10'CLI.NUMERO, '#13#10'CLI.OBS, '#13#10'CLI.RG' +
      ', '#13#10'CLI.TIPO_PESSOA, '#13#10'CLI.USU_ALT, '#13#10'CLI.USU_INC ,'#13#10'CLI.DATA_AB' +
      'ERTURA ,'#13#10'CLI.COMPRADOR  ,'#13#10'CLI.NUM_FUNC  ,'#13#10'CLI.NOME_ANTERIOR ,' +
      #13#10'CLI.END_PAGAMENTO ,'#13#10'CLI.END_ENTREGA ,'#13#10'CLI.PREDIO_PROPRIO ,'#13#10 +
      'CLI.VALOR_ALUGUEL ,'#13#10'CLI.SEGMENTO ,'#13#10'CLI.CATEGORIA ,'#13#10'CLI.CLASSI' +
      'FICACAO ,'#13#10'CLI.QTDE_COMPRA_SEMANA ,'#13#10'CLI.DIAS_APRAZO ,'#13#10'CLI.VALO' +
      'R_PEDIDO, '#13#10'CLI.FICHA_CADASTRAL ,'#13#10'CLI.CARTAO_CADASTRAL  ,'#13#10'CLI.' +
      'CONTRATO_SOCIAL ,'#13#10'CLI.DOC_PROPRIETARIO,'#13#10'CLI.TIPO_FICHA ,'#13#10'CLI.' +
      'CONSUMO_MENSAL,'#13#10'CLI.MARCAR,'#13#10'CLI.COD_VENDEDOR,'#13#10'FORMA.DESC_PAGT' +
      'O,'#13#10'CID.DESC_CIDADE,'#13#10'CID.CEP AS CEP_CIDADE,'#13#10'EST.SIGLA,'#13#10'CON.DE' +
      'SC_CONDICAO,'#13#10'VEN.NOME AS VEN_NOME'#13#10'from CLIENTE CLI'#13#10#13#10' left jo' +
      'in CIDADE CID on CLI.COD_CIDADE = CID.COD_CIDADE'#13#10#13#10' left join C' +
      'ONDICAO CON on CLI.COD_CONDICAO = CON.COD_CONDICAO '#13#10#13#10' left joi' +
      'n FORMA_PAGTO FORMA on CLI.COD_PAGTO = FORMA.COD_PAGTO'#13#10#13#10' left ' +
      'join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'#13#10' left join VEN' +
      'DEDOR VEN on CLI.COD_VENDEDOR = VEN.COD_VENDEDOR'#13#10#13#10' where CLI.C' +
      'OD_EMPRESA = :COD_EMPRESA'#13#10' and CLI.NOME like :NOME'#13#10' order by N' +
      'OME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 168
    object dtClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtClienteCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dtClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dtClienteCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtClienteCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtClienteCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dtClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtClienteFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtClienteFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtClienteINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dtClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dtClienteOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object dtClienteRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtClienteUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtClienteUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtClienteDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      ProviderFlags = []
      Size = 30
    end
    object dtClienteDESC_CONDICAO: TStringField
      FieldName = 'DESC_CONDICAO'
      ProviderFlags = []
      Size = 50
    end
    object dtClienteDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtClienteCEP_CIDADE: TStringField
      FieldName = 'CEP_CIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object dtClienteSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtClienteDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object dtClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object dtClienteDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtClienteNUM_FUNC: TIntegerField
      FieldName = 'NUM_FUNC'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteNOME_ANTERIOR: TStringField
      FieldName = 'NOME_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtClienteEND_PAGAMENTO: TStringField
      FieldName = 'END_PAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtClienteEND_ENTREGA: TStringField
      FieldName = 'END_ENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtClientePREDIO_PROPRIO: TStringField
      FieldName = 'PREDIO_PROPRIO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtClienteVALOR_ALUGUEL: TFloatField
      FieldName = 'VALOR_ALUGUEL'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dtClienteCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dtClienteCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dtClienteQTDE_COMPRA_SEMANA: TFloatField
      FieldName = 'QTDE_COMPRA_SEMANA'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteDIAS_APRAZO: TIntegerField
      FieldName = 'DIAS_APRAZO'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteFICHA_CADASTRAL: TStringField
      FieldName = 'FICHA_CADASTRAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtClienteCARTAO_CADASTRAL: TStringField
      FieldName = 'CARTAO_CADASTRAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtClienteCONTRATO_SOCIAL: TStringField
      FieldName = 'CONTRATO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtClienteDOC_PROPRIETARIO: TStringField
      FieldName = 'DOC_PROPRIETARIO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtClienteTIPO_FICHA: TStringField
      FieldName = 'TIPO_FICHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtClienteCONSUMO_MENSAL: TFloatField
      FieldName = 'CONSUMO_MENSAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteMARCAR: TStringField
      FieldName = 'MARCAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtClienteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dtClienteVEN_NOME: TStringField
      FieldName = 'VEN_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object dtEmpresa: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select '#13#10'BAIRRO, '#13#10'CEP, '#13#10'CNPJ, '#13#10'COD_EMPRESA, '#13#10'DESC_CIDADE, '#13#10 +
      'EMAIL, '#13#10'ENDERECO, '#13#10'ESTADO, '#13#10'FAX, '#13#10'FONE, '#13#10'INSC_ESTADUAL, '#13#10'N' +
      'OME, '#13#10'NUMERO, '#13#10'USU_ALT, '#13#10'USU_INC,'#13#10'VERSAO'#13#10'from EMPRESA'#13#10' whe' +
      're COD_EMPRESA = :COD_EMPRESA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 216
    object dtEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtEmpresaCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dtEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dtEmpresaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dtEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtEmpresaESTADO: TStringField
      FieldName = 'ESTADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dtEmpresaFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtEmpresaFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtEmpresaINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtEmpresaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dtEmpresaNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dtEmpresaUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtEmpresaUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtEmpresaVERSAO: TStringField
      FieldName = 'VERSAO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
  end
  object dtCad_Usuario: TSQLDataSet
    CommandText = 
      'select COD_EMPRESA, GERENTE, NOME, SENHA, USU_ALT, ID_USUARIO, U' +
      'SU_INC from CAD_USUARIO'#13#10' where COD_EMPRESA = :COD_EMPRESA'#13#10' and' +
      ' NOME like :NOME'#13#10' order by NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 264
    object dtCad_UsuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtCad_UsuarioNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCad_UsuarioCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInKey]
      Required = True
    end
    object dtCad_UsuarioGERENTE: TStringField
      FieldName = 'GERENTE'
      ProviderFlags = [pfInUpdate, pfInKey]
      FixedChar = True
      Size = 1
    end
    object dtCad_UsuarioSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate, pfInKey]
      FixedChar = True
    end
    object dtCad_UsuarioUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate, pfInKey]
      Size = 30
    end
    object dtCad_UsuarioUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate, pfInKey]
      Size = 30
    end
  end
  object dtPermissao: TSQLDataSet
    CommandText = 
      'select ALT, COD_EMPRESA, CON, EXC, ID_PER, INC, NOME, TABELA, US' +
      'U_ALT, USU_INC from PERMISSAO'#13#10' where COD_EMPRESA = :COD_EMPRESA' +
      #13#10' and NOME = :NOME'#13#10' order by NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 312
    object dtPermissaoID_PER: TIntegerField
      FieldName = 'ID_PER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtPermissaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtPermissaoTABELA: TStringField
      FieldName = 'TABELA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtPermissaoALT: TStringField
      FieldName = 'ALT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtPermissaoCON: TStringField
      FieldName = 'CON'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtPermissaoEXC: TStringField
      FieldName = 'EXC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtPermissaoINC: TStringField
      FieldName = 'INC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtPermissaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
    end
    object dtPermissaoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtPermissaoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dtFornecedor: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select '#13#10'FO.*,'#13#10'CI.DESC_CIDADE,'#13#10'ES.SIGLA,'#13#10'TP.desc_tipo'#13#10'from F' +
      'ORNECEDOR FO'#13#10' left join CIDADE CI on FO.COD_CIDADE = CI.COD_CID' +
      'ADE'#13#10' left join ESTADO ES on CI.ID_ESTADO = ES.ID_ESTADO'#13#10' left ' +
      'join forn_tipo_empresa TP on FO.id_tipo_empresa = TP.id_tipo'#13#10' w' +
      'here FO.COD_EMPRESA = :COD_EMPRESA'#13#10' and FO.NOME like :NOME'#13#10' or' +
      'der by NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 360
    object dtFornecedorCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtFornecedorCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dtFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dtFornecedorCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtFornecedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dtFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtFornecedorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtFornecedorFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtFornecedorFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtFornecedorINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtFornecedorNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dtFornecedorNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dtFornecedorOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object dtFornecedorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtFornecedorUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtFornecedorDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtFornecedorSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtFornecedorNUM_BANCO: TStringField
      FieldName = 'NUM_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dtFornecedorNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtFornecedorNUM_AGENCIA: TStringField
      FieldName = 'NUM_AGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dtFornecedorNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dtFornecedorNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtFornecedorCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dtFornecedorNOME_DESPOSITANTE: TStringField
      FieldName = 'NOME_DESPOSITANTE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtFornecedorMARCAR: TStringField
      FieldName = 'MARCAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtFornecedorID_TIPO_EMPRESA: TIntegerField
      FieldName = 'ID_TIPO_EMPRESA'
      ProviderFlags = [pfInUpdate]
    end
    object dtFornecedorDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      ProviderFlags = []
      Size = 50
    end
  end
  object dtContato: TSQLDataSet
    CommandText = 
      'select '#13#10'CODIGO, '#13#10'COD_EMPRESA, '#13#10'CONTATO, '#13#10'DATANASC,'#13#10'EMAIL, '#13 +
      #10'FAX, '#13#10'FONE, '#13#10'SEQ, '#13#10'TIPO, '#13#10'USU_ALT, '#13#10'USU_INC '#13#10'from CONTATO' +
      #13#10' where CODIGO = :CODIGO'#13#10' and TIPO = :TIPO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIPO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 408
    object dtContatoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtContatoSEQ: TIntegerField
      FieldName = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtContatoTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtContatoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtContatoCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dtContatoFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
    end
    object dtContatoFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
    end
    object dtContatoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtContatoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtContatoDATANASC: TDateField
      FieldName = 'DATANASC'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtCondicao: TSQLDataSet
    CommandText = 
      'select COD_CONDICAO, COD_EMPRESA, DESC_CONDICAO, USU_ALT, USU_IN' +
      'C from CONDICAO'#13#10' where COD_EMPRESA = :COD_EMPRESA'#13#10' and DESC_CO' +
      'NDICAO like :DESC_CONDICAO'#13#10' order by DESC_CONDICAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_CONDICAO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 456
    object dtCondicaoCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtCondicaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCondicaoDESC_CONDICAO: TStringField
      FieldName = 'DESC_CONDICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dtCondicaoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtCondicaoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dtItens_Condicao: TSQLDataSet
    CommandText = 
      'select COD_CONDICAO, COD_EMPRESA, DIAS, SEQ, SEQUENCIA, USU_ALT,' +
      ' USU_INC from ITENS_CONDICAO'#13#10' where COD_CONDICAO = :COD_CONDICA' +
      'O'#13#10' order by DIAS'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CONDICAO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 24
    Top = 504
    object dtItens_CondicaoCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtItens_CondicaoSEQ: TIntegerField
      FieldName = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtItens_CondicaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object dtItens_CondicaoDIAS: TIntegerField
      FieldName = 'DIAS'
      Required = True
    end
    object dtItens_CondicaoSEQUENCIA: TStringField
      FieldName = 'SEQUENCIA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object dtItens_CondicaoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object dtItens_CondicaoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
  end
  object dtForma_Pagto: TSQLDataSet
    CommandText = 
      'select COD_EMPRESA, COD_PAGTO, DESC_PAGTO, SIGLA, USU_ALT, USU_I' +
      'NC from FORMA_PAGTO'#13#10' where COD_EMPRESA = :COD_EMPRESA'#13#10' and DES' +
      'C_PAGTO like :DESC_PAGTO'#13#10' order by DESC_PAGTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_PAGTO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 72
    object dtForma_PagtoCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtForma_PagtoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtForma_PagtoDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object dtForma_PagtoSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object dtForma_PagtoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtForma_PagtoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dtGrupo: TSQLDataSet
    CommandText = 
      'select COD_EMPRESA, COD_GRUPO, DESC_GRUPO, USU_ALT, USU_INC from' +
      ' GRUPO'#13#10' where COD_EMPRESA = :COD_EMPRESA'#13#10' and DESC_GRUPO like ' +
      ':DESC_GRUPO'#13#10' order by  DESC_GRUPO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_GRUPO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 120
    object dtGrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtGrupoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtGrupoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object dtGrupoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtGrupoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dtUnidade: TSQLDataSet
    CommandText = 
      'select '#13#10'    un.COD_EMPRESA,'#13#10'    un.DESC_UNIDADE, '#13#10'    un.ID_U' +
      'NIDADE, '#13#10'    un.SIGLA, '#13#10'    un.FATOR_CONVERSAO,'#13#10'    un.ID_TEX' +
      'TO,'#13#10'    un.COMPL_UNIDADE,'#13#10'    un.USU_ALT, '#13#10'    un.USU_INC,'#13#10' ' +
      '   unt.observacao'#13#10#13#10'from UNIDADE un'#13#10'    LEFT JOIN unidade_text' +
      'o unt ON un.id_texto = unt.id'#13#10'    where un.COD_EMPRESA = :COD_E' +
      'MPRESA'#13#10'    and  un.DESC_UNIDADE like :DESC_UNIDADE'#13#10'    order b' +
      'y  un.DESC_UNIDADE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_UNIDADE'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 168
    object dtUnidadeID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtUnidadeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtUnidadeDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object dtUnidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 5
    end
    object dtUnidadeUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtUnidadeUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtUnidadeFATOR_CONVERSAO: TFMTBCDField
      FieldName = 'FATOR_CONVERSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object dtUnidadeID_TEXTO: TIntegerField
      FieldName = 'ID_TEXTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtUnidadeCOMPL_UNIDADE: TStringField
      FieldName = 'COMPL_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtUnidadeOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = []
      Size = 30
    end
  end
  object dtProduto: TSQLDataSet
    CommandText = 
      'select '#13#10'PRO.COD_EMPRESA, '#13#10'PRO.COD_GRUPO, '#13#10'PRO.COD_PRODUTO, '#13#10 +
      'PRO.DESC_PRODUTO, '#13#10'PRO.ID_UNIDADE, '#13#10'PRO.REFERENCIA, '#13#10'PRO.USU_' +
      'ALT, '#13#10'PRO.USU_INC, '#13#10'PRO.VALOR_VENDA,'#13#10'GRU.DESC_GRUPO,'#13#10'UNI.SIG' +
      'LA'#13#10'from PRODUTO PRO'#13#10' left join GRUPO GRU on PRO.COD_GRUPO = GR' +
      'U.COD_GRUPO'#13#10' left join UNIDADE UNI on PRO.ID_UNIDADE = UNI.ID_U' +
      'NIDADE'#13#10' where PRO.COD_EMPRESA = :COD_EMPRESA'#13#10' and PRO.DESC_PRO' +
      'DUTO like :DESC_PRODUTO'#13#10' order by PRO.DESC_PRODUTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 216
    object dtProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtProdutoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtProdutoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object dtProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtProdutoID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtProdutoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtProdutoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtProdutoVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dtProdutoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      ProviderFlags = []
      Size = 40
    end
    object dtProdutoSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 5
    end
  end
  object dtPedido: TSQLDataSet
    CommandText = 
      'select '#13#10'PED.COD_CLIENTE, '#13#10'PED.COD_EMPRESA, '#13#10'PED.COD_FOR, '#13#10'PE' +
      'D.DATA,'#13#10'PED.IMP_LOGO,'#13#10'PED.NUM_CARGA,'#13#10'PED.NUM_PEDIDO, '#13#10'PED.PE' +
      'RC_DESCONTO, '#13#10'PED.SITUACAO, '#13#10'PED.TOTAL_BRUTO, '#13#10'PED.TOTAL_LIQU' +
      'IDO, '#13#10'PED.USU_ALT, '#13#10'PED.TOTAL_QTDE,'#13#10'PED.USU_INC, '#13#10'PED.VALOR_' +
      'DESCONTO ,'#13#10'PED.OBS,'#13#10'PED.COD_CONTATO, '#13#10'PED.ENCERRADO, '#13#10'PED.PE' +
      'RC_COMISSAO, '#13#10'PED.TOTAL_LUCRO, '#13#10'PED.VALOR_LUCRO,'#13#10'PED.TOTAL_VE' +
      'NDA,'#13#10'PED.COD_VENDEDOR,'#13#10'PED.TOTAL_COMISSAO,'#13#10'PED.VALOR_COMISSAO' +
      ','#13#10'PED.COD_USINA,'#13#10'CLI.NOME,'#13#10'VEN.NOME AS NOME_VENDEDOR,'#13#10'FO.NOM' +
      'E AS NOME_FOR,'#13#10'USI.NOME AS NOME_USINA'#13#10#13#10'from PEDIDO PED'#13#10' inne' +
      'r join CLIENTE CLI on PED.COD_CLIENTE = CLI.COD_CLIENTE'#13#10#13#10' left' +
      ' join FORNECEDOR FO on PED.COD_FOR = FO.COD_FOR'#13#10' left join FORN' +
      'ECEDOR USI on PED.COD_USINA = USI.COD_FOR'#13#10' left join VENDEDOR V' +
      'EN on PED.COD_VENDEDOR = VEN.COD_VENDEDOR'#13#10' '#13#10' where PED.COD_EMP' +
      'RESA = :COD_EMPRESA'#13#10' and PED.NUM_PEDIDO = :NUM_PEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 264
    object dtPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtPedidoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtPedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtPedidoCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtPedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtPedidoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtPedidoTOTAL_BRUTO: TFloatField
      FieldName = 'TOTAL_BRUTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoTOTAL_LIQUIDO: TFloatField
      FieldName = 'TOTAL_LIQUIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtPedidoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtPedidoVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 60
    end
    object dtPedidoNOME_FOR: TStringField
      FieldName = 'NOME_FOR'
      ProviderFlags = []
      Size = 60
    end
    object dtPedidoOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object dtPedidoCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtPedidoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoTOTAL_LUCRO: TFloatField
      FieldName = 'TOTAL_LUCRO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoTOTAL_QTDE: TFloatField
      FieldName = 'TOTAL_QTDE'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoVALOR_LUCRO: TFloatField
      FieldName = 'VALOR_LUCRO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoIMP_LOGO: TStringField
      FieldName = 'IMP_LOGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtPedidoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      ProviderFlags = []
      Size = 50
    end
    object dtPedidoTOTAL_COMISSAO: TFloatField
      FieldName = 'TOTAL_COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoVALOR_COMISSAO: TFloatField
      FieldName = 'VALOR_COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoCOD_USINA: TIntegerField
      FieldName = 'COD_USINA'
      ProviderFlags = [pfInUpdate]
    end
    object dtPedidoNOME_USINA: TStringField
      FieldName = 'NOME_USINA'
      ProviderFlags = []
      Size = 60
    end
  end
  object dtTabela_Prazo: TSQLDataSet
    CommandText = 
      'select '#13#10'TAB.COD_CONDICAO, '#13#10'TAB.COD_PAGTO, '#13#10'TAB.NUM_PEDIDO, '#13#10 +
      'TAB.SEQ, '#13#10'TAB.SEQUENCIA,'#13#10'TAB.DIAS,'#13#10'TAB.USU_ALT, '#13#10'TAB.USU_INC' +
      ','#13#10'FO.DESC_PAGTO'#13#10'from TABELA_PRAZO TAB'#13#10' left join FORMA_PAGTO ' +
      'FO on TAB.COD_PAGTO = FO.COD_PAGTO'#13#10' where TAB.NUM_PEDIDO = :NUM' +
      '_PEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 360
    object dtTabela_PrazoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtTabela_PrazoSEQ: TIntegerField
      FieldName = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtTabela_PrazoCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtTabela_PrazoCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtTabela_PrazoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTabela_PrazoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTabela_PrazoDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      ProviderFlags = []
      Size = 30
    end
    object dtTabela_PrazoSEQUENCIA: TStringField
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object dtTabela_PrazoDIAS: TIntegerField
      FieldName = 'DIAS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtItensPedido: TSQLDataSet
    CommandText = 
      'select '#13#10'ITE.COD_PRODUTO, '#13#10'ITE.ID_UNIDADE, '#13#10'ITE.NUM_PEDIDO, '#13#10 +
      'ITE.COD_EMPRESA,'#13#10'ITE.QTDE, '#13#10'ITE.SEQ, '#13#10'ITE.USU_ALT, '#13#10'ITE.USU_' +
      'INC, '#13#10'ITE.VALOR, '#13#10'ITE.PRECO_VENDA, '#13#10'ITE.VALOR_LUCRO,'#13#10'ITE.VAL' +
      'OR_TOTAL,'#13#10'ITE.TOTAL_VENDA,'#13#10'ITE.TOTAL_LUCRO,'#13#10'PRO.DESC_PRODUTO,' +
      #13#10'UNI.SIGLA'#13#10'from ITENS_PEDIDO ITE'#13#10#13#10' inner join PRODUTO PRO on' +
      #13#10' ITE.COD_PRODUTO = PRO.COD_PRODUTO'#13#10#13#10' left join UNIDADE UNI o' +
      'n '#13#10' ITE.ID_UNIDADE = UNI.ID_UNIDADE'#13#10' where NUM_PEDIDO = :NUMPE' +
      'DIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 312
    object dtItensPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtItensPedidoSEQ: TIntegerField
      FieldName = 'SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtItensPedidoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtItensPedidoID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtItensPedidoQTDE: TFloatField
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
    end
    object dtItensPedidoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtItensPedidoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtItensPedidoVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
    end
    object dtItensPedidoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtItensPedidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      ProviderFlags = []
      Size = 50
    end
    object dtItensPedidoSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 5
    end
    object dtItensPedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
    end
    object dtItensPedidoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dtItensPedidoVALOR_LUCRO: TFloatField
      FieldName = 'VALOR_LUCRO'
      ProviderFlags = [pfInUpdate]
    end
    object dtItensPedidoTOTAL_LUCRO: TFloatField
      FieldName = 'TOTAL_LUCRO'
      ProviderFlags = [pfInUpdate]
    end
    object dtItensPedidoTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtContas: TSQLDataSet
    CommandText = 
      'select '#13#10'COD_CLIENTE, '#13#10'COD_CONDICAO, '#13#10'COD_EMPRESA, '#13#10'COD_FOR, ' +
      #13#10'COD_PAGTO, '#13#10'DATA_EMISSAO, '#13#10'DATA_PAGO, '#13#10'DATA_VENCTO, '#13#10'DIAS,' +
      ' '#13#10'DOCUMENTO, '#13#10'ID_CONTA, '#13#10'ID_CONTABANCO,'#13#10'ID_PEDIDO,'#13#10'NUM_PEDI' +
      'DO, '#13#10'SEQ_CONTA, '#13#10'SITUACAO, '#13#10'TIPO_CONTA, '#13#10'USU_ALT, '#13#10'USU_INC,' +
      ' '#13#10'VALOR_ORIGINAL, '#13#10'VALOR_PAGAR, '#13#10'VALOR_PAGO,'#13#10'exportar_net'#13#10'f' +
      'rom CONTAS'#13#10' where ID_CONTA = :ID_CONTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTA'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 408
    object dtContasID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtContasNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtContasCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtContasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasDATA_PAGO: TSQLTimeStampField
      FieldName = 'DATA_PAGO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasDATA_VENCTO: TSQLTimeStampField
      FieldName = 'DATA_VENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasDIAS: TIntegerField
      FieldName = 'DIAS'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasSEQ_CONTA: TIntegerField
      FieldName = 'SEQ_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtContasTIPO_CONTA: TIntegerField
      FieldName = 'TIPO_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtContasUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtContasVALOR_ORIGINAL: TFloatField
      FieldName = 'VALOR_ORIGINAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasVALOR_PAGAR: TFloatField
      FieldName = 'VALOR_PAGAR'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasID_CONTABANCO: TIntegerField
      FieldName = 'ID_CONTABANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dtContasEXPORTAR_NET: TStringField
      FieldName = 'EXPORTAR_NET'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspForma_Pagto: TDataSetProvider
    DataSet = dtForma_Pagto
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 72
  end
  object Forma_Pagto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_PAGTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspForma_Pagto'
    BeforeInsert = Forma_PagtoBeforeInsert
    BeforePost = Forma_PagtoBeforePost
    BeforeDelete = Forma_PagtoBeforeDelete
    OnReconcileError = Forma_PagtoReconcileError
    Left = 408
    Top = 72
    object Forma_PagtoCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
      Required = True
    end
    object Forma_PagtoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object Forma_PagtoDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      Required = True
      Size = 30
    end
    object Forma_PagtoSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 10
    end
    object Forma_PagtoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object Forma_PagtoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = dtGrupo
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 120
  end
  object Grupo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_GRUPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspGrupo'
    BeforeInsert = GrupoBeforeInsert
    BeforePost = GrupoBeforePost
    BeforeDelete = GrupoBeforeDelete
    OnReconcileError = GrupoReconcileError
    Left = 408
    Top = 120
    object GrupoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
      Required = True
    end
    object GrupoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object GrupoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 40
    end
    object GrupoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object GrupoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
  end
  object dspUnidade: TDataSetProvider
    DataSet = dtUnidade
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 168
  end
  object Unidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_UNIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspUnidade'
    BeforeInsert = UnidadeBeforeInsert
    BeforePost = UnidadeBeforePost
    BeforeDelete = UnidadeBeforeDelete
    OnNewRecord = UnidadeNewRecord
    OnReconcileError = UnidadeReconcileError
    Left = 408
    Top = 168
    object UnidadeID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object UnidadeCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object UnidadeDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Required = True
      Size = 40
    end
    object UnidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object UnidadeUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object UnidadeUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object UnidadeFATOR_CONVERSAO: TFMTBCDField
      FieldName = 'FATOR_CONVERSAO'
      DisplayFormat = ',##0.00000'
      Precision = 18
      Size = 6
    end
    object UnidadeID_TEXTO: TIntegerField
      FieldName = 'ID_TEXTO'
    end
    object UnidadeCOMPL_UNIDADE: TStringField
      FieldName = 'COMPL_UNIDADE'
      Size = 30
    end
    object UnidadeOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 30
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = dtEmpresa
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 216
  end
  object Empresa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEmpresa'
    BeforeInsert = EmpresaBeforeInsert
    BeforePost = EmpresaBeforePost
    BeforeDelete = EmpresaBeforeDelete
    OnReconcileError = EmpresaReconcileError
    Left = 144
    Top = 216
    object EmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object EmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object EmpresaCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object EmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
    object EmpresaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 40
    end
    object EmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object EmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object EmpresaESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object EmpresaFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object EmpresaFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object EmpresaINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object EmpresaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object EmpresaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object EmpresaUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object EmpresaUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object EmpresaVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = dtProduto
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 216
  end
  object Produto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_PRODUTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProduto'
    BeforeInsert = ProdutoBeforeInsert
    BeforePost = ProdutoBeforePost
    BeforeDelete = ProdutoBeforeDelete
    OnReconcileError = ProdutoReconcileError
    Left = 408
    Top = 216
    object ProdutoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ProdutoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object ProdutoCOD_GRUPO: TIntegerField
      FieldName = 'COD_GRUPO'
    end
    object ProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 50
    end
    object ProdutoID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object ProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object ProdutoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object ProdutoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object ProdutoVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
      DisplayFormat = ',##0.00'
    end
    object ProdutoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Size = 40
    end
    object ProdutoSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
  end
  object dspCad_Usuario: TDataSetProvider
    DataSet = dtCad_Usuario
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 264
  end
  object Cad_Usuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspCad_Usuario'
    BeforeInsert = Cad_UsuarioBeforeInsert
    BeforePost = Cad_UsuarioBeforePost
    BeforeDelete = Cad_UsuarioBeforeDelete
    OnNewRecord = Cad_UsuarioNewRecord
    OnReconcileError = Cad_UsuarioReconcileError
    Left = 144
    Top = 264
    object Cad_UsuarioNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object Cad_UsuarioCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object Cad_UsuarioGERENTE: TStringField
      FieldName = 'GERENTE'
      FixedChar = True
      Size = 1
    end
    object Cad_UsuarioSENHA: TStringField
      FieldName = 'SENHA'
      FixedChar = True
    end
    object Cad_UsuarioUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object Cad_UsuarioUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object Cad_UsuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = dtCliente
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 168
  end
  object Cliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspCliente'
    BeforeInsert = ClienteBeforeInsert
    BeforePost = ClienteBeforePost
    BeforeDelete = ClienteBeforeDelete
    OnNewRecord = ClienteNewRecord
    OnReconcileError = ClienteReconcileError
    Left = 144
    Top = 168
    object ClienteCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object ClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object ClienteCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object ClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
    object ClienteCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object ClienteCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
    end
    object ClienteCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object ClienteCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
    end
    object ClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object ClienteCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object ClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object ClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object ClienteFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object ClienteFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object ClienteINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object ClienteNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object ClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object ClienteOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object ClienteRG: TStringField
      FieldName = 'RG'
    end
    object ClienteTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ClienteUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object ClienteUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object ClienteDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      Size = 30
    end
    object ClienteDESC_CONDICAO: TStringField
      FieldName = 'DESC_CONDICAO'
      Size = 50
    end
    object ClienteDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object ClienteCEP_CIDADE: TStringField
      FieldName = 'CEP_CIDADE'
      FixedChar = True
      Size = 8
    end
    object ClienteSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
    object ClienteDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      EditMask = '##/##/####'
    end
    object ClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 500
    end
    object ClienteDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
      EditMask = '##/##/####'
    end
    object ClienteCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      Size = 40
    end
    object ClienteNUM_FUNC: TIntegerField
      FieldName = 'NUM_FUNC'
    end
    object ClienteNOME_ANTERIOR: TStringField
      FieldName = 'NOME_ANTERIOR'
      Size = 50
    end
    object ClienteEND_PAGAMENTO: TStringField
      FieldName = 'END_PAGAMENTO'
      Size = 50
    end
    object ClienteEND_ENTREGA: TStringField
      FieldName = 'END_ENTREGA'
      Size = 50
    end
    object ClientePREDIO_PROPRIO: TStringField
      FieldName = 'PREDIO_PROPRIO'
      FixedChar = True
      Size = 1
    end
    object ClienteVALOR_ALUGUEL: TFloatField
      FieldName = 'VALOR_ALUGUEL'
      DisplayFormat = ',##0.00'
    end
    object ClienteSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      FixedChar = True
      Size = 5
    end
    object ClienteCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 5
    end
    object ClienteCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      FixedChar = True
      Size = 5
    end
    object ClienteQTDE_COMPRA_SEMANA: TFloatField
      FieldName = 'QTDE_COMPRA_SEMANA'
    end
    object ClienteDIAS_APRAZO: TIntegerField
      FieldName = 'DIAS_APRAZO'
    end
    object ClienteVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
      DisplayFormat = ',##0.00'
    end
    object ClienteFICHA_CADASTRAL: TStringField
      FieldName = 'FICHA_CADASTRAL'
      FixedChar = True
      Size = 1
    end
    object ClienteCARTAO_CADASTRAL: TStringField
      FieldName = 'CARTAO_CADASTRAL'
      FixedChar = True
      Size = 1
    end
    object ClienteCONTRATO_SOCIAL: TStringField
      FieldName = 'CONTRATO_SOCIAL'
      FixedChar = True
      Size = 1
    end
    object ClienteDOC_PROPRIETARIO: TStringField
      FieldName = 'DOC_PROPRIETARIO'
      FixedChar = True
      Size = 1
    end
    object ClienteTIPO_FICHA: TStringField
      FieldName = 'TIPO_FICHA'
      FixedChar = True
      Size = 1
    end
    object ClienteCONSUMO_MENSAL: TFloatField
      FieldName = 'CONSUMO_MENSAL'
      DisplayFormat = ',##0.00'
    end
    object ClienteMARCAR: TStringField
      FieldName = 'MARCAR'
      FixedChar = True
      Size = 1
    end
    object ClienteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object ClienteVEN_NOME: TStringField
      FieldName = 'VEN_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object dspContato: TDataSetProvider
    DataSet = dtContato
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 408
  end
  object Contato: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspContato'
    BeforeInsert = ContatoBeforeInsert
    BeforePost = ContatoBeforePost
    BeforeDelete = ContatoBeforeDelete
    OnReconcileError = ContatoReconcileError
    Left = 144
    Top = 408
    object ContatoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ContatoSEQ: TIntegerField
      FieldName = 'SEQ'
      Required = True
    end
    object ContatoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ContatoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object ContatoCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 40
    end
    object ContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object ContatoFAX: TStringField
      FieldName = 'FAX'
    end
    object ContatoFONE: TStringField
      FieldName = 'FONE'
    end
    object ContatoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object ContatoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object ContatoDATANASC: TDateField
      FieldName = 'DATANASC'
      EditMask = '##/##/####'
    end
    object ContatoC_ITEM: TAggregateField
      FieldName = 'C_ITEM'
      Active = True
      DisplayName = ''
      Expression = 'max(SEQ)'
    end
  end
  object Fornecedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspFornecedor'
    BeforeInsert = FornecedorBeforeInsert
    BeforePost = FornecedorBeforePost
    BeforeDelete = FornecedorBeforeDelete
    OnReconcileError = FornecedorReconcileError
    Left = 144
    Top = 360
    object FornecedorCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object FornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object FornecedorCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object FornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
    object FornecedorCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Required = True
    end
    object FornecedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object FornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object FornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object FornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object FornecedorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object FornecedorFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object FornecedorFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object FornecedorINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object FornecedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object FornecedorNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object FornecedorOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object FornecedorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object FornecedorUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object FornecedorDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object FornecedorSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
    object FornecedorNUM_BANCO: TStringField
      FieldName = 'NUM_BANCO'
    end
    object FornecedorNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 50
    end
    object FornecedorNUM_AGENCIA: TStringField
      FieldName = 'NUM_AGENCIA'
    end
    object FornecedorNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
    end
    object FornecedorNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 50
    end
    object FornecedorCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object FornecedorNOME_DESPOSITANTE: TStringField
      FieldName = 'NOME_DESPOSITANTE'
      Size = 50
    end
    object FornecedorMARCAR: TStringField
      FieldName = 'MARCAR'
      FixedChar = True
      Size = 1
    end
    object FornecedorID_TIPO_EMPRESA: TIntegerField
      FieldName = 'ID_TIPO_EMPRESA'
    end
    object FornecedorDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspFornecedor: TDataSetProvider
    DataSet = dtFornecedor
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 360
  end
  object dspCondicao: TDataSetProvider
    DataSet = dtCondicao
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 456
  end
  object Condicao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_CONDICAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCondicao'
    BeforeInsert = CondicaoBeforeInsert
    BeforePost = CondicaoBeforePost
    BeforeDelete = CondicaoBeforeDelete
    OnReconcileError = CondicaoReconcileError
    Left = 144
    Top = 456
    object CondicaoCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      Required = True
    end
    object CondicaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object CondicaoDESC_CONDICAO: TStringField
      FieldName = 'DESC_CONDICAO'
      Required = True
      Size = 50
    end
    object CondicaoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object CondicaoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
  end
  object dspItens_Condicao: TDataSetProvider
    DataSet = dtItens_Condicao
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 504
  end
  object Itens_Condicao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CONDICAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItens_Condicao'
    BeforePost = Itens_CondicaoBeforePost
    OnReconcileError = Itens_CondicaoReconcileError
    Left = 144
    Top = 504
    object Itens_CondicaoCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      Required = True
    end
    object Itens_CondicaoSEQ: TIntegerField
      FieldName = 'SEQ'
      Required = True
    end
    object Itens_CondicaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object Itens_CondicaoDIAS: TIntegerField
      FieldName = 'DIAS'
      Required = True
    end
    object Itens_CondicaoSEQUENCIA: TStringField
      FieldName = 'SEQUENCIA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Itens_CondicaoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object Itens_CondicaoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object Itens_CondicaoC_TOTITENS: TAggregateField
      FieldName = 'C_TOTITENS'
      Active = True
      DisplayName = ''
      Expression = 'max(SEQ)'
    end
  end
  object dspPermissao: TDataSetProvider
    DataSet = dtPermissao
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 312
  end
  object Permissao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspPermissao'
    BeforePost = PermissaoBeforePost
    Left = 144
    Top = 312
    object PermissaoID_PER: TIntegerField
      FieldName = 'ID_PER'
      Required = True
    end
    object PermissaoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object PermissaoTABELA: TStringField
      FieldName = 'TABELA'
      Size = 40
    end
    object PermissaoALT: TStringField
      FieldName = 'ALT'
      FixedChar = True
      Size = 1
    end
    object PermissaoCON: TStringField
      FieldName = 'CON'
      FixedChar = True
      Size = 1
    end
    object PermissaoEXC: TStringField
      FieldName = 'EXC'
      FixedChar = True
      Size = 1
    end
    object PermissaoINC: TStringField
      FieldName = 'INC'
      FixedChar = True
      Size = 1
    end
    object PermissaoNOME: TStringField
      FieldName = 'NOME'
    end
    object PermissaoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object PermissaoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
  end
  object dspPedido: TDataSetProvider
    DataSet = dtPedido
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 264
  end
  object Pedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPedido'
    BeforeInsert = PedidoBeforeInsert
    BeforePost = PedidoBeforePost
    BeforeDelete = PedidoBeforeDelete
    OnNewRecord = PedidoNewRecord
    OnReconcileError = PedidoReconcileError
    Left = 408
    Top = 264
    object PedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object PedidoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object PedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object PedidoCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object PedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
      EditMask = '##/##/####'
    end
    object PedidoPERC_DESCONTO: TFloatField
      FieldName = 'PERC_DESCONTO'
      DisplayFormat = ',##0.00'
    end
    object PedidoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object PedidoTOTAL_BRUTO: TFloatField
      FieldName = 'TOTAL_BRUTO'
      DisplayFormat = ',##0.00'
    end
    object PedidoTOTAL_LIQUIDO: TFloatField
      FieldName = 'TOTAL_LIQUIDO'
      DisplayFormat = ',##0.00'
    end
    object PedidoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object PedidoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object PedidoVALOR_DESCONTO: TFloatField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = ',##0.00'
    end
    object PedidoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object PedidoNOME_FOR: TStringField
      FieldName = 'NOME_FOR'
      Size = 60
    end
    object PedidoOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object PedidoCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object PedidoENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      FixedChar = True
      Size = 1
    end
    object PedidoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = ',##0.0000'
    end
    object PedidoTOTAL_LUCRO: TFloatField
      FieldName = 'TOTAL_LUCRO'
      DisplayFormat = ',##0.00'
    end
    object PedidoTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
      DisplayFormat = ',##0.00'
    end
    object PedidoTOTAL_QTDE: TFloatField
      FieldName = 'TOTAL_QTDE'
    end
    object PedidoNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
    end
    object PedidoVALOR_LUCRO: TFloatField
      FieldName = 'VALOR_LUCRO'
    end
    object PedidoIMP_LOGO: TStringField
      FieldName = 'IMP_LOGO'
      FixedChar = True
      Size = 1
    end
    object PedidoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object PedidoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 50
    end
    object PedidoTOTAL_COMISSAO: TFloatField
      FieldName = 'TOTAL_COMISSAO'
      DisplayFormat = ',##0.00'
    end
    object PedidoVALOR_COMISSAO: TFloatField
      FieldName = 'VALOR_COMISSAO'
      DisplayFormat = ',##0.0000'
    end
    object PedidoCOD_USINA: TIntegerField
      FieldName = 'COD_USINA'
    end
    object PedidoNOME_USINA: TStringField
      FieldName = 'NOME_USINA'
      ProviderFlags = []
      Size = 60
    end
  end
  object ItensPedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensPedido'
    BeforeInsert = ItensPedidoBeforeInsert
    BeforePost = ItensPedidoBeforePost
    BeforeDelete = ItensPedidoBeforeDelete
    OnReconcileError = ItensPedidoReconcileError
    Left = 408
    Top = 312
    object ItensPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object ItensPedidoSEQ: TIntegerField
      FieldName = 'SEQ'
      Required = True
    end
    object ItensPedidoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object ItensPedidoID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object ItensPedidoQTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = ',##0'
    end
    object ItensPedidoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object ItensPedidoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object ItensPedidoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = ',##0.0000'
    end
    object ItensPedidoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = ',##0.00'
    end
    object ItensPedidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 50
    end
    object ItensPedidoSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
    object ItensPedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object ItensPedidoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = ',##0.0000'
    end
    object ItensPedidoVALOR_LUCRO: TFloatField
      FieldName = 'VALOR_LUCRO'
      DisplayFormat = ',##0.00'
    end
    object ItensPedidoTOTAL_LUCRO: TFloatField
      FieldName = 'TOTAL_LUCRO'
      DisplayFormat = ',##0.00'
    end
    object ItensPedidoTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
      DisplayFormat = ',##0.00'
    end
    object ItensPedidoC_SEQ: TAggregateField
      FieldName = 'C_SEQ'
      Active = True
      DisplayName = ''
      Expression = 'max(SEQ)'
    end
    object ItensPedidoC_TOTAL: TAggregateField
      FieldName = 'C_TOTAL'
      Active = True
      DisplayName = ''
      Expression = 'sum(VALOR_TOTAL)'
    end
    object ItensPedidoSOMAR_VENDA: TAggregateField
      FieldName = 'SOMAR_VENDA'
      Active = True
      DisplayName = ''
      DisplayFormat = ',##0.00'
      Expression = 'sum(TOTAL_VENDA)'
    end
    object ItensPedidoSOMAR_LUCRO: TAggregateField
      FieldName = 'SOMAR_LUCRO'
      Active = True
      DisplayName = ''
      DisplayFormat = ',##0.00'
      Expression = 'sum(TOTAL_LUCRO)'
    end
    object ItensPedidoSOMAR_QTDE: TAggregateField
      FieldName = 'SOMAR_QTDE'
      Active = True
      DisplayName = ''
      Expression = 'sum(QTDE)'
    end
    object ItensPedidoSOMAR_VALORLUCRO: TAggregateField
      FieldName = 'SOMAR_VALORLUCRO'
      Active = True
      DisplayName = ''
      Expression = 'sum(VALOR_LUCRO)'
    end
  end
  object dspItensPedido: TDataSetProvider
    DataSet = dtItensPedido
    Left = 328
    Top = 312
  end
  object dspTabela_Prazo: TDataSetProvider
    DataSet = dtTabela_Prazo
    Left = 328
    Top = 360
  end
  object Tabela_Prazo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspTabela_Prazo'
    BeforePost = Tabela_PrazoBeforePost
    BeforeDelete = Tabela_PrazoBeforeDelete
    Left = 408
    Top = 360
    object Tabela_PrazoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object Tabela_PrazoSEQ: TIntegerField
      FieldName = 'SEQ'
      Required = True
    end
    object Tabela_PrazoCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
      Required = True
    end
    object Tabela_PrazoCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
    end
    object Tabela_PrazoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object Tabela_PrazoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object Tabela_PrazoDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      Size = 30
    end
    object Tabela_PrazoSEQUENCIA: TStringField
      FieldName = 'SEQUENCIA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object Tabela_PrazoDIAS: TIntegerField
      FieldName = 'DIAS'
      Required = True
    end
  end
  object dspContas: TDataSetProvider
    DataSet = dtContas
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 408
  end
  object Contas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTA'
        ParamType = ptInput
      end>
    ProviderName = 'dspContas'
    BeforeInsert = ContasBeforeInsert
    BeforePost = ContasBeforePost
    BeforeDelete = ContasBeforeDelete
    OnReconcileError = ContasReconcileError
    Left = 408
    Top = 408
    object ContasID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      Required = True
    end
    object ContasNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object ContasCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object ContasCOD_CONDICAO: TIntegerField
      FieldName = 'COD_CONDICAO'
    end
    object ContasCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object ContasCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
    end
    object ContasCOD_PAGTO: TIntegerField
      FieldName = 'COD_PAGTO'
    end
    object ContasDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
      EditMask = '##/##/####'
    end
    object ContasDATA_PAGO: TSQLTimeStampField
      FieldName = 'DATA_PAGO'
      EditMask = '##/##/####'
    end
    object ContasDATA_VENCTO: TSQLTimeStampField
      FieldName = 'DATA_VENCTO'
      EditMask = '##/##/####'
    end
    object ContasDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object ContasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object ContasSEQ_CONTA: TIntegerField
      FieldName = 'SEQ_CONTA'
    end
    object ContasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object ContasTIPO_CONTA: TIntegerField
      FieldName = 'TIPO_CONTA'
    end
    object ContasUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object ContasUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object ContasVALOR_ORIGINAL: TFloatField
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = ',##0.00'
    end
    object ContasVALOR_PAGAR: TFloatField
      FieldName = 'VALOR_PAGAR'
      DisplayFormat = ',##0.00'
    end
    object ContasVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = ',##0.00'
    end
    object ContasID_CONTABANCO: TIntegerField
      FieldName = 'ID_CONTABANCO'
    end
    object ContasID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object ContasEXPORTAR_NET: TStringField
      FieldName = 'EXPORTAR_NET'
      FixedChar = True
      Size = 1
    end
    object ContasC_VALORTOTAL: TAggregateField
      Alignment = taRightJustify
      FieldName = 'C_VALORTOTAL'
      Active = True
      DisplayName = ''
      DisplayFormat = ',##0.00'
      Expression = 'sum(VALOR_PAGAR)'
    end
    object ContasC_NUMPARCELA: TAggregateField
      FieldName = 'C_NUMPARCELA'
      Active = True
      DisplayName = ''
      Expression = 'count(ID_CONTA)'
    end
  end
  object dtMotorista: TSQLDataSet
    CommandText = 
      'select '#13#10'MOT.BAIRRO, '#13#10'MOT.CEP, '#13#10'MOT.COD_CIDADE, '#13#10'MOT.COD_EMPR' +
      'ESA, '#13#10'MOT.COD_MOTORISTA, '#13#10'MOT.COD_TRANS, '#13#10'MOT.ENDERECO, '#13#10'MOT' +
      '.FONE1, '#13#10'MOT.PLACA,'#13#10'MOT.FONE2, '#13#10'MOT.NOME, '#13#10'MOT.CPF,'#13#10'MOT.OBS' +
      ', '#13#10'MOT.DATANASC,'#13#10'MOT.ESTADO_CPF,'#13#10'MOT.PLACA_REBOQUE1,'#13#10'MOT.PLA' +
      'CA_REBOQUE2,'#13#10'MOT.PLACA_REBOQUE3,'#13#10'MOT.TONELAGEM,'#13#10'MOT.USU_ALT, ' +
      #13#10'MOT.USU_INC,'#13#10'MOT.CNH,'#13#10'MOT.RENAVAN,'#13#10'CID.DESC_CIDADE,'#13#10'EST.SI' +
      'GLA,'#13#10'TRA.NOME AS NOME_TRANS'#13#10'from MOTORISTA MOT'#13#10' left join CID' +
      'ADE CID on MOT.COD_CIDADE = CID.COD_CIDADE'#13#10' left join ESTADO ES' +
      'T on CID.ID_ESTADO = EST.ID_ESTADO'#13#10' left join TRANSPORTADOR TRA' +
      ' on MOT.COD_TRANS = TRA.COD_TRANS'#13#10#13#10' where MOT.COD_EMPRESA = :C' +
      'OD_EMPRESA'#13#10' and MOT.NOME like :NOME'#13#10' order by MOT.NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 456
    object dtMotoristaCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtMotoristaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtMotoristaCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dtMotoristaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dtMotoristaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtMotoristaCOD_TRANS: TIntegerField
      FieldName = 'COD_TRANS'
      ProviderFlags = [pfInUpdate]
    end
    object dtMotoristaENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtMotoristaFONE1: TStringField
      FieldName = 'FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtMotoristaPLACA: TStringField
      FieldName = 'PLACA'
      ProviderFlags = [pfInUpdate]
    end
    object dtMotoristaFONE2: TStringField
      FieldName = 'FONE2'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtMotoristaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object dtMotoristaCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dtMotoristaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object dtMotoristaDATANASC: TDateField
      FieldName = 'DATANASC'
      ProviderFlags = [pfInUpdate]
    end
    object dtMotoristaESTADO_CPF: TStringField
      FieldName = 'ESTADO_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dtMotoristaPLACA_REBOQUE1: TStringField
      FieldName = 'PLACA_REBOQUE1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dtMotoristaPLACA_REBOQUE2: TStringField
      FieldName = 'PLACA_REBOQUE2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dtMotoristaPLACA_REBOQUE3: TStringField
      FieldName = 'PLACA_REBOQUE3'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dtMotoristaTONELAGEM: TFloatField
      FieldName = 'TONELAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object dtMotoristaUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtMotoristaUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtMotoristaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtMotoristaSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtMotoristaNOME_TRANS: TStringField
      FieldName = 'NOME_TRANS'
      ProviderFlags = []
      Size = 50
    end
    object dtMotoristaCNH: TStringField
      FieldName = 'CNH'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtMotoristaRENAVAN: TStringField
      FieldName = 'RENAVAN'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspMotorista: TDataSetProvider
    DataSet = dtMotorista
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 456
  end
  object Motorista: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspMotorista'
    BeforeInsert = MotoristaBeforeInsert
    BeforePost = MotoristaBeforePost
    BeforeDelete = MotoristaBeforeDelete
    Left = 408
    Top = 456
    object MotoristaCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object MotoristaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object MotoristaCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object MotoristaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object MotoristaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object MotoristaCOD_TRANS: TIntegerField
      FieldName = 'COD_TRANS'
      ProviderFlags = [pfInUpdate]
    end
    object MotoristaENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object MotoristaFONE1: TStringField
      FieldName = 'FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object MotoristaFONE2: TStringField
      FieldName = 'FONE2'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object MotoristaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object MotoristaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object MotoristaUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object MotoristaUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object MotoristaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object MotoristaSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object MotoristaNOME_TRANS: TStringField
      FieldName = 'NOME_TRANS'
      ProviderFlags = []
      Size = 50
    end
    object MotoristaPLACA: TStringField
      FieldName = 'PLACA'
    end
    object MotoristaESTADO_CPF: TStringField
      FieldName = 'ESTADO_CPF'
      Size = 10
    end
    object MotoristaPLACA_REBOQUE1: TStringField
      FieldName = 'PLACA_REBOQUE1'
      Size = 10
    end
    object MotoristaPLACA_REBOQUE2: TStringField
      FieldName = 'PLACA_REBOQUE2'
      Size = 10
    end
    object MotoristaCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      FixedChar = True
      Size = 11
    end
    object MotoristaDATANASC: TDateField
      FieldName = 'DATANASC'
      EditMask = '##/##/####'
    end
    object MotoristaPLACA_REBOQUE3: TStringField
      FieldName = 'PLACA_REBOQUE3'
      Size = 10
    end
    object MotoristaTONELAGEM: TFloatField
      FieldName = 'TONELAGEM'
      DisplayFormat = ',##0,000'
    end
    object MotoristaCNH: TStringField
      FieldName = 'CNH'
      Size = 30
    end
    object MotoristaRENAVAN: TStringField
      FieldName = 'RENAVAN'
      Size = 50
    end
  end
  object dtTransportador: TSQLDataSet
    CommandText = 
      'select '#13#10'TRA.*,'#13#10'CID.DESC_CIDADE,'#13#10'EST.SIGLA,'#13#10'AGE.NOME AS NOME_' +
      'AGENCIADOR'#13#10'from TRANSPORTADOR TRA'#13#10' left join CIDADE CID on TRA' +
      '.COD_CIDADE = CID.COD_CIDADE'#13#10' left join ESTADO EST on CID.ID_ES' +
      'TADO = EST.ID_ESTADO'#13#10' left join AGENCIADOR AGE on TRA.COD_AGENC' +
      'IA = AGE.COD_AGENCIA'#13#10' where TRA.COD_EMPRESA = :COD_EMPRESA'#13#10' an' +
      'd TRA.NOME like :NOME'#13#10' order by TRA.NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
        Value = 'A'
      end>
    SQLConnection = BancoDados
    Left = 256
    Top = 504
    object dtTransportadorCOD_TRANS: TIntegerField
      FieldName = 'COD_TRANS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtTransportadorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtTransportadorCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dtTransportadorCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dtTransportadorCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtTransportadorCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtTransportadorDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dtTransportadorDESTAQUE: TStringField
      FieldName = 'DESTAQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtTransportadorENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtTransportadorFONE1: TStringField
      FieldName = 'FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtTransportadorFONE2: TStringField
      FieldName = 'FONE2'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dtTransportadorINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dtTransportadorOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object dtTransportadorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTransportadorUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTransportadorDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtTransportadorSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object dtTransportadorNOME_AGENCIADOR: TStringField
      FieldName = 'NOME_AGENCIADOR'
      ProviderFlags = []
      Size = 50
    end
    object dtTransportadorFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtTransportadorANTT: TStringField
      FieldName = 'ANTT'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtTransportadorRENAVAN: TStringField
      FieldName = 'RENAVAN'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtTransportadorDATANASC: TDateField
      FieldName = 'DATANASC'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorNUM_BANCO: TStringField
      FieldName = 'NUM_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtTransportadorNUM_AGENCIA: TStringField
      FieldName = 'NUM_AGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dtTransportadorNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtTransportadorCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dtTransportadorNOME_DESPOSITANTE: TStringField
      FieldName = 'NOME_DESPOSITANTE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtTransportadorCPF_TRANSP: TStringField
      FieldName = 'CPF_TRANSP'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
  end
  object dspTransportador: TDataSetProvider
    DataSet = dtTransportador
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 504
  end
  object Transportador: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
        Size = 2
        Value = 'A'
      end>
    ProviderName = 'dspTransportador'
    BeforeInsert = TransportadorBeforeInsert
    BeforePost = TransportadorBeforePost
    BeforeDelete = TransportadorBeforeDelete
    OnNewRecord = TransportadorNewRecord
    OnReconcileError = TransportadorReconcileError
    Left = 408
    Top = 504
    object TransportadorCOD_TRANS: TIntegerField
      FieldName = 'COD_TRANS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TransportadorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object TransportadorCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object TransportadorCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
    object TransportadorCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object TransportadorCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object TransportadorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object TransportadorCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object TransportadorDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object TransportadorDESTAQUE: TStringField
      FieldName = 'DESTAQUE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object TransportadorENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object TransportadorFONE1: TStringField
      FieldName = 'FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object TransportadorFONE2: TStringField
      FieldName = 'FONE2'
      ProviderFlags = [pfInUpdate]
    end
    object TransportadorINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object TransportadorNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object TransportadorOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object TransportadorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object TransportadorUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object TransportadorDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object TransportadorSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object TransportadorNOME_AGENCIADOR: TStringField
      FieldName = 'NOME_AGENCIADOR'
      Size = 50
    end
    object TransportadorFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object TransportadorDATANASC: TDateField
      FieldName = 'DATANASC'
      EditMask = '##/##/####'
    end
    object TransportadorNUM_BANCO: TStringField
      FieldName = 'NUM_BANCO'
    end
    object TransportadorNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 50
    end
    object TransportadorNUM_AGENCIA: TStringField
      FieldName = 'NUM_AGENCIA'
    end
    object TransportadorNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
    end
    object TransportadorNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 50
    end
    object TransportadorCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object TransportadorNOME_DESPOSITANTE: TStringField
      FieldName = 'NOME_DESPOSITANTE'
      Size = 50
    end
    object TransportadorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object TransportadorCPF_TRANSP: TStringField
      FieldName = 'CPF_TRANSP'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object TransportadorANTT: TStringField
      FieldName = 'ANTT'
      Size = 50
    end
    object TransportadorRENAVAN: TStringField
      FieldName = 'RENAVAN'
      Size = 50
    end
  end
  object dtAgenciador: TSQLDataSet
    CommandText = 
      'select '#13#10'AGE.AGENCIA, '#13#10'AGE.BAIRRO, '#13#10'AGE.CEP, '#13#10'AGE.CNPJ, '#13#10'AGE' +
      '.COD_AGENCIA, '#13#10'AGE.COD_CIDADE, '#13#10'AGE.COD_EMPRESA, '#13#10'AGE.CONTA_B' +
      'ANCO, '#13#10'AGE.EMAIL, '#13#10'AGE.ENDERECO, '#13#10'AGE.FONE1, '#13#10'AGE.FONE2, '#13#10'A' +
      'GE.INSC_ESTADUAL, '#13#10'AGE.NOME, '#13#10'AGE.NOME_BANCO, '#13#10'AGE.OBS, '#13#10'AGE' +
      '.PERC_COMISSAO, '#13#10'AGE.USU_ALT, '#13#10'AGE.USU_INC,'#13#10'CID.DESC_CIDADE,'#13 +
      #10'EST.SIGLA'#13#10#13#10'from AGENCIADOR AGE'#13#10' left join CIDADE CID on AGE.' +
      'COD_CIDADE = CID.COD_CIDADE'#13#10' left join ESTADO EST on CID.ID_EST' +
      'ADO = EST.ID_ESTADO'#13#10#13#10' where AGE.COD_EMPRESA = :COD_EMPRESA'#13#10' a' +
      'nd AGE.NOME like :NOME'#13#10' order by AGE.NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 72
    object dtAgenciadorCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtAgenciadorAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtAgenciadorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtAgenciadorCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dtAgenciadorCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dtAgenciadorCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dtAgenciadorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
    end
    object dtAgenciadorCONTA_BANCO: TStringField
      FieldName = 'CONTA_BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtAgenciadorEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dtAgenciadorENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtAgenciadorFONE1: TStringField
      FieldName = 'FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtAgenciadorFONE2: TStringField
      FieldName = 'FONE2'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtAgenciadorINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtAgenciadorNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dtAgenciadorNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtAgenciadorOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object dtAgenciadorPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtAgenciadorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtAgenciadorUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtAgenciadorDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtAgenciadorSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
  end
  object dspAgenciador: TDataSetProvider
    DataSet = dtAgenciador
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 72
  end
  object Agenciador: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspAgenciador'
    BeforeInsert = AgenciadorBeforeInsert
    BeforePost = AgenciadorBeforePost
    BeforeDelete = AgenciadorBeforeDelete
    OnReconcileError = AgenciadorReconcileError
    Left = 624
    Top = 72
    object AgenciadorCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
    end
    object AgenciadorAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 40
    end
    object AgenciadorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object AgenciadorCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;0;_'
      Size = 8
    end
    object AgenciadorCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
    object AgenciadorCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object AgenciadorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object AgenciadorCONTA_BANCO: TStringField
      FieldName = 'CONTA_BANCO'
      Size = 30
    end
    object AgenciadorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object AgenciadorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object AgenciadorFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object AgenciadorFONE2: TStringField
      FieldName = 'FONE2'
      Size = 15
    end
    object AgenciadorINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object AgenciadorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object AgenciadorNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 50
    end
    object AgenciadorOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object AgenciadorPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = ',##0.00'
    end
    object AgenciadorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object AgenciadorUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object AgenciadorDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object AgenciadorSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
  end
  object Qcidade: TSQLDataSet
    CommandText = 
      'select '#13#10'CID.CEP, '#13#10'CID.DESC_CIDADE, '#13#10'EST.SIGLA'#13#10'from CIDADE CI' +
      'D'#13#10' left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'#13#10' wher' +
      'e CID.COD_EMPRESA = :COD_EMPRESA'#13#10' and CID.COD_CIDADE = :COD_CID' +
      'ADE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CIDADE'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 200
    Top = 120
    object QcidadeCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object QcidadeDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Required = True
      Size = 50
    end
    object QcidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
  end
  object QCliente: TSQLDataSet
    CommandText = 
      'select '#13#10'BAIRRO, '#13#10'CEP, '#13#10'CNPJ, '#13#10'COMPLEMENTO, '#13#10'CPF, '#13#10'DATA_CAD' +
      'ASTRO, '#13#10'EMAIL,'#13#10'ENDERECO, '#13#10'FANTASIA, '#13#10'FAX, '#13#10'FONE, '#13#10'INSC_EST' +
      'ADUAL, '#13#10'NOME, '#13#10'NUMERO, '#13#10'OBS, '#13#10'RG, '#13#10'TIPO_PESSOA'#13#10'from CLIENT' +
      'E'#13#10' where COD_EMPRESA = :COD_EMPRESA'#13#10' and COD_CLIENTE = :COD_CL' +
      'IENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 200
    Top = 168
    object QClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object QClienteCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object QClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object QClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object QClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object QClienteDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
    end
    object QClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object QClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object QClienteFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object QClienteFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object QClienteINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object QClienteNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object QClienteOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object QClienteRG: TStringField
      FieldName = 'RG'
    end
    object QClienteTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
  end
  object dtCarga: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select '#13#10'CAR.ARMAZEM,'#13#10'CAR.COD_AGENCIA, '#13#10'CAR.COD_CLIENTE, '#13#10'CAR' +
      '.COD_CONTATO, '#13#10'CAR.COD_EMPRESA, '#13#10'CAR.COD_FOR, '#13#10'CAR.COD_MOTORI' +
      'STA, '#13#10'CAR.DATA, '#13#10'CAR.ID_CARGA, '#13#10'CAR.QTDE_PEDIDO,'#13#10'CAR.FINANCE' +
      'IRO,'#13#10'CAR.LETRA, '#13#10'CAR.SITUACAO, '#13#10'CAR.OBS,'#13#10'CAR.NUM_CARGA, '#13#10'CA' +
      'R.NUM_PEDIDO, '#13#10'CAR.QTDE, '#13#10'CAR.USU_ALT, '#13#10'CAR.USU_INC, '#13#10'CAR.VA' +
      'LOR_CARREGA, '#13#10'CAR.COMPLEMENTO,'#13#10'CAR.VALOR_FRETE, '#13#10'CAR.VALOR_PE' +
      'DIDO, '#13#10'CAR.VISTO,'#13#10'CAR.PLACA,'#13#10'CAR.SALDO,'#13#10'CAR.UNIDADE,'#13#10'CAR.CO' +
      'MPLUNIDADE,'#13#10'CAR.CONTATO_INDICACAO,'#13#10'CAR.OBS2,'#13#10'CAR.NUM_NF,'#13#10'CAR' +
      '.DATA_NF,'#13#10'CAR.QTDE_CADA,'#13#10'CAR.ID_UNIDADE,'#13#10'CAR.COD_MANIFESTO,'#13#10 +
      'CAR.id_contabanco,'#13#10'CAR.CNPJ_CPF,'#13#10'CAR.CREDITO_NF,'#13#10'CAR.IR,'#13#10'CAR' +
      '.NUM_NOTA2,'#13#10'CAR.VALOR_NOTA2,'#13#10'CAR.COD_USINA,'#13#10'CLI.NOME AS NOME_' +
      'CLIENTE,'#13#10'CON.NOME AS NOME_CONTATO,'#13#10'FO.NOME AS NOME_FORNECEDOR,' +
      #13#10'MOT.NOME AS NOME_MOTORISTA,'#13#10'TRA.NOME AS NOME_MANIFESTO,'#13#10'USI.' +
      'NOME AS NOME_USINA,'#13#10'CTB.AGENCIA,'#13#10'CTB.BANCO,'#13#10'CTB.NUM_CONTA,'#13#10'C' +
      'TB.CNPJ_CPF AS CTB_CNPJ'#13#10'from CARGA CAR'#13#10#13#10' left join CLIENTE CL' +
      'I on CAR.COD_CLIENTE = CLI.COD_CLIENTE'#13#10#13#10' left join CLIENTE CON' +
      ' on CAR.COD_CONTATO = CON.COD_CLIENTE'#13#10#13#10' left join FORNECEDOR F' +
      'O on CAR.COD_FOR = FO.COD_FOR'#13#10#13#10' left join MOTORISTA MOT on CAR' +
      '.COD_MOTORISTA = MOT.COD_MOTORISTA'#13#10' '#13#10' left join FORNECEDOR USI' +
      ' on CAR.COD_USINA = USI.COD_FOR'#13#10#13#10' left join TRANSPORTADOR TRA ' +
      'on CAR.COD_MANIFESTO = TRA.COD_TRANS'#13#10#13#10'left join CONTABANCO CTB' +
      ' on CAR.ID_CONTABANCO = CTB.ID_CONTABANCO'#13#10#13#10#13#10' where CAR.COD_EM' +
      'PRESA = :COD_EMPRESA'#13#10' and CAR.ID_CARGA = :ID_CARGA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 120
    object dtCargaARMAZEM: TStringField
      FieldName = 'ARMAZEM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object dtCargaCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCargaCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCargaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCargaCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCargaID_CARGA: TIntegerField
      FieldName = 'ID_CARGA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtCargaQTDE_PEDIDO: TFloatField
      FieldName = 'QTDE_PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaFINANCEIRO: TStringField
      FieldName = 'FINANCEIRO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtCargaLETRA: TStringField
      FieldName = 'LETRA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dtCargaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtCargaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object dtCargaNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCargaNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtCargaQTDE: TFloatField
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtCargaUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtCargaVALOR_CARREGA: TFloatField
      FieldName = 'VALOR_CARREGA'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object dtCargaVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaVISTO: TStringField
      FieldName = 'VISTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dtCargaPLACA: TStringField
      FieldName = 'PLACA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtCargaSALDO: TFloatField
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaCOMPLUNIDADE: TStringField
      FieldName = 'COMPLUNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtCargaCONTATO_INDICACAO: TStringField
      FieldName = 'CONTATO_INDICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtCargaOBS2: TStringField
      FieldName = 'OBS2'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object dtCargaNUM_NF: TStringField
      FieldName = 'NUM_NF'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtCargaDATA_NF: TDateField
      FieldName = 'DATA_NF'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaQTDE_CADA: TFMTBCDField
      FieldName = 'QTDE_CADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dtCargaID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaID_CONTABANCO: TIntegerField
      FieldName = 'ID_CONTABANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = []
      Size = 60
    end
    object dtCargaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      ProviderFlags = []
      Size = 60
    end
    object dtCargaNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      ProviderFlags = []
      Size = 60
    end
    object dtCargaNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      ProviderFlags = []
      Size = 40
    end
    object dtCargaNOME_MANIFESTO: TStringField
      FieldName = 'NOME_MANIFESTO'
      ProviderFlags = []
      Size = 50
    end
    object dtCargaAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = []
    end
    object dtCargaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 30
    end
    object dtCargaNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      ProviderFlags = []
    end
    object dtCargaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object dtCargaCREDITO_NF: TStringField
      FieldName = 'CREDITO_NF'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtCargaCTB_CNPJ: TStringField
      FieldName = 'CTB_CNPJ'
      ProviderFlags = []
      Size = 25
    end
    object dtCargaIR: TFloatField
      FieldName = 'IR'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaNUM_NOTA2: TStringField
      FieldName = 'NUM_NOTA2'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object dtCargaVALOR_NOTA2: TFloatField
      FieldName = 'VALOR_NOTA2'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaCOD_USINA: TIntegerField
      FieldName = 'COD_USINA'
      ProviderFlags = [pfInUpdate]
    end
    object dtCargaNOME_USINA: TStringField
      FieldName = 'NOME_USINA'
      ProviderFlags = []
      Size = 60
    end
  end
  object dspCarga: TDataSetProvider
    DataSet = dtCarga
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 120
  end
  object Carga: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    ProviderName = 'dspCarga'
    BeforeInsert = CargaBeforeInsert
    BeforePost = CargaBeforePost
    BeforeDelete = CargaBeforeDelete
    OnNewRecord = CargaNewRecord
    OnReconcileError = CargaReconcileError
    Left = 624
    Top = 120
    object CargaID_CARGA: TIntegerField
      FieldName = 'ID_CARGA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CargaCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object CargaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CargaCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
      ProviderFlags = [pfInUpdate]
    end
    object CargaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CargaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CargaCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
      ProviderFlags = [pfInUpdate]
    end
    object CargaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CargaLETRA: TStringField
      FieldName = 'LETRA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object CargaNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CargaNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CargaQTDE: TFloatField
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',#####'
    end
    object CargaUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CargaUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CargaVALOR_CARREGA: TFloatField
      FieldName = 'VALOR_CARREGA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',##0.00'
    end
    object CargaVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',##0.00'
    end
    object CargaVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',##0.00'
    end
    object CargaVISTO: TStringField
      FieldName = 'VISTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object CargaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = []
      Size = 60
    end
    object CargaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      ProviderFlags = []
      Size = 60
    end
    object CargaNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      ProviderFlags = []
      Size = 60
    end
    object CargaNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      ProviderFlags = []
      Size = 40
    end
    object CargaQTDE_PEDIDO: TFloatField
      FieldName = 'QTDE_PEDIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###.###'
    end
    object CargaPLACA: TStringField
      FieldName = 'PLACA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object CargaOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CargaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object CargaFINANCEIRO: TStringField
      FieldName = 'FINANCEIRO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object CargaCONTATO_INDICACAO: TStringField
      FieldName = 'CONTATO_INDICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CargaARMAZEM: TStringField
      FieldName = 'ARMAZEM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CargaSALDO: TFloatField
      DefaultExpression = '0'
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
    end
    object CargaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object CargaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object CargaCOMPLUNIDADE: TStringField
      FieldName = 'COMPLUNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CargaOBS2: TStringField
      FieldName = 'OBS2'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object CargaDATA_NF: TDateField
      FieldName = 'DATA_NF'
      ProviderFlags = [pfInUpdate]
      EditMask = '##/##/####'
    end
    object CargaNUM_NF: TStringField
      FieldName = 'NUM_NF'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CargaCOD_MANIFESTO: TIntegerField
      FieldName = 'COD_MANIFESTO'
      ProviderFlags = [pfInUpdate]
    end
    object CargaNOME_MANIFESTO: TStringField
      FieldName = 'NOME_MANIFESTO'
      ProviderFlags = []
      Size = 50
    end
    object CargaQTDE_CADA: TFMTBCDField
      FieldName = 'QTDE_CADA'
      DisplayFormat = ',##0'
      Precision = 15
      Size = 3
    end
    object CargaID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
    end
    object CargaID_CONTABANCO: TIntegerField
      FieldName = 'ID_CONTABANCO'
    end
    object CargaAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = []
    end
    object CargaBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = []
      Size = 30
    end
    object CargaNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      ProviderFlags = []
    end
    object CargaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 25
    end
    object CargaCREDITO_NF: TStringField
      FieldName = 'CREDITO_NF'
      Size = 50
    end
    object CargaCTB_CNPJ: TStringField
      FieldName = 'CTB_CNPJ'
      ProviderFlags = []
      Size = 25
    end
    object CargaIR: TFloatField
      FieldName = 'IR'
      DisplayFormat = ',##0.00'
    end
    object CargaNUM_NOTA2: TStringField
      FieldName = 'NUM_NOTA2'
      Size = 25
    end
    object CargaVALOR_NOTA2: TFloatField
      FieldName = 'VALOR_NOTA2'
      DisplayFormat = ',##0.00'
    end
    object CargaCOD_USINA: TIntegerField
      FieldName = 'COD_USINA'
    end
    object CargaNOME_USINA: TStringField
      FieldName = 'NOME_USINA'
      ProviderFlags = []
      Size = 60
    end
  end
  object dtContaBanco: TSQLDataSet
    CommandText = 
      'select '#13#10' AGENCIA, '#13#10' BANCO,'#13#10' COD_EMPRESA, '#13#10' ID_CONTABANCO, '#13#10 +
      ' NUM_CONTA,'#13#10'ATIVO,'#13#10'CNPJ_CPF'#13#10'from CONTABANCO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = BancoDados
    Left = 528
    Top = 168
    object dtContaBancoID_CONTABANCO: TIntegerField
      FieldName = 'ID_CONTABANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtContaBancoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dtContaBancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
    end
    object dtContaBancoNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dtContaBancoBANCO: TStringField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtContaBancoATIVO: TStringField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtContaBancoCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
  end
  object dspContaBanco: TDataSetProvider
    DataSet = dtContaBanco
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 168
  end
  object ContaBanco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContaBanco'
    BeforeInsert = ContaBancoBeforeInsert
    BeforePost = ContaBancoBeforePost
    BeforeDelete = ContaBancoBeforeDelete
    OnNewRecord = ContaBancoNewRecord
    OnReconcileError = ContaBancoReconcileError
    Left = 624
    Top = 168
    object ContaBancoID_CONTABANCO: TIntegerField
      FieldName = 'ID_CONTABANCO'
      Required = True
    end
    object ContaBancoAGENCIA: TStringField
      FieldName = 'AGENCIA'
    end
    object ContaBancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
    end
    object ContaBancoNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
    end
    object ContaBancoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 30
    end
    object ContaBancoATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object ContaBancoCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 25
    end
  end
  object dtCad_Obs: TSQLDataSet
    CommandText = 
      'select CODEMPRESA, CODIGO, NUM_LINHA, TEXTO, TIPO from CAD_OBS'#13#10 +
      ' where  CODIGO = :CODIGO'#13#10'  and  TIPO = :TIPO'#13#10'  order by NUM_LI' +
      'NHA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIPO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 216
    object dtCad_ObsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtCad_ObsTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object dtCad_ObsNUM_LINHA: TIntegerField
      FieldName = 'NUM_LINHA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dtCad_ObsCODEMPRESA: TIntegerField
      FieldName = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate]
    end
    object dtCad_ObsTEXTO: TStringField
      FieldName = 'TEXTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dsCad_Obs: TDataSetProvider
    DataSet = dtCad_Obs
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 216
  end
  object Cad_Obs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dsCad_Obs'
    Left = 624
    Top = 216
    object Cad_ObsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object Cad_ObsTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object Cad_ObsNUM_LINHA: TIntegerField
      FieldName = 'NUM_LINHA'
    end
    object Cad_ObsCODEMPRESA: TIntegerField
      FieldName = 'CODEMPRESA'
    end
    object Cad_ObsTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 100
    end
  end
  object dtObs_Conta: TSQLDataSet
    CommandText = 
      'select COD_EMPRESA, ID_CONTA, ID_OBS, TEXTO from OBS_CONTAS'#13#10' wh' +
      'ere ID_CONTA = :ID_CONTA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTA'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 264
    object dtObs_ContaID_OBS: TIntegerField
      FieldName = 'ID_OBS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtObs_ContaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtObs_ContaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtObs_ContaTEXTO: TStringField
      FieldName = 'TEXTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
  end
  object dspObs_Conta: TDataSetProvider
    DataSet = dtObs_Conta
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 264
  end
  object ObsConta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTA'
        ParamType = ptInput
      end>
    ProviderName = 'dspObs_Conta'
    BeforePost = ObsContaBeforePost
    OnNewRecord = ObsContaNewRecord
    OnReconcileError = ObsContaReconcileError
    Left = 624
    Top = 264
    object ObsContaID_OBS: TIntegerField
      FieldName = 'ID_OBS'
      Required = True
    end
    object ObsContaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object ObsContaID_CONTA: TIntegerField
      FieldName = 'ID_CONTA'
      Required = True
    end
    object ObsContaTEXTO: TStringField
      FieldName = 'TEXTO'
      Required = True
      Size = 200
    end
  end
  object dtDiretor: TSQLDataSet
    CommandText = 
      'select COD_CLIENTE, COD_EMPRESA, CPF, DATANASC, ENDERECO, FONE, ' +
      'ID_DIRETOR, NOME from DIRETOR'#13#10' where COD_CLIENTE = :COD_CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 312
    object dtDiretorID_DIRETOR: TIntegerField
      FieldName = 'ID_DIRETOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtDiretorCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtDiretorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtDiretorCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dtDiretorDATANASC: TSQLTimeStampField
      FieldName = 'DATANASC'
      ProviderFlags = [pfInUpdate]
    end
    object dtDiretorENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtDiretorFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtDiretorNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
  end
  object dtRefBanco: TSQLDataSet
    CommandText = 
      'select COD_CLIENTE, COD_EMPRESA, FONE, ID_BANCO, NOME_AGENCIA, N' +
      'OME_BANCO, NUMERO, NUM_CONTA, TIPO_PESSOA from REF_BANCARIA'#13#10' wh' +
      'ere COD_CLIENTE = :COD_CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 360
    object dtRefBancoID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtRefBancoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtRefBancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtRefBancoFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtRefBancoNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtRefBancoNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtRefBancoNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtRefBancoNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dtRefBancoTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dtRefComercio: TSQLDataSet
    CommandText = 
      'select CNPJ, COD_CLIENTE, COD_EMPRESA, FONE, ID_COMERCIO, NOME_F' +
      'ORNECEDOR from REF_COMERCIAL '#13#10' where COD_CLIENTE = :COD_CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 408
    object dtRefComercioID_COMERCIO: TIntegerField
      FieldName = 'ID_COMERCIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtRefComercioCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dtRefComercioCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtRefComercioCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtRefComercioFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtRefComercioNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspDiretor: TDataSetProvider
    DataSet = dtDiretor
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 312
  end
  object dspRefBanco: TDataSetProvider
    DataSet = dtRefBanco
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 360
  end
  object dspRefComercio: TDataSetProvider
    DataSet = dtRefComercio
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 408
  end
  object Diretor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspDiretor'
    BeforePost = DiretorBeforePost
    Left = 624
    Top = 312
    object DiretorID_DIRETOR: TIntegerField
      FieldName = 'ID_DIRETOR'
      Required = True
    end
    object DiretorCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object DiretorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object DiretorCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object DiretorDATANASC: TSQLTimeStampField
      FieldName = 'DATANASC'
      EditMask = '##/##/####'
    end
    object DiretorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object DiretorFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object DiretorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object RefBanco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspRefBanco'
    BeforePost = RefBancoBeforePost
    Left = 624
    Top = 360
    object RefBancoID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
      Required = True
    end
    object RefBancoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object RefBancoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object RefBancoFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object RefBancoNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 50
    end
    object RefBancoNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 50
    end
    object RefBancoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object RefBancoNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
    end
    object RefBancoTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      FixedChar = True
      Size = 1
    end
  end
  object RefComercio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspRefComercio'
    BeforePost = RefComercioBeforePost
    Left = 624
    Top = 408
    object RefComercioID_COMERCIO: TIntegerField
      FieldName = 'ID_COMERCIO'
      Required = True
    end
    object RefComercioCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
    object RefComercioCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object RefComercioCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object RefComercioFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object RefComercioNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 50
    end
  end
  object dtVendedor: TSQLDataSet
    CommandText = 
      'select '#13#10'COD_EMPRESA, '#13#10'COD_VENDEDOR, '#13#10'NOME, '#13#10'PERC_COMISSAO, '#13 +
      #10'USU_ALT, '#13#10'USU_INC '#13#10'from VENDEDOR '#13#10' where COD_EMPRESA = :COD_' +
      'EMPRESA'#13#10' and NOME like :NOME'#13#10' order by NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 456
    object dtVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtVendedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtVendedorNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dtVendedorPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dtVendedorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtVendedorUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspVendedor: TDataSetProvider
    DataSet = dtVendedor
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 456
  end
  object Vendedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendedor'
    BeforeInsert = VendedorBeforeInsert
    BeforePost = VendedorBeforePost
    BeforeDelete = VendedorBeforeDelete
    OnReconcileError = VendedorReconcileError
    Left = 624
    Top = 456
    object VendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Required = True
    end
    object VendedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object VendedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object VendedorPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
      DisplayFormat = ',##0.00'
    end
    object VendedorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object VendedorUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
  end
  object dtTerceiro: TSQLDataSet
    CommandText = 
      'select '#13#10'TER.BAIRRO, '#13#10'TER.CEP, '#13#10'TER.CNPJ, '#13#10'TER.COD_CIDADE, '#13#10 +
      'TER.COD_EMPRESA, '#13#10'TER.COD_TERCEIRO, '#13#10'TER.COMPLEMENTO, '#13#10'TER.CP' +
      'F, '#13#10'TER.DATA_ABERTURA, '#13#10'TER.DATA_CADASTRO, '#13#10'TER.EMAIL, '#13#10'TER.' +
      'ENDERECO, '#13#10'TER.FANTASIA, '#13#10'TER.FAX, '#13#10'TER.FONE, '#13#10'TER.INSC_ESTA' +
      'DUAL, '#13#10'TER.MARCAR, '#13#10'TER.NOME, '#13#10'TER.NUMERO, '#13#10'TER.OBS, '#13#10'TER.R' +
      'G, '#13#10'TER.TIPO_PESSOA, '#13#10'TER.USU_ALT, '#13#10'TER.USU_INC ,'#13#10#13#10'CID.DESC' +
      '_CIDADE,'#13#10'CID.CEP AS CEP_CIDADE,'#13#10'EST.SIGLA'#13#10#13#10'from TERCEIRO TER' +
      #13#10#13#10' left join CIDADE CID on TER.COD_CIDADE = CID.COD_CIDADE'#13#10#13#10 +
      ' left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'#13#10#13#10' where' +
      ' TER.COD_EMPRESA = :COD_EMPRESA'#13#10' and TER.NOME like :NOME'#13#10' orde' +
      'r by TER.NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 512
    object dtTerceiroCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtTerceiroCOD_TERCEIRO: TIntegerField
      FieldName = 'COD_TERCEIRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtTerceiroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dtTerceiroCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dtTerceiroCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dtTerceiroCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dtTerceiroCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTerceiroCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dtTerceiroDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
      ProviderFlags = [pfInUpdate]
    end
    object dtTerceiroDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dtTerceiroEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dtTerceiroENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtTerceiroFANTASIA: TStringField
      FieldName = 'FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dtTerceiroFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtTerceiroFONE: TStringField
      FieldName = 'FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dtTerceiroINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dtTerceiroMARCAR: TStringField
      FieldName = 'MARCAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtTerceiroNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dtTerceiroNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dtTerceiroOBS: TStringField
      FieldName = 'OBS'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object dtTerceiroRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
    end
    object dtTerceiroTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtTerceiroUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTerceiroUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTerceiroDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object dtTerceiroCEP_CIDADE: TStringField
      FieldName = 'CEP_CIDADE'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object dtTerceiroSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
  end
  object dspTerceiro: TDataSetProvider
    DataSet = dtTerceiro
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 512
  end
  object Terceiro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspTerceiro'
    BeforeInsert = TerceiroBeforeInsert
    BeforePost = TerceiroBeforePost
    BeforeDelete = TerceiroBeforeDelete
    OnNewRecord = TerceiroNewRecord
    OnReconcileError = TerceiroReconcileError
    Left = 624
    Top = 512
    object TerceiroCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object TerceiroCOD_TERCEIRO: TIntegerField
      FieldName = 'COD_TERCEIRO'
      Required = True
    end
    object TerceiroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object TerceiroCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object TerceiroCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      Size = 14
    end
    object TerceiroCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object TerceiroCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object TerceiroCPF: TStringField
      FieldName = 'CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object TerceiroDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
      EditMask = '##/##/####'
    end
    object TerceiroDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      EditMask = '##/##/####'
    end
    object TerceiroEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object TerceiroENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object TerceiroFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object TerceiroFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object TerceiroFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object TerceiroINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object TerceiroMARCAR: TStringField
      FieldName = 'MARCAR'
      FixedChar = True
      Size = 1
    end
    object TerceiroNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object TerceiroNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object TerceiroOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object TerceiroRG: TStringField
      FieldName = 'RG'
    end
    object TerceiroTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TerceiroUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object TerceiroUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object TerceiroDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object TerceiroCEP_CIDADE: TStringField
      FieldName = 'CEP_CIDADE'
      FixedChar = True
      Size = 8
    end
    object TerceiroSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
  end
  object dtTipoFornecedor: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select'#13#10'COD_EMPRESA, '#13#10'DESC_TIPO,'#13#10'ID_TIPO, SIGLA, '#13#10'USU_ALT, '#13#10 +
      'USU_INC '#13#10'from FORN_TIPO_EMPRESA'#13#10'where COD_EMPRESA = :COD_EMPRE' +
      'SA'#13#10'and DESC_TIPO like :DESC_TIPO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_TIPO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 528
    Top = 563
    object dtTipoFornecedorID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtTipoFornecedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dtTipoFornecedorDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dtTipoFornecedorSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object dtTipoFornecedorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtTipoFornecedorUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspTipoFornecedor: TDataSetProvider
    DataSet = dtTipoFornecedor
    UpdateMode = upWhereKeyOnly
    Left = 576
    Top = 564
  end
  object TipoFornecedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESC_TIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspTipoFornecedor'
    BeforeInsert = TipoFornecedorBeforeInsert
    BeforePost = TipoFornecedorBeforePost
    BeforeDelete = TipoFornecedorBeforeDelete
    OnNewRecord = TipoFornecedorNewRecord
    Left = 624
    Top = 564
    object TipoFornecedorID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      Required = True
    end
    object TipoFornecedorCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object TipoFornecedorDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      Required = True
      Size = 50
    end
    object TipoFornecedorSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TipoFornecedorUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
    object TipoFornecedorUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
  end
  object BancoDados: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\CLIENTES\mb\loja.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 24
    Top = 8
  end
  object dtConfPedido: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select'#13#10' COM_DESCARGA, '#13#10' COM_MANIFESTO, '#13#10' FRETE_PAGO_DESCARGA,' +
      ' '#13#10'NUM_PEDIDO, '#13#10'PRAZO, '#13#10'TEXTO, '#13#10'VENCIMENTO '#13#10'from CONF_PEDIDO' +
      #13#10' WHERE NUM_PEDIDO = :NUM_PEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = BancoDados
    Left = 248
    Top = 552
    object dtConfPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dtConfPedidoCOM_DESCARGA: TStringField
      FieldName = 'COM_DESCARGA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtConfPedidoCOM_MANIFESTO: TStringField
      FieldName = 'COM_MANIFESTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtConfPedidoFRETE_PAGO_DESCARGA: TStringField
      FieldName = 'FRETE_PAGO_DESCARGA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dtConfPedidoPRAZO: TStringField
      FieldName = 'PRAZO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dtConfPedidoTEXTO: TStringField
      FieldName = 'TEXTO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object dtConfPedidoVENCIMENTO: TStringField
      FieldName = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dspConfPedido: TDataSetProvider
    DataSet = dtConfPedido
    UpdateMode = upWhereKeyOnly
    Left = 328
    Top = 552
  end
  object ConfPedido: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConfPedido'
    OnNewRecord = ConfPedidoNewRecord
    Left = 408
    Top = 552
    object ConfPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object ConfPedidoCOM_DESCARGA: TStringField
      FieldName = 'COM_DESCARGA'
      FixedChar = True
      Size = 1
    end
    object ConfPedidoCOM_MANIFESTO: TStringField
      FieldName = 'COM_MANIFESTO'
      FixedChar = True
      Size = 1
    end
    object ConfPedidoFRETE_PAGO_DESCARGA: TStringField
      FieldName = 'FRETE_PAGO_DESCARGA'
      FixedChar = True
      Size = 1
    end
    object ConfPedidoPRAZO: TStringField
      FieldName = 'PRAZO'
      Size = 30
    end
    object ConfPedidoTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 500
    end
    object ConfPedidoVENCIMENTO: TStringField
      FieldName = 'VENCIMENTO'
      Size = 100
    end
  end
  object QUnidadeTexto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'observacao'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    ut.id,'
      '    ut.observacao,'
      '    ut.texto,'
      '    ut.usu_inc,'
      '    ut.usu_alt'
      'FROM unidade_texto ut'
      '    where ut.observacao like :observacao'
      'ORDER BY ut.observacao')
    SQLConnection = BancoDados
    Left = 24
    Top = 560
    object QUnidadeTextoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QUnidadeTextoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object QUnidadeTextoTEXTO: TStringField
      FieldName = 'TEXTO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object QUnidadeTextoUSU_INC: TStringField
      FieldName = 'USU_INC'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object QUnidadeTextoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspUnidadeTexto: TDataSetProvider
    DataSet = QUnidadeTexto
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 560
  end
  object UnidadeTexto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'observacao'
        ParamType = ptInput
      end>
    ProviderName = 'dspUnidadeTexto'
    BeforeInsert = UnidadeTextoBeforeInsert
    BeforePost = UnidadeTextoBeforePost
    BeforeDelete = UnidadeTextoBeforeDelete
    OnReconcileError = UnidadeTextoReconcileError
    Left = 144
    Top = 560
    object UnidadeTextoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object UnidadeTextoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Required = True
      Size = 30
    end
    object UnidadeTextoTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 500
    end
    object UnidadeTextoUSU_INC: TStringField
      FieldName = 'USU_INC'
      Size = 30
    end
    object UnidadeTextoUSU_ALT: TStringField
      FieldName = 'USU_ALT'
      Size = 30
    end
  end
end
