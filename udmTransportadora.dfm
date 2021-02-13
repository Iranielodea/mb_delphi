object dmTransportadora: TdmTransportadora
  OldCreateOrder = False
  Height = 166
  Width = 268
  object QTransportadora: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_TRANS'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '  COD_TRANS,'
      '  NOME'
      'from TRANSPORTADOR TRA'
      '  WHERE COD_TRANS = :COD_TRANS')
    SQLConnection = DM.BancoDados
    Left = 136
    Top = 16
    object QTransportadoraCOD_TRANS: TIntegerField
      FieldName = 'COD_TRANS'
      Required = True
    end
    object QTransportadoraNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QCnpj: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CNPJ'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '    TRA.nome'
      'from TRANSPORTADOR TRA'
      '    where TRA.cod_empresa = :CODEMPRESA'
      '    and TRA.cnpj = :CNPJ')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 16
    object QCnpjNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QCpf: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '    TRA.nome'
      'from TRANSPORTADOR TRA'
      '    where TRA.cod_empresa = :CODEMPRESA'
      '    and TRA.cpf_transp = :CPF')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 72
    object QCpfNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
  end
  object QExpNuvem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'UPDATE TRANSPORTADOR SET EXPORTAR_NET = '#39'S'#39' WHERE COD_TRANS = :C' +
        'ODIGO')
    SQLConnection = DM.BancoDados
    Left = 136
    Top = 72
  end
end
