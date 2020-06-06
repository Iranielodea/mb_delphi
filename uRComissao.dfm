object frComissao: TfrComissao
  Left = 0
  Top = 0
  Caption = 'frComissao'
  ClientHeight = 355
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object QComissao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datafin'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    car.num_carga,'
      
        '    iif(car.letra <> '#39#39', car.num_carga || '#39'-'#39' || COALESCE(car.le' +
        'tra,'#39#39'), car.num_carga) AS num_carga_letra,'
      '    car.num_pedido,'
      '    cli.nome,'
      '    '#39'M'#39' AS tipo_for,'
      '    car.qtde_pedido,'
      '    car.qtde AS qtde_carreg,'
      '    ite.valor AS valor_unit,'
      '    ite.valor_total AS valor_pedido,'
      '    car.qtde * ite.valor AS base_calculo,'
      
        '    IIF(ped.situacao = '#39'C'#39', 0, ped.perc_comissao) as perc_comiss' +
        'ao,'
      
        '    IIF(ped.situacao = '#39'C'#39', 0, (SELECT valor_comissao FROM sp_co' +
        'missao_calculo_venda(ped.perc_comissao, car.qtde, ite.valor))) A' +
        'S valor_comissao,'
      '    car.saldo,'
      '    car.num_nf,'
      
        '    IIF(ped.situacao = '#39'C'#39', '#39'cancelado'#39', ped.data) as faturament' +
        'o,'
      '    ped.situacao,'
      '    ped.data,'
      '    car.letra,'
      '    car.data_nf,'
      '    TP.sigla,'
      '    tp.desc_tipo,'
      '    forn.cod_for,'
      '    forn.nome as nome_forn'
      'FROM pedido ped'
      
        '    INNER JOIN itens_pedido ite ON ped.num_pedido = ite.num_pedi' +
        'do'
      '    INNER JOIN carga car ON ped.num_pedido = car.num_pedido'
      '    INNER JOIN cliente cli ON car.cod_cliente = cli.cod_cliente'
      '    INNER JOIN fornecedor forn ON car.cod_for = forn.cod_for'
      
        '    LEFT JOIN forn_tipo_empresa tp ON forn.id_tipo_empresa = tp.' +
        'id_tipo'
      ''
      'WHERE ped.cod_empresa = :cod_empresa'
      'AND car.data_nf between :dataini AND :datafin')
    SQLConnection = DM.BancoDados
    Left = 40
    Top = 24
  end
  object dspComissao: TDataSetProvider
    DataSet = QComissao
    Left = 40
    Top = 80
  end
  object cdsComissao: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'nome_forn;cod_for;Data;num_carga'
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datafin'
        ParamType = ptInput
      end>
    ProviderName = 'dspComissao'
    OnCalcFields = cdsComissaoCalcFields
    Left = 40
    Top = 136
    object cdsComissaoNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
      Required = True
    end
    object cdsComissaoNUM_CARGA_LETRA: TStringField
      FieldName = 'NUM_CARGA_LETRA'
      Size = 14
    end
    object cdsComissaoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object cdsComissaoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdsComissaoTIPO_FOR: TStringField
      FieldName = 'TIPO_FOR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsComissaoQTDE_PEDIDO: TFloatField
      FieldName = 'QTDE_PEDIDO'
    end
    object cdsComissaoQTDE_CARREG: TFloatField
      FieldName = 'QTDE_CARREG'
    end
    object cdsComissaoVALOR_UNIT: TFloatField
      FieldName = 'VALOR_UNIT'
    end
    object cdsComissaoVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
    end
    object cdsComissaoBASE_CALCULO: TFloatField
      FieldName = 'BASE_CALCULO'
    end
    object cdsComissaoPERC_COMISSAO: TFloatField
      FieldName = 'PERC_COMISSAO'
    end
    object cdsComissaoVALOR_COMISSAO: TFloatField
      FieldName = 'VALOR_COMISSAO'
    end
    object cdsComissaoSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object cdsComissaoFATURAMENTO: TStringField
      FieldName = 'FATURAMENTO'
      Required = True
      Size = 25
    end
    object cdsComissaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsComissaoLETRA: TStringField
      FieldName = 'LETRA'
      FixedChar = True
      Size = 2
    end
    object cdsComissaoSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
    object cdsComissaoCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object cdsComissaoNOME_FORN: TStringField
      FieldName = 'NOME_FORN'
      Required = True
      Size = 60
    end
    object cdsComissaoDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      Size = 50
    end
    object cdsComissaoC_Faturamento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_Faturamento'
      Size = 30
    end
    object cdsComissaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsComissaoDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object cdsComissaoNUM_NF: TStringField
      FieldName = 'NUM_NF'
      Size = 40
    end
  end
  object dsComissao: TDataSource
    DataSet = cdsComissao
    Left = 40
    Top = 192
  end
  object RelComissao: TppReport
    AutoStop = False
    DataPipeline = dbComissao
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
    OpenFile = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = []
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
    Left = 40
    Top = 296
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbComissao'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 22225
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 22225
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Quant. do'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 108744
        mmTop = 17463
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 22225
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 129911
        mmTop = 17463
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Carregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 22225
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 17463
        mmWidth = 8202
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Unit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 22225
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Valor do'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 17463
        mmWidth = 12171
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 22225
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Base de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183621
        mmTop = 17463
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'C'#225'lculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183886
        mmTop = 22225
        mmWidth = 10848
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 201084
        mmTop = 22225
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 212990
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 210609
        mmTop = 22225
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Saldo do'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 228865
        mmTop = 17463
        mmWidth = 12435
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 230188
        mmTop = 22225
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'N.Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 246063
        mmTop = 22225
        mmWidth = 11906
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Faturamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 262996
        mmTop = 22225
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 24342
        mmWidth = 283369
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 15346
        mmWidth = 283369
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4149
        mmLeft = 17198
        mmTop = 22754
        mmWidth = 8340
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Relat'#243'rio de Comiss'#245'es por Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 87313
        mmTop = 794
        mmWidth = 86519
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 794
        mmWidth = 30163
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 242359
        mmTop = 794
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground
      end
      object lblData: TppLabel
        UserName = 'lblData'
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 94192
        mmTop = 7938
        mmWidth = 70379
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 265
        mmTop = 0
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NUM_CARGA_LETRA'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 0
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 0
        mmWidth = 69850
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QTDE_PEDIDO'
        DataPipeline = dbComissao
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 0
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'QTDE_CARREG'
        DataPipeline = dbComissao
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR_UNIT'
        DataPipeline = dbComissao
        DisplayFormat = ',##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 0
        mmWidth = 15346
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VALOR_PEDIDO'
        DataPipeline = dbComissao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 0
        mmWidth = 18521
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'BASE_CALCULO'
        DataPipeline = dbComissao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 0
        mmWidth = 16404
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PERC_COMISSAO'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 197644
        mmTop = 0
        mmWidth = 8467
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VALOR_COMISSAO'
        DataPipeline = dbComissao
        DisplayFormat = ',##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 207169
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'SALDO'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 225690
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'NUM_NF'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4149
        mmLeft = 244475
        mmTop = 0
        mmWidth = 15610
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'C_Faturamento'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 262996
        mmTop = 0
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 50536
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 265
        mmTop = 0
        mmWidth = 283369
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 20373
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'COD_FOR'
        DataPipeline = dbComissao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 4498
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Quant.Carregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 203200
        mmTop = 9790
        mmWidth = 24077
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Valor do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 203200
        mmTop = 15610
        mmWidth = 22754
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Base de C'#225'lculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 203200
        mmTop = 21167
        mmWidth = 22754
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Valor Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 203200
        mmTop = 26988
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'QTDE_CARREG'
        DataPipeline = dbComissao
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 9790
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'VALOR_PEDIDO'
        DataPipeline = dbComissao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 15610
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'BASE_CALCULO'
        DataPipeline = dbComissao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 21167
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'VALOR_COMISSAO'
        DataPipeline = dbComissao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbComissao'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 26988
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 203200
        mmTop = 4498
        mmWidth = 24342
        BandType = 7
        LayerName = Foreground
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 26723
        mmLeft = 198173
        mmTop = 4498
        mmWidth = 3440
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'COD_FOR'
      DataPipeline = dbComissao
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbComissao'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 1058
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'COD_FOR'
          DataPipeline = dbComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbComissao'
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 1058
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'NOME_FORN'
          DataPipeline = dbComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbComissao'
          mmHeight = 4233
          mmLeft = 34131
          mmTop = 1058
          mmWidth = 90223
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'DESC_TIPO'
          DataPipeline = dbComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbComissao'
          mmHeight = 4233
          mmLeft = 131498
          mmTop = 1058
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'QTDE_CARREG'
          DataPipeline = dbComissao
          DisplayFormat = ',###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbComissao'
          mmHeight = 4149
          mmLeft = 127000
          mmTop = 2117
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALOR_PEDIDO'
          DataPipeline = dbComissao
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbComissao'
          mmHeight = 4233
          mmLeft = 160867
          mmTop = 2117
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'BASE_CALCULO'
          DataPipeline = dbComissao
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbComissao'
          mmHeight = 4233
          mmLeft = 180182
          mmTop = 2117
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR_COMISSAO'
          DataPipeline = dbComissao
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbComissao'
          mmHeight = 4233
          mmLeft = 207963
          mmTop = 2117
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Total do Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4149
          mmLeft = 0
          mmTop = 2117
          mmWidth = 29591
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'COD_FOR'
          DataPipeline = dbComissao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbComissao'
          mmHeight = 4233
          mmLeft = 34131
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Style = psDot
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 2381
          mmLeft = 0
          mmTop = 3969
          mmWidth = 283634
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
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
  object dbComissao: TppDBPipeline
    DataSource = dsComissao
    UserName = 'dbComissao'
    Left = 40
    Top = 248
    object pfldComissaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_CARGA'
      FieldName = 'NUM_CARGA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object pfldComissaoppField2: TppField
      FieldAlias = 'NUM_CARGA_LETRA'
      FieldName = 'NUM_CARGA_LETRA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 1
    end
    object pfldComissaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_PEDIDO'
      FieldName = 'NUM_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object pfldComissaoppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pfldComissaoppField5: TppField
      FieldAlias = 'TIPO_FOR'
      FieldName = 'TIPO_FOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pfldComissaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_PEDIDO'
      FieldName = 'QTDE_PEDIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pfldComissaoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_CARREG'
      FieldName = 'QTDE_CARREG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pfldComissaoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_UNIT'
      FieldName = 'VALOR_UNIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pfldComissaoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_PEDIDO'
      FieldName = 'VALOR_PEDIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pfldComissaoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'BASE_CALCULO'
      FieldName = 'BASE_CALCULO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pfldComissaoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERC_COMISSAO'
      FieldName = 'PERC_COMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pfldComissaoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_COMISSAO'
      FieldName = 'VALOR_COMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pfldComissaoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pfldComissaoppField14: TppField
      FieldAlias = 'FATURAMENTO'
      FieldName = 'FATURAMENTO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 13
    end
    object pfldComissaoppField15: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 14
    end
    object pfldComissaoppField16: TppField
      FieldAlias = 'LETRA'
      FieldName = 'LETRA'
      FieldLength = 2
      DisplayWidth = 2
      Position = 15
    end
    object pfldComissaoppField17: TppField
      FieldAlias = 'SIGLA'
      FieldName = 'SIGLA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object pfldComissaoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'COD_FOR'
      FieldName = 'COD_FOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object pfldComissaoppField19: TppField
      FieldAlias = 'NOME_FORN'
      FieldName = 'NOME_FORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object pfldComissaoppField20: TppField
      FieldAlias = 'DESC_TIPO'
      FieldName = 'DESC_TIPO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object pfldComissaoppField21: TppField
      FieldAlias = 'C_Faturamento'
      FieldName = 'C_Faturamento'
      FieldLength = 30
      DisplayWidth = 30
      Position = 20
    end
    object pfldComissaoppField22: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object pfldComissaoppField23: TppField
      FieldAlias = 'DATA_NF'
      FieldName = 'DATA_NF'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 22
    end
    object pfldComissaoppField24: TppField
      FieldAlias = 'NUM_NF'
      FieldName = 'NUM_NF'
      FieldLength = 40
      DisplayWidth = 40
      Position = 23
    end
  end
  object QVendedor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datafin'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    car.num_carga,'
      
        '    iif(car.letra <> '#39#39', car.num_carga || '#39'-'#39' || COALESCE(car.le' +
        'tra,'#39#39'), car.num_carga) AS num_carga_letra,'
      '    car.num_pedido,'
      '    cli.nome,'
      '    car.qtde_pedido,'
      '    car.qtde AS qtde_carreg,'
      '    ite.valor AS valor_unit,'
      
        '    IIF(ped.situacao = '#39'C'#39', 0, car.qtde * ped.valor_comissao) as' +
        ' total_comissao,'
      
        '    IIF(ped.situacao = '#39'C'#39', 0, ped.valor_comissao) as valor_comi' +
        'ssao,'
      '    car.num_nf,'
      
        '    IIF(ped.situacao = '#39'C'#39', '#39'cancelado'#39', ped.data) as faturament' +
        'o,'
      '    ped.situacao,'
      '    ped.data,'
      '    car.letra,'
      '    car.data_nf,'
      '    car.unidade,'
      '    TP.sigla,'
      '    tp.desc_tipo,'
      '    forn.cod_for,'
      '    forn.nome as nome_forn,'
      '    ped.cod_vendedor,'
      '    ven.nome as nome_vendedor'
      'FROM pedido ped'
      
        '    INNER JOIN itens_pedido ite ON ped.num_pedido = ite.num_pedi' +
        'do'
      '    INNER JOIN carga car ON ped.num_pedido = car.num_pedido'
      '    INNER JOIN cliente cli ON car.cod_cliente = cli.cod_cliente'
      '    INNER JOIN fornecedor forn ON car.cod_for = forn.cod_for'
      
        '    LEFT JOIN forn_tipo_empresa tp ON forn.id_tipo_empresa = tp.' +
        'id_tipo'
      
        '    LEFT JOIN vendedor ven ON ped.cod_vendedor = ven.cod_vendedo' +
        'r'
      ''
      'WHERE ped.cod_empresa = :cod_empresa'
      'AND car.data_nf between :dataini AND :datafin')
    SQLConnection = DM.BancoDados
    Left = 144
    Top = 32
  end
  object dspVendedor: TDataSetProvider
    DataSet = QVendedor
    Left = 144
    Top = 88
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nome_Vendedor;cod_Vendedor;Unidade;Data;num_carga'
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_empresa'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dataini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datafin'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendedor'
    OnCalcFields = cdsVendedorCalcFields
    Left = 144
    Top = 144
    object IntegerField1: TIntegerField
      FieldName = 'NUM_CARGA'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NUM_CARGA_LETRA'
      Size = 14
    end
    object IntegerField2: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'QTDE_PEDIDO'
    end
    object FloatField2: TFloatField
      FieldName = 'QTDE_CARREG'
    end
    object FloatField7: TFloatField
      FieldName = 'VALOR_COMISSAO'
    end
    object StringField4: TStringField
      FieldName = 'FATURAMENTO'
      Required = True
      Size = 25
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object StringField5: TStringField
      FieldName = 'LETRA'
      FixedChar = True
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 1
    end
    object IntegerField4: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object StringField7: TStringField
      FieldName = 'NOME_FORN'
      Required = True
      Size = 60
    end
    object StringField8: TStringField
      FieldName = 'DESC_TIPO'
      Size = 50
    end
    object cdsVendedorVALOR_UNIT: TFloatField
      FieldName = 'VALOR_UNIT'
    end
    object cdsVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
    end
    object cdsVendedorNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 50
    end
    object cdsVendedorTOTAL_COMISSAO: TFloatField
      FieldName = 'TOTAL_COMISSAO'
    end
    object cdsVendedorSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsVendedorC_Faturamento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_Faturamento'
      Size = 30
    end
    object cdsVendedorDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object cdsVendedorNUM_NF: TStringField
      FieldName = 'NUM_NF'
      Size = 40
    end
    object cdsVendedorUNIDADE: TStringField
      FieldName = 'UNIDADE'
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 144
    Top = 200
  end
  object RelVendedor: TppReport
    AutoStop = False
    DataPipeline = dbVendedor
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
    OpenFile = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = []
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
    Left = 144
    Top = 296
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbVendedor'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'Label1'
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 22225
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel30: TppLabel
        UserName = 'Label2'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 22225
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel32: TppLabel
        UserName = 'Label4'
        Caption = 'Quant. do'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 108744
        mmTop = 17463
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel33: TppLabel
        UserName = 'Label5'
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 22225
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel34: TppLabel
        UserName = 'Label6'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 129911
        mmTop = 17463
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel35: TppLabel
        UserName = 'Label7'
        Caption = 'Carregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 22225
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel36: TppLabel
        UserName = 'Label8'
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 17463
        mmWidth = 8202
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel37: TppLabel
        UserName = 'Label9'
        Caption = 'Unit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 22225
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel43: TppLabel
        UserName = 'Label15'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel44: TppLabel
        UserName = 'Label16'
        Caption = 'Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 165100
        mmTop = 22225
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel45: TppLabel
        UserName = 'Label17'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4149
        mmLeft = 186796
        mmTop = 17992
        mmWidth = 7197
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel46: TppLabel
        UserName = 'Label18'
        Caption = 'Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 185473
        mmTop = 22754
        mmWidth = 13758
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel47: TppLabel
        UserName = 'Label19'
        Caption = 'N.Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 207169
        mmTop = 22225
        mmWidth = 11906
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel48: TppLabel
        UserName = 'Label20'
        Caption = 'Faturamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 224103
        mmTop = 22225
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine7: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 15346
        mmWidth = 283369
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel49: TppLabel
        UserName = 'Label21'
        Caption = 'Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4149
        mmLeft = 17198
        mmTop = 22754
        mmWidth = 8340
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel50: TppLabel
        UserName = 'Label22'
        Caption = 'Relat'#243'rio de Comiss'#245'es por Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 87313
        mmTop = 794
        mmWidth = 84138
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 794
        mmWidth = 30163
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 242359
        mmTop = 794
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground1
      end
      object lbDataVendedor: TppLabel
        UserName = 'lblData'
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 94192
        mmTop = 7938
        mmWidth = 70379
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine6: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 24342
        mmWidth = 283369
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'DBText2'
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 265
        mmTop = 0
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText18: TppDBText
        UserName = 'DBText3'
        DataField = 'NUM_CARGA_LETRA'
        DataPipeline = dbVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 0
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText19: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME'
        DataPipeline = dbVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 0
        mmWidth = 69850
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText20: TppDBText
        UserName = 'DBText5'
        DataField = 'QTDE_PEDIDO'
        DataPipeline = dbVendedor
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 0
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText21: TppDBText
        UserName = 'DBText6'
        DataField = 'QTDE_CARREG'
        DataPipeline = dbVendedor
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText22: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR_UNIT'
        DataPipeline = dbVendedor
        DisplayFormat = ',##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 0
        mmWidth = 15346
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText25: TppDBText
        UserName = 'DBText10'
        DataField = 'VALOR_COMISSAO'
        DataPipeline = dbVendedor
        DisplayFormat = ',##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 163777
        mmTop = 0
        mmWidth = 12171
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText26: TppDBText
        UserName = 'DBText11'
        DataField = 'TOTAL_COMISSAO'
        DataPipeline = dbVendedor
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 0
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText28: TppDBText
        UserName = 'DBText13'
        DataField = 'NUM_NF'
        DataPipeline = dbVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4149
        mmLeft = 205582
        mmTop = 0
        mmWidth = 15610
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText29: TppDBText
        UserName = 'DBText14'
        DataField = 'C_Faturamento'
        DataPipeline = dbVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 224103
        mmTop = 0
        mmWidth = 17727
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 50536
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 265
        mmTop = 0
        mmWidth = 283369
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel52: TppLabel
        UserName = 'Label24'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 15610
        mmWidth = 15875
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'COD_FOR'
        DataPipeline = dbVendedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 4498
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel53: TppLabel
        UserName = 'Label26'
        Caption = 'Quant.Carregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 203200
        mmTop = 9790
        mmWidth = 24077
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel54: TppLabel
        UserName = 'Label27'
        Caption = 'Valor Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4149
        mmLeft = 203602
        mmTop = 15610
        mmWidth = 22352
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel55: TppLabel
        UserName = 'Label28'
        Caption = 'Total Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4149
        mmLeft = 204068
        mmTop = 21167
        mmWidth = 21886
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'QTDE_CARREG'
        DataPipeline = dbVendedor
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 9790
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'VALOR_COMISSAO'
        DataPipeline = dbVendedor
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 15610
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'TOTAL_COMISSAO'
        DataPipeline = dbVendedor
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbVendedor'
        mmHeight = 4233
        mmLeft = 236273
        mmTop = 21167
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel57: TppLabel
        UserName = 'Label31'
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 203200
        mmTop = 4498
        mmWidth = 24342
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine9: TppLine
        UserName = 'Line5'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 22225
        mmLeft = 198173
        mmTop = 4498
        mmWidth = 3440
        BandType = 7
        LayerName = Foreground1
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'COD_VENDEDOR'
      DataPipeline = dbVendedor
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbVendedor'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel58: TppLabel
          UserName = 'Label3'
          Caption = 'Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4106
          mmLeft = 265
          mmTop = 1058
          mmWidth = 14520
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText30: TppDBText
          UserName = 'DBText1'
          DataField = 'COD_VENDEDOR'
          DataPipeline = dbVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 1058
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText31: TppDBText
          UserName = 'DBText15'
          DataField = 'NOME_VENDEDOR'
          DataPipeline = dbVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4233
          mmLeft = 34131
          mmTop = 1058
          mmWidth = 90223
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'QTDE_CARREG'
          DataPipeline = dbVendedor
          DisplayFormat = ',###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4149
          mmLeft = 127000
          mmTop = 2117
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR_COMISSAO'
          DataPipeline = dbVendedor
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4233
          mmLeft = 159544
          mmTop = 2117
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel59: TppLabel
          UserName = 'Label23'
          Caption = 'Total do Vendedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4149
          mmLeft = 2582
          mmTop = 2117
          mmWidth = 27009
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'COD_VENDEDOR'
          DataPipeline = dbVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbVendedor'
          mmHeight = 4233
          mmLeft = 34131
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'TOTAL_COMISSAO'
          DataPipeline = dbVendedor
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4233
          mmLeft = 179917
          mmTop = 2117
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Pen.Style = psDot
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 2646
          mmLeft = 0
          mmTop = 5292
          mmWidth = 283634
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'UNIDADE'
      DataPipeline = dbVendedor
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbVendedor'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'UNIDADE'
          DataPipeline = dbVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4498
          mmLeft = 34131
          mmTop = 2381
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppLabel38: TppLabel
          UserName = 'Label101'
          Caption = 'Unidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 19579
          mmTop = 2381
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Pen.Style = psDash
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 794
          mmWidth = 283368
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLabel39: TppLabel
          UserName = 'Label102'
          Caption = 'Total da Unidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3968
          mmLeft = 5292
          mmTop = 2117
          mmWidth = 25135
          BandType = 5
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR_COMISSAO'
          DataPipeline = dbVendedor
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4498
          mmLeft = 157957
          mmTop = 3175
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'TOTAL_COMISSAO'
          DataPipeline = dbVendedor
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4498
          mmLeft = 180182
          mmTop = 3175
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'QTDE_CARREG'
          DataPipeline = dbVendedor
          DisplayFormat = ',###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbVendedor'
          mmHeight = 4149
          mmLeft = 127000
          mmTop = 2117
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Pen.Style = psDash
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 2381
          mmLeft = 0
          mmTop = 5292
          mmWidth = 283369
          BandType = 5
          GroupNo = 1
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
  object dbVendedor: TppDBPipeline
    DataSource = dsVendedor
    UserName = 'dbVendedor'
    Left = 144
    Top = 248
  end
end
