object fRCarga1: TfRCarga1
  Left = 192
  Top = 114
  Caption = 'fRCarga1'
  ClientHeight = 317
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object QRelatorio: TSQLQuery
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
      '   FO.NOME AS NOME_FORNECEDOR,'
      '   MOT.NOME AS NOME_MOTORISTA,'
      '   ('
      '      select CON.NOME from CLIENTE CON'
      '         where CAR.COD_CONTATO = CON.COD_CLIENTE'
      '   ) AS NOME_CONTATO,'
      '   CAR.COD_CONTATO,'
      '   CAR.COD_CLIENTE,'
      '   CAR.COD_FOR,'
      '   CAR.COD_MOTORISTA,'
      '   CAR.DATA,'
      '   CAR.ID_CARGA,'
      '   CAR.LETRA,'
      '   CAR.NUM_CARGA,'
      '   CAR.NUM_PEDIDO,'
      '   CAR.QTDE,'
      '   CAR.QTDE_PEDIDO,'
      '   CAR.SITUACAO,'
      '   CAR.VALOR_CARREGA,'
      '   CAR.VALOR_FRETE,'
      '   CAR.VALOR_PEDIDO,'
      '   PED.PERC_COMISSAO,'
      '   PED.TOTAL_VENDA,'
      '   PED.TOTAL_LIQUIDO,'
      '   PED.TOTAL_QTDE,'
      '   USI.cod_for as COD_USINA,'
      '   USI.nome AS NOME_USINA'
      'from CARGA CAR'
      '   left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE'
      '   left join FORNECEDOR FO on CAR.COD_FOR = FO.COD_FOR'
      
        '   left join MOTORISTA MOT on CAR.COD_MOTORISTA = MOT.COD_MOTORI' +
        'STA'
      '   left join PEDIDO PED on CAR.NUM_PEDIDO = PED.NUM_PEDIDO'
      '   left join FORNECEDOR USI on PED.cod_usina = USI.cod_for'
      '   left join TRANSPORTADOR TRA on MOT.COD_TRANS = TRA.COD_TRANS'
      '   where CAR.COD_EMPRESA = :COD_EMPRESA'
      '   and CAR.DATA between :DATAINI and :DATAFIN')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 24
  end
  object dspRelatorio: TDataSetProvider
    DataSet = QRelatorio
    Left = 96
    Top = 24
  end
  object Relatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    OnCalcFields = RelatorioCalcFields
    Left = 176
    Top = 24
    object RelatorioNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object RelatorioNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 60
    end
    object RelatorioNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 40
    end
    object RelatorioCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object RelatorioCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object RelatorioCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object RelatorioCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object RelatorioDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object RelatorioID_CARGA: TIntegerField
      FieldName = 'ID_CARGA'
      Required = True
    end
    object RelatorioLETRA: TStringField
      FieldName = 'LETRA'
      FixedChar = True
      Size = 2
    end
    object RelatorioNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
      Required = True
    end
    object RelatorioNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object RelatorioQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object RelatorioQTDE_PEDIDO: TFloatField
      FieldName = 'QTDE_PEDIDO'
    end
    object RelatorioSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object RelatorioVALOR_CARREGA: TFloatField
      FieldName = 'VALOR_CARREGA'
    end
    object RelatorioVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object RelatorioVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
    end
    object RelatorioPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object RelatorioTOTAL_VENDA: TFloatField
      FieldName = 'TOTAL_VENDA'
    end
    object RelatorioTOTAL_QTDE: TFloatField
      FieldName = 'TOTAL_QTDE'
    end
    object RelatorioC_BASECOMISSAO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C_BASECOMISSAO'
      Calculated = True
    end
    object RelatorioC_VALORCOMISSAO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C_VALORCOMISSAO'
      Calculated = True
    end
    object RelatorioC_NUMCARGA: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_NUMCARGA'
      Calculated = True
    end
    object RelatorioNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 60
    end
    object RelatorioTOTAL_LIQUIDO: TFloatField
      FieldName = 'TOTAL_LIQUIDO'
    end
    object RelatorioCOD_USINA: TIntegerField
      FieldName = 'COD_USINA'
    end
    object RelatorioNOME_USINA: TStringField
      FieldName = 'NOME_USINA'
      Size = 60
    end
  end
  object dsRelatorio: TDataSource
    DataSet = Relatorio
    Left = 248
    Top = 24
  end
  object dbRelatorio: TppDBPipeline
    DataSource = dsRelatorio
    UserName = 'dbRelatorio'
    Left = 320
    Top = 24
  end
  object Rel1: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 24
    Top = 80
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Comiss'#245'es p/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
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
        mmTop = 4233
        mmWidth = 101336
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'N'#186'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 12700
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Base Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = '%Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 12700
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'C_NUMCARGA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 0
        mmWidth = 53711
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'C_BASECOMISSAO'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'PERC_COMISSAO'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'C_VALORCOMISSAO'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 168011
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13758
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Qtde Cargas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Base Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 25400
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Valor Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2381
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'C_BASECOMISSAO'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'C_VALORCOMISSAO'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'Label9'
          HyperlinkEnabled = False
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_FOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 23283
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_FORNECEDOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 33867
          mmTop = 794
          mmWidth = 74613
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'C_BASECOMISSAO'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 120650
          mmTop = 2381
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'C_VALORCOMISSAO'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 2381
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = 'Total=>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 2381
          mmWidth = 17198
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
    DataPipeline = dbRelatorio
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
    Left = 72
    Top = 80
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Cargas p/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
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
        mmTop = 4233
        mmWidth = 101336
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'N'#186'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 12700
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'C_NUMCARGA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 0
        mmWidth = 53711
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 168011
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Qtde Cargas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2381
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
      end
      object ppLabel30: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel28: TppLabel
          UserName = 'Label9'
          HyperlinkEnabled = False
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 794
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_FOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 23283
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_FORNECEDOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 33867
          mmTop = 794
          mmWidth = 74613
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 120650
          mmTop = 2381
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 2381
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = 'Total=>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 2381
          mmWidth = 17198
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
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 144463
          mmTop = 2381
          mmWidth = 18785
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
    DataPipeline = dbRelatorio
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
    Left = 120
    Top = 80
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Cargas p/Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
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
        mmTop = 4233
        mmWidth = 101336
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'N'#186'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 12700
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText21: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'C_NUMCARGA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 0
        mmWidth = 53711
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 168011
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel39: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel40: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Qtde Cargas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel41: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
      end
      object ppLabel42: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2381
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
      end
      object ppLabel43: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'COD_CONTATO'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel44: TppLabel
          UserName = 'Label9'
          HyperlinkEnabled = False
          Caption = 'Contato:'
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
        end
        object ppDBText29: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_CONTATO'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_CONTATO'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 29633
          mmTop = 794
          mmWidth = 74613
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 120650
          mmTop = 2381
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 2381
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = 'Total=>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 2381
          mmWidth = 17198
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
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 144463
          mmTop = 2381
          mmWidth = 18785
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
  object Rel4: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 168
    Top = 80
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel31: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Cargas p/Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
        BandType = 0
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
        mmLeft = 50800
        mmTop = 4233
        mmWidth = 101336
        BandType = 0
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'N'#186'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 12700
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 12700
        mmWidth = 19579
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText31: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'C_NUMCARGA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'COD_FOR'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'NOME_FORNECEDOR'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 0
        mmWidth = 53711
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 168011
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel54: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel55: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Qtde Cargas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel56: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
      end
      object ppLabel57: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc23: TppDBCalc
        UserName = 'DBCalc4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2381
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
      end
      object ppLabel58: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'COD_CLIENTE'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel59: TppLabel
          UserName = 'Label9'
          HyperlinkEnabled = False
          Caption = 'Cliente:'
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
        end
        object ppDBText39: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText40: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 29633
          mmTop = 794
          mmWidth = 74613
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 120650
          mmTop = 2381
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 2381
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = 'Total=>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
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
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 144463
          mmTop = 2381
          mmWidth = 18785
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
  object Rel5: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 216
    Top = 80
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand5: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Cargas p/Motorista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
        BandType = 0
        LayerName = Foreground4
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
        mmLeft = 50800
        mmTop = 4233
        mmWidth = 101336
        BandType = 0
        LayerName = Foreground4
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
        LayerName = Foreground4
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
        LayerName = Foreground4
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel62: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'N'#186'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel63: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel64: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 12700
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel65: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel66: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel67: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel68: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground4
      end
    end
    object ppDetailBand5: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText41: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'C_NUMCARGA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 14552
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 0
        mmWidth = 14023
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 0
        mmWidth = 9790
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 0
        mmWidth = 53711
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 0
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 168011
        mmTop = 0
        mmWidth = 22754
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppSummaryBand5: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground4
      end
      object ppLine14: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel70: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Qtde Cargas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel71: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel72: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2381
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc32: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
        LayerName = Foreground4
      end
      object ppLabel73: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
        LayerName = Foreground4
      end
      object ppDBCalc34: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
        LayerName = Foreground4
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'COD_MOTORISTA'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel74: TppLabel
          UserName = 'Label9'
          HyperlinkEnabled = False
          Caption = 'Motorista:'
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
          LayerName = Foreground4
        end
        object ppDBText49: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_MOTORISTA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBText50: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_MOTORISTA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 29633
          mmTop = 794
          mmWidth = 74613
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc35: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 120650
          mmTop = 2381
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 2381
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLabel75: TppLabel
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = 'Total=>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
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
          LayerName = Foreground4
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 144463
          mmTop = 2381
          mmWidth = 18785
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
  object Rel6: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 24
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel61: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Comiss'#245'es p/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
        BandType = 0
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
        mmLeft = 50800
        mmTop = 4233
        mmWidth = 101336
        BandType = 0
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Base Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 27252
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label9'
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
        mmTop = 12700
        mmWidth = 19579
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand6: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel84: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13758
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel86: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Base Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 25400
        BandType = 7
      end
      object ppLabel87: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Valor Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc40: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'C_BASECOMISSAO'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc41: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'C_VALORCOMISSAO'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand6: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBCalc42: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'C_BASECOMISSAO'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 121444
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc43: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'C_VALORCOMISSAO'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 167217
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppDBText59: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_FOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 264
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object ppDBText60: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_FORNECEDOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 264
          mmWidth = 74613
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
  object Rel7: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 72
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand7: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel76: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Cargas p/Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
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
        mmTop = 4233
        mmWidth = 101336
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107156
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 148961
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label9'
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
        mmTop = 12700
        mmWidth = 13758
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
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel91: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
      end
      object ppLine20: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel93: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
      end
      object ppLabel94: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc44: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc45: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
      end
      object ppLabel95: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc46: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
      end
      object ppLine21: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'COD_CLIENTE'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
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
        object ppDBCalc47: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 110067
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc48: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc50: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 137054
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBText61: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 264
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object ppDBText62: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 264
          mmWidth = 74613
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
  object Rel8: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 120
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand8: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel78: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Cargas p/Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
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
        mmTop = 4233
        mmWidth = 101336
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107156
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 148961
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label9'
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
        mmTop = 12700
        mmWidth = 19579
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
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel98: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
      end
      object ppLine23: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel99: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
      end
      object ppLabel100: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc39: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc49: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
      end
      object ppLabel101: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc51: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
      end
      object ppLine24: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
        BandType = 7
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
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
        object ppDBCalc52: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 110067
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc53: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc54: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 137054
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBText51: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_FOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 264
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object ppDBText52: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_FORNECEDOR'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 264
          mmWidth = 74613
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
  object Rel9: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 168
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand9: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel77: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Cargas p/Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
        BandType = 0
        LayerName = Foreground8
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
        mmTop = 4233
        mmWidth = 101336
        BandType = 0
        LayerName = Foreground8
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
        LayerName = Foreground8
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
        LayerName = Foreground8
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel102: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107156
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel103: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 148961
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel104: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground8
      end
      object ppLine25: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground8
      end
      object ppLabel105: TppLabel
        UserName = 'Label9'
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
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground8
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
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel106: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground8
      end
      object ppLine26: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
        LayerName = Foreground8
      end
      object ppLabel107: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground8
      end
      object ppLabel108: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground8
      end
      object ppDBCalc55: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
        LayerName = Foreground8
      end
      object ppDBCalc56: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
        LayerName = Foreground8
      end
      object ppLabel109: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
        LayerName = Foreground8
      end
      object ppDBCalc57: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
        LayerName = Foreground8
      end
      object ppLine27: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
        BandType = 7
        LayerName = Foreground8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
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
        object ppDBCalc58: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 110067
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
          LayerName = Foreground8
        end
        object ppDBCalc59: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
          LayerName = Foreground8
        end
        object ppDBCalc60: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 137054
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
          LayerName = Foreground8
        end
        object ppDBText53: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_CONTATO'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 264
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
          LayerName = Foreground8
        end
        object ppDBText54: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_CONTATO'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 264
          mmWidth = 74613
          BandType = 5
          GroupNo = 0
          LayerName = Foreground8
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
  object Rel10: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 216
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand10: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel79: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Cargas p/Motorista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
        BandType = 0
        LayerName = Foreground9
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
        mmLeft = 50800
        mmTop = 4233
        mmWidth = 101336
        BandType = 0
        LayerName = Foreground9
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
        LayerName = Foreground9
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
        LayerName = Foreground9
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel111: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107156
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel112: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 148961
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel113: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine28: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel114: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Motorista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 12700
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground9
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
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel115: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground9
      end
      object ppLine29: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel116: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel117: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc61: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc62: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
        LayerName = Foreground9
      end
      object ppLabel118: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
        LayerName = Foreground9
      end
      object ppDBCalc63: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
        LayerName = Foreground9
      end
      object ppLine30: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
        BandType = 7
        LayerName = Foreground9
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'COD_MOTORISTA'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand10: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBCalc64: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 110067
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBCalc65: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBCalc66: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 137054
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBText55: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_MOTORISTA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 264
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
          LayerName = Foreground9
        end
        object ppDBText56: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_MOTORISTA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 264
          mmWidth = 74613
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
    DataPipeline = dbRelatorio
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
    Left = 256
    Top = 80
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand11: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel110: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Relat'#243'rio de Cargas p/Usina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
        BandType = 0
        LayerName = BandLayer11
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
        mmLeft = 50800
        mmTop = 4233
        mmWidth = 101336
        BandType = 0
        LayerName = BandLayer11
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
        LayerName = BandLayer11
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
        LayerName = BandLayer11
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLabel120: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'N'#186'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLabel121: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 15610
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLabel122: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 12700
        mmWidth = 7673
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLabel123: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 118534
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLabel124: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLabel125: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLabel126: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = BandLayer11
      end
      object ppLine31: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
        LayerName = BandLayer11
      end
    end
    object ppDetailBand11: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText57: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'C_NUMCARGA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 14552
        BandType = 4
        LayerName = BandLayer11
      end
      object ppDBText58: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 0
        mmWidth = 14023
        BandType = 4
        LayerName = BandLayer11
      end
      object ppDBText63: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 20108
        BandType = 4
        LayerName = BandLayer11
      end
      object ppDBText64: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 52917
        mmTop = 0
        mmWidth = 9790
        BandType = 4
        LayerName = BandLayer11
      end
      object ppDBText65: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 0
        mmWidth = 53711
        BandType = 4
        LayerName = BandLayer11
      end
      object ppDBText66: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 0
        mmWidth = 22490
        BandType = 4
        LayerName = BandLayer11
      end
      object ppDBText67: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = BandLayer11
      end
      object ppDBText68: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 168011
        mmTop = 0
        mmWidth = 22754
        BandType = 4
        LayerName = BandLayer11
      end
    end
    object ppSummaryBand11: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel127: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
        LayerName = BandLayer11
      end
      object ppLine32: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
        LayerName = BandLayer11
      end
      object ppLabel128: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Qtde Cargas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
        LayerName = BandLayer11
      end
      object ppLabel129: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
        LayerName = BandLayer11
      end
      object ppLabel130: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
        LayerName = BandLayer11
      end
      object ppDBCalc67: TppDBCalc
        UserName = 'DBCalc4'
        HyperlinkEnabled = False
        DataField = 'COD_CLIENTE'
        DataPipeline = dbRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 2381
        mmWidth = 27252
        BandType = 7
        LayerName = BandLayer11
      end
      object ppDBCalc68: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
        LayerName = BandLayer11
      end
      object ppDBCalc69: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
        LayerName = BandLayer11
      end
      object ppLabel131: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
        LayerName = BandLayer11
      end
      object ppDBCalc70: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
        LayerName = BandLayer11
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'COD_USINA'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
      NewFile = False
      object ppGroupHeaderBand11: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel132: TppLabel
          UserName = 'Label9'
          HyperlinkEnabled = False
          Caption = 'Usina:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 794
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer11
        end
        object ppDBText69: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_USINA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 19050
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer11
        end
        object ppDBText70: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_USINA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 29633
          mmTop = 794
          mmWidth = 74613
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer11
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc71: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 120650
          mmTop = 2381
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer11
        end
        object ppDBCalc72: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 166423
          mmTop = 2381
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer11
        end
        object ppLabel133: TppLabel
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = 'Total=>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer11
        end
        object ppDBCalc73: TppDBCalc
          UserName = 'DBCalc3'
          HyperlinkEnabled = False
          DataField = 'COD_CLIENTE'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 16933
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer11
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
          LayerName = BandLayer11
        end
        object ppDBCalc74: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 144463
          mmTop = 2381
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer11
        end
      end
    end
    object ppDesignLayers11: TppDesignLayers
      object ppDesignLayer11: TppDesignLayer
        UserName = 'BandLayer11'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList11: TppParameterList
    end
  end
  object Rel12: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio
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
    Left = 256
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio'
    object ppHeaderBand12: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel119: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Resumo de Cargas p/Usina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 50800
        mmTop = 0
        mmWidth = 101336
        BandType = 0
        LayerName = BandLayer12
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
        mmLeft = 50800
        mmTop = 4233
        mmWidth = 101336
        BandType = 0
        LayerName = BandLayer12
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
        LayerName = BandLayer12
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
        LayerName = BandLayer12
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
        mmLeft = 167217
        mmTop = 0
        mmWidth = 25400
        BandType = 0
        LayerName = BandLayer12
      end
      object ppLabel135: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Qtde Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107156
        mmTop = 12700
        mmWidth = 25400
        BandType = 0
        LayerName = BandLayer12
      end
      object ppLabel136: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Vlr.Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 148961
        mmTop = 12700
        mmWidth = 13758
        BandType = 0
        LayerName = BandLayer12
      end
      object ppLabel137: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Valor frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 168805
        mmTop = 12700
        mmWidth = 21431
        BandType = 0
        LayerName = BandLayer12
      end
      object ppLine34: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
        LayerName = BandLayer12
      end
      object ppLabel138: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Usina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 12700
        mmWidth = 9260
        BandType = 0
        LayerName = BandLayer12
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
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel139: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 6879
        mmWidth = 27252
        BandType = 7
        LayerName = BandLayer12
      end
      object ppLine35: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17198
        mmLeft = 121444
        mmTop = 2646
        mmWidth = 3969
        BandType = 7
        LayerName = BandLayer12
      end
      object ppLabel140: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Total Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 7408
        mmWidth = 27252
        BandType = 7
        LayerName = BandLayer12
      end
      object ppLabel141: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Total Dif'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 11642
        mmWidth = 17463
        BandType = 7
        LayerName = BandLayer12
      end
      object ppDBCalc75: TppDBCalc
        UserName = 'DBCalc5'
        HyperlinkEnabled = False
        DataField = 'QTDE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 7408
        mmWidth = 26988
        BandType = 7
        LayerName = BandLayer12
      end
      object ppDBCalc76: TppDBCalc
        UserName = 'DBCalc6'
        HyperlinkEnabled = False
        DataField = 'VALOR_CARREGA'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 11642
        mmWidth = 26723
        BandType = 7
        LayerName = BandLayer12
      end
      object ppLabel142: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Total Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 15875
        mmWidth = 21431
        BandType = 7
        LayerName = BandLayer12
      end
      object ppDBCalc77: TppDBCalc
        UserName = 'DBCalc14'
        HyperlinkEnabled = False
        DataField = 'VALOR_FRETE'
        DataPipeline = dbRelatorio
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio'
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 15875
        mmWidth = 26723
        BandType = 7
        LayerName = BandLayer12
      end
      object ppLine36: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 265
        mmWidth = 197115
        BandType = 7
        LayerName = BandLayer12
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'COD_USINA'
      DataPipeline = dbRelatorio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio'
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
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBCalc78: TppDBCalc
          UserName = 'DBCalc1'
          HyperlinkEnabled = False
          DataField = 'QTDE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 110067
          mmTop = 0
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer12
        end
        object ppDBCalc79: TppDBCalc
          UserName = 'DBCalc2'
          HyperlinkEnabled = False
          DataField = 'VALOR_FRETE'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer12
        end
        object ppDBCalc80: TppDBCalc
          UserName = 'DBCalc13'
          HyperlinkEnabled = False
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbRelatorio
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 137054
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer12
        end
        object ppDBText71: TppDBText
          UserName = 'DBText9'
          HyperlinkEnabled = False
          DataField = 'COD_USINA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 0
          mmTop = 264
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer12
        end
        object ppDBText72: TppDBText
          UserName = 'DBText10'
          HyperlinkEnabled = False
          DataField = 'NOME_USINA'
          DataPipeline = dbRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelatorio'
          mmHeight = 3440
          mmLeft = 10583
          mmTop = 264
          mmWidth = 74613
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer12
        end
      end
    end
    object ppDesignLayers12: TppDesignLayers
      object ppDesignLayer12: TppDesignLayer
        UserName = 'BandLayer12'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList12: TppParameterList
    end
  end
end
