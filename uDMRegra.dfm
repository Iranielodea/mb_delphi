object dmRegra: TdmRegra
  OldCreateOrder = False
  Height = 204
  Width = 328
  object QContasCarga: TSQLDataSet
    CommandText = 
      'select VALOR_PAGAR, COD_CLIENTE from CONTAS'#13#10' where COD_EMPRESA ' +
      '= :COD_EMPRESA'#13#10' and  NUM_PEDIDO = :NUM_PEDIDO'#13#10' and TIPO_CONTA ' +
      '= 2'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 16
    Top = 16
    object QContasCargaVALOR_PAGAR: TFloatField
      FieldName = 'VALOR_PAGAR'
    end
    object QContasCargaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
  end
  object QCarga: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   NUM_PEDIDO,'
      '   ID_CARGA'
      'from CARGA'
      '   where NUM_PEDIDO = :NUM_CARGA')
    SQLConnection = DM.BancoDados
    Left = 80
    Top = 16
    object QCargaNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object QCargaID_CARGA: TIntegerField
      FieldName = 'ID_CARGA'
      Required = True
    end
  end
  object Qpesq: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_MOTORISTA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   count(ID_CARGA) AS QTDE,'
      '   max(NUM_CARGA) AS NUM_CARGA'
      'from CARGA'
      '   where COD_EMPRESA = :COD_EMPRESA'
      '   and DATA = :DATA'
      '   and COD_MOTORISTA = :COD_MOTORISTA')
    SQLConnection = DM.BancoDados
    Left = 16
    Top = 64
    object QpesqQTDE: TIntegerField
      FieldName = 'QTDE'
      Required = True
    end
    object QpesqNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
    end
  end
  object Qpesq1: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   max(NUM_CARGA) AS N_CARGA'
      'from CARGA'
      '   where COD_EMPRESA = :COD_EMPRESA'
      '   and DATA = :DATA'
      '')
    SQLConnection = DM.BancoDados
    Left = 80
    Top = 64
    object Qpesq1N_CARGA: TIntegerField
      FieldName = 'N_CARGA'
    end
  end
  object QSaldo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   sum(QTDE) as Qtde_ENTREGUE'
      'from CARGA'
      '   where COD_EMPRESA = :COD_EMPRESA'
      '   and ID_CARGA <> :ID_CARGA'
      '   and NUM_PEDIDO = :NUM_PEDIDO'
      '')
    SQLConnection = DM.BancoDados
    Left = 16
    Top = 120
    object QSaldoQTDE_ENTREGUE: TFloatField
      FieldName = 'QTDE_ENTREGUE'
    end
  end
  object QPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   VALOR_LUCRO'
      'from PEDIDO'
      '   where NUM_PEDIDO = :NUM_PEDIDO')
    SQLConnection = DM.BancoDados
    Left = 80
    Top = 120
    object QPedidoVALOR_LUCRO: TFloatField
      FieldName = 'VALOR_LUCRO'
    end
  end
  object QClienteWEB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT COUNT(COD_CLIENTE) FROM CLIENTE WHERE EXPORTAR_NET = '#39'S'#39)
    SQLConnection = DM.BancoDados
    Left = 152
    Top = 16
    object QClienteWEBCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object QTransportadorWEB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT COUNT(COD_TRANS) FROM TRANSPORTADOR WHERE EXPORTAR_NET = ' +
        #39'S'#39)
    SQLConnection = DM.BancoDados
    Left = 152
    Top = 64
    object QTransportadorWEBCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object QPedidoWEB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT COUNT(NUM_PEDIDO) FROM PEDIDO WHERE EXPORTAR_NET = '#39'S'#39)
    SQLConnection = DM.BancoDados
    Left = 152
    Top = 120
    object QPedidoWEBCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end
