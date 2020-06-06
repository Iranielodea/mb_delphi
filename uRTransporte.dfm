object FRTransporte: TFRTransporte
  Left = 192
  Top = 114
  Caption = 'FRTransporte'
  ClientHeight = 355
  ClientWidth = 328
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
      end>
    SQL.Strings = (
      'select'
      '   TRA.NOME AS NOME_TRANSPORTE,'
      '   MOT.NOME AS NOME_MOTORISTA,'
      '   MOT.FONE1 AS MOT_FONE_CELULAR,'
      '   TRA.DDD,'
      '   TRA.FONE1,'
      '   TRA.FONE2,'
      '   TRA.FAX,'
      '   TRA.DESTAQUE,'
      '   TRA.CONTATO,'
      '   CID.DESC_CIDADE,'
      '   EST.SIGLA'
      'from MOTORISTA MOT'
      '   left join TRANSPORTADOR TRA on MOT.COD_TRANS = TRA.COD_TRANS'
      '   left join CIDADE CID on MOT.COD_CIDADE = CID.COD_CIDADE'
      '   left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      '   where MOT.COD_EMPRESA = :COD_EMPRESA')
    SQLConnection = DM.BancoDados
    Left = 32
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
    Left = 160
    Top = 24
  end
  object dsRelatorio: TDataSource
    DataSet = Relatorio
    Left = 216
    Top = 24
  end
  object dbRel: TppDBPipeline
    DataSource = dsRelatorio
    UserName = 'dbRel'
    Left = 264
    Top = 24
  end
  object Rel1: TppReport
    AutoStop = False
    DataPipeline = dbRel
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 32
    Top = 72
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRel'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Telefones dos Transportadores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 112184
        mmTop = 0
        mmWidth = 57415
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Nome Motorista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12700
        mmTop = 14023
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Empresa Transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 59267
        mmTop = 14023
        mmWidth = 30163
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 112184
        mmTop = 14023
        mmWidth = 8996
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'Fone Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 14023
        mmWidth = 15346
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Fone Transp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 179917
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 0
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 4233
        mmWidth = 11377
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 254001
        mmTop = 0
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object Nome_Agencia: TppDBText
        UserName = 'Nome_Agencia'
        HyperlinkEnabled = False
        DataField = 'NOME_MOTORISTA'
        DataPipeline = dbRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 0
        mmWidth = 44450
        BandType = 4
        LayerName = Foreground
      end
      object Nome_Empresa: TppDBText
        UserName = 'Nome_Empresa'
        HyperlinkEnabled = False
        DataField = 'NOME_TRANSPORTE'
        DataPipeline = dbRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 59267
        mmTop = 0
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground
      end
      object Desc_Cidade: TppDBText
        UserName = 'Desc_Cidade'
        HyperlinkEnabled = False
        DataField = 'DESC_CIDADE'
        DataPipeline = dbRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 112184
        mmTop = 0
        mmWidth = 37571
        BandType = 4
        LayerName = Foreground
      end
      object Fone1: TppDBText
        UserName = 'Fone1'
        HyperlinkEnabled = False
        DataField = 'MOT_FONE_CELULAR'
        DataPipeline = dbRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 152400
        mmTop = 0
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground
      end
      object Fone2: TppDBText
        UserName = 'Fone2'
        HyperlinkEnabled = False
        DataField = 'FONE1'
        DataPipeline = dbRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 179917
        mmTop = 0
        mmWidth = 26723
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Total Geral ==>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 1588
        mmWidth = 20902
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkEnabled = False
        DataField = 'DDD'
        DataPipeline = dbRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 12700
        mmTop = 265
        mmWidth = 270405
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DDD'
      DataPipeline = dbRel
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRel'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel8: TppLabel
          UserName = 'Label8'
          HyperlinkEnabled = False
          Caption = 'DDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 12700
          mmTop = 794
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          HyperlinkEnabled = False
          DataField = 'DDD'
          DataPipeline = dbRel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRel'
          mmHeight = 3440
          mmLeft = 21167
          mmTop = 794
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          HyperlinkEnabled = False
          Caption = '('
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 38100
          mmTop = 794
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          HyperlinkEnabled = False
          DataField = 'SIGLA'
          DataPipeline = dbRel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRel'
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 794
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          HyperlinkEnabled = False
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 48683
          mmTop = 794
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 2117
          mmLeft = 12700
          mmTop = 0
          mmWidth = 271728
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 12700
          mmTop = 2910
          mmWidth = 271728
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
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
  object QAniver: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '   extract(DAY FROM DATANASC) AS DIA,'
      '   extract(MONTH FROM DATANASC) AS MES,'
      '   TRA.NOME AS NOME_TRANSPORTE,'
      '   TRA.DDD,'
      '   TRA.DATANASC,'
      '   TRA.FONE1,'
      '   TRA.FONE2,'
      '   TRA.FAX,'
      '   TRA.DESTAQUE,'
      '   TRA.CONTATO,'
      '   CID.DESC_CIDADE,'
      '   EST.SIGLA'
      'from TRANSPORTADOR TRA'
      '   left join CIDADE CID on TRA.COD_CIDADE = CID.COD_CIDADE'
      '   left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      '   ')
    SQLConnection = DM.BancoDados
    Left = 32
    Top = 128
  end
  object dspAniver: TDataSetProvider
    DataSet = QAniver
    Left = 96
    Top = 128
  end
  object Aniver: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAniver'
    Left = 152
    Top = 128
  end
  object dsAniver: TDataSource
    DataSet = Aniver
    Left = 208
    Top = 128
  end
  object dbAniver: TppDBPipeline
    DataSource = dsAniver
    UserName = 'dbAniver'
    Left = 264
    Top = 128
    object dbAniverppField1: TppField
      FieldAlias = 'DIA'
      FieldName = 'DIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbAniverppField2: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbAniverppField3: TppField
      FieldAlias = 'NOME_TRANSPORTE'
      FieldName = 'NOME_TRANSPORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbAniverppField4: TppField
      FieldAlias = 'NOME_MOTORISTA'
      FieldName = 'NOME_MOTORISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbAniverppField5: TppField
      FieldAlias = 'MOT_FONE_CELULAR'
      FieldName = 'MOT_FONE_CELULAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbAniverppField6: TppField
      FieldAlias = 'DDD'
      FieldName = 'DDD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbAniverppField7: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object dbAniverppField8: TppField
      FieldAlias = 'FONE1'
      FieldName = 'FONE1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object dbAniverppField9: TppField
      FieldAlias = 'FONE2'
      FieldName = 'FONE2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object dbAniverppField10: TppField
      FieldAlias = 'FAX'
      FieldName = 'FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object dbAniverppField11: TppField
      FieldAlias = 'DESTAQUE'
      FieldName = 'DESTAQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object dbAniverppField12: TppField
      FieldAlias = 'CONTATO'
      FieldName = 'CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object dbAniverppField13: TppField
      FieldAlias = 'DESC_CIDADE'
      FieldName = 'DESC_CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object dbAniverppField14: TppField
      FieldAlias = 'SIGLA'
      FieldName = 'SIGLA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
  end
  object Rel2: TppReport
    AutoStop = False
    DataPipeline = dbAniver
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
    Left = 32
    Top = 176
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbAniver'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Relat'#243'rio de Aniversariantes / Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 57150
        mmTop = 0
        mmWidth = 84138
        BandType = 0
        LayerName = Foreground1
      end
      object lblData02: TppLabel
        UserName = 'lblData02'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67733
        mmTop = 6350
        mmWidth = 62971
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 4233
        mmWidth = 12435
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 0
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 14817
        mmWidth = 6879
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 14817
        mmWidth = 8467
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Fone1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 14817
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        HyperlinkEnabled = False
        Caption = 'Fone2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 112184
        mmTop = 14817
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 14817
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'DATANASC'
        DataPipeline = dbAniver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbAniver'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NOME_TRANSPORTE'
        DataPipeline = dbAniver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbAniver'
        mmHeight = 3969
        mmLeft = 19315
        mmTop = 0
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'FONE1'
        DataPipeline = dbAniver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbAniver'
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 0
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'FONE2'
        DataPipeline = dbAniver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbAniver'
        mmHeight = 3969
        mmLeft = 112184
        mmTop = 0
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'DESC_CIDADE'
        DataPipeline = dbAniver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbAniver'
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 0
        mmWidth = 51594
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Total =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2381
        mmWidth = 11906
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        HyperlinkEnabled = False
        DataField = 'NOME_MOTORISTA'
        DataPipeline = dbAniver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbAniver'
        mmHeight = 3704
        mmLeft = 14817
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'MES'
      DataPipeline = dbAniver
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbAniver'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel14: TppLabel
          UserName = 'Label14'
          HyperlinkEnabled = False
          Caption = 'M'#234's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 794
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          HyperlinkEnabled = False
          DataField = 'MES'
          DataPipeline = dbAniver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbAniver'
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 794
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
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
  object QRel: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   TRA.NOME AS NOME_TRANSPORTE,'
      '   TRA.DDD,'
      '   TRA.FONE1,'
      '   TRA.FONE2,'
      '   TRA.FAX,'
      '   TRA.DESTAQUE,'
      '   TRA.CONTATO,'
      '   CID.DESC_CIDADE,'
      '   EST.SIGLA'
      'from transportador TRA'
      '   left join CIDADE CID on TRA.COD_CIDADE = CID.COD_CIDADE'
      '   left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      '   where TRA.COD_EMPRESA = :COD_EMPRESA')
    SQLConnection = DM.BancoDados
    Left = 32
    Top = 232
  end
  object dspRel: TDataSetProvider
    DataSet = QRel
    Left = 88
    Top = 232
  end
  object cdsRel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRel'
    Left = 136
    Top = 232
  end
  object dsRel: TDataSource
    DataSet = cdsRel
    Left = 176
    Top = 232
  end
  object dbRel1: TppDBPipeline
    DataSource = dsRel
    UserName = 'dbRel1'
    Left = 216
    Top = 232
  end
  object Rel3: TppReport
    AutoStop = False
    DataPipeline = dbRel1
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
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
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
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 256
    Top = 232
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRel1'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'Label19'
        HyperlinkEnabled = False
        Caption = 'Transportadoras por Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 57150
        mmTop = 0
        mmWidth = 52388
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 4233
        mmWidth = 12435
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 168540
        mmTop = 0
        mmWidth = 20108
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10583
        mmWidth = 8996
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 78317
        mmTop = 10583
        mmWidth = 10319
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Fone1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 96573
        mmTop = 10583
        mmWidth = 9261
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Fone 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 131234
        mmTop = 10583
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 14288
        mmWidth = 197115
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SIGLA'
        DataPipeline = dbRel1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel1'
        mmHeight = 4498
        mmLeft = 78317
        mmTop = 529
        mmWidth = 10319
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NOME_TRANSPORTE'
        DataPipeline = dbRel1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel1'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 75936
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FONE1'
        DataPipeline = dbRel1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel1'
        mmHeight = 4498
        mmLeft = 96573
        mmTop = 529
        mmWidth = 29898
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'FONE2'
        DataPipeline = dbRel1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRel1'
        mmHeight = 4498
        mmLeft = 131234
        mmTop = 0
        mmWidth = 39688
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 2646
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground2
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SIGLA'
        DataPipeline = dbRel1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRel1'
        mmHeight = 4498
        mmLeft = 25929
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground2
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESC_CIDADE'
      DataPipeline = dbRel1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRel1'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 2381
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'DESC_CIDADE'
          DataPipeline = dbRel1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRel1'
          mmHeight = 4498
          mmLeft = 12965
          mmTop = 2381
          mmWidth = 78317
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLine7: TppLine
          UserName = 'Line7'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7938
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Total da Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1852
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'SIGLA'
          DataPipeline = dbRel1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup3
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRel1'
          mmHeight = 4498
          mmLeft = 25929
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
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
end
