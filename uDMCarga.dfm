object dmCarga: TdmCarga
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object QPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    FORN.nome'
      'FROM PEDIDO PED'
      '    INNER JOIN FORNECEDOR FORN ON PED.cod_usina = FORN.cod_for'
      '    WHERE PED.num_pedido = :NUM_PEDIDO')
    SQLConnection = DM.BancoDados
    Left = 40
    Top = 40
    object QPedidoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object QExpNuvem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE CARGA SET EXPORTAR_NET = '#39'S'#39' WHERE ID_CARGA = :ID')
    SQLConnection = DM.BancoDados
    Left = 96
    Top = 40
  end
end
