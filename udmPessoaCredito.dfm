object dmPessoaCredito: TdmPessoaCredito
  OldCreateOrder = False
  Height = 169
  Width = 215
  object sqlPessoaCredito: TSQLDataSet
    CommandText = 
      'select COD_CLIENTE, DATA_CREDITO, QTDE_CREDITO, QTDE_SALDO, QTDE' +
      '_USADO from PESSOA_CREDITO'#13#10'where COD_CLIENTE = :COD_CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 48
    Top = 16
    object sqlPessoaCreditoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPessoaCreditoDATA_CREDITO: TDateField
      FieldName = 'DATA_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPessoaCreditoQTDE_CREDITO: TFloatField
      FieldName = 'QTDE_CREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPessoaCreditoQTDE_USADO: TFloatField
      FieldName = 'QTDE_USADO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPessoaCreditoQTDE_SALDO: TFloatField
      FieldName = 'QTDE_SALDO'
      ProviderFlags = []
    end
  end
  object dspPessoaCredito: TDataSetProvider
    DataSet = sqlPessoaCredito
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 64
  end
  object cdsPessoaCredito: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspPessoaCredito'
    AfterDelete = cdsPessoaCreditoAfterDelete
    Left = 48
    Top = 112
    object cdsPessoaCreditoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsPessoaCreditoDATA_CREDITO: TDateField
      FieldName = 'DATA_CREDITO'
      OnSetText = cdsPessoaCreditoDATA_CREDITOSetText
      EditMask = '##/##/####'
    end
    object cdsPessoaCreditoQTDE_CREDITO: TFloatField
      FieldName = 'QTDE_CREDITO'
      DisplayFormat = '#,000'
    end
    object cdsPessoaCreditoQTDE_USADO: TFloatField
      FieldName = 'QTDE_USADO'
      DisplayFormat = '#,000'
    end
    object cdsPessoaCreditoQTDE_SALDO: TFloatField
      FieldName = 'QTDE_SALDO'
      ProviderFlags = []
      DisplayFormat = '#,000'
    end
  end
end
