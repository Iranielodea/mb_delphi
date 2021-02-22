object dmContas: TdmContas
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QExpNuvem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE CONTAS SET EXPORTAR_NET = '#39'S'#39' WHERE ID_CONTA = :ID')
    SQLConnection = DM.BancoDados
    Left = 96
    Top = 40
  end
end
