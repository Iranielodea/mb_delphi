object fRPedido: TfRPedido
  Left = 192
  Top = 114
  Caption = 'fRPedido'
  ClientHeight = 209
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Qped: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   EMP.NOME          AS EMP_NOME,'
      '   EMP.ENDERECO      AS EMP_ENDERECO,'
      '   EMP.NUMERO        AS EMP_NUMERO,'
      '   EMP.CEP           AS EMP_CEP,'
      '   EMP.DESC_CIDADE   AS EMP_DESC_CIDADE,'
      '   EMP.ESTADO        AS EMP_ESTADO,'
      '   EMP.FONE          AS EMP_FONE,'
      '   EMP.FAX           AS EMP_FAX,'
      '   EMP.EMAIL         AS EMP_EMAIL,'
      '   EMP.CNPJ          AS EMP_CNPJ,'
      ''
      '   PED.NUM_PEDIDO    AS PED_NUM_PEDIDO,'
      '   PED.DATA          AS PED_DATA,'
      '   PED.OBS           AS PED_OBS,'
      '   PED.TOTAL_LIQUIDO AS PED_TOTAL_LIQUIDO,'
      ''
      '   CLI.NOME          AS CLI_NOME,'
      '   CLI.ENDERECO      AS CLI_ENDERECO,'
      '   CLI.BAIRRO        AS CLI_BAIRRO,'
      '   CLI.NUMERO        AS CLI_NUMERO,'
      '   CLI.CEP           AS CLI_CEP,'
      '   CLI.COMPLEMENTO   AS CLI_COMPLEMENTO,'
      '   CLI.CNPJ          AS CLI_CNPJ,'
      '   CLI.INSC_ESTADUAL AS CLI_INSC_ESTADUAL,'
      '   CLI.EMAIL         AS CLI_EMAIL,'
      '   CIDCLI.DESC_CIDADE AS CLI_DESC_CIDADE,'
      '   ESTCLI.SIGLA      AS CLI_UF,'
      '   CLI.FONE          AS CLI_FONE,'
      ''
      '   FO.NOME           AS FOR_NOME,'
      '   FO.FONE           AS FOR_FONE,'
      '   FO.ENDERECO       AS FOR_ENDERECO,'
      '   FO.NUMERO         AS FOR_NUMERO,'
      '   FO.BAIRRO         AS FOR_BAIRRO,'
      '   FO.CEP            AS FOR_CEP,'
      '   FO.COMPLEMENTO    AS FOR_COMPLEMENTO,'
      '   EST.SIGLA         AS FOR_UF,'
      '   CID.DESC_CIDADE   AS FOR_DESC_CIDADE,'
      ''
      '   PRO.DESC_PRODUTO  AS ITE_DESC_PRODUTO,'
      '   ITE.QTDE          AS ITE_QTDE,'
      '   ITE.VALOR         AS ITE_VALOR,'
      '   ITE.VALOR_TOTAL   AS ITE_VALOR_TOTAL,'
      '   UNI.SIGLA         AS ITE_UN'
      ''
      'from PEDIDO PED'
      
        '   inner join EMPRESA EMP        on PED.COD_EMPRESA = EMP.COD_EM' +
        'PRESA'
      
        '   inner join ITENS_PEDIDO ITE   on PED.NUM_PEDIDO = ITE.NUM_PED' +
        'IDO'
      '   left join FORNECEDOR FO       on PED.COD_FOR = FO.COD_FOR'
      
        '   left join CIDADE CID          on FO.COD_CIDADE = CID.COD_CIDA' +
        'DE'
      
        '   left join ESTADO EST          on CID.ID_ESTADO = EST.ID_ESTAD' +
        'O'
      
        '   left join CLIENTE CLI         on PED.COD_CLIENTE = CLI.COD_CL' +
        'IENTE'
      
        '   left join CIDADE CIDCLI       on CLI.COD_CIDADE = CIDCLI.COD_' +
        'CIDADE'
      
        '   left join ESTADO ESTCLI       on CIDCLI.ID_ESTADO = ESTCLI.ID' +
        '_ESTADO'
      
        '   left join PRODUTO PRO         on ITE.COD_PRODUTO = PRO.COD_PR' +
        'ODUTO'
      
        '   left join UNIDADE UNI         on ITE.ID_UNIDADE = UNI.ID_UNID' +
        'ADE'
      '   where PED.NUM_PEDIDO = :NUM_PEDIDO')
    SQLConnection = DM.BancoDados
    Left = 40
    Top = 24
    object QpedEMP_NOME: TStringField
      FieldName = 'EMP_NOME'
      Required = True
      Size = 60
    end
    object QpedEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      Size = 50
    end
    object QpedEMP_NUMERO: TStringField
      FieldName = 'EMP_NUMERO'
      Size = 8
    end
    object QpedEMP_CEP: TStringField
      FieldName = 'EMP_CEP'
      FixedChar = True
      Size = 8
    end
    object QpedEMP_DESC_CIDADE: TStringField
      FieldName = 'EMP_DESC_CIDADE'
      Size = 40
    end
    object QpedEMP_ESTADO: TStringField
      FieldName = 'EMP_ESTADO'
      FixedChar = True
      Size = 2
    end
    object QpedEMP_FONE: TStringField
      FieldName = 'EMP_FONE'
      Size = 15
    end
    object QpedEMP_FAX: TStringField
      FieldName = 'EMP_FAX'
      Size = 15
    end
    object QpedEMP_EMAIL: TStringField
      FieldName = 'EMP_EMAIL'
      Size = 80
    end
    object QpedPED_NUM_PEDIDO: TIntegerField
      FieldName = 'PED_NUM_PEDIDO'
      Required = True
    end
    object QpedPED_DATA: TSQLTimeStampField
      FieldName = 'PED_DATA'
      Required = True
    end
    object QpedPED_OBS: TStringField
      FieldName = 'PED_OBS'
      Size = 200
    end
    object QpedPED_TOTAL_LIQUIDO: TFloatField
      FieldName = 'PED_TOTAL_LIQUIDO'
    end
    object QpedCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 60
    end
    object QpedCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object QpedCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 40
    end
    object QpedCLI_NUMERO: TStringField
      FieldName = 'CLI_NUMERO'
      Size = 8
    end
    object QpedCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      FixedChar = True
      Size = 8
    end
    object QpedCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      Size = 30
    end
    object QpedCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      Size = 14
    end
    object QpedCLI_INSC_ESTADUAL: TStringField
      FieldName = 'CLI_INSC_ESTADUAL'
    end
    object QpedCLI_DESC_CIDADE: TStringField
      FieldName = 'CLI_DESC_CIDADE'
      Size = 50
    end
    object QpedCLI_UF: TStringField
      FieldName = 'CLI_UF'
      FixedChar = True
      Size = 2
    end
    object QpedFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      Size = 60
    end
    object QpedFOR_FONE: TStringField
      FieldName = 'FOR_FONE'
      Size = 15
    end
    object QpedFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      Size = 50
    end
    object QpedFOR_NUMERO: TStringField
      FieldName = 'FOR_NUMERO'
      Size = 8
    end
    object QpedFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      Size = 40
    end
    object QpedFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      FixedChar = True
      Size = 8
    end
    object QpedFOR_COMPLEMENTO: TStringField
      FieldName = 'FOR_COMPLEMENTO'
      Size = 30
    end
    object QpedFOR_UF: TStringField
      FieldName = 'FOR_UF'
      FixedChar = True
      Size = 2
    end
    object QpedFOR_DESC_CIDADE: TStringField
      FieldName = 'FOR_DESC_CIDADE'
      Size = 50
    end
    object QpedITE_DESC_PRODUTO: TStringField
      FieldName = 'ITE_DESC_PRODUTO'
      Size = 50
    end
    object QpedITE_QTDE: TFloatField
      FieldName = 'ITE_QTDE'
    end
    object QpedITE_VALOR: TFloatField
      FieldName = 'ITE_VALOR'
    end
    object QpedITE_VALOR_TOTAL: TFloatField
      FieldName = 'ITE_VALOR_TOTAL'
    end
    object QpedITE_UN: TStringField
      FieldName = 'ITE_UN'
      FixedChar = True
      Size = 5
    end
    object QpedEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Size = 14
    end
    object QpedCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 80
    end
    object QpedCLI_FONE: TStringField
      FieldName = 'CLI_FONE'
      Size = 15
    end
  end
  object dspPed: TDataSetProvider
    DataSet = Qped
    Left = 96
    Top = 24
  end
  object Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPed'
    OnCalcFields = PedCalcFields
    Left = 160
    Top = 24
    object PedEMP_NOME: TStringField
      FieldName = 'EMP_NOME'
      Required = True
      Size = 60
    end
    object PedEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      Size = 50
    end
    object PedEMP_NUMERO: TStringField
      FieldName = 'EMP_NUMERO'
      Size = 8
    end
    object PedEMP_CEP: TStringField
      FieldName = 'EMP_CEP'
      FixedChar = True
      Size = 8
    end
    object PedEMP_DESC_CIDADE: TStringField
      FieldName = 'EMP_DESC_CIDADE'
      Size = 40
    end
    object PedEMP_ESTADO: TStringField
      FieldName = 'EMP_ESTADO'
      FixedChar = True
      Size = 2
    end
    object PedEMP_FONE: TStringField
      FieldName = 'EMP_FONE'
      Size = 15
    end
    object PedEMP_FAX: TStringField
      FieldName = 'EMP_FAX'
      Size = 15
    end
    object PedEMP_EMAIL: TStringField
      FieldName = 'EMP_EMAIL'
      Size = 80
    end
    object PedPED_NUM_PEDIDO: TIntegerField
      FieldName = 'PED_NUM_PEDIDO'
      Required = True
    end
    object PedPED_DATA: TSQLTimeStampField
      FieldName = 'PED_DATA'
      Required = True
    end
    object PedPED_OBS: TStringField
      FieldName = 'PED_OBS'
      Size = 200
    end
    object PedPED_TOTAL_LIQUIDO: TFloatField
      FieldName = 'PED_TOTAL_LIQUIDO'
    end
    object PedCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 60
    end
    object PedCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object PedCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 40
    end
    object PedCLI_NUMERO: TStringField
      FieldName = 'CLI_NUMERO'
      Size = 8
    end
    object PedCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      FixedChar = True
      Size = 8
    end
    object PedCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      Size = 30
    end
    object PedCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      Size = 14
    end
    object PedCLI_INSC_ESTADUAL: TStringField
      FieldName = 'CLI_INSC_ESTADUAL'
    end
    object PedCLI_DESC_CIDADE: TStringField
      FieldName = 'CLI_DESC_CIDADE'
      Size = 50
    end
    object PedCLI_UF: TStringField
      FieldName = 'CLI_UF'
      FixedChar = True
      Size = 2
    end
    object PedFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      Size = 60
    end
    object PedFOR_FONE: TStringField
      FieldName = 'FOR_FONE'
      Size = 15
    end
    object PedFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      Size = 50
    end
    object PedFOR_NUMERO: TStringField
      FieldName = 'FOR_NUMERO'
      Size = 8
    end
    object PedFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      Size = 40
    end
    object PedFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      FixedChar = True
      Size = 8
    end
    object PedFOR_COMPLEMENTO: TStringField
      FieldName = 'FOR_COMPLEMENTO'
      Size = 30
    end
    object PedFOR_UF: TStringField
      FieldName = 'FOR_UF'
      FixedChar = True
      Size = 2
    end
    object PedFOR_DESC_CIDADE: TStringField
      FieldName = 'FOR_DESC_CIDADE'
      Size = 50
    end
    object PedITE_DESC_PRODUTO: TStringField
      FieldName = 'ITE_DESC_PRODUTO'
      Size = 50
    end
    object PedITE_QTDE: TFloatField
      FieldName = 'ITE_QTDE'
    end
    object PedITE_VALOR: TFloatField
      FieldName = 'ITE_VALOR'
    end
    object PedITE_VALOR_TOTAL: TFloatField
      FieldName = 'ITE_VALOR_TOTAL'
    end
    object PedITE_UN: TStringField
      FieldName = 'ITE_UN'
      FixedChar = True
      Size = 5
    end
    object PedC_ENDERECO_FOR: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_ENDERECO_FOR'
      Size = 80
      Calculated = True
    end
    object PedC_ENDERECO_CLI: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_ENDERECO_CLI'
      Size = 80
      Calculated = True
    end
    object PedC_ENDERECO_EMP: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_ENDERECO_EMP'
      Size = 80
      Calculated = True
    end
    object PedC_DESC_CONDICAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_DESC_CONDICAO'
      Size = 50
    end
    object PedQTab: TDataSetField
      FieldName = 'QTab'
    end
    object PedEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Size = 14
    end
    object PedCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 80
    end
    object PedCLI_FONE: TStringField
      FieldName = 'CLI_FONE'
      Size = 15
    end
  end
  object dsPed: TDataSource
    DataSet = Ped
    Left = 216
    Top = 24
  end
  object Tab: TClientDataSet
    Aggregates = <>
    DataSetField = PedQTab
    Params = <>
    OnCalcFields = TabCalcFields
    Left = 160
    Top = 128
    object TabDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      Size = 30
    end
    object TabVALOR_PAGAR: TFloatField
      FieldName = 'VALOR_PAGAR'
    end
    object TabDATA_VENCTO: TSQLTimeStampField
      FieldName = 'DATA_VENCTO'
    end
    object TabDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object TabC_DIAS: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_DIAS'
      Size = 30
    end
  end
  object dspTab: TDataSetProvider
    DataSet = QTab
    Left = 96
    Top = 128
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 216
    Top = 128
  end
  object dbPed: TppDBPipeline
    DataSource = dsPed
    UserName = 'dbPed'
    Left = 272
    Top = 24
  end
  object RelPed: TppReport
    AutoStop = False
    DataPipeline = dbPed
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
    Template.FileName = 'C:\Projetos\mb\PedidoSLogo.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = RelPedPreviewFormCreate
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
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 336
    Top = 24
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbPed'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 215371
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Pedido N'#186':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 57415
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'PED_NUM_PEDIDO'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5292
        mmLeft = 44450
        mmTop = 56356
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 86784
        mmTop = 57415
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        AutoSize = True
        DataField = 'PED_DATA'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 6350
        mmLeft = 103717
        mmTop = 55298
        mmWidth = 1058
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 25135
        mmTop = 60325
        mmWidth = 172244
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 77788
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'FONE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 61383
        mmTop = 87577
        mmWidth = 10848
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Rua'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 61383
        mmTop = 74083
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'BAIRRO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 61383
        mmTop = 78581
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 25135
        mmTop = 90488
        mmWidth = 172244
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'FOR_NOME'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5556
        mmLeft = 61383
        mmTop = 67204
        mmWidth = 131234
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        HyperlinkEnabled = False
        DataField = 'FOR_FONE'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 4233
        mmLeft = 74083
        mmTop = 87577
        mmWidth = 34131
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        HyperlinkEnabled = False
        DataField = 'C_ENDERECO_FOR'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 4233
        mmLeft = 69850
        mmTop = 74083
        mmWidth = 97367
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        HyperlinkEnabled = False
        DataField = 'FOR_BAIRRO'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 4233
        mmLeft = 78317
        mmTop = 78581
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        HyperlinkEnabled = False
        AutoSize = True
        DataField = 'FOR_CEP'
        DataPipeline = dbPed
        DisplayFormat = '#####-###;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 4234
        mmLeft = 61383
        mmTop = 83079
        mmWidth = 794
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        HyperlinkEnabled = False
        DataField = 'FOR_DESC_CIDADE'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 83079
        mmWidth = 61648
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        HyperlinkEnabled = False
        DataField = 'FOR_UF'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 4233
        mmLeft = 143669
        mmTop = 83079
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Cliente:.....................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 96838
        mmWidth = 32279
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'Endere'#231'o:.................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 102129
        mmWidth = 32808
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Bairro:.......................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 107421
        mmWidth = 33073
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Cep:..........................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 112977
        mmWidth = 33338
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Cidade:.....................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 118269
        mmWidth = 33073
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        HyperlinkEnabled = False
        Caption = 'CNPJ:.......................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 123825
        mmWidth = 33073
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        HyperlinkEnabled = False
        Caption = 'Insc. Est.:.................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 129382
        mmWidth = 32015
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        HyperlinkEnabled = False
        DataField = 'CLI_NOME'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 96044
        mmWidth = 135202
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        HyperlinkEnabled = False
        DataField = 'CLI_BAIRRO'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 106627
        mmWidth = 133879
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        HyperlinkEnabled = False
        DataField = 'C_ENDERECO_CLI'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5556
        mmLeft = 59267
        mmTop = 100806
        mmWidth = 134938
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        HyperlinkEnabled = False
        DataField = 'CLI_CEP'
        DataPipeline = dbPed
        DisplayFormat = '#####-###;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 112184
        mmWidth = 29633
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        HyperlinkEnabled = False
        DataField = 'CLI_DESC_CIDADE'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 117475
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        HyperlinkEnabled = False
        DataField = 'CLI_UF'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 91017
        mmTop = 112184
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        HyperlinkEnabled = False
        DataField = 'CLI_CNPJ'
        DataPipeline = dbPed
        DisplayFormat = '##.###.###/####-##;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 123031
        mmWidth = 63765
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        HyperlinkEnabled = False
        DataField = 'CLI_INSC_ESTADUAL'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 59267
        mmTop = 128588
        mmWidth = 70379
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 24606
        mmTop = 212990
        mmWidth = 172244
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        HyperlinkEnabled = False
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 208757
        mmWidth = 10583
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        HyperlinkEnabled = False
        Caption = 'Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41804
        mmTop = 208757
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        HyperlinkEnabled = False
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 124354
        mmTop = 208757
        mmWidth = 8202
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        HyperlinkEnabled = False
        Caption = 'Valor Unit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 208757
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        HyperlinkEnabled = False
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 177271
        mmTop = 208757
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground1
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'dbTab'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 147902
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = dbTab
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
          Version = '15.03'
          mmColumnWidth = 0
          DataPipelineName = 'dbTab'
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              HyperlinkEnabled = False
              DataField = 'C_DIAS'
              DataPipeline = dbTab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbTab'
              mmHeight = 5027
              mmLeft = 50800
              mmTop = 0
              mmWidth = 32279
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              HyperlinkEnabled = False
              DataField = 'VALOR_PAGAR'
              DataPipeline = dbTab
              DisplayFormat = ',##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbTab'
              mmHeight = 5027
              mmLeft = 84138
              mmTop = 0
              mmWidth = 30956
              BandType = 4
              LayerName = Foreground
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              HyperlinkEnabled = False
              DataField = 'DESC_PAGTO'
              DataPipeline = dbTab
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'dbTab'
              mmHeight = 5027
              mmLeft = 139700
              mmTop = 0
              mmWidth = 52123
              BandType = 4
              LayerName = Foreground
            end
          end
          object ppDesignLayers1: TppDesignLayers
            object ppDesignLayer1: TppDesignLayer
              UserName = 'Foreground'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        HyperlinkEnabled = False
        Caption = 'Forma de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 139700
        mmTop = 141288
        mmWidth = 33867
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        HyperlinkEnabled = False
        Caption = 'Cond. Pagto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 141288
        mmWidth = 20638
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 24606
        mmTop = 206905
        mmWidth = 172244
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        HyperlinkEnabled = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 63765
        mmTop = 141288
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        HyperlinkEnabled = False
        Caption = 'Valor R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 141288
        mmWidth = 13494
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        HyperlinkEnabled = False
        Caption = 'Observa'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 26194
        mmTop = 172773
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'PED_OBS'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 31221
        mmLeft = 49477
        mmTop = 172773
        mmWidth = 147373
        BandType = 0
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Email.:.......................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 134144
        mmWidth = 33073
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'CLI_EMAIL'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 59531
        mmTop = 133879
        mmWidth = 70379
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        HyperlinkEnabled = False
        DataField = 'ITE_QTDE'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 265
        mmWidth = 14023
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        HyperlinkEnabled = False
        DataField = 'ITE_DESC_PRODUTO'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 41010
        mmTop = 0
        mmWidth = 82286
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        HyperlinkEnabled = False
        DataField = 'ITE_UN'
        DataPipeline = dbPed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 124884
        mmTop = 0
        mmWidth = 10319
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        HyperlinkEnabled = False
        DataField = 'ITE_VALOR'
        DataPipeline = dbPed
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 137584
        mmTop = 0
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        HyperlinkEnabled = False
        DataField = 'ITE_VALOR_TOTAL'
        DataPipeline = dbPed
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 160867
        mmTop = 0
        mmWidth = 33073
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 47096
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D616765A6290000FFD8FFE000104A46494600010101009600
          960000FFE100224578696600004D4D002A000000080001011200030000000100
          01000000000000FFFE001F4C45414420546563686E6F6C6F6769657320496E63
          2E2056312E303100FFDB00430002010102010102020202020202020305030303
          03030604040305070607070706070708090B0908080A0807070A0D0A0A0B0C0C
          0C0C07090E0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C080708
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800EA011E0301220002
          1101031101FFC4001F0000010501010101010100000000000000000102030405
          060708090A0BFFC400B5100002010303020403050504040000017D0102030004
          1105122131410613516107227114328191A1082342B1C11552D1F02433627282
          090A161718191A25262728292A3435363738393A434445464748494A53545556
          5758595A636465666768696A737475767778797A838485868788898A92939495
          969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CA
          D2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC400
          1F0100030101010101010101010000000000000102030405060708090A0BFFC4
          00B5110002010204040304070504040001027700010203110405213106124151
          0761711322328108144291A1B1C109233352F0156272D10A162434E125F11718
          191A262728292A35363738393A434445464748494A535455565758595A636465
          666768696A737475767778797A82838485868788898A92939495969798999AA2
          A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7
          D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311
          003F00FDFCA28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
          00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
          00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
          00A29B2B6D8D88EC0F5ACBD77C536BE17D2EE2F750BA86D2CEDD4B3CB3305518
          C639F71CE393D688A6DF2C55D81AAC48538EB8E334CF3BE427FBBED5E630FC58
          F127C4B9A7B6F09E8EF67A76D2835DD5613144C4E46628090F27A86385FC2AE4
          1F01ED75B9B7F89B58D6FC4533307F2A6BC7B7B78DBFD98A22A36FB366BBE581
          8D2D3153E57D97BD2FB93497A3927E473AC4297F0D5FCF65F7FF0095CEBF58F1
          AE99E1D8D5B50D4B4FB20C700CF3A463F56ABD63A9C3A8C11CB6F245710C832B
          244DB9187A822B02F3E0A783EFEDA38EE3C2FA0DD2C2311F9F631CA57F1604D6
          2A7806D3E1B789B4BBBD06DDAC6C2EAE56D6EEC2D58A5A90E1B6CA221F2290C1
          7950297B1C34A3CB4E52E6D774ACFCB7767F79A734D7C4BB6CFF00E023D0A8A2
          8AE1340A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
          28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A6CA76C4DCEDE0F3E
          944EDB6073E8A4F271FAD79AEA7E3ABAF8B5AADE687E17BAB8B7D3EDE4306A5A
          DC64A8898300D0DB9FE29301816E8B9C8E715D187C2CEB376D22B77D12FEB65B
          B7A22652515766BF89FE2CFF0066788D343D2EC6E35BD6A542EF040CAB1590EC
          D3C8788C1F4C1623A03C0393E17F8497DE20D6A1D63C717169AC6A36F3799696
          906E6B1B1DACDB0AAB01BDC073F3B0EB8EEA08EAFC15E02D33C03A60B3D36D56
          08D9B748CC77492B77691CFCCCC7DC9ADFD8A0FDD1F956F2C6469274F0AADD1C
          9FC4FF003E54FB2D7BB666A9B92FDE7DDD3FE08CFB1C4571E5AE0F18C76A72C4
          A9D3F9D3A8AE0DCDB61B20DC8C3D4638ACFBCD92EAD670C8BB98335CA9DC4050
          BF2F3EF975E0F1D7D056937DDAA7691ADC5C35C6D0C33B14FA01CE7F13551DEE
          296BA1728A28A918514514005145140051451400514514005145140051451400
          514514005145140051451400514514005145140051451400547732086DA4666D
          AAAA4963D863AD3A41946FA5791EBDACFF00C2FCF145EF856C6394785B4D98C1
          ACDFE4C6B7B2A807EC917F7907F1FA8FCDBAB0B8575A4DBD2315793ECBF56F64
          B76EC899CAC8857C4BA87ED3175A8D8693773E9DE0100DA4FAA5B968EEB596E4
          3A5B499C243CE1A4C1270429192C9E9DE11F0969FE09D02D34BD36D62B5B2B34
          D914680003B927D5892493DC926AE697A6C3A458416B6CAB15BDB208E345E8A0
          70055AAAC5633DA2F634972D35B47E56BBEF27DEDA6C9244D38B5ACB57FD6C18
          E68A28AE3340A0F4A2997132DBDBC9248C152352CC4F40075A00A9AADDB27976
          F1488B35C301863C84FE223DC0E9566DA04B4816251F2A8E38AA1A3DB49F6E9A
          EA6455694F93185FE18D4B1527EB5A9552D159131BEEC28A28A92828A28A0028
          A28A0028A28A0028A28A0028A28A0028A28A0028A8EEA5582D649246544452CC
          CC70AA00E4926BC2FC59FB645BEB1AE5E685F0EF4B7F176B56A0FDA2F1DBECFA
          4E9A07DE79E76217E5E4ED07240EB5DD81CB7138B938D08DD2DDED14BBB6EC97
          CDA26738C1734DD97F5B77F45A9EF1457CA7FB325DFC4DF8C1F1A9BC51AC789E
          55F08E932CB6B1DB5A02969A849F74C71263F791C67933C8031C61554EE29F56
          56D9B658F015FEAF29C672B26F96F68B7F65DD2D575EDB6E451ACAA479A3B051
          4515E59A85145140051451400138A6CA731374E87AD398E16B85F8F3F13A6F87
          BE086FECD8FED9AF6B520B0D22DA365DF35C4836A119E36AB10493C01C9E2B5C
          3E1E75EAAA34F7969FD792EA293B2BB39FF89DE2BD6BC7BE3BB3F05F84EEDACA
          385E39FC43A8C60335ADB37FCB08DB076CB228600FDE5FBC3A66BD07C1DE0CD3
          FC0DA0DB697A65BFD9ECAD06D8D32588E724927249272726B1BE0E7C2E8BE15F
          8516CC33DD6A179335EEA778DC35E5D49CC921F6270001C05007639ECABAB1B8
          8834B0D43E08F5B5B99FF33FFDB57D95A6F76E29C5FC52DFF24145145701A051
          41381413C500079A86587CD65DDF714EEFC453A793119E7031C9EC2832288B97
          5E879CFA75A3601DBB6D3AB9AF08FC53D07C75E20D574CD2353B6D42F3439162
          BE580965B7739F94BE3693C1C8CF1835D2D5D4A73A72E5A89A7D9AB6FAAFBD6A
          09A7AA0A28A3350014520704E32323A8F4A5A0028CD19A6B4ABB3EF29C8E39EB
          400A1D580C1073D39EB4A4E05737E04F89DE1DF8970DC4DE1FD634ED5A3B394C
          331B59964F25C12002074CE0907B815D1B9011B3D31CE6AAA539D3938544D35D
          1E8C00B8033918F5AADAA6B965A259B5C5EDE5AD9DBA901A59E558D172703249
          C7278AE57E2FFC61D37E11E850CD741AE6FB549BEC7A6D942A5A6BEB83C2A281
          938CE3240380726B8FD4BF664B3F89DE288FC41E359EEB5493CBFDD6902E192C
          2D3746AAFC0FBE7209073C139E480C3BB0D838722AF8B93841DED657726BA257
          5A776F45EBA1954A8D3E58ABBFBADEA7B0C5731CF1ABC7223A48015656C8607A
          629E4E05792FECE176BA3EA9E26F0CDADD5D5E69BE1BBC10412CC1895DCCF98F
          71EBB42AF3EA58F422BD375FD72CFC3FA2DD5F5F5D4369676B1B4934D2361635
          03A9ACB1985746BBA11F7B6B69AB4D26B4EF66B41D2A9CF1E62D97564FBCBB48
          EB9E2BC93E377ED3FA7FC3BD597C33A0DBB78A7C75A8204B3D12D0E5973FC733
          0F962451F312D8E067A7238DD67E32F8D7F68ED4EEB47F869632687E1D6FDCDC
          78BEF970927507EC918E5C80A4863C72A7806BD17E077ECEDE1EF805A3343A5C
          57975A85D106F754BD6F3EF2FD867E677F4F40B800761C9AF5BFB3F0F804AA66
          1EF54DD534FF00F4E35F0AFEEAF7FBF2EE632ACE4F968EBDDF45E9DDF96CBABD
          93E3748F81BE22F885E1A9AFBE3078924BAB72D25CAE8BA6DCFD874FD3633CA8
          96588A4933263A970A39FBDCB567FC34D16DFE3BDAB69BA0D9C7E1FF00843661
          D204B01F655D732CE098CAAABAA1392EC0E0E5704B97F2F3FE39789AFBF69DF8
          F317C25D16E258FC35A305BDF17DEDB3E1A541802C830FBA5CB007B8C3FF0074
          D7D19A268B6BE19D26DF4FB1B75B5B3B3411451469B51140E83FCF35DB98632B
          616842556CAAD45CD182568D28BDA4A2B4E792D5377928D9B6DB4D4468C64DC5
          BE6EEDEFE697449F54925E447E1DF0E59F84748B4D374FB68ED2C6CD16282089
          7091A8EC3F9E4F24E6B5335E6FF133F6A1F0AFC23F1F691E1BD7AF1ECEFB5844
          785CA7EE977C9B06E6380A320F27B03E95E88922BAA91F32B720FF002AF99AD8
          7AF4E31AD5A2D29EA9BFB5AEAD3EBAEE75C6DF0AE84945145739414514500143
          36D19F4A286FBA6802AEADA9DBE99A5DCDCDC49E55BDBC4F2CAE72362A8258E4
          73C01DABC7BF66CB4BAF89DE23D43E276A8BE4BEB61AC345B7CB036DA7A48304
          8DC57F7C504981D0124121CD2FED37AC5C78E35AF0EFC39D22494DE78A27F375
          6683992CB4B439999FFB8243F2A938C952A3278AF5AD1341B7F0F69D6D676702
          DBDADA46B0C31A001634501540FA2803E8057AEAF85C0DFEDD6FC209FF00EDF2
          5F745ADA463A4E765B2FCFA7E068514515E41B0514504E050004E0557BABB085
          5577349203B70718F7A92E2E56DE2666CF033800927E80726AA58AB489F68B85
          02739031CEC146CB998BC8B224FDDFCC4EEC1078AF9D7E2DF8DB5AFDA73E22DC
          7C3BF085C4F61E18D3982F8A75FB7C330E0E6CA0278673D18E0E3353FED25F1E
          754F1AF8917E17FC359A3BEF14EADFB9D52FE26DD06836C7891E465FBAFB4F6E
          412A3192057AC7C1CF83DA67C11F0069FE1FD2A36FB358AEE92563BA4B895B97
          958F56663D49E715F4987A3FD974238EAE97B696B4E2FECAFF009F925FFA427A
          3D64F4493C2A37297B387CDFE9EAFF000468F823C0FA6FC37F0D58E8BA2D9DBE
          9FA5E9C8238608C10A17249E7AB31625998E4B1624E492D5BFBABCABE3C7ED0C
          BF0BB53D274BD2EC5B56D6352BC82031283B6149240BD7A79873C2E7774E306B
          D4207DCAAD865070D83EE2BC5C4617110847155B6A8DB4DBD5DB77DF56F7EBAB
          35838FC11E84CCDB149F4E7A552D5BC4365A26977579757115BDAD9A19269243
          B5635032493526A3A9DBE9DA7CB71713476F6F1A6E79253B1631EA49E83EB5E0
          D7BE1F93F6BFF16C82FBED50FC36D1E70B6D1A3322F88E6E18B1E9BADD738C7F
          7830EAAC06D80C1C6B373AD2E5A71F89EEFD12EB27B25F37A26675EB7B3574AE
          DEC96EFF00AEADE8BB9BFF000EBF6DBF037C49F1FDBE836326A56F36A2D22E9D
          75776660B6D50C78DFE539EB8C81C81924019240AF6112A93F8E3A7E35F3EFED
          E9E0E8EC3E00AF882C6D7ECFA9781EF2D6F74C7B64DAD10F392364F9573E5ED6
          DDB47059132702BDE2C6E96F608A68CEE8A450E8D8FBE08E0FE20835D39961F0
          BF57A58BC1A94632728B527CDEF4795DD34968D4D696D1A7D0AA751B6E12DF7D
          3FAFEBC8B6CDB549F419AF9D7F6E0F1BDD6B571E18F863A4DEB596A1E3EB910D
          E5C272D6965BC2C84AF53BCB63E91B66BDCFC6BE38D2FC01E14BFD6356BA86CF
          4FD3E232CD24A76A81D873DC9C003A9271D6BE4DFD937C2FAB7C7AFDABF5EF8B
          774B71FD876AAF63A4CF2212976B831911EEC7CAB8392A382A0752C07A3C3385
          843DA66B5F4850578DF69547A422BCD36A4FC976231152C9435BCB4D0F50F857
          F073FE14C7ED5DA8B687A7FD83C2FADF84ED9AE04646D92F2D66F247CA3A1101
          8FA0E4B39E4D7AB7C54F8A3A4FC24F87FAB7887569BCBB1D2A0695C60E643D15
          0601E598AAFD5856CB44A97325C10DF702F033C0C9E3BF39FD2BE70F8DF651FE
          D53F1FF4BF00453472F83FC1AD1EB1E2A68C9F2E4B804882CCB766CEE62A4F2A
          C73828A2B9F0B279A6363531AFDC8453A92EBCB0B2FF00C09AB463E6D799518B
          A50B4575D11B3FB21FC33D575CD4350F8ABE30F325F1478B543D95BB0CAE8D61
          FC10A2F6661824F5C05FE22FBBBDF8DDF1AD7E1D59DAE9FA5DBB6B1E28D69FCA
          D374C84E6594907E738FBA8304966C28018938071C4FC51FDACD23997C3BF0B7
          4F5F1F78AB22268F4D613586903383F69994F971918C0566073E8335D37C04F8
          0F75F0EBCFF1078AB505F10F8E3544C5FEA447EEED63CEEFB35B8382B0A9033C
          02E4024001557AB1B0939FF696671514FE0A5B3715A455B78D34ADABB3974DDC
          94EB1F721BBD5BEDFD745F923A0F831F0F64F871E0686D2E2692EB53B8637BA8
          CFBB709EEA4E653EB8CF03D80AC1FDAB7C10BE37F852C595268F43BB8B559A07
          194B88E204BA30F4DA49C7538E3271516AFF001EAF7C5DE236D0FC0DA59D71BE
          68E7D65D49D2ED5C120A99070CCA7AA839FCC56A785BC31E3C8BC4B27FC241A8
          787754F0FDF40567B686078A5B67C636C7C61D0F7DC41AE18D3C4D0C42C76224
          A33BF372B7EF3F92DAEB64EDE44CA50E5F651F4D9DAFEA8EB3C2FAC45E21F0E5
          8EA16CAD1DBDF4115C44A4744650D8C76EB8C76AF34FDB0FE31DDFC2CF84525A
          E86CD2F8B3C512A691A2C08FB6E1E79BE5DEB9FEE021B278076E79201EB3E0ED
          E3C7A3EA5A54DE5B2E87A84B63095FF9E402B203EE0374EB800F422BC6F49D42
          1F8CDFB714DAC5FDFC31F86FE1DA0D2B4959A630A5F6AB3656609B861D93E646
          55390C90D6994E069AC6CEB5657A74539B5BF37F245FF8A4D27E577D0A751FB3
          4E1BBB25FD791EA9FB337C12B6F807F0A34BD0EDFF007974CBF6BD46739DD737
          5205323F3CE3236A83C85551D457A31E951AA1073B719C74A92BC4C5626A622B
          4F1159DE526DB7E6CDA31515CA8F3DF8BFF06DBC75AFF87F5BB1874F1ACE8372
          0ACB72A595ED988334240FEF945FA735DE241B597E5C05E074E3E9EDFE153138
          14DF357FAF4A5531139D28529BD237B7A3D6C254E29B9771D45344AADDE9D589
          6145145000C70298EEAD1373C63927B53CF4AF39FDA93E20CBF0E3E076B97B6A
          3FE2617517F67D82E3E63713FEEA323D4866DDDB8535BE170F3C45685086F269
          2F57A0A52B2BB391FD94636F891E2BF187C49B90D27FC241A9369DA53B8195D3
          ED898D718247CCEA49C673B41CF26BDD2B93F831F0EA1F851F0BFC3FE1DB758D
          5348B28EDD8A0F95DC01BDBFE04DB8FE26BACAEACDB170C462E73A5F02768FF8
          62AD1FC12BF9DC8A6AD1BBDDEBF78514504E0579C6804E05433DDA456ED23B79
          6AA092CDC62A491C0898919E0F1EB5CFCCD26BF731C9FBA6D2623BDD9CFCD3B8
          E8718C6D523B9E7E95518DF57B7F5F8B0772D692B36A127DB6EA17818022180E
          09857A1E47049C67DABC3FF6C7FDA4AEBC27E146D17C2EBF6AD6356BD1A3A903
          3E64EF85F223238660197711C2EE50486216BA0F885F18BFE133F0F5E7FC237A
          9B693E1BB0F346B3E270408EC043F7A2801FF59213952E80A8EA0B1C0AE27F65
          8F04AFC6FF001EC7F12AEAC0D8F84F4756B2F0469D264797113896F1948CF992
          30277312C4924F4563F5794E029E1B9B32CC22B969FD8EF2FB317E6DEB6DD453
          93DE29F2D6ACFE0A7BBFE9FDDBFE0B567A37ECADFB3C43FB3CF80BECB2BC579E
          20D5A537DABDE212C6E6727250330DC638F710B9C12773100B367D335AD6ADF4
          3D2AE6EEE9B6416B1BC921C676AAA173FF008E826A768F62E76FB900FE3C5784
          FEDD3E3FBFD33E1B69FE0FD0E6913C4DF103504D26C95188644DCAD33938E140
          65539FE17AF228AC466D992F6D2BCEA4AF27D96EDF928A5E892EC69EED1A578F
          4FBDFF00C16CA9F05ACE4FDA07E267FC27370641A368B7728D3E378C20B8906F
          4572BD09556187CE4ED0302BE8067CA1F95978CFB8CFF5AC2F875E07B4F86DE0
          DB0D1ECE32B0D9A6CEB92ED8CB13EF9CD7987EDD1F1F1BE0DFC16BA834ABE36B
          E2ED7B16FA2C718CCA5FCC4DEFE8A155BA9C0DC5477AE8AB19E6D99430983568
          B6A105DA3DDFE6DFA93462A9D3E696FBB2D7C5CBC6F8F5E386F873A6BE34BB16
          8AE3C5174A388E3243A5AA9ED23F049ECAD9E4822BD674DD163D1ECE0B7B68AD
          EDED6D542471449B51100202A81C0C71D3D31EF5E31F02747D6FF674F0715F17
          C2BAA35EFF00C4C751D6ACFF007B22CEE7949500DECAA0E15C0230B938C903DA
          34EF1059EB5A5C3776B32DC5BDC26F8D94FDF1F8F4E7820E307838ACF378AA6A
          387A0EF4A1B496D297DA97ABD927AA8A5EA461E519C9CDFC4FA754BA7F9BF3F4
          3C97F6FBBA687F649F186C055BCBB653CE0E0DCC20E3DF9FCEBD5BC35A7AE8DE
          1BB0B55DC56D6DA389727E621540FCF8AF29FDB54C9AD7C27B3D02D7CB6BAF12
          6B363651A480624FDFAC8327B2EE4504F60738AF54BFD7E2B35F2915A6B9313C
          89026373ED04F524280718CB1033DEA6B737F6550A4BAD4A92F972D3577F34FE
          E2F6AAE5E4BF367CB9FF000528F1D4DAC7F62F816C51A7BABA03507B68DFE6B9
          72E61B7523BAF9859883DD46335F43FC20F8636BF07BE1DE8BE1DB1669ADF48B
          61179AFC34CD92CEE40E0333BB1E3D7AF15F3BFC2BB14F8E5FB77F89B52BE02E
          2D7C2CE0DB80994DD0318E1CB74FE379460F276F7C81F5A3C5F27B0FCEBD7E22
          A8F0D82C2E530FB31F692F394D5D7DCB4BF6663875CF56557E4BFAFEB638BF8F
          9F116EBE137C27D6BC456B6F6F70DA341F6978E672AAF1AF2C3201E4E0A8F722
          BE4EF821FB1BFC4DF8C9E1692EFC5FE32FF846FC3BE2CBB7D6AFF4DD254C77DA
          93CF862B34BB46C18DACB82704B71F31C7D13FB6769D2F893E11DBF8721B85B5
          FF0084AB5AB0D2A59095DEB1C9729B8A8246E3D303BE715EAB6F69E56D555555
          5381B78F43D3DB18C7A56597E75532DCB13C3463ED2ACDDE4E2A4D28A8DB96E9
          A4EF293BEEAC8D2A53752A59B6925D3CFCF7FBAC739F0C3E0DF87FE0C78621D2
          3C37A659E936319DEEB12E1A67E33239EAEED8E598E7DCF4AA1FB4C6A375A3FE
          CF7E38BAB38E66BA8343BD68CC5FEB231E43E5947F787240F502BBC2B9150DED
          825FD94D6F3247347708C8EB2286575230411D083DC1AF069E327F5A58AAEDCD
          F326EEEEDD9DDDDBEE6D1A6A30E482B1E49FB108D2D3F65AF03CDA6CDF69865D
          384EF26EDCCD3BB933027F8B12975FC06335E99E24F1958F85F447BEBC674846
          1554292D231E1514772490057CFF00A37EC1DE21F847A8DFAFC2FF008917DE0C
          D0F549BCF97489EC1752B7B790B025A132302A368DB8E49C72C7A57A4F81BF67
          69B43F10DB6B5E22F13EADE30D5ED40F264BD58E2B7B63FDE8E145C06C8CE493
          8AF6B34A380A988A98C8E279D4E4E5CBCB253D5DDA95E2A37BBDD49F74BA18C2
          A4ECA0A0D74D796CBCF497F5D6C4FF0002746D69346D5B56D7ADD2CF52F10DF3
          DEA5B0037DA5B950B146C46416C8663FEFE0F4AB7E0CFD9F3C27E03F1CEA5E23
          D33468A1D6B56B892E6E6EDE69666F3243972A1D9826EC9C84C0AEDC4255BB2F
          39E3FCF35CBF8E7C75A87836EEC1E1F0E6A9ACD9CC1FED12586C924B5200DA3C
          B2416DC7233D060E4D793F5AC4D6AD354A5CBCFA349F2A696C9EAAEB4D99AAA7
          184527D0EB28AABA5EAD1EAD671CD1C7346B30255654D8D8071920F233D79EC6
          AD57034D3B3354D3D508E7087E95E61FB4D6BFE32F0B7856CEFBC1AD6DF688AE
          76DD47345BFCC5230A3A1C727938E057A81E9514D6FE68FE13EC4641ADF07885
          42BC6B4A2A493D9ECFD49945B8B49D8A1E159EFEE340B293548EDD3506894DC0
          818B461FBED2403FA0AD4A6F97F367D0E453AB094AEDCAD61AD15828A28A4311
          CE10FD2BC67F6BD8D6F8FC33B194E62BDF1D69A241D415512B63F30B5ECEDF74
          D78B7ED1F1B5F7C6AF83D62CC05ACBAFCD72E71BB32436ECE9FC88CF6AF6320D
          31F19BFB2A6FFF0001849FE863887FBB67B379473F7BBF4A7D14578F6B1B050D
          D3FC682768A86E67641B631FBC61F2E7A0A2D70DB728F88CC77DA45D5BCB32DB
          DBBC6CB7126F0BE5A11F3027F84953C1ED5E4BA8EAFAA7ED31753699A47DA347
          F87D097B7BFD4B98E7D682F0D15B9E36C58C83277E4003071D578EFE166B5E30
          921897C456D6FA52156B8B27D31A437A55154876F3412A76F4C77C7BD60FC52F
          8F31FC01F046B53EA9A4DB99743B6B7FECEB5B16C26A6F23324714498CC78643
          91F36D033CF02BDECBA9BF76383B54ACDAB2FE56DA57B34B9A57B5B751DEDD57
          3D47ADE5A2EAFF00E0F45DFAF63CE7F684B183E2B7C44F0D7C09F0BEDB1D221F
          2EFF00C4EB6ABB7EC5628EAF1C59EA0BB608F7319248C8AFA6B45D021F0FE9B6
          D676AAB1DAD9C4B1448AB8C0518FE83B5792FEC85F032E3E19787352D7F5E9BE
          D9E2FF001CDCAEADABCACBB4C2C72C96FE87CA2EC3381C9F402BDA0F4A33CC65
          397260A84B9A9D3DE5FCF376739FCDE8BFBA9770A11FF979DF65D974F9F71B21
          C46D8EB8AF9E74703E2FFEDDD737DB9E4D37E18E93F668103FCAB797258138C7
          78C4A0FBC69E95EDBE31F155BF86BC3FA8DE5D33476BA7DAC9737047558D51D9
          88F7F90FE75E49FB0D783A683E18DF78CAF777F697C40D425D5DC489B5A3819D
          FC84CE79CAB170DC712631C64996FEE30588C63D24D2A71F59BBCBFF0024525F
          35DCAACB99A879DFEEFF0033D83C55E27B2F09F87EF352D4A786DAC6CA169A69
          6470A1140C9EBEA2BE21FDA47C19AFF8F7E06EBDF19F5E84457925EDA1D2B4D9
          58AAE9FA52DC6D507BEE919D19BE5191CF7C2FD17F11B41FF8695F882BE19F3E
          787C23E1B9A2B9D64A2068B57989568ED437F755416720F7518F9830F49F1EFC
          3EB3F881E07D6341BFDCD63AC59C9672AC60064474DBF2E7A30EAA7B3735DD93
          E650C9AA52ACD5EA49C5CFFBB4EEA5CABFBD35ABECB95759233AD0F6D1715B7E
          6FFC91734AD4EDF5ED1AD2FECE74BAB4BE8126B7947DD9919432B0E33CA9CD79
          FF008C7E09EB3A7DCC975E07F127FC22CF33F993DB496AB736B281CE02120A64
          F0769E01E001C1E37C09AD7C4EFD9EFC31A4F834F827FE13EB1D1E05B3B4D7AC
          B568ADDAE21562235920917F765136A93BC83B49E2BB8B09BE207C4BD1F6DDDA
          D9FC3BDD200CAB72354BC9223C11F2AA470B63A32BC983838ED5C7F53A982AAE
          746AC3D937A3728494A3D1B87BD2D7B385D3DEC44EA53A91D2F75DB469AF5DAF
          E7EEB3938FC07E32F117C53D3755F125D68BA9DD68208D32D2C237FB25A4B220
          57B8B866DB965C7C88B9393D457B0685E185D06D2490CD25DDE4C7CC9EE66399
          256EC3206028EC00C01DB3CD58D23C391E8D651C3148ECB19DCCCE4B3C8C4E4B
          3124F24D68346587DEF5ED5E7E33309D7B434518AB2B24B4BB7D3CDDFCDBBB6D
          9587C3F237396EFF00CADFD68B4E97BDFE6BFF00826B78566B5F84979AEDC2C9
          1C9AC5FB85072AB22233B79983C825A575C12788D3D001F4B119154EC345B7D2
          ADD21B58A1B786362CA889B5412727007D4FE7572AB38CC1E3B1B5318D5B9DDE
          DD9745F25A1AE1E9BA74D45EFD7D4E77E22F8157C6FE1A6B569123B8B79E2BDB
          490A0C43710C8B2C6DDC81B90671CE09ADAB2F30DB47E685F3700BED3919EFCD
          583C8A68439FBDBBEA2B81D49382A6F65AAF9DAFF9235B6B71D4514540C28A28
          A0008C8A8CDB0CF539CE73F9FF008D4945004696CB1FDDF6FC071FE152514500
          1451450014514500145145003641946FA5791FC7CD48683F173E12EA4CB1B29D
          7A5D389638C1B8B5915703F0AF5D7E50FD2BCA3F6B9D3AF17E13B6BDA7C515C6
          A1E0BD420F115BC320CA4DF6662CE87B81E56F3C73C7E35EA64928FD761096D2
          BC7FF038B8FEA675AFC8EC7AC5159FE19F125B78B742B2D4AC6449ECB50852E2
          0954FCB246EA1948FC0D68579928B4F95EE8D0290A66949C0A6B3ED4DD480495
          7F76DF4F5C57CDDA859AFED2FF00B6A436E57CEF09FC298D2595BAC73EAACC70
          871D4C657907215A26C83BC62E7ED79FB6C7FC2A29ADFC23E0E82D75CF881ACC
          91DB5BDBB64C160D230506520F2E7242A039C942D8565DDE81FB35FC0CB7F811
          E02363F689B50D5752BA3A96AD772105AE2EDD555CF007CA0280339381924924
          9FA7C2E1EAE5982798564E33AB171A4B6767A4E7E4B95F2C5E976EEB457396AC
          A3525EC93BDB57E5D93F53D105B8520EE6F969D23EC8C9A754771109226E3903
          23EB5F30751E2FFB6F6A771FF0A0EF345B1919754F1A5E5A68768037CCCD3CC8
          ACBEB8F2C3E7EA6BA0F13C971E05F09E8BE0DF0ADB88EF1ADD2C6D1D4164D3AD
          D13CBF31B9041C290BEE0FF779F33FDB3BC6B2784BE357C269DAC25D552DEE6F
          E6B4B18A366FB55E08A34B7CE01DA049203938EF5EA9F05BE1E6A9A3C93788BC
          4F79F6AF166B90C26FA284E2CF4F2AA3305B8E4F96AC48CB1624F39E4D7D554A
          70A195E1EB4ECD49CA697F34B9B9126BB4546EDBD1DEDD4E3E752AAE317AD97C
          BFE1FA773A0F873F0EF4FF00875E1CB7D3ECA158D91DA799949FDECCE73239CF
          7273D38038000C01D1B2EF52A7A1183405C52D7CBD4A93A937526EEDEADF99D7
          18A8AB2217B18E4073BB9F7E9F4F4A3EC29E6ABFF129C8E071FA54D4548C28A2
          8A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A2
          8A0028A28A002ABEA36515E69D3432469247246C8C8E372B02082083C107A62A
          C504645007CE5E11D7F53FD8BA7BAD175AB7BDD43E1AF9CD3695ACC08D3CBA2A
          3B81F67B941CEC527E5651C0F5C958FD97C21F14F42F1D582DC68FAE69FA946C
          81C7933A3360FA8E307D8E3DEBA2934E82689A37891E3618656190C3DC579CF8
          9FF637F863E2EBD5B8BAF076970CCA49DD65BEC724F5CF92C99CFBE6BDCA98CC
          1E324EAE314A351EF2824D49F7716E366FAB52B37ADAFABE58C6AD3F763692F3
          6D34BEE77F2D9F765FF1DFED11E13F8676EC758F1169D14DF2AA5BC4E27B9919
          864058932C49EDDAB8DB5F893E3AF8F37FF67D034DBAF05F8540FDEEB3A9403F
          B4AF461722DAD8F118E4FEF240C3D1735DCF82BF670F02FC399239747F0BE916
          B73081B2E5A1F3AE170303F7AFB9FA7BD73FFB52FC44BAF86BF0A59343E3C45E
          20B88B49D1D57EF09A5601481FEC0C9CE383835B613EAB2AD0C3E069B9CE4D25
          2A96B27DF9536B4EBCCE4ADD0553DADAEDF2A5DB57F26F45F75FB34792FECF3F
          06743F16FED45AA6B3A7C11CFE1EF87406956F733E649753D60E4DCDD3B92433
          286C7B1F2CAED0315F572C2AA738FD6B8DF825F08F4BF82FE02B0D0F4B89556D
          FE7B99C0DAF7B3B60C933FAB3B64F700614600007695CB9E669F5EC573C5B708
          A518DF7B2EAFCE4EEDFAD8BC3D1E48B7D64EEFFAF25F7EFBB0A1977A953D0F06
          8A2BC73A08CD9C6595B60DCBD0F714EF2573D3A1CF5A75140051451400514514
          0051451400514514005145140051451400507A51450034B6DC7239F534EA6989
          58E4A8E0E453A800A28A2800A28A2800A28A2800A28A2800A28A2800A28A6C9C
          C6DC6EE3A1EF4004C711373B783CFA5782C702FC70FDB423669A29F45F853679
          3191B964D46E460124F0DB110E3BABA83C139AF40FDA0FE2EDBFC0EF847AC788
          9CC2D35AC463B48E43949A773B63523238DC46791C6791D6B27F652F85337C1A
          F83BA3E977CCCDAC5D6ED4354918FCF25DCC7CC70C77365901099CFCC17757B9
          816F0B83A98D7F14AF4E1F35FBC7F28DA3EB35D8C2A27292874DDFCB65F37F91
          EA090AC7F75557272703F1FE74EA28AF0CDC28A28A0028A28A0028A28A0028A2
          8A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A2
          8A0028A28A0028A28A0028A28A0009C53659152362C78039C52B305524F000C9
          CD71DF1BFE25C5F083E136BDE22996390E9766F2469267CB9252308AC47382C5
          41C73835A51A33AB5234A9ABCA4D24BCDEC0F63CCFC6F237C73FDAD3C3BE1CB7
          F39F41F870135BD52589C885AF9BFE3DA238E37215DC01ECD20AF7EFBB5E4BFB
          20FC3DD4BC03F06F4C6D6A4B89BC41AFC8DAD6AB24C0ACC679CEEC4808FBEA86
          38D874CA13815EB55E96715A1ED16168EB0A4B9535D6CDF34BFEDE776BCACBA1
          CF86BCA3ED25BCB5F9745F70514515E49D014514500145145001451450014514
          5001451450014514500145145001451450014514500145145001451450014514
          50014514500145145001451413814008E76A31F6AF06F8F56D6FF1CBE3B784FE
          1DACC9F67D0E44F156B48CAAEAF0C7208E2878C9DCECC4156C0D87767200AF77
          925DB1B1079C719AF0AFD91A75F88DE2FF001FFC426CC917883581A769AE60DB
          9B2B40638D94F5258B156F78CE7915ECE51FB98D5C7F5A6AD1FF001CFDD5F34B
          9A4BCE26359DED05D7F25B9EE4B06C2BF2AE17A6074A9A903823F0CF34B5E31B
          0514514005145140051451400514514005145140051451400514514005145140
          05145140051451400514514005145140051451400514514005145140052336D5
          27D052D237DD3F4A00F21FDAFF00E22EA1E15F8631E8BA242B71E22F1A4E344D
          3631285656955B7B8EF855079EC597EA3B1F873E07B3F847F0E347D0ED446B6D
          A55B476EAC1446D3C87EFB63380EF212C4027258F5CF1E6B25CB7C48FDB8D229
          23B8FB07C37D13CE249FDDC77B799E0F18FF00518C60F55F4E6BD3BC2FE243E3
          BBA92E238645D2EDE709692B6196FF0068C9940C70A1B956079C76AF7B1B4A54
          707470EB6B2A93F59FC2BFF0049AFF0014BD4E584A529B97C97EACE8AC56478B
          7C9F2B48776DCE767B74AB1498207E34B5E09D41451450014514500145145001
          4514500145145001451450014514500145145001451450014514500145145001
          45145001451450014514500145145001430CAD14500798EB9FB30D8EB3E30F13
          6B11F88BC49A6BF8BDAD7FB520B396148E74B78CC6B186319754643860AC09F5
          15E89A768F0E916B0DBDB470C36F6E8B1471A205088A30147B0ED56A8AE8C462
          EB578C63565751492F92515EB68A4B5E8AC4C69A8EC145145739414514500145
          1450014514500145145001451450014514500145145001451450014514500145
          14500145145001451450014514500145145007FFD9}
        mmHeight = 22225
        mmLeft = 129382
        mmTop = 12700
        mmWidth = 44186
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        HyperlinkEnabled = False
        Caption = 'Total do Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 131234
        mmTop = 8731
        mmWidth = 25400
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        HyperlinkEnabled = False
        DataField = 'PED_TOTAL_LIQUIDO'
        DataPipeline = dbPed
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPed'
        mmHeight = 5027
        mmLeft = 159544
        mmTop = 7938
        mmWidth = 34396
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 113506
        mmTop = 30956
        mmWidth = 80433
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 156898
        mmTop = 6085
        mmWidth = 36248
        BandType = 7
        LayerName = Foreground1
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dbTab: TppDBPipeline
    DataSource = dsTab
    SkipWhenNoRecords = False
    UserName = 'dbTab'
    Left = 280
    Top = 128
  end
  object QTab: TSQLQuery
    DataSource = dsPonte
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PED_NUM_PEDIDO'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select distinct'
      '   FO.DESC_PAGTO,'
      '   CO.VALOR_PAGAR,'
      '   CO.DATA_VENCTO,'
      '   CO.DIAS'
      'from CONTAS CO'
      '   left join FORMA_PAGTO FO on CO.COD_PAGTO = FO.COD_PAGTO'
      '   where CO.NUM_PEDIDO = :PED_NUM_PEDIDO'
      '   and CO.SITUACAO = '#39'A'#39
      '   and CO.TIPO_CONTA = 1'
      '   order by CO.DATA_VENCTO')
    SQLConnection = DM.BancoDados
    Left = 40
    Top = 128
    object QTabDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      Size = 30
    end
    object QTabVALOR_PAGAR: TFloatField
      FieldName = 'VALOR_PAGAR'
    end
    object QTabDATA_VENCTO: TSQLTimeStampField
      FieldName = 'DATA_VENCTO'
    end
    object QTabDIAS: TIntegerField
      FieldName = 'DIAS'
    end
  end
  object dsPonte: TDataSource
    DataSet = Qped
    Left = 40
    Top = 80
  end
  object QCond: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   distinct'
      '   CON.DESC_CONDICAO'
      'from TABELA_PRAZO TAB'
      '   left join CONDICAO CON on TAB.COD_CONDICAO = TAB.COD_CONDICAO'
      '   where TAB.NUM_PEDIDO = :NUM_PEDIDO')
    SQLConnection = DM.BancoDados
    Left = 400
    Top = 24
    object QCondDESC_CONDICAO: TStringField
      FieldName = 'DESC_CONDICAO'
      Required = True
      Size = 50
    end
  end
  object desRel: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = RelPed
    IniStorageType = 'IniFile'
    IniStorageName = '($LocalAppData)\RBuilder\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 336
    Top = 72
  end
end
