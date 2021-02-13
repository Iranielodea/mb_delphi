object dmCliente: TdmCliente
  OldCreateOrder = False
  Height = 150
  Width = 248
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
      '    CLI.nome'
      'from cliente CLI'
      '    where CLI.cod_empresa = :CODEMPRESA'
      '    and CLI.cnpj = :CNPJ')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 24
    object QCnpjNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
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
      '    CLI.nome'
      'from cliente CLI'
      '    where CLI.cod_empresa = :CODEMPRESA'
      '    and CLI.cpf = :CPF')
    SQLConnection = DM.BancoDados
    Left = 72
    Top = 24
    object QCpfNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object QConsultaCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      'CLI.CNPJ,'
      'CLI.COD_CLIENTE,'
      'CLI.CPF,'
      'CLI.FAX,'
      'CLI.FONE,'
      'CLI.INSC_ESTADUAL,'
      'CLI.NOME,'
      'CLI.EMAIL'
      'from CLIENTE CLI')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 80
  end
  object dspConsultaCliente: TDataSetProvider
    DataSet = QConsultaCliente
    Left = 80
    Top = 80
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaCliente'
    Left = 152
    Top = 80
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
      
        'UPDATE CLIENTE SET EXPORTAR_NET = '#39'S'#39' WHERE COD_CLIENTE = :CODIG' +
        'O')
    SQLConnection = DM.BancoDados
    Left = 152
    Top = 32
  end
end
