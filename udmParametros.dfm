object dmParametros: TdmParametros
  OldCreateOrder = False
  Height = 186
  Width = 290
  object sqlParametro: TSQLDataSet
    CommandText = 
      'select CODIGO, NOME, OBSERVACAO, PAR_ID, VALOR from PARAMETROS'#13#10 +
      'where NOME like :NOME'#13#10' order by CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 56
    Top = 16
    object sqlParametroPAR_ID: TIntegerField
      FieldName = 'PAR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlParametroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlParametroNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object sqlParametroOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object sqlParametroVALOR: TStringField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
  end
  object dspParametro: TDataSetProvider
    DataSet = sqlParametro
    UpdateMode = upWhereKeyOnly
    Left = 56
    Top = 64
  end
  object cdsParametro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspParametro'
    BeforePost = cdsParametroBeforePost
    AfterPost = cdsParametroAfterPost
    AfterDelete = cdsParametroAfterDelete
    OnNewRecord = cdsParametroNewRecord
    Left = 56
    Top = 112
    object cdsParametroPAR_ID: TIntegerField
      FieldName = 'PAR_ID'
      Required = True
    end
    object cdsParametroCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsParametroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 200
    end
    object cdsParametroOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsParametroVALOR: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Size = 200
    end
  end
  object sqlValor: TSQLDataSet
    CommandText = 'select VALOR from PARAMETROS'#13#10'where CODIGO = :CODIGO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 144
    Top = 32
    object sqlValorVALOR: TStringField
      FieldName = 'VALOR'
      Size = 200
    end
  end
  object sqlMax: TSQLDataSet
    CommandText = 'select max(CODIGO) + 1 AS CODIGO from PARAMETROS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.BancoDados
    Left = 152
    Top = 88
    object sqlMaxCODIGO: TLargeintField
      FieldName = 'CODIGO'
    end
  end
end
