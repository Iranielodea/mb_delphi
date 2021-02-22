object dmContaBanco: TdmContaBanco
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QExpNuvem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'UPDATE CONTABANCO SET EXPORTAR_NET = '#39'S'#39' WHERE ID_CONTABANCO = :' +
        'ID')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 24
  end
end
