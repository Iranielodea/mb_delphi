object dmPedido: TdmPedido
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QExpNuvem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE PEDIDO SET EXPORTAR_NET = '#39'S'#39' WHERE NUM_PEDIDO = :CODIGO')
    SQLConnection = DM.BancoDados
    Left = 40
    Top = 24
  end
end
