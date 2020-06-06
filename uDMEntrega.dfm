object DMEndereco: TDMEndereco
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QEndEntrega: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_cliente'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  e.cod_cliente,'
      '  e.endereco,'
      '  e.numero,'
      '  e.complemento,'
      '  e.bairro,'
      '  e.cod_cidade,'
      '  e.cep,'
      '  c.desc_cidade,'
      '  c.cep as Cid_Cep,'
      '  a.sigla'
      'FROM end_entrega e'
      '  LEFT JOIN cidade c On e.cod_cidade = c.cod_cidade'
      '  LEFT JOIN estado a On c.id_estado = a.id_estado'
      'WHERE e.cod_cliente = :cod_cliente')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 32
    object QEndEntregaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QEndEntregaENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QEndEntregaNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object QEndEntregaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object QEndEntregaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object QEndEntregaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object QEndEntregaCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object QEndEntregaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      ProviderFlags = []
      Size = 50
    end
    object QEndEntregaCID_CEP: TStringField
      FieldName = 'CID_CEP'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object QEndEntregaSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
  end
  object dspEndEntrega: TDataSetProvider
    DataSet = QEndEntrega
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 32
  end
  object cdsEndEntrega: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_cliente'
        ParamType = ptInput
      end>
    ProviderName = 'dspEndEntrega'
    Left = 136
    Top = 32
    object cdsEndEntregaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object cdsEndEntregaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsEndEntregaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsEndEntregaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object cdsEndEntregaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsEndEntregaCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
    end
    object cdsEndEntregaCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;0;_'
      Size = 8
    end
    object cdsEndEntregaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object cdsEndEntregaCID_CEP: TStringField
      FieldName = 'CID_CEP'
      FixedChar = True
      Size = 8
    end
    object cdsEndEntregaSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
  end
end
