object FrPedido1: TFrPedido1
  Left = 283
  Top = 240
  Caption = 'FrPedido1'
  ClientHeight = 461
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object QPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIN'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   CLI.NOME AS NOME_CLIENTE,'
      '   EST.SIGLA AS UF,'
      '   FO.NOME AS NOME_FORNECEDOR,'
      '   CON.NOME AS NOME_CONTATO,'
      '   PRO.DESC_PRODUTO,'
      '   VEN.NOME AS NOME_VENDEDOR,'
      '   UN.SIGLA,'
      '   PED.NUM_PEDIDO,'
      '   PED.DATA,'
      '   PED.COD_CLIENTE,'
      '   PED.COD_FOR,'
      '   PED.COD_CONTATO,'
      '   PED.COD_VENDEDOR,'
      '   PED.PERC_COMISSAO,'
      '   PED.TOTAL_LIQUIDO,'
      '   PED.SITUACAO,'
      '   PED.VALOR_COMISSAO AS COMISSAO_PEDIDO,'
      '   ITE.COD_PRODUTO,'
      '   ITE.QTDE,'
      
        '   (ITE.TOTAL_VENDA * PED.PERC_COMISSAO) / 100 AS VALOR_COMISSAO' +
        ','
      '   ITE.VALOR_TOTAL AS TOTAL_COMPRA,'
      '   ITE.TOTAL_VENDA,'
      '   ITE.TOTAL_LUCRO AS TOTAL_DIFERENCA'
      'from PEDIDO PED'
      
        '   inner join ITENS_PEDIDO ITE on PED.NUM_PEDIDO = ITE.NUM_PEDID' +
        'O'
      '   left join CLIENTE CLI on PED.COD_CLIENTE = CLI.COD_CLIENTE'
      '   left join CIDADE CID on CLI.COD_CIDADE = CID.COD_CIDADE'
      '   left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      '   left join FORNECEDOR FO on PED.COD_FOR = FO.COD_FOR'
      '   left join CLIENTE CON on PED.COD_CONTATO = CON.COD_CLIENTE'
      '   left join PRODUTO PRO on ITE.COD_PRODUTO = PRO.COD_PRODUTO'
      '   left join UNIDADE UN on ITE.ID_UNIDADE = UN.ID_UNIDADE'
      '   left join VENDEDOR VEN on PED.COD_VENDEDOR = VEN.COD_VENDEDOR'
      'where PED.COD_EMPRESA = :COD_EMPRESA'
      'and PED.DATA between :DATAINI and :DATAFIN')
    SQLConnection = DM.BancoDados
    Left = 40
    Top = 40
  end
  object dspPedido: TDataSetProvider
    DataSet = QPedido
    Left = 96
    Top = 40
  end
  object Pedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido'
    OnCalcFields = PedidoCalcFields
    Left = 152
    Top = 40
    object PedidoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object PedidoNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 60
    end
    object PedidoNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 60
    end
    object PedidoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 50
    end
    object PedidoNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 50
    end
    object PedidoSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 5
    end
    object PedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object PedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object PedidoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object PedidoCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
    end
    object PedidoCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object PedidoCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object PedidoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object PedidoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object PedidoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object PedidoQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object PedidoVALOR_COMISSAO: TFloatField
      FieldName = 'VALOR_COMISSAO'
    end
    object PedidoTOTAL_COMPRA: TFloatField
      FieldName = 'TOTAL_COMPRA'
    end
    object PedidoTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
    end
    object PedidoTOTAL_DIFERENCA: TFloatField
      FieldName = 'TOTAL_DIFERENCA'
    end
    object PedidoCOMISSAO_PEDIDO: TFloatField
      FieldName = 'COMISSAO_PEDIDO'
    end
    object PedidoC_TOTALCOMISSAO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C_TOTALCOMISSAO'
      Calculated = True
    end
    object PedidoTOTAL_LIQUIDO: TFloatField
      FieldName = 'TOTAL_LIQUIDO'
    end
    object PedidoC_COMISSAOUNITARIO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C_COMISSAOUNITARIO'
      Calculated = True
    end
    object PedidoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object dsPedido: TDataSource
    DataSet = Pedido
    Left = 208
    Top = 40
  end
  object dbPedido: TppDBPipeline
    DataSource = dsPedido
    UserName = 'dbPedido'
    Left = 280
    Top = 40
  end
  object Rel1: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 40
    Top = 96
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Pedidos p/Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 20638
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 20638
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Un'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 21167
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 122767
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 133350
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 156634
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23546
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 86784
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'COD_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'DESC_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'SIGLA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 114829
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 133879
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 154517
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3969
        mmLeft = 177800
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 88900
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'COD_CLIENTE'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          HyperlinkEnabled = False
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 14817
          mmTop = 794
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 25400
          mmTop = 794
          mmWidth = 71702
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 110596
          mmTop = 1852
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 134673
          mmTop = 1852
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 155575
          mmTop = 1852
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 1323
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object Rel2: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 88
    Top = 96
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Pedidos p/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData2: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 20638
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 20638
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Un'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 21167
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23546
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 86784
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'COD_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'DESC_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'SIGLA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 112977
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 132027
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 175684
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 88900
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel30: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel31: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel32: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel36: TppLabel
          UserName = 'Label2'
          HyperlinkEnabled = False
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_FOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 21167
          mmTop = 794
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_FORNECEDOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 31750
          mmTop = 794
          mmWidth = 71702
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 108744
          mmTop = 1852
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 1852
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1852
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 176742
          mmTop = 1852
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object Rel3: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 136
    Top = 96
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel20: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Pedidos p/Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData3: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 20638
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 20638
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Un'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 21167
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23546
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 86784
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText23: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'COD_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'DESC_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'SIGLA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 112977
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 132027
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 175948
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 88900
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel48: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc23: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel49: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel50: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel51: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel52: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel53: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'COD_CONTATO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel54: TppLabel
          UserName = 'Label2'
          HyperlinkEnabled = False
          Caption = 'Contato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_CONTATO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_CONTATO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 71702
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 108744
          mmTop = 1852
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 1852
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1852
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 176742
          mmTop = 1852
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object Rel5: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 232
    Top = 96
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand5: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel56: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Pedidos p/Produto/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 0
        mmWidth = 138907
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable15: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData5: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 138907
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 129117
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 88900
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText45: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 127000
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 150284
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 174890
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 91017
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'COD_FOR'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOME_FORNECEDOR'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 56886
        BandType = 4
      end
    end
    object ppSummaryBand5: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel81: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc41: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc42: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc43: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc44: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc45: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel82: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel83: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel84: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel85: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine14: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel86: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'COD_PRODUTO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText53: TppDBText
          UserName = 'DBText5'
          HyperlinkEnabled = False
          DataField = 'COD_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppDBText54: TppDBText
          UserName = 'DBText6'
          HyperlinkEnabled = False
          DataField = 'DESC_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
        end
        object ppDBText55: TppDBText
          UserName = 'DBText7'
          HyperlinkEnabled = False
          DataField = 'SIGLA'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 794
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel87: TppLabel
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel88: TppLabel
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = 'Un'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 794
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc46: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 103717
          mmTop = 2381
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc47: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 127265
          mmTop = 2117
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc48: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 2117
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc49: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 174890
          mmTop = 2117
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel89: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc50: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'Foreground3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object Rel6: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 280
    Top = 96
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel57: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Pedidos p/Produto/Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 0
        mmWidth = 138907
        BandType = 0
        LayerName = Foreground4
      end
      object ppSystemVariable16: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground4
      end
      object ppSystemVariable17: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground4
      end
      object ppSystemVariable18: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground4
      end
      object lblData6: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 138907
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel91: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel92: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel93: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel94: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine16: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel95: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel96: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel97: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground4
      end
    end
    object ppDetailBand6: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText56: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 112977
        mmTop = 0
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 0
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 0
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 175948
        mmTop = 0
        mmWidth = 19579
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 0
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'COD_CONTATO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOME_CONTATO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 64294
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppSummaryBand6: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel98: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc51: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc52: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc53: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc54: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc55: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel99: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel100: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel101: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel102: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
        LayerName = Foreground4
      end
      object ppLine17: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel103: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground4
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'COD_PRODUTO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand6: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText64: TppDBText
          UserName = 'DBText5'
          HyperlinkEnabled = False
          DataField = 'COD_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBText65: TppDBText
          UserName = 'DBText6'
          HyperlinkEnabled = False
          DataField = 'DESC_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBText66: TppDBText
          UserName = 'DBText7'
          HyperlinkEnabled = False
          DataField = 'SIGLA'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 794
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLabel104: TppLabel
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLabel105: TppLabel
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = 'Un'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 794
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc56: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 108744
          mmTop = 1852
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBCalc57: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 1852
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBCalc58: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 152665
          mmTop = 1852
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBCalc59: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 175155
          mmTop = 1852
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLine18: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLabel106: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBCalc60: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup6
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
      end
    end
    object ppDesignLayers5: TppDesignLayers
      object ppDesignLayer5: TppDesignLayer
        UserName = 'Foreground4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList5: TppParameterList
    end
  end
  object Rel7: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 40
    Top = 144
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand7: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel90: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Pedidos p/Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable19: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable20: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable21: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData7: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 110067
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23548
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand7: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel117: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc62: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc63: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc64: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc65: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel118: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel119: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel120: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel121: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine20: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLine21: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'COD_CLIENTE'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand7: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBCalc66: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 95779
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc67: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 121444
          mmTop = 0
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc68: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 146315
          mmTop = 0
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc69: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 171980
          mmTop = 0
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBText76: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppDBText77: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 12700
          mmTop = 0
          mmWidth = 76200
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer6: TppDesignLayer
        UserName = 'Foreground5'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList6: TppParameterList
    end
  end
  object Rel8: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 88
    Top = 144
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand8: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel107: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Pedidos p/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable22: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable23: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable24: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData8: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107950
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 122767
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23546
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand8: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel124: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc61: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc70: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc71: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc72: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel125: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel126: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel127: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel128: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine23: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLine24: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand8: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBCalc73: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 95250
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc74: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 118534
          mmTop = 0
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc75: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 143934
          mmTop = 0
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc76: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 0
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object ppDBText67: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_FOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppDBText68: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_FORNECEDOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 12700
          mmTop = 0
          mmWidth = 79375
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers7: TppDesignLayers
      object ppDesignLayer7: TppDesignLayer
        UserName = 'Foreground6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
  object Rel9: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 136
    Top = 144
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand9: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel109: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Pedidos p/Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable25: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable26: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable27: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData9: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 111654
        mmTop = 20638
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 125413
        mmTop = 20638
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 153459
        mmTop = 20108
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23546
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand9: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel135: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc77: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc78: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc79: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc80: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel136: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel137: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel138: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel139: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine26: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLine27: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'COD_CONTATO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand9: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBCalc81: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 99484
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc82: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 122767
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc83: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 148167
          mmTop = 0
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc84: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 0
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object ppDBText69: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_CONTATO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppDBText70: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_CONTATO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 12700
          mmTop = 0
          mmWidth = 82550
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers8: TppDesignLayers
      object ppDesignLayer8: TppDesignLayer
        UserName = 'Foreground7'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList8: TppParameterList
    end
  end
  object Rel10: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 184
    Top = 144
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand10: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel65: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Pedidos p/Produto/Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 0
        mmWidth = 138907
        BandType = 0
      end
      object ppSystemVariable28: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable29: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable30: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData10: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 138907
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 114565
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 127794
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel141: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel142: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178594
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand10: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel145: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc89: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc90: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc91: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel146: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel147: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel148: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel149: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine29: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'COD_PRODUTO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand11: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText37: TppDBText
          UserName = 'DBText5'
          HyperlinkEnabled = False
          DataField = 'COD_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppDBText38: TppDBText
          UserName = 'DBText6'
          HyperlinkEnabled = False
          DataField = 'DESC_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
        end
        object ppDBText39: TppDBText
          UserName = 'DBText7'
          HyperlinkEnabled = False
          DataField = 'SIGLA'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 794
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel150: TppLabel
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel151: TppLabel
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = 'Un'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 794
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 16669
        mmPrintPosition = 0
        object ppDBCalc92: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 99748
          mmTop = 1323
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc93: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 124619
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc94: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 148167
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc95: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 173302
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel152: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc96: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'COD_CLIENTE'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand12: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText40: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 0
          mmWidth = 88371
          BandType = 5
          GroupNo = 1
        end
        object ppDBText41: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc97: TppDBCalc
          UserName = 'DBCalc85'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 100013
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc98: TppDBCalc
          UserName = 'DBCalc86'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 123825
          mmTop = 265
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc99: TppDBCalc
          UserName = 'DBCalc87'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 149225
          mmTop = 265
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc100: TppDBCalc
          UserName = 'DBCalc88'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 173038
          mmTop = 0
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppDesignLayers9: TppDesignLayers
      object ppDesignLayer9: TppDesignLayer
        UserName = 'Foreground8'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList9: TppParameterList
    end
  end
  object Rel4: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 184
    Top = 96
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel38: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Pedidos p/Produto/Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 0
        mmWidth = 138907
        BandType = 0
        LayerName = Foreground9
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground9
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground9
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground9
      end
      object lblData4: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 138907
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel59: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel60: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel61: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel62: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine10: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel63: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel64: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel66: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground9
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText34: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 112977
        mmTop = 0
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText35: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText36: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 0
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText42: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 175684
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText43: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText44: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 0
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText71: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText72: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 64294
        BandType = 4
        LayerName = Foreground9
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel67: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc32: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc34: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc36: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel68: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel69: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel70: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel72: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
        LayerName = Foreground9
      end
      object ppLine11: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel73: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground9
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'COD_PRODUTO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText73: TppDBText
          UserName = 'DBText5'
          HyperlinkEnabled = False
          DataField = 'COD_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBText74: TppDBText
          UserName = 'DBText6'
          HyperlinkEnabled = False
          DataField = 'DESC_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBText75: TppDBText
          UserName = 'DBText7'
          HyperlinkEnabled = False
          DataField = 'SIGLA'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 794
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppLabel153: TppLabel
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppLabel154: TppLabel
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = 'Un'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 794
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
          LayerName = Foreground9
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 108744
          mmTop = 1852
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 1852
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1852
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 176742
          mmTop = 1852
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppLine12: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppLabel155: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBCalc85: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
      end
    end
    object ppDesignLayers10: TppDesignLayers
      object ppDesignLayer10: TppDesignLayer
        UserName = 'Foreground9'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList10: TppParameterList
    end
  end
  object Rel11: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 232
    Top = 144
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand11: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel58: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Pedidos p/Produto/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 0
        mmWidth = 138907
        BandType = 0
      end
      object ppSystemVariable31: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable32: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable33: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData11: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 138907
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 114300
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 127000
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel161: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand11: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel162: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc86: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc87: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc88: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc101: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel163: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel164: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel165: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel166: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine32: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'COD_PRODUTO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand10: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText78: TppDBText
          UserName = 'DBText5'
          HyperlinkEnabled = False
          DataField = 'COD_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppDBText79: TppDBText
          UserName = 'DBText6'
          HyperlinkEnabled = False
          DataField = 'DESC_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'DBText7'
          HyperlinkEnabled = False
          DataField = 'SIGLA'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 794
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel167: TppLabel
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel168: TppLabel
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = 'Un'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 794
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc102: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 101600
          mmTop = 1323
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc103: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 124884
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc104: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 148696
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc105: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 172773
          mmTop = 1323
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel169: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc106: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand13: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText81: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_FORNECEDOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 0
          mmWidth = 87313
          BandType = 5
          GroupNo = 1
        end
        object ppDBText82: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_FOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc107: TppDBCalc
          UserName = 'DBCalc85'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 101600
          mmTop = 265
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc108: TppDBCalc
          UserName = 'DBCalc86'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 124884
          mmTop = 265
          mmWidth = 22490
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc109: TppDBCalc
          UserName = 'DBCalc87'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 148961
          mmTop = 265
          mmWidth = 22490
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc110: TppDBCalc
          UserName = 'DBCalc88'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 173567
          mmTop = 265
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppDesignLayers11: TppDesignLayers
      object ppDesignLayer11: TppDesignLayer
        UserName = 'Foreground10'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList11: TppParameterList
    end
  end
  object Rel12: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 280
    Top = 144
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand12: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel71: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Pedidos p/Produto/Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 0
        mmWidth = 138907
        BandType = 0
      end
      object ppSystemVariable34: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable35: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable36: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData12: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 138907
        BandType = 0
      end
      object ppLabel171: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107950
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel172: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 122767
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel173: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 150284
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel174: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel176: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel170: TppLabel
        UserName = 'Label170'
        HyperlinkEnabled = False
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 11642
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand12: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel177: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc111: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc112: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc113: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc114: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel178: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel179: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel180: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel181: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine35: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'COD_PRODUTO'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand14: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText83: TppDBText
          UserName = 'DBText5'
          HyperlinkEnabled = False
          DataField = 'COD_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppDBText84: TppDBText
          UserName = 'DBText6'
          HyperlinkEnabled = False
          DataField = 'DESC_PRODUTO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
        end
        object ppDBText85: TppDBText
          UserName = 'DBText7'
          HyperlinkEnabled = False
          DataField = 'SIGLA'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 105834
          mmTop = 794
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel182: TppLabel
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel183: TppLabel
          UserName = 'Label7'
          HyperlinkEnabled = False
          Caption = 'Un'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 794
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc115: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 94456
          mmTop = 1323
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc116: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 120121
          mmTop = 1323
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc117: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 146579
          mmTop = 1323
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc118: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 171186
          mmTop = 1323
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel184: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc119: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup14
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand15: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText86: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_CONTATO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 0
          mmWidth = 82286
          BandType = 5
          GroupNo = 1
        end
        object ppDBText87: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'NOME_CONTATO'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc120: TppDBCalc
          UserName = 'DBCalc85'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 265
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc121: TppDBCalc
          UserName = 'DBCalc86'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 120650
          mmTop = 265
          mmWidth = 23813
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc122: TppDBCalc
          UserName = 'DBCalc87'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 146050
          mmTop = 265
          mmWidth = 23813
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc123: TppDBCalc
          UserName = 'DBCalc88'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 171450
          mmTop = 0
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppDesignLayers12: TppDesignLayers
      object ppDesignLayer12: TppDesignLayer
        UserName = 'Foreground11'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList12: TppParameterList
    end
  end
  object Rel13: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 40
    Top = 192
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand13: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel175: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Comiss'#245'es p/Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
        LayerName = Foreground12
      end
      object ppSystemVariable37: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
        LayerName = Foreground12
      end
      object ppSystemVariable38: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground12
      end
      object ppSystemVariable39: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground12
      end
      object lblData13: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel186: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 20638
        mmWidth = 11642
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel187: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 20638
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel188: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Un'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 21167
        mmWidth = 3969
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel189: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 122767
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel190: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 133350
        mmTop = 21167
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel191: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Total Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 158221
        mmTop = 21167
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground12
      end
      object ppLine37: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23546
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel193: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground12
      end
      object ppLabel194: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 86784
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground12
      end
    end
    object ppDetailBand13: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText88: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'COD_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 10054
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText89: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'DESC_PRODUTO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 56356
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText90: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'SIGLA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 0
        mmWidth = 10054
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText91: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 114829
        mmTop = 0
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText92: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'C_COMISSAOUNITARIO'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 0
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText93: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'C_TOTALCOMISSAO'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 159015
        mmTop = 0
        mmWidth = 26458
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText95: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground12
      end
      object ppDBText96: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 88900
        mmTop = 0
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground12
      end
    end
    object ppSummaryBand13: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel195: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
        LayerName = Foreground12
      end
      object ppDBCalc124: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 1323
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground12
      end
      object ppDBCalc125: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 5292
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground12
      end
      object ppDBCalc126: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'C_TOTALCOMISSAO'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 9525
        mmWidth = 28575
        BandType = 7
        LayerName = Foreground12
      end
      object ppLabel196: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
        LayerName = Foreground12
      end
      object ppLabel197: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground12
      end
      object ppLine38: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 13758
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
        LayerName = Foreground12
      end
      object ppLabel200: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground12
      end
    end
    object ppGroup16: TppGroup
      BreakName = 'COD_VENDEDOR'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand16: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel201: TppLabel
          UserName = 'Label2'
          HyperlinkEnabled = False
          Caption = 'Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppDBText97: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_VENDEDOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 794
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppDBText98: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_VENDEDOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 27517
          mmTop = 794
          mmWidth = 71702
          BandType = 3
          GroupNo = 0
          LayerName = Foreground12
        end
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc129: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 110596
          mmTop = 1852
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppDBCalc130: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'C_COMISSAOUNITARIO'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 135467
          mmTop = 1852
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppDBCalc131: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'C_TOTALCOMISSAO'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 158750
          mmTop = 1852
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLine39: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppLabel202: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
        object ppDBCalc133: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup16
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground12
        end
      end
    end
    object ppDesignLayers13: TppDesignLayers
      object ppDesignLayer13: TppDesignLayer
        UserName = 'Foreground12'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList13: TppParameterList
    end
  end
  object Rel14: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 88
    Top = 192
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand14: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel185: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Comiss'#245'es p/Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable40: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable41: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable42: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData14: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel198: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel199: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 122767
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel203: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 137584
        mmTop = 21167
        mmWidth = 23283
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23546
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand14: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel206: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc127: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 5292
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc128: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'C_TOTALCOMISSAO'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 9525
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel207: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel208: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 27252
        BandType = 7
      end
      object ppLine41: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 14288
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLine42: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'COD_VENDEDOR'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand17: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object ppDBCalc135: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3175
          mmLeft = 110596
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc136: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'C_TOTALCOMISSAO'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 134673
          mmTop = 0
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBText94: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'COD_VENDEDOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppDBText99: TppDBText
          UserName = 'DBText2'
          HyperlinkEnabled = False
          DataField = 'NOME_VENDEDOR'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 12700
          mmTop = 0
          mmWidth = 94192
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers14: TppDesignLayers
      object ppDesignLayer14: TppDesignLayer
        UserName = 'Foreground13'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList14: TppParameterList
    end
  end
  object Rel15: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 328
    Top = 96
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand15: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel192: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Pedidos p/Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 0
        mmWidth = 138907
        BandType = 0
      end
      object ppSystemVariable43: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable44: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable45: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData15: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 138907
        BandType = 0
      end
      object ppLabel205: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel209: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel210: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel211: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel213: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 21167
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel214: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 21167
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText100: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 112977
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText101: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText103: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 175684
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText104: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 64294
        BandType = 4
      end
    end
    object ppSummaryBand15: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel215: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc132: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1852
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc134: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc137: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc138: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc139: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel216: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel217: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel218: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel219: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine44: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel220: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'UF'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand18: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText108: TppDBText
          UserName = 'DBText5'
          HyperlinkEnabled = False
          DataField = 'UF'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 6350
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel221: TppLabel
          UserName = 'Label6'
          HyperlinkEnabled = False
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBCalc140: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 108744
          mmTop = 1852
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc141: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 1852
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc142: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 153723
          mmTop = 1852
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc143: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 176742
          mmTop = 1852
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
        object ppLabel223: TppLabel
          UserName = 'Label12'
          HyperlinkEnabled = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 1852
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc144: TppDBCalc
          UserName = 'DBCalc5'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup18
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers15: TppDesignLayers
      object ppDesignLayer15: TppDesignLayer
        UserName = 'Foreground14'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList15: TppParameterList
    end
  end
  object Rel16: TppReport
    AutoStop = False
    DataPipeline = dbPedido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = Rel1PreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 136
    Top = 192
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPedido'
    object ppHeaderBand16: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel204: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Pedidos p/Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 50800
        mmTop = 0
        mmWidth = 103188
        BandType = 0
      end
      object ppSystemVariable46: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable47: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable48: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object lblData16: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 50800
        mmTop = 6350
        mmWidth = 103452
        BandType = 0
      end
      object ppLabel224: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 21167
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel225: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 110067
        mmTop = 21167
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel226: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Vlr.Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 21167
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel227: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Vlr.Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel228: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Dif.Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 178065
        mmTop = 21167
        mmWidth = 17463
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23548
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand16: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLabel229: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Geral=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 10054
        mmWidth = 25400
        BandType = 7
      end
      object ppDBCalc145: TppDBCalc
        UserName = 'DBCalc7'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbPedido
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 5821
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc146: TppDBCalc
        UserName = 'DBCalc8'
        HyperlinkEnabled = False
        DataField = 'TOTAL_COMPRA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 10054
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc147: TppDBCalc
        UserName = 'DBCalc9'
        HyperlinkEnabled = False
        DataField = 'TOTAL_VENDA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 14288
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc148: TppDBCalc
        UserName = 'DBCalc10'
        HyperlinkEnabled = False
        DataField = 'TOTAL_DIFERENCA'
        DataPipeline = dbPedido
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPedido'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 18521
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel230: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 6350
        mmWidth = 19579
        BandType = 7
      end
      object ppLabel231: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel232: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Total Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 14288
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel233: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Total Dif.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 132821
        mmTop = 18521
        mmWidth = 19579
        BandType = 7
      end
      object ppLine47: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 129117
        mmTop = 1588
        mmWidth = 2646
        BandType = 7
      end
      object ppLine48: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'UF'
      DataPipeline = dbPedido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbPedido'
      NewFile = False
      object ppGroupHeaderBand19: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand19: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBCalc149: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbPedido
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 95779
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc150: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'TOTAL_COMPRA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 121444
          mmTop = 0
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc151: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'TOTAL_VENDA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 146315
          mmTop = 0
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc152: TppDBCalc
          UserName = 'DBCalc4'
          HyperlinkEnabled = False
          DataField = 'TOTAL_DIFERENCA'
          DataPipeline = dbPedido
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup19
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3704
          mmLeft = 171980
          mmTop = 0
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBText109: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'UF'
          DataPipeline = dbPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbPedido'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppDesignLayers16: TppDesignLayers
      object ppDesignLayer16: TppDesignLayer
        UserName = 'Foreground15'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList16: TppParameterList
    end
  end
end
