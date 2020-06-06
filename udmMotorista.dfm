object dmMotorista: TdmMotorista
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QMotorista: TSQLQuery
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
      '  MOT.NOME'
      'from MOTORISTA MOT'
      '  where MOT.COD_EMPRESA = :CODEMPRESA'
      '  and MOT.CPF = :CPF')
    SQLConnection = DM.BancoDados
    Left = 32
    Top = 24
    object QMotoristaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
  end
end
