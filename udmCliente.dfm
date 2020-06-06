object dmCliente: TdmCliente
  OldCreateOrder = False
  Height = 150
  Width = 215
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
end
