object dmCargaVencto: TdmCargaVencto
  OldCreateOrder = False
  Height = 150
  Width = 240
  object QConsulta: TSQLDataSet
    CommandText = 
      'select '#13#10'V.CARGA_ID, '#13#10'V.DIAS, '#13#10'V.FORMAPAGTO_ID, '#13#10'V.ID, '#13#10'V.VA' +
      'LOR, '#13#10'V.VENCTO,'#13#10'F.DESC_PAGTO '#13#10'from CARGA_VENCTO V'#13#10'LEFT JOIN ' +
      ' FORMA_PAGTO F ON V.FORMAPAGTO_ID = F.COD_PAGTO'#13#10'WHERE CARGA_ID ' +
      '= :CARGA_ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CARGA_ID'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 16
    object QConsultaCARGA_ID: TIntegerField
      FieldName = 'CARGA_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QConsultaDIAS: TIntegerField
      FieldName = 'DIAS'
      ProviderFlags = [pfInUpdate]
    end
    object QConsultaFORMAPAGTO_ID: TIntegerField
      FieldName = 'FORMAPAGTO_ID'
      ProviderFlags = [pfInUpdate]
    end
    object QConsultaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QConsultaVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
    end
    object QConsultaVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      ProviderFlags = [pfInUpdate]
    end
    object QConsultaDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      ProviderFlags = []
      Size = 30
    end
  end
  object dspConsulta: TDataSetProvider
    DataSet = QConsulta
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 16
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CARGA_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta'
    BeforePost = cdsConsultaBeforePost
    Left = 168
    Top = 16
    object cdsConsultaCARGA_ID: TIntegerField
      FieldName = 'CARGA_ID'
      Required = True
    end
    object cdsConsultaDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object cdsConsultaFORMAPAGTO_ID: TIntegerField
      FieldName = 'FORMAPAGTO_ID'
    end
    object cdsConsultaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConsultaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = ',##0.00'
    end
    object cdsConsultaVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
      EditMask = '##/##/####'
    end
    object cdsConsultaDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      ProviderFlags = []
      Size = 30
    end
  end
  object QItensPedido: TSQLDataSet
    CommandText = 
      'select '#13#10'ITE.VALOR '#13#10'from ITENS_PEDIDO ITE'#13#10' where NUM_PEDIDO = ' +
      ':NUMPEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 72
    object QItensPedidoVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object QIncrementa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select cast(gen_id(GEN_CARGA_VENCTO,1) as Integer) as CODIGO fro' +
        'm rdb$database')
    SQLConnection = DM.BancoDados
    Left = 96
    Top = 72
    object QIncrementaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
  end
end
