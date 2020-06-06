object dmUnidade: TdmUnidade
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object QUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codempresa'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '    un.desc_unidade,'
      '    un.sigla'
      'from unidade un'
      '    where un.cod_empresa = :codempresa')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 24
    object QUnidadeDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Required = True
      Size = 40
    end
    object QUnidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      FixedChar = True
      Size = 5
    end
  end
  object QUnidadeDesc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codempresa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'desc_unidade'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '    un.id_unidade,'
      '    un.compl_unidade'
      'from unidade un'
      '    where un.cod_empresa = :codempresa'
      '    and un.desc_unidade = :desc_unidade')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 80
    object QUnidadeDescID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object QUnidadeDescCOMPL_UNIDADE: TStringField
      FieldName = 'COMPL_UNIDADE'
      Size = 30
    end
  end
end
