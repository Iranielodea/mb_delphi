object frmExtratoCredito: TfrmExtratoCredito
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Extrato Cr'#233'dito'
  ClientHeight = 423
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 145
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 62
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Cliente:'
    end
    object Label2: TLabel
      Left = 34
      Top = 46
      Width = 65
      Height = 13
      Caption = 'Data Cr'#233'dito:'
    end
    object Label3: TLabel
      Left = 1
      Top = 73
      Width = 98
      Height = 13
      Caption = 'Quantidade Cr'#233'dito:'
    end
    object Label4: TLabel
      Left = 6
      Top = 98
      Width = 93
      Height = 13
      Caption = 'Quantidade Usada:'
    end
    object Label5: TLabel
      Left = 69
      Top = 124
      Width = 30
      Height = 13
      Caption = 'Saldo:'
    end
    object Label6: TLabel
      Left = 299
      Top = 103
      Width = 127
      Height = 13
      Caption = 'Quantidade Movimentada:'
    end
    object Label7: TLabel
      Left = 376
      Top = 126
      Width = 50
      Height = 13
      Caption = 'Diferen'#231'a:'
    end
    object dbedtCOD_CLIENTE: TDBEdit
      Left = 112
      Top = 13
      Width = 64
      Height = 21
      DataField = 'COD_CLIENTE'
      DataSource = ds2
      TabOrder = 0
    end
    object dbedtNOME: TDBEdit
      Left = 182
      Top = 13
      Width = 451
      Height = 21
      DataField = 'NOME'
      DataSource = ds2
      TabOrder = 1
    end
    object dbedtDATA_CREDITO: TDBEdit
      Left = 112
      Top = 45
      Width = 121
      Height = 21
      DataField = 'DATA_CREDITO'
      DataSource = ds2
      TabOrder = 2
    end
    object dbedtQTDE_CREDITO: TDBEdit
      Left = 112
      Top = 70
      Width = 121
      Height = 21
      DataField = 'QTDE_CREDITO'
      DataSource = ds2
      TabOrder = 3
    end
    object dbedtQTDE_USADO: TDBEdit
      Left = 112
      Top = 95
      Width = 121
      Height = 21
      DataField = 'QTDE_USADO'
      DataSource = ds2
      TabOrder = 4
    end
    object dbedtQTDE_SALDO: TDBEdit
      Left = 112
      Top = 118
      Width = 121
      Height = 21
      DataField = 'QTDE_SALDO'
      DataSource = ds2
      TabOrder = 5
    end
    object dbedtCTotalQtde: TDBEdit
      Left = 432
      Top = 95
      Width = 121
      Height = 21
      DataField = 'CTotalQtde'
      DataSource = ds2
      TabOrder = 6
    end
    object edtDiferenca: TEdit
      Left = 432
      Top = 118
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 7
      Text = 'edtDiferenca'
    end
    object btnAjustarSaldo: TBitBtn
      Left = 576
      Top = 114
      Width = 113
      Height = 25
      Caption = 'Ajustar Saldo'
      TabOrder = 8
      OnClick = btnAjustarSaldoClick
    end
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 145
    Width = 702
    Height = 237
    Align = alClient
    DataSource = ds2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CARGA'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Width = 99
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 382
    Width = 702
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 1
  end
  object dsCredito: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspCredito'
    Left = 200
    Top = 192
    object dsCreditoDATA_CREDITO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA_CREDITO'
    end
    object dsCreditoQTDE_CREDITO: TFloatField
      DisplayLabel = 'Qtde Cr'#233'dito'
      FieldName = 'QTDE_CREDITO'
      DisplayFormat = ',###.###'
    end
    object dsCreditoQTDE_USADO: TFloatField
      DisplayLabel = 'Qtde Usado'
      FieldName = 'QTDE_USADO'
      DisplayFormat = ',###.###'
    end
    object dsCreditoQTDE_SALDO: TFloatField
      FieldName = 'QTDE_SALDO'
      DisplayFormat = ',###.###'
    end
    object dsCreditoID_CARGA: TIntegerField
      DisplayLabel = 'N'#186' Carga'
      FieldName = 'ID_CARGA'
      Required = True
    end
    object dsCreditoNUM_PEDIDO: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object dsCreditoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object dsCreditoQTDE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      DisplayFormat = ',###.###'
    end
    object dsCreditoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object dsCreditoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object dsCreditoCTotalQtde: TAggregateField
      Alignment = taRightJustify
      FieldName = 'CTotalQtde'
      Active = True
      DisplayName = ''
      DisplayFormat = ',###.###'
      Expression = 'Sum(Qtde)'
    end
  end
  object ds2: TDataSource
    AutoEdit = False
    DataSet = dsCredito
    Left = 264
    Top = 192
  end
  object QCredito: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    PC.cod_cliente,'
      '    PC.data_credito,'
      '    PC.qtde_credito,'
      '    PC.qtde_usado,'
      '    PC.qtde_saldo,'
      '    CA.id_carga,'
      '    CA.num_pedido,'
      '    CA.data,'
      '    CA.qtde,'
      '    CLI.nome'
      'FROM PESSOA_CREDITO PC'
      '    INNER JOIN CLIENTE CLI ON PC.cod_cliente = CLI.cod_cliente'
      '    LEFT JOIN CARGA CA ON PC.cod_cliente = CA.cod_cliente'
      'WHERE CA.cod_empresa = :CODEMPRESA'
      'AND CA.data >= :DATA'
      'AND CA.cod_cliente = :CODCLIENTE'
      'ORDER BY CA.DATA, CA.ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 128
    Top = 192
  end
  object dspCredito: TDataSetProvider
    DataSet = QCredito
    Left = 160
    Top = 192
  end
  object QAtualizaQtde: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'QTDE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODCLIENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      ' UPDATE pessoa_credito'
      ' SET qtde_usado = :QTDE'
      ' WHERE cod_cliente = :CODCLIENTE')
    SQLConnection = DM.BancoDados
    Left = 352
    Top = 200
  end
end
