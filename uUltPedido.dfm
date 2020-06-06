object fUltPedido: TfUltPedido
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = #218'ltimos Pedidos do Cliente'
  ClientHeight = 516
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Grade: TDBGrid
    Left = 0
    Top = 41
    Width = 742
    Height = 434
    Align = alClient
    DataSource = dsPedido
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = Menu_Auxiliar
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Title.Caption = 'N'#186'Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 209
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Title.Caption = 'Produto'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGLA'
        Title.Caption = 'Unidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Title.Caption = 'Qtde'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Title.Caption = 'Valor Venda'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 475
    Width = 742
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 256
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Total Qtde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 9
      Width = 178
      Height = 16
      Caption = 'Bot'#227'o Direito para ver Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Cod_Cliente: TEdit
      Left = 552
      Top = 8
      Width = 41
      Height = 21
      TabOrder = 0
      Visible = False
    end
    object butSair: TBitBtn
      Left = 608
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Sai&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = butSairClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
        9090808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9A66669A6666B96666BB6868693334FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9494949494948F8F8F91
        9191808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
        669A66669A6666FF00FFFF00FFFF00FF9494949494949898989D9D9D9D9D9D95
        9595808080949494949494949494949494949494949494FF00FFFF00FFFF00FF
        9A6666DE7374D77071D56F70D56D6EC76A6D693334FEA2A3FCAFB0FABCBDF9C5
        C6F9C5C69A6666FF00FFFF00FFFF00FF949494A8A8A8A3A3A3A2A2A2A1A1A198
        9898808080D0D0D0D5D5D5DBDBDBDFDFDFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
        5BF9C5C69A6666FF00FFFF00FFFF00FF949494ABABABA8A8A8A7A7A7A6A6A69D
        9D9D8080808F8F8F8E8E8E8E8E8E868686DFDFDF949494FF00FFFF00FFFF00FF
        9A6666E57D7EE07A7BDF797ADF7778D0727569333442C46830CD6733CB6724CB
        60F9C5C69A6666FF00FFFF00FFFF00FF949494B1B1B1ADADADACACACABABABA1
        A1A18080809292929292929393938B8B8BDFDFDF949494FF00FFFF00FFFF00FF
        9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
        5EF9C5C69A6666FF00FFFF00FFFF00FF949494B6B6B6B2B2B2B0B0B0B3B3B3A3
        A3A38080808F8F8F8E8E8E909090898989DFDFDF949494FF00FFFF00FFFF00FF
        9A6666F08788E98182EC9697FBDDDED8888A693334B8E1AC6BDC895DD58046D4
        73F9C5C69A6666FF00FFFF00FFFF00FF949494BBBBBBB5B5B5C1C1C1ECECECB0
        B0B0808080DADADAB7B7B7ADADADA1A1A1DFDFDF949494FF00FFFF00FFFF00FF
        9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
        D4F9C5C69A6666FF00FFFF00FFFF00FF949494C0C0C0BABABAC4C4C4ECECECB1
        B1B1808080F1F1F1EFEFEFEEEEEEE8E8E8DFDFDF949494FF00FFFF00FFFF00FF
        9A6666FA9192F48E8FF28B8CF48C8DDC7F80693334FDF3D4FFFFDFFFFFDDFFFF
        E0F9C5C69A6666FF00FFFF00FFFF00FF949494C5C5C5C1C1C1BEBEBEC0C0C0AD
        ADAD808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF949494CACACAC6C6C6C5C5C5C4C4C4B2
        B2B2808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666FF9B9CFD9798FC9697FE9798E38889693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF949494CDCDCDCACACAC9C9C9CACACAB5
        B5B5808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF949494CFCFCFCCCCCCCCCCCCCCCCCCB9
        B9B9808080E8E8E8EFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A66669A6666E98E8FFE999AFF9D9EEB8F90693334FBF0D2FDFCDCFDFCDAFDFC
        DCF9C5C69A6666FF00FFFF00FFFF00FF949494949494BBBBBBCBCBCBCECECEBD
        BDBD808080E6E6E6ECECECEBEBEBECECECDFDFDF949494FF00FFFF00FFFF00FF
        FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
        669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FF949494A4A4A4AEAEAEB1
        B1B1808080949494949494949494949494949494949494FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF9A66669A6666693334FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92929290
        9090808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
    object DBEdit1: TDBEdit
      Left = 328
      Top = 16
      Width = 97
      Height = 19
      Color = clBtnFace
      Ctl3D = False
      DataField = 'C_QTDE'
      DataSource = dsPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object PNome: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Qpedido: TSQLQuery
    SQLConnection = DM.BancoDados
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select'
      '   PED.NUM_PEDIDO,'
      '   PED.DATA,'
      '   PED.COD_CLIENTE,'
      '   CLI.NOME,'
      '   PRO.COD_PRODUTO,'
      '   PRO.DESC_PRODUTO,'
      '   UNI.SIGLA,'
      '   ITE.QTDE,'
      '   ITE.VALOR,'
      '   ITE.PRECO_VENDA'
      'from PEDIDO PED'
      '   left join CLIENTE CLI on PED.COD_CLIENTE = CLI.COD_CLIENTE'
      '   left join ITENS_PEDIDO ITE on PED.NUM_PEDIDO = ITE.NUM_PEDIDO'
      '   left join PRODUTO PRO on ITE.COD_PRODUTO = PRO.COD_PRODUTO'
      '   left join UNIDADE UNI on ITE.ID_UNIDADE = UNI.ID_UNIDADE'
      '   where PED.COD_CLIENTE = :COD_CLIENTE'
      '   order by PED.NUM_PEDIDO desc')
    Left = 152
    Top = 80
  end
  object dspPedido: TDataSetProvider
    DataSet = Qpedido
    Constraints = True
    Left = 224
    Top = 80
  end
  object Pedido: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPedido'
    Left = 312
    Top = 80
    object PedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object PedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object PedidoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object PedidoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object PedidoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object PedidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 50
    end
    object PedidoSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
    object PedidoQTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = ',##0'
    end
    object PedidoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = ',##0.00'
    end
    object PedidoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      DisplayFormat = ',##0.00'
    end
    object PedidoC_QTDE: TAggregateField
      FieldName = 'C_QTDE'
      Active = True
      DisplayFormat = ',##0'
      Expression = 'sum(QTDE)'
    end
  end
  object dsPedido: TDataSource
    DataSet = Pedido
    Left = 384
    Top = 88
  end
  object Menu_Auxiliar: TPopupMenu
    Left = 464
    Top = 224
    object VerPedido1: TMenuItem
      Caption = 'Ver Pedido'
      OnClick = VerPedido1Click
    end
  end
end
