object FRCarga: TFRCarga
  Left = 355
  Top = 205
  Caption = 'FRCarga'
  ClientHeight = 346
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EditValorUnit: TEdit
    Left = 240
    Top = 232
    Width = 41
    Height = 21
    TabOrder = 0
  end
  object QCarga: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   CAR.COD_AGENCIA,'
      '   CAR.COD_CLIENTE,'
      '   CAR.COD_CONTATO,'
      '   CAR.COD_FOR,'
      '   CAR.COD_MOTORISTA,'
      '   CAR.DATA,'
      '   CAR.ID_CARGA,'
      '   CAR.PLACA,'
      '   CAR.LETRA,'
      '   CAR.NUM_CARGA,'
      '   CAR.OBS,'
      '   CAR.NUM_PEDIDO,'
      '   CAR.QTDE,'
      '   CAR.SALDO,'
      '   CAR.ARMAZEM,'
      '   CAR.QTDE_PEDIDO,'
      '   CAR.VALOR_CARREGA,'
      '   CAR.VALOR_FRETE,'
      '   CAR.VALOR_PEDIDO,'
      '   CAR.CONTATO_INDICACAO,'
      '   CAR.VISTO,'
      '   CAR.NUM_NF,'
      '   CAR.DATA_NF,'
      '   CAR.CNPJ_CPF,'
      '   CAR.CREDITO_NF,'
      '   CAR.NUM_NOTA2,'
      '   CAR.IR,'
      '   CAR.VALOR_NOTA2,'
      '   FO.NOME AS NOME_FOR,'
      '   CLI.NOME AS NOME_CLIENTE,'
      '   CLI.FONE AS FONE_CLIENTE,'
      '   CLI.EMAIL AS EMAIL_CLIENTE,'
      '   CON.NOME AS NOME_CONTATO,'
      '   CON.FONE AS FONE_CONTATO,'
      '   TRA.FONE1 AS FONE_TRANSPORTADOR,'
      '   MOT.NOME AS NOME_MOTORISTA,'
      '   MOT.FONE1 AS FONE_MOTORISTA,'
      '   MOT.PLACA_REBOQUE1 AS PLACA_REBOQUE1,'
      '   MOT.PLACA_REBOQUE2 AS PLACA_REBOQUE2,'
      '   MOT.PLACA_REBOQUE3 AS PLACA_REBOQUE3,'
      '   CTB.NUM_CONTA AS CTB_NUM_CONTA,'
      '   CTB.BANCO AS CTB_BANCO,'
      '   CTB.AGENCIA AS CTB_AGENCIA,'
      '   CTB.CNPJ_CPF AS CTB_CNPJ,'
      ''
      '   USI.nome AS NOME_USINA,'
      '   ('
      '      select avg(ITE.PRECO_VENDA)'
      '      from ITENS_PEDIDO ITE'
      '      where CAR.NUM_PEDIDO = ITE.NUM_PEDIDO'
      '   ) AS VALOR_VENDA'
      'from CARGA CAR'
      '   left join FORNECEDOR FO on CAR.COD_FOR = FO.COD_FOR'
      '   left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE'
      '   left join CLIENTE CON on CAR.COD_CONTATO = CON.COD_CLIENTE'
      
        '   left join MOTORISTA MOT on CAR.COD_MOTORISTA = MOT.COD_MOTORI' +
        'STA'
      '   left join TRANSPORTADOR TRA on MOT.COD_TRANS = TRA.COD_TRANS'
      '   left join PEDIDO PED on CAR.NUM_PEDIDO = PED.NUM_PEDIDO'
      '   left join FORNECEDOR USI on PED.cod_usina = USI.cod_for'
      
        '   left join CONTABANCO CTB on CAR.ID_CONTABANCO = CTB.ID_CONTAB' +
        'ANCO'
      ''
      '   where CAR.ID_CARGA = :ID_CARGA'
      '')
    SQLConnection = DM.BancoDados
    Left = 48
    Top = 24
    object QCargaCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
    end
    object QCargaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object QCargaCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object QCargaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      Required = True
    end
    object QCargaCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object QCargaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object QCargaID_CARGA: TIntegerField
      FieldName = 'ID_CARGA'
      Required = True
    end
    object QCargaPLACA: TStringField
      FieldName = 'PLACA'
      Size = 30
    end
    object QCargaLETRA: TStringField
      FieldName = 'LETRA'
      FixedChar = True
      Size = 2
    end
    object QCargaNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
      Required = True
    end
    object QCargaOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object QCargaNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object QCargaQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object QCargaQTDE_PEDIDO: TFloatField
      FieldName = 'QTDE_PEDIDO'
    end
    object QCargaVALOR_CARREGA: TFloatField
      FieldName = 'VALOR_CARREGA'
    end
    object QCargaVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object QCargaVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
    end
    object QCargaCONTATO_INDICACAO: TStringField
      FieldName = 'CONTATO_INDICACAO'
      Size = 40
    end
    object QCargaVISTO: TStringField
      FieldName = 'VISTO'
      FixedChar = True
      Size = 2
    end
    object QCargaNOME_FOR: TStringField
      FieldName = 'NOME_FOR'
      Size = 60
    end
    object QCargaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object QCargaFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      Size = 15
    end
    object QCargaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 60
    end
    object QCargaFONE_CONTATO: TStringField
      FieldName = 'FONE_CONTATO'
      Size = 15
    end
    object QCargaFONE_TRANSPORTADOR: TStringField
      FieldName = 'FONE_TRANSPORTADOR'
      Size = 15
    end
    object QCargaNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 40
    end
    object QCargaFONE_MOTORISTA: TStringField
      FieldName = 'FONE_MOTORISTA'
      Size = 15
    end
    object QCargaSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object QCargaARMAZEM: TStringField
      FieldName = 'ARMAZEM'
      Size = 100
    end
    object QCargaVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
    end
    object QCargaEMAIL_CLIENTE: TStringField
      FieldName = 'EMAIL_CLIENTE'
      Size = 80
    end
    object QCargaNOME_USINA: TStringField
      FieldName = 'NOME_USINA'
      Size = 60
    end
    object QCargaPLACA_REBOQUE1: TStringField
      FieldName = 'PLACA_REBOQUE1'
      Size = 10
    end
    object QCargaPLACA_REBOQUE2: TStringField
      FieldName = 'PLACA_REBOQUE2'
      Size = 10
    end
    object QCargaPLACA_REBOQUE3: TStringField
      FieldName = 'PLACA_REBOQUE3'
      Size = 10
    end
    object QCargaNUM_NF: TStringField
      FieldName = 'NUM_NF'
      Size = 40
    end
    object QCargaDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object QCargaCTB_NUM_CONTA: TStringField
      FieldName = 'CTB_NUM_CONTA'
    end
    object QCargaCTB_BANCO: TStringField
      FieldName = 'CTB_BANCO'
      Size = 30
    end
    object QCargaCTB_AGENCIA: TStringField
      FieldName = 'CTB_AGENCIA'
    end
    object QCargaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 25
    end
    object QCargaCREDITO_NF: TStringField
      FieldName = 'CREDITO_NF'
      Size = 50
    end
    object QCargaCTB_CNPJ: TStringField
      FieldName = 'CTB_CNPJ'
      Size = 25
    end
    object QCargaNUM_NOTA2: TStringField
      FieldName = 'NUM_NOTA2'
      Size = 25
    end
    object QCargaIR: TFloatField
      FieldName = 'IR'
    end
    object QCargaVALOR_NOTA2: TFloatField
      FieldName = 'VALOR_NOTA2'
    end
  end
  object dspCarga: TDataSetProvider
    DataSet = QCarga
    Left = 120
    Top = 24
  end
  object Carga: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    ProviderName = 'dspCarga'
    OnCalcFields = CargaCalcFields
    Left = 192
    Top = 24
    object CargaCOD_AGENCIA: TIntegerField
      FieldName = 'COD_AGENCIA'
    end
    object CargaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object CargaCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object CargaCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
    end
    object CargaCOD_MOTORISTA: TIntegerField
      FieldName = 'COD_MOTORISTA'
    end
    object CargaDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object CargaID_CARGA: TIntegerField
      FieldName = 'ID_CARGA'
    end
    object CargaLETRA: TStringField
      FieldName = 'LETRA'
      FixedChar = True
      Size = 2
    end
    object CargaNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
    end
    object CargaNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object CargaQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object CargaQTDE_PEDIDO: TFloatField
      FieldName = 'QTDE_PEDIDO'
    end
    object CargaVALOR_CARREGA: TFloatField
      FieldName = 'VALOR_CARREGA'
    end
    object CargaVALOR_FRETE: TFloatField
      FieldName = 'VALOR_FRETE'
    end
    object CargaVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
    end
    object CargaVISTO: TStringField
      FieldName = 'VISTO'
      FixedChar = True
      Size = 2
    end
    object CargaNOME_FOR: TStringField
      FieldName = 'NOME_FOR'
      Size = 60
    end
    object CargaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object CargaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 60
    end
    object CargaNOME_MOTORISTA: TStringField
      FieldName = 'NOME_MOTORISTA'
      Size = 40
    end
    object CargaPLACA: TStringField
      FieldName = 'PLACA'
      Size = 30
    end
    object CargaFONE_CLIENTE: TStringField
      FieldName = 'FONE_CLIENTE'
      Size = 15
    end
    object CargaFONE_CONTATO: TStringField
      FieldName = 'FONE_CONTATO'
      Size = 15
    end
    object CargaFONE_MOTORISTA: TStringField
      FieldName = 'FONE_MOTORISTA'
      Size = 15
    end
    object CargaOBS: TStringField
      FieldName = 'OBS'
      Size = 150
    end
    object CargaCONTATO_INDICACAO: TStringField
      FieldName = 'CONTATO_INDICACAO'
      Size = 40
    end
    object CargaFONE_TRANSPORTADOR: TStringField
      FieldName = 'FONE_TRANSPORTADOR'
      Size = 15
    end
    object CargaSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object CargaARMAZEM: TStringField
      FieldName = 'ARMAZEM'
      Size = 100
    end
    object CargaC_VALORUNIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C_VALORUNIT'
      Calculated = True
    end
    object CargaC_ANO: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_ANO'
      Size = 4
      Calculated = True
    end
    object CargaQObs: TDataSetField
      FieldName = 'QObs'
    end
    object CargaVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
    end
    object CargaEMAIL_CLIENTE: TStringField
      FieldName = 'EMAIL_CLIENTE'
      Size = 80
    end
    object CargaC_OUTRAS_CARGAS: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_OUTRAS_CARGAS'
      Size = 200
    end
    object CargaNOME_USINA: TStringField
      FieldName = 'NOME_USINA'
      Size = 60
    end
    object CargaPLACA_REBOQUE1: TStringField
      FieldName = 'PLACA_REBOQUE1'
      Size = 10
    end
    object CargaPLACA_REBOQUE2: TStringField
      FieldName = 'PLACA_REBOQUE2'
      Size = 10
    end
    object CargaPLACA_REBOQUE3: TStringField
      FieldName = 'PLACA_REBOQUE3'
      Size = 10
    end
    object CargaC_Placas: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_Placas'
      Size = 100
    end
    object CargaQContas: TDataSetField
      FieldName = 'QContas'
    end
    object CargaNUM_NF: TStringField
      FieldName = 'NUM_NF'
      Size = 40
    end
    object CargaDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object CargaCTB_NUM_CONTA: TStringField
      FieldName = 'CTB_NUM_CONTA'
    end
    object CargaCTB_BANCO: TStringField
      FieldName = 'CTB_BANCO'
      Size = 30
    end
    object CargaCTB_AGENCIA: TStringField
      FieldName = 'CTB_AGENCIA'
    end
    object CargaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 25
    end
    object CargaCREDITO_NF: TStringField
      FieldName = 'CREDITO_NF'
      Size = 50
    end
    object CargaCTB_CNPJ: TStringField
      FieldName = 'CTB_CNPJ'
      Size = 25
    end
    object CargaNUM_NOTA2: TStringField
      FieldName = 'NUM_NOTA2'
      Size = 25
    end
    object CargaIR: TFloatField
      FieldName = 'IR'
    end
    object CargaVALOR_NOTA2: TFloatField
      FieldName = 'VALOR_NOTA2'
    end
    object CargaQParcelas: TDataSetField
      FieldName = 'QParcelas'
    end
  end
  object dsCarga: TDataSource
    DataSet = Carga
    Left = 264
    Top = 24
  end
  object Rel: TppReport
    AutoStop = False
    DataPipeline = dbCarga
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
    Template.FileName = 'C:\Projetos\MB\Carga.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OnPreviewFormCreate = RelPreviewFormCreate
    OpenFile = False
    OutlineSettings.CreateNode = True
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
    Left = 192
    Top = 72
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbCarga'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 75406
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CARREGAMENTO DE A'#199#218'CAR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 10583
        mmTop = 12700
        mmWidth = 62706
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Carga N'#186':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Usina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 35983
        mmWidth = 9790
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Visto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 74083
        mmTop = 27517
        mmWidth = 8731
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 84667
        mmTop = 29633
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 44713
        mmWidth = 11906
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 46038
        mmWidth = 14023
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUM_CARGA'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 7144
        mmLeft = 27517
        mmTop = 24077
        mmWidth = 28840
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'LETRA'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 6879
        mmLeft = 58208
        mmTop = 24342
        mmWidth = 8467
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VISTO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 27517
        mmWidth = 12435
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME_FOR'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 35454
        mmWidth = 107950
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 44184
        mmWidth = 100013
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'N'#186' Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 52917
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 52917
        mmWidth = 32015
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Quantidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 59267
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDE_PEDIDO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 59267
        mmWidth = 32015
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 65617
        mmWidth = 5556
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALOR_PEDIDO'
        DataPipeline = dbCarga
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 65617
        mmWidth = 31750
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Condi'#231#245'es de Pagto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 64558
        mmWidth = 34660
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Vencto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 69321
        mmWidth = 11906
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Forma de Pagto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 39158
        mmTop = 69321
        mmWidth = 26194
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'FONE_CONTATO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 156898
        mmTop = 46038
        mmWidth = 32015
        BandType = 0
        LayerName = Foreground1
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D6167655C970000FFD8FFE000104A4649460001010100A000
          A00000FFDB0043000302020302020303030304030304050805050404050A0707
          06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
          1816141812141514FFC0000B0801A903EA01011100FFC4001E00010002020301
          01010000000000000000000708060901040503020AFFC4006110000103020304
          05060A04070A0B07050001000203040506071108122131091341516114227181
          91A115233242526272B1C1D1168292C217243353A2B2D3184357739496A3B3C3
          F01925385456638393B4D2E13744757695A4C426343574F1FFDA000801010000
          3F00DA9A22222222222222222222222222222222222222222222222222222222
          22222222222222222222222222222222222222222E8DD2F941658BACADAB8A9C
          69A80F779C7D0399F52C22ED9C5490EF32DD48FA877F3931DC6FB399F72C4AE1
          99F7EAE2436A5948C3F360601EF3A9F7AF02AAF35F5C4F9456D44FAFF392B8FE
          2BA48BF714F240EDE8E4746EEF69D17B1438D6F96E20C3739C81F36577583D8E
          D565369CE2AC8486DC2923A86F6C911DC77B3883EE59ED8B1ADA710E8DA6A90D
          9CFF007897CD7FB3B7D5AAF75111111111111111111111111111111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          1111111111746EF7BA2B15319EB6A19033B01E6E3DC0732A30C479B5575A5D0D
          AA3F2387975CF00C8EFC07BFD2B03A8A99AB2674B3CAF9A571D5CF91C5C4FACA
          F922222222E5AE2D702090471042CEB0A668D65A9CCA7B91756D272EB0F19183
          D3F3BD7ED52D5BAE54D76A4654D24CD9E07F2737EE3DC7C17651111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          1111111111111111111111111111111116138C73269AC3BF4B43BB575E381ED6
          467C7BCF8288AE776ABBCD5BAA6B2774F2BBB5C790EE03B0782EA22222E5AD2F
          706B41713C805E8330E5D6566FB2D958E6FD26C0E23EE5D3A8A59A91FB93C4F8
          5FF4646969F7AF92222F730AE2CABC2D5C2585C5F4EF3F1B013E6BC7E07C54ED
          68BB535EEDF15652BF7E1906A3BC1ED07C42EE22222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222222222
          222222222222222222E090D0493A01DA545B8EF329D2992DF6797467C996A9A7
          8BBC187BBC7D8A352753A9E6B84445CB5A5EE0D68249E000ED59FE16CA9A9B83
          59537573A9203C4403F9470F1FA3F7FA149969C3B6DB1C61B45491C240D0BC0D
          5E7D2E3C57A4BAB70B6525D69DD055D3C75111F9AF1AE9E8EEF4A8531E60D385
          6BDAE84B9F433EA6371E6D3DAD2B1644459865C62B7582EEDA699FFC46A9C1AE
          04F063BB1DF81F0F429B91111111111111111111111111111111111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          44D98B8FCD63E4B5DB64D29C79B34CD3FCA1ED683DDF7FA39C748888BED49493
          57D4C74F4F1BA59A43BAD63471254CB8272F29F0F31955581B51713C75E6D8BC
          1BE3E3EC599A222C6F30ED8DB9E13AD046AF81BD7B0F716F13EED47AD40A8888
          A7CC037A37CC334B2BDDBD3C5F13213CCB9BDBEB1A1F5AC89111111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          1111111111111111111111111147799D8D4D0C6EB45149A5448DF8F91A7E434F
          CD1E27EEF4A89511117D20864A9999144C3248F21AD6B46A493C829BB026088B
          0CD209E76B64B94A3CF7F3118FA23F12B2C44445E7623706E1EB9977214B2EBF
          B25572444452664C57912DC6889E05AD99A3D1C0FDED52922222222222222222
          2222222222222222222222222222222222222222222222222222222222222222
          222222222222222222222222F0F186246618B2CB527433BBCC8587E73CFE039A
          806A2A24AB9E49A67992591C5CE7BB9927995F3444452C656E0D14B036F1591F
          C7483F8BB1DF35BF4BD27B3C3D2A464444458CE63578A0C235BC7474C042D1DF
          BC78FBB5503A2222CC32A6A4C18BE266BFCB44F67BB7BF754DC8888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          888888888888888888888888888A0ACC3C49FA437E788DDAD2536B145A723F49
          DEB3EE0162C8888B24C07864E25BDB19234F9243F1931EF1D8DF5FDDAA9E5AD0
          C686B400D03400762E5111114519C57A1356525B2376A211D6CA07D23C1A3D43
          5F6A8E11111647978F2CC656D23E9B87B5A54F68888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          88888888888888B1ACC1BF1B0E1B9DF1BB76A27F898F4E609E67D435F7281911
          1114F38030F7E8FE1E85AF6EED54FF001B36BCC13C9BEA1EFD564A88888BAD72
          B8456AA09EAE776EC50B0BDDF92AEB76B94B77B954564C7E32679791DDDC3D43
          82EA22222C9B2DE332633B770D742F71F531CA78444444444444444444444444
          4444444444444444444444444444444444444444444444444444444444444444
          44444444444444450DE6DDE0D6DFE3A263B58A919A11F5DDC4FBB7560A8888B2
          2C036417CC4D4D13C6F4317C7483C1BD9EB3A0F5A9F11111114559B58A04D2B2
          CD4EFD59190FA823B5DD8DF573F67728D9111116759414667C4734E479B04078
          F89200F76AA64444444444444444444444444444444444444444444444444444
          4444444444444444444444444444444444444444444444444445F89A56D3C2F9
          5E7758C697389EC0156EB9D73EE571A9AB7FCB9A47487C353AE8BAA8888A59C9
          CB588ADB597070F3E693AA693F45A353ED27DCA45444445E0633C511E17B43E7
          D43AAA4D590467B5DDFE81FEFCD4093CF254CD24D2BCBE491C5CE71E649E657C
          D111114C594569347619AB5E34755C9E6FD96EA07BF796788888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888888888888B1DCC0AFF83F08DC1E0E8E919D50F1DE3A1F712A03
          44444560302D10A0C256C8C0D0BA2121F4BBCEFC57BC8888BAB72B953DA2866A
          BAA90470C4DDE713F70F1501E29C493E28BABEAA5D5918F3628B5E0C6FE7DEBC
          7444445DBB5DBA5BB5C69E8E11AC933C307878FAB9AB176EA18AD9434F4908D2
          285818DF400BB088888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888B00CE3AAEAEC
          349003A196A378FA034FE614408888B91CD595B7C229E829A20340C8DAD03D01
          7611117CAA6A62A48249A691B145182E73DC740028431D636971456755097476
          E89DF16CE45E7E91FC3B962A888888A53CA3C32638E4BCCEDD0BC18E9C1EEF9C
          EFC3DAA4B4444444444444444444444444444444444444444444444444444444
          444444444444444444444444444444444444444444444444517E74CDE75A62EE
          1238FF00454628888B91CC2B350B83E2638722D042FDA22F8D555C3434F24F51
          23618631BCE7BCE80050AE3AC772E269CD35397456D61E0DE4643F49DF80588A
          222222F730861997145DD94EDD5B4ECF3E6907CD6FE679053ED353C7494F1C10
          B047146D0D6B5BC801C82FAA222222222222228F33BB3EF066CF7845D88719DD
          0515339C63A7A689BD6545549A6BB9133E71EF3C00ED202A2D897A64A1657C8C
          C3F966F9A881F327B8DD44723C78C6C89C1BFB457569BA666A1A3F8C653C721E
          F8EFE5BF7D315DE8BA66291DFCAE544CCFB17E0EFF00F1C2EE47D3276523CFCB
          1AE69EE6DD987FD905F19BA656D8DFE4B2B6A9FF006EF4D6FF00B02BA72F4CD3
          07F27948E778BB1169FF00E2AE9CBD32F5A7F93CA9819F6AFA5DFF00E385D393
          A64EF675EAF2CA81BF6AECF3FEC82E20E992BEB48EBB2CEDEF1DA19757B7EF8C
          ACA6C5D327689E402F39635B46CED7D0DDD9507F65D133EF53B659F495E47E63
          54454B3DF2AB0956CA435B1621A7EA584FF8D617C6D1E2E705682DF71A5BB514
          35945530D6524CD0F8A781E1EC7B4F22D70E047885D84451E6696D0997392D08
          7E34C5F6DB1CAE6EFB6965977EA5EDEF6C2C06470F10D55771DF4B7E55D81EF8
          70E596FB8A656F297AA65240EFD6792FFE828471274C6E2DA97BFE00CBDB35B9
          BF37E11AC96A88F4EE08960171E963CEDAD7130C1862807753DBA43FD795CBA5
          074A9E7A4526F3AAEC530FA0FB6003DCE057BF68E974CDFA299A6B6C7852E10F
          CE69A49E371F4113683D854A784BA646374B1C789F2D9CC8BE7D4DAAE7BC47A2
          27C635FDB571B2136BBCB3DA36374584EF659778D9D64B65B8B3A8AC637B4866
          A43C0ED2C2E03B48533A222228D33F3684C1FB3960A931162DAEEA83F5651D04
          1A3AA6B64035DC89BAF1ECD5C740DD46A46A16AEF377A54F3631B57D447847C8
          F02DA09D22653C2CA9AA2DFAF2C8D235FB2D6E9EF512536DD39F149586A59997
          787487E6C9D5BD9FB0E696FB958CC90E96DC5D62AE828B33ACF4F896D6ED1AFB
          95AE26D356C7DEE2CD44727D9019E9EC5B32CB0CD5C2D9C784A9712610BC53DE
          6D55034EB213E746ED38B2469E2C78D78B5C01F6ACB1111111143BB506D3586F
          65FCBF75FEF40D75CAA5C61B65A22786CB59281A9E3F358DD4173F43A0238124
          0346309F4C6E2082B5FF00A4D9796EACA473CEE9B556C94EF8DBD9A8787879FD
          9F5295AD3D3059633C6DF84B08E2AA390F314D1D34ED1EB32B3EE5EFC3D2D392
          B2341750E2A889EC7DBE2D47B262BF53F4B3E4A44DD5B498A663DCCB7C5F8CA1
          79953D2F79411EA21C398CA63E3474AD1FF88FC17855FD3118123D7C8F02E219
          FBBAF9A08FEE73963B5FD32D6F8F5F23CACA99FBBAFBDB63FBA072C76BBA64EF
          926BE479654107775F767C9F744D58ED774C2E63C9AF91E0CC3107775FE5127D
          D23563D5DD2DB9D157AF556CC2745AFF00334139D3F6A772F067E94BCF89666B
          D975B3C2D07531B2D71969F0E3A9F7ABBBB0A6DE52ED2F5D5D84F15DBE96D78C
          68E9CD5C5350EF369EB610435E435C4963DA5CD246A410491A6842B94B0ECD3C
          DEC2192D85E5C418CAF94D64B630EEB5F3125F2BF4D772360D5CF7783413DBC9
          523C75D30F856DB5334384B01DCEF71B496B6A6E756CA36BBEB06B5B2123D3A1
          F42886F5D30799550F3F04E0EC2F42CEEAB6D45411EB6CACFB963955D2D19D75
          1AF574785A9BFC55BE53A7ED4C57499D2B39E4C3A9970FBFC1D6DFC9EBD9B674
          B9E7151968AAB2612AE676EFD15431C7D05B381EE522E16E990B8C7235988F2D
          A9A78CFCA96D9727445BE218F63B5F46F0568F22FA42F2933CAE94766A7B8D4E
          1AC43544321B6DEE31175CF3F36395A4B1C49E00121C7B02B3488ABAED23B74E
          5BECD956EB45D2A2A2FB8A3703FE05B506BA4881E2D32BC90D8F51C7424BB420
          EEE87554CF1674C5630AA99FFA35806CB6D8B5F30DD2A65AB769E3B9D52C0EB3
          A58F3B6A5E5D1C1866941F9B15BA4207ED4A4AEBC5D2B59E319D5D261E97C1F6
          D3F83C2C9AC5D2F99A9472B05D70C615B9423E57530D44121FD6EB5C3FA2AC4E
          4BF4B1E02C7373A5B5E36B254E06A99DC18DAFEB855510713A0DF706B5CC07BC
          B481DA40E2AF352D5435D4D15453CAC9E9E56092396370735ED2350411C0823B
          57D5114179E1B6A653E41493D1E21C46CACBE4438D96D2DF29AA07B9C01DD8CF
          F8C73552ECC3E989BD544D24581F01D0D142350CAABF543E773BC4C711606FA3
          7DCA11BDF49E67F5D642EA5C4B4167693AEE515A69DC07FDEB5E57934DD23FB4
          3D34BBFF00C2019413A964969A120FFA1E1EA521E11E96ACE0B2491B6F36DC3B
          88A01F2CCB4AF8253E8746F0D1FB25587CBAE97DC0D797C70632C2376C3523B4
          06A2825657420F7BB831E07A1AE53A547485640D3E1F37719814D2C5A70A68E9
          2A0D493A72EABABDE1E9234F151447D2E7946FC40DA3363C50CB697EE1B93A9A
          1D07D6EAC4BBDBBEFF000EC56FB2F731F0D66B617A5C4584EF14D7CB354EBD5D
          4D33B5008E6D703A16B876B5C011DA16488A28CE73FF00185B476754EFBC28E1
          111172AC7D8EA055D968271CA4818EF6B42EF22E95DEF14963A27D5564C2289B
          CB5E6E3DC0769509E30C6D558AAA0B78C142C3F17003CFC5DDE7EE58D2222222
          EDDAED95378AE8A92963324D21D001C8789EE0A7AC2D86A9F0BDAD94B168E94F
          9D2CBA717BBF2EE0BD94444444444444445A8EE97C37BFE1D70B8ABEB7E01F80
          9BE41CFAAEB7AE93AED3B37FF92D7C371510444444444453AECCFB6263CD99EF
          90BAD35CFBA6197C9AD5E1EAC909A69413E73A3E7D549F59BE1BC1C382DD8649
          E73E1BCFBCBDB762FC2F5467A0AA1BB24326825A59869BF0C8D07839BA8F0208
          23504139DA8636C5CD5BB64B6CDF8D316D880178A4822869652DDE10BE699908
          9343C3CDEB3786BC090015A13BDDF2E3896ED5574BB57545CAE35521967ABAB9
          4C92CAF3CDCE712493E95D2444445EDE08C6377CBFC5B69C4761AC9282EF6DA9
          654D34F19D0B5CD3DBDE0F223910483C0AFE8DAC1717DE2C56EAF9223049554D
          1CCE88F36173412DF56ABBE888B83C02D0C6DB39D574CEBDA171556D554BDF69
          B5564B6BB5D36FEB1C3044F2CDE68EC2F2D2F3E2ED3900A07445316CC1B4CE25
          D99330A0BE59E57D4DA277363BADA1CFD22AD841E23EABDBA92D7F307BC120EF
          5F2D731AC59B581ED18B30D560AEB3DCE11343272737B1CC70F9AE6B81691D84
          10B27444445D7B85C29AD341535D593B29A929A374D34D2BB7591B1A3573893C
          80009D568536BFDA22B7692CE7BAE2032C8DB0D2B8D1D9A95DA81152B5C775C4
          7639E757BBC5DA726850922222222222BBFD13796B72C479FD5B8B98D7C768C3
          B6F91B34DF35F34E0B238FF67AC7786E0EF0B702B491D2559897DC63B52E24B4
          5CE695B6CC3C22A2B751B9DE644C3132473C0E5ABDCE2E279E9BA39342AAC888
          88B98E4744F6BD8E2C7B4EA1CD3A1057F405B23E35BA661ECDB97D7FBD48F9EE
          B556C636A2794EAF99CC263EB1C7B4BB73789EF2A5D5C3BE49D39E8BF9D6CEE3
          7D767063438984CDBF9BBD51AC151AEF893AD76BCFB3BBC34D16128888B7B1D1
          F72DEA5D90F2F4DF44DE5429A66C3D7EBBFE4C2A241073ECEAF7377EAEEAB10B
          C9C578B2CF81B0ED7DFAFF0071A7B4D9E8223354D654BF7591B47693DFD800E2
          49006A4AD4DED69D26389733AA6B70DE5A4F5385B09718A4B937E2EBEB872243
          8718587B037CE23991A968A37248F9A473E4717BDC75739C7524F7AFCA222222
          9EB641DAAEF7B30662C15F1C93D6613AE7B62BC5A5AEF3658F975AC0780959CC
          1E1AF1693A15BD4C3788ADD8BB0FDBAF768AB8EBAD771A765552D4C4756CB1BD
          A1CD70F48217A4A2BCE8611556B7F616483D85BF9A8D5111114ED96B5A2B7085
          171D5D0EF44EF513A7B885942C7715E37A1C2D116BDDD7D611AB29D878FA5DDC
          142D7FC455B892B4D4564BBDD8C8DBC1AC1DC02F3111111176ADB6DA9BB56474
          B4913A69E43A06B7EF3DC14E183306D3E14A3EC96B641F1B369FD16F87DFF764
          88888888888888888A3FCE9C89C199FF0084CE1FC696865C691AE3241335C593
          D349A69BF14838B4FB8F2208E0B52FB64F47FDEF669A338A2C75F2624C0CF944
          4FA89181B5340E71D18D980E0E693A0123741A9D0B5BA8D6A3A222EE59AD1577
          FBBD15B2821754D756CECA6A7859F2A491EE0D6B478924057FA87A1D7174D608
          E7A9CC0B453DE1D1873A89B4523E16BB4F93D6EF03CF86BB8A9FE7C6CF18D767
          2C5A2C38CADEDA7926699292B699FD65355B01D0BA37E835D386A080E1A8D40D
          428D51115D1E8B5CF0AACBECF76E0BAAA877C038B63741D539DE64756C69744F
          1DC5C03A3E1CF7DBAF20B71EB1DCC3C0566CD1C1379C298829BCAECF75A77535
          4440E8743C9CD3D8E6901C0F6100AD2DED63B09E32D9A6B27BB40D7E23C0AF93
          486F54F1F9D4E09D1ACA960F907881BDF25DC34209DD1595111177EC161B8628
          BDD0D9ED3472DC2E75D3329E9A9606EF3E591C746B5A3B49256D0365AE8AFA1C
          2F576DC519B1571DD6E5096CF161BA43AD344F1C409E4FEFA41E6C6E8DD4712F
          0745B10000000E002E51117E64E11BBD057F35F7EACF842F971AAD75EBEA2493
          5EFD5C4FE2BA2888AEE74666D52FCA8CC36E5EE20ACDDC2589670DA67CAEF368
          AB8E8D63BC1B268187C770F000EBB84E688888A98F4A5E763F2DF2163C2B4139
          86ED8C273464B0E8E6D1C7A3A73EBD638C8ED123969B511772DB66AFBCCFD4D0
          50D4574DA6BD5D3C4E91DA7A005DEB8E08C456780CD5F61B9D14206A64A8A492
          3681DFA90BC5234444445D8B6DB6AAF171A5A0A1824AAADAA95B041044D2E7C8
          F7101AD681CC9240016FB363FD9F29B66FC93B461B7358EBE547F1EBC54338F5
          954F0379A0F6B5803583BC375E64A9B1525DBE760E973FDFFA73829D1418DE9A
          9C455343310C8EE71B079803B936568F3413C1C34048D015A87BE58AE3866F15
          96ABB514F6DB951CAE86A292AA331C913C1D0B5CD3C410BA2888B9631D23835A
          0B9C4E800E64ABBDB37F45D637CCBF21BDE3E99D8270E49BB28A37377AE350CE
          7A06728751DAFF00387D02B6D98570C5B70561AB5D82CD4ADA2B55B29A3A4A5A
          76728E363435A3C780E679AF55157EDA43624CB8DA503EBEF147259F1388F723
          BF5B3464C401E6895A46ECAD1C3E50D40E01C16A476A6D92B166CB18A29A8AF3
          24775B1D7EF1B75EA9985B1CFBBA6F31CD3A9648351AB493CF813C541C8BB16F
          B7D4DDABE9A868A092AAB2A646C30C1134B9F23DC746B5A0712492000B6B9B28
          F45EE1FC194B6FC4D9AAC8F1162121B332C20EB43487986CBFCF38768F91CC68
          FE055F98618E9A1645131B144C686B58C1A0681C801D8173248D8A373DEE0C63
          412E738E800EF5A56DBF36C4ACDA131DCF872C158E665ED9672CA56467417099
          BA8754BFBC730C079378F02E2AA52222F46C186AEF8AAE0CA0B2DAEB6EF5CF1A
          B69A829DF3487D0D682565578C84CCCC3B446B2EB9798AADB4806F19EAECB531
          300EFDE730058216969D0820F714445B50E890CF79AFF85AFD95D74A97CD3D98
          7C276ADF3A914AF706CB18EE0D91CD70FF001C7B96C414719CF017505B66D383
          247B35F4807F7545088888A51C9EBAC70D15CE9A691B1C7139B3EF3CE8002342
          7DC131766B06EFD2D97CE3C9D56E1C07D91F89FF00D546534F254CAF9657BA49
          1E7573DE7524F792BE6888888BD0B258AB3105736968E22F79E2E71F92C1DE4F
          60538613C23498568F7221D6D4BC7C6D411C5DE03B8782F79111111111111111
          11146BB4AE1AA7C5FB3EE62DA6A18D9195161AC2CDE1A86C8D85CE8DDEA735A7
          D4BF9E92342888A59D92A99955B4EE56B241AB4623A17FADB335C3DE02FE81D5
          6EE904C9FA3CD9D997153DF4ED7DD70F53BEF7413E9E746E85A5D2B477874424
          6E9DFBA7B02D182222CFF67DB9CD66CF7CBAAE80912D3E21B7C8DD3B74A8670F
          5F25FD100E2172BA778B451620B555DB2E54B0D75BEAE2741514D3B03E396370
          D1CD703C082091A2FE7F76A0CAA8B2533F319E0EA66BDB416FAE2EA3121248A7
          91A258413DA431ED1AF6E8A2D4445793A2532DE9714E7BDEB13D642D99986ED8
          5D4DBC35DCA89DDB8D77FDD8987AFC16DF11111163D98988A2C2180312DF6678
          8E1B65B6A6B1EF77202389CF27DCBF9C179D5EE3DE570888B963DD1BDAE692D7
          34EA083C415BC5D80B6921B42E49D2B6E755D762EC3DB96FBAEFBB57CC00F8AA
          83FE31A0EA7E931FD9A2B348888B4FBD2DB8B27BC6D176AB29935A4B3D9210D8
          C72124AF7BDEEF496F563F542A428B603D1E9B065BB352DB1E6466350BAA70D1
          90B6D367792D6D716921D34BA687AB0E0406FCE20EBE68D1DB4BC3D85ACD84AD
          B1DBAC769A1B3D04634652D053B2189BE86B40017A2F863918E63D8D735C342D
          70D410B4EBD2A785304612CF5B4C38568292D975A9B58A8BC535046D8E2EB0BD
          C23796B7807B9A093CB51BA7B7534B111115FCE8ABD9A3F4CF1AD4E6A5F6977A
          CF6090C16A64ADF367AD238C83BC44D23F59ED238B4ADB2222D5DF4C1E58D05B
          6F981F1D5152C70565C9B3DB6E12B0686531863A171EF3BAE906BCF46B472016
          B8D111585D80B035363EDAC70250D740CA8A2A49E5B8CB1C83504C113E48F51D
          BF18D62DEDF2444454E3A566C51DD765792B1D135EFB6DE692A1AF238B37B7E2
          3A1FFB45A664535EC576A179DAAF2C69CB43C32F30D46847F37AC9AFF416FD51
          550E928CEC9B28F673AEA0B74EE82F58A66F82207B1DA3A385CD2E9DE3F506E6
          BD86405693B9A222EC5BA864B9DC2968E100CD512B62602741BCE200FBD7F417
          B3FE41616D9EF2FADF8730E50431CAC8986BAE1D58EBEBA6D3CE9247733A9D74
          1C9A380D00526100F31AA817681D8A72C7685A19E4BB5962B3E2170263BF5A63
          6C3521DD864D06928F07827B88E6B513B4F6C918CF65FC49E4D7A87E12C3F52F
          22DF7FA58C882A073DD70E3D5C9A73613D8482E1C54208AD0746ADFE7B26D838
          3A189EE6C3718AB28E76B7E730D348F00F86FB187D4B780B0DCD7A4353849F20
          1AF513324FDDFDE509A22222FD364735AE6B5C435DC1C01E07D2BF28888888BD
          FC2983AB715556910EAA95A7E32A1C3CD6F80EF3E0A6DB0E1FA3C3B42DA6A38F
          71BCDCF3F29E7BC95E922222222222222222222C7331E06D565EE2785DF264B5
          D4B0EBDC62705FCE1BFE5BBD2B84452F6C83FF002A1CAEFF00E61A3FF5AD5FD0
          12C5735A28A6CAFC5F1CDA752FB455B5FAFD130BF55FCE53BE51F4AE1114D3B1
          86069F30B6A1CB9B643199190DDA2B84FC3808A9CF5EFD7B8111E9E9216FDD11
          69AFA582C62D3B5332A80D0DCAC549547C487CB17FB254CD1116D03A1AED823C
          3F9A170DD1BD354D041BDF61B3BB4FF48B64088888AAD7493665C597BB2B622A
          56CDD55C31149159E99A0F1707BB7A5E1DDD53241E923BD6911111114F5B146D
          0726CEB9EB68BD54CCE661CB8116EBC460F0F27791F19A77C6E0D7F7E8D70F9C
          B7C504F1D4C31CD13DB2C5234398F61D4381E2083DA17D11116A37A5C72DAB6C
          79D963C64D85C6D57CB6329CCDA706D4C0E21CD3DDE63A2235E7E7772A22A52D
          99B246BB684CE6C3F83A9048CA5A897AEB854B07FF00B7A4668657EBD874F346
          BCDCE68ED5BFEC3F61A0C2D63B7D9ED54B1D0DB2820653535344346451B1A1AD
          681DC00017A0B0CCE2CD3B3E4AE5ADFB19DF64DDA0B553997AB0ED1D34878471
          37EB3DC5AD1E9EE5FCFD667E62DE336F1FDF717DFA6EBEE976A97544A46BBAC0
          78358DEE6B5A1AD03B0342C5D11165795596D78CDFCC3B160FB0C3D6DCEED52D
          A78C904B636F37C8ED3E6B1A1CE3E0D2BFA07CA5CB2B3E4E65CD870758A2EAED
          B69A66C0D71003A57737C8EFACF71738F8B8ACB911502E986898727304C87F94
          6DF4B47A0C126BF705A9C44456FF00A2BE9C4FB5850BCFF79B4D63C7ECB5BFBC
          B7428888AB27492D30A8D8D31E9D35744EA078FF002E801F712B4748AC3747DC
          5D76D83970DEEAA9DDECA598FE0B7B48B553D3178926A9CC9C01602E3D451DA6
          6AE0DD7E74D36E13EC802D7AA222FDC333E9E68E58DC59231C1CD734E8411C8A
          DE36C79B68616DA3707DBA82AEE14F6CC7F4D0363AFB44EF0C74EF68F3A6801F
          96C7684E838B791E1A1365D17838E3035873270B5C30E625B64177B357C6629E
          96A1BAB5C3B083CDAE07421C34208041042D34ED97B08E22D9BEEB517DB1C751
          7ECBD99FAC5700DDE968753C22A8039770934DD770E44E8AA9ABF9D14BB3CDDE
          FB99AECD5B8D1C94B87ECB0CD4F6E9E56902AAAA4698DDB9AF36B18E7827E939
          A3B0E9B645E6626A0373C3F70A60379D242EDD1F580D47BC055D111111111111
          1167582F2D67BCEE565C43A9E879B63E4F97F21E3FFF00AA5EA4A382829A3A7A
          789B0C318D1AC60D000BEC88888888888888888888B1ACCB93A9CB9C53272DDB
          5553BD91397F38AFF947D2B84452DEC8F3320DA7B2B5CF3BA0E22A26EBE26668
          1EF217F40AA12DB43326932B7666C7B74A89DB0D4555B65B651B4BB473EA2A1A
          6266E8ED2378BF4EE613D8B418888B6AFD151B33D5E0FC3F5F9AD88291D4F5D7
          B83C92CD0CCDD1CCA4D439F36879758E6B434FD1693C9E16C25116A53A60E8C3
          33C7075576CB87847FB35331FDF54291116D67A1D62DDCAFC7D27D2BBC4DF642
          3F35B07444445A84E961CE56E34CE9B6608A1A8EB2DF85297F8C069E06B260D7
          3C78EEC6221E04BC77AA34BED45435372A96535253CB555121D19142C2F7B8F8
          01C4AF9CB13E091D1C8C747234E8E6B86841EE217E51116E7BA32B3FFF0085BC
          8B8F0CDCAA7ADC45840B285FBEED5F2D2107C9DFEA0D747FF6609E6AE12222C0
          33CB24B0D6D039795F8431453BA5A2A8D2486A22D04D4B30077258CF6386A7C0
          8241D41216AEB19744C66DDA311BE970FD7D8EFF006773C886BDF52699ED6761
          923703BA7C1A5FE957C762ED8DED9B2B615AB92AAAA2BCE32BAB5BF085CA2691
          1C6C1C4410EBC7701E249D0B8E8481A002C9A2D4774A5ED33FC20E3F872CAC55
          7BF60C35297DC5F1BBCDA8AFD082D3DE2204B7ED39FDC151044445B5EE8A9D9A
          7F44707D4E6B5F69376ED7D8CD3DA192B7CE868C1F3A51AF2323870FAAC04707
          AD812222D7E74C4CBA6546048BE95E6477B2077E6B544888AE7744EC5D66D493
          3BF9BB0D5BBFA710FC56E491111577E906A7F29D8F73199A6BA5353BFF0066AA
          177E0B44E8AC9747345D6ED95976DFAF5AEF650D41FC16F3916A8BA626C32D3E
          6BE04BD16E9055D9A4A46BBBDD14EE7387B276FB56BF111117D29AAA6A2A88E7
          A795F04F1B83D9246E2D7348E4411C8AB2994BD2259D79511C34A3118C556C8F
          4028F11B0D5683B84BA89470ECDFD0772B8795DD2F983EF1D4D363CC2770C3B3
          9D1AEADB5C82B29F5FA45A775ED1E037CAB7F95BB44E5BE74C21D837185B2F53
          6EEF1A464BD5D4B477BA1786C807896A902B28E9EE349352D5411D5534CC31C9
          0CCC0F63DA4684381E0411D8543153B14E46D5DE3E13932CEC3E53BFD66EB202
          D849D75E310219A786EE8A63B65AE8ECB6FA7A0B7D24143434EC11C34D4D188E
          38983806B5A00000EE0BB48ABCE2EB57C0D88EBA940D18D90B99F64F11EE2BC7
          44444444445F7A3A29EE152CA7A689D34CF3A358C1A92A5AC1B96305AB72AEE8
          1B535638B61E6C8CFE27DDF7ACF511111111111111111111116239BF275594F8
          D1FF0046CB58EF640F5FCE73BE51F4AE1117A586710D6E12C476ABE5B65EA2E3
          6CAA8AB29A5FA12C6F0F61F51016CA697A64A81B6288D4659D43EF023D1EC8EE
          AD6D3B9FA730E3117004F66874EF2A9AED3DB5EE35DA92F34D25FDD0DB2C544E
          2EA2B25097751138F0DF712757C9A70DE3CB8E81BA9D60E445757A36764CC3F9
          F78A2ED8AF16BA3AEB0E1C9A2632CC788AB9DC0B8197FEADA1BAEEFCE2743C01
          0770F0411D2C11C30C6D8A18DA18C8D8346B5A380000E417D1116A8FA6263D33
          5301BFBECD28F64C7F35AFB4445B65E87A8B4C98C6B27D2BF06FB29E3FCD5FB4
          444586E71665DBF27B2BF12E32B991E4967A27D47564E9D6C9A691C60F7BDE5A
          D1E2E0BF9E6C5989EE18D7145DB105DA735373BA554B595331F9F248E2E71F69
          2BCA5B78E8B0D9E68B05E523B31AE9411BB116257BBC926959ABE9E85A775A1B
          AFC9EB1C1CE24736F57DCB1DE941D92A97116179B36F0ADBDB15EAD6D1F0EC34
          CC03CAA9B97941039BE3E1BC7B59C49F302D54A2229DF62ACFA7ECF79F962BED
          4CE62B0573BE0DBBB75F37C9A423579FB0E0D7FEA11DAB7CD148C9A36C91B83D
          8F01CD734EA083DABF6888888A01DB5F68E8366EC94B8DDA9A667E93DCB5A0B3
          427427AF70E3291F4636EAE3D84EEB4FCA5A22ABAB9ABEAE6A9A995F3D44CF32
          492C8E2E73DC4EA49279927B57C91114D1B22ECF957B48674DA30C8648CB2427
          CB6EF52CE1D552308DE00F639E48637C5DAF2056FBAD56BA4B25B292DD414F1D
          250D242C820A789BBAC8E3680D6B5A3B0000003C17691116BBFA63A5D30065D4
          7F4AE552EF644DFCD6ABD1115DBE88D8BACDA6AF0EFE6F0CD4BBFF00B8A61F8A
          DC2A22228176EE01DB246650235FF8B81FF4AC5A194565BA37FF00E59D97BE9A
          FF00FC0542DE522A79D2839313E676CF4EBFDBA033DD708D47C23BAC6EAE752B
          86ED401E81B921F088AD3122222222FB51D6D45BEA62A9A59E4A6A889C1F1CB0
          BCB5EC70E4411C4156D767DE92CCCFCA1A9828712553F1FE1C0435D4F7598F95
          C4DEF8EA0EAE27C1FBC3BB4E6B6AD90DB46E07DA330B8BC610BA3679230DF2BB
          6CFA32AE8DC7E6C91EBC3B7470D5A743A13A1527A228BB392CFA3E8AE6C6F03F
          1121F1E6DFDEF728C91111111117B986708D7E28A8DDA666E40D3F1950F1E6B7
          F33E0A67C3584A830BD36E53337E670F8C9DE3CF7FE43C17B688888888888888
          888888888B07CF494419278FE42740CC3F5EED7D14EF5FCEB9E6511111111167
          993B9E78DB21B121BDE09BE4D68AA90064F1001F0D4B01D43648DDAB5C39E9A8
          D46A7420AD9F6CA9D273877366BE8F0C661D353611C4D3B8454F5F13C8B7D5BC
          F26EAE24C2E2790712D3F481202BCA0EA1728B545D31326B9AF8119DD6691DED
          9DDF92D7E2222DB2743CC9AE4D63667D1BF03EDA78FF00257F111116B57A5D33
          DBAAA5C3D9516CA8F3A522EF770C3F346ADA788FA4EFBC83F4633DAB592B2ECA
          3CBBAECDACCDC3383EDC08AABC57454A1E06BD5B0BBCF90F835BBCE3E0D2BFA1
          FC338768708E1CB5D8ED700A6B6DB6962A3A685BC991C6D0D68F500176EE16FA
          6BAD054D15640CA9A4A98DD0CD0CADDE648C70D1CD20F30412345A0DDAE720EA
          7674CEFBDE17DC79B3C8EF2DB44EFD4F5B49213B9C7B4B487309EF613DAA1944
          4E4B759D1B19FA739320E9ACD71A8EBB116122CB654EF3B57C94FA7F1790FEA0
          2CD7B4C44F6AB6888888BE7515115253C93CF2321862697BE47B835AD681A924
          9E402D146DC3B48CBB48675575C28E773B0ADA37A82CD1710D7440F9D369DF23
          86F77EEEE03F2557A44446B4B88006A4F0016EFBA3EB66A1B3F64AD3D55D697A
          9C5F88C32BEE5BEDD1F0334F89A73DDB8D71247D27BC760568911116B8FA64E5
          D30C658C7AFCAACAE77B190FE6B576888AF47440C3BDB45E2793E8E169DBEDAA
          A5FC96DE1111140DB767FC92732BFF00870FF5AC5A184565BA37FF00E59D97BE
          9AFF00FC0542DE522F95552C35D4D3535444C9E9E6618E48A468735ED2342083
          CC11D8B481B746C8D5DB35E624B5B6BA6966C057999D25AEA86AE14EE3E73A95
          E7B1CDE3BA4FCA68D75243B4AC688888888B30CA7CDAC4F9298DA8714E12B949
          6DBA529D0E9C639A3246F4723793D8ED3883E046840237A7B2FED1764DA632BA
          8F145AC0A5AF8C8A7B9DB4BB575254800B9BE2D3A8735DDA0F61040975178F8B
          ACFF000E61EADA403591CCDE8FED8E23DE34F5AAF4468745C2222222E567D837
          2C26B9EE55DD43A9E94F16C1C9F27A7E88F7FA39A966928E0A0A76414F136185
          8346B1834017D9111111111111111111111111463B50567906CDD9A536BA16E1
          8B9069F134D201EF217F3DA888BEB47473DC2AE0A5A689F51533BDB1C5146D2E
          73DC4E81A00E6493A68AEBE18E893CDEBDD961ADB85DF0CD8AA668C3C5055554
          D24B193F35E6389CD07ECB9CA20CF7D87B35F67BB7BEE9882CD15C6C0C76EBEF
          16694D453C7C7405FA80F8C1240D5ED0353A6BAA80911101D16D27A3376CEACC
          58E832931B579A9B8C109F802E150ED5F3C6C04BA99EE3CDCD68D584F36B5C3B
          1BAEC5D16A63A6164D73A705B3E8D835F6D44BF92A0C888B6B5D0EB26B95B8F5
          9F46F111F6C23F25B064445E562AC4D6FC19866EB7FBB543696D96CA592B2A66
          772646C69738FB015FCF5675E68DC33A335712E34B9970A8BBD63E66C4E3AF53
          10F3628C1EE63035BFAAB095727A2CAA3085A7683AFBCE29BD5BAD353456895B
          6B1719DB0892791CD6B8B1CE201708FAC1A7321E7B8ADB87F0A3837FE9658FFF
          00A8C3FF00993F851C1BFF004B2C7FFD461FFCCA83F4B3DD72FF0017E5DE12B8
          DBB1259EE18BADD72743152D155C734CEA49237190B9AC248687C71684F0E240
          E256AF911158ED81F3E7F808DA16CD535B51D4E1DBE1169B9EF3B46319238757
          29EC1B926E927E8EF8ED5BD10751AAE51111519E945DA67F835CB88F2E2C757D
          5E22C4F11F2D746EF3A9ADFA96BBD06520B07D512782D42A2222B81D1B1B34FF
          000D59C0DC5179A5EB709E147B2AA512375654D5EBAC3171E040237DC38F0680
          7E5ADCFF0025CA2222D6C74CC3C8B7654B3B0CB7327D429BF35AC644457CFA1F
          5AD39ED8BDC4F9C30E3801E1E5306BF82DB6A22228136EF7866C919945C741F0
          7347B65605A1A45663A37185FB66E5FE9C9BE5E4FF0090542DE4222C6F3132EB
          0F66B60FB8E18C516D86EB66AF8F726A79472EE734F36B81E21C3882350B4DDB
          5E6C0F8AF671ACA9BDD9C4F89B00B9E4B2E51B359A8813C1952D1CBBBAC1E69E
          1F2490D5551111111115AFE8D8CEF9F29F68BB5D96A2A5D1D871696DAAAA227C
          DEBC93E4CFD3BC484335EE95CB762BE73D4454B0BE59A46C51306AE7BCE800F1
          2A36C579B01BBF4D651BC791AB78E1FAA0FDE7D8A3091EE95EE7B8EAE71249EF
          2BF288888BEB4B4B35754C70411BA59A43BAD63471254BF82F2D60B2EE565C43
          6A2BB9B59CD911FC4F8FB3BD67488888888888888888888888888A0FDB76E5F0
          4ECA199B3EBA6F5A1F07FDE39B1FEF2D07A22295B651A18AE3B4C6574130DE8F
          F48E81E41E477676380F72FE82975AE56DA4BCDBEA682BE9A2ACA2A98DD0CF4F
          3B03E3958E1A39AE69E04104820AD09ED8F92116CFFB40624C2F44C7B6CAE736
          BAD85E75FE2D28DE6B75EDDC76F47AF6EE6AA144445EDE08C5D71C018C2CB892
          D131A7B9DAAAE2ACA793B9EC7070D7BC70D08ED1AAFE8BF09622A5C5F85ACF7D
          A23BD4773A386B613AEBAB24607B7DCE0BD65A8FE981935CFBC251FD1C371BBD
          B5351F92A1E888B6A3D0E326B97F988CEEB9D33BDB13BF25B0F444542FA58B3D
          BF43B2C2D99716DA8DCB9E267F9457061F39945138100F76FC800F111BC76AD4
          9A26BA2E778F794DE3DE570493CD111101D0EAB7A3B0367CFF000EFB3D59AA2B
          6A3AEC456302D373DE76AF7BE368EAE53DA77E3DD24FD2DFEE563D1116359919
          8167CABC0B7BC597EA814D69B4D33AA677F6B80E4C68ED73890D03B4B805FCFD
          E75E6CDE33C333AFD8D2F6FF00E3973A82F6421DAB69E21C2389BF55AD0D6F8E
          9A9E24AC211117A58670DDC718E22B6D8AD14AFAEBA5C6A23A5A5A68C6AE9247
          B835AD1E9242DFE6CD19196ED9DF27AC783A87725A9823EBEE156C1A794D5BC0
          32C9DFA6BA35BAF26B5A3B14A48B09CDECE3C2791782EA714631BA36D96B85C2
          36E8D2F96790EBBB1C6C1C5CE3A1E0390049D002455DB4F4B664C5C6E6296A6D
          B8AED94E5DA0ACA9A085D181DE447339DEC6956D70066261BCD2C314B88B0A5E
          29AF966A9D7ABAAA576A351CDAE078B5C3B5AE008ED0B235AE2E993A473F0CE5
          8D506F991D5D7465DDC5CC848FEA15ABC4445723A29716C58776A56DBE5786FC
          3966AAA18C13C0BDA5938F5E90B96E611111568E91CBD4766D8F71D6F1F8CAB1
          494B18EF2EAA8B5FE8871F52D1B22B53D19144EABDB0B0A4ADE54D4B5D2BBD06
          96467DEF0B76E9C96B2B6A9E946C4B863322EB8572C68EDB15BACF50FA4A8BBD
          7C2677D4CCC3BAFEADBBC1AD8C381009D4BB4D4100E8A51D8AFA46A2CF5C410E
          09C7B474764C59383E415B47AB296BC81A98CB5C49649A0D47121DC40DD3A037
          866863A985F14AC6CB13C16B98F1A8703CC11DA1530DA13A2FB2F735AAAA6F18
          3E73806FB2EAF745490892DF33BBCC3A8EAC9E5AB08039EE92B5ED9C7B06E726
          4CCD3C95B85E6C41698F522EB600EAB877476B9A06FB078BDA078AAF7246E89E
          58F69639A742D70D082B8444445E8E1BBD5461BC456BBB51BB72AE82AA2AA85D
          DCF63C39A7DA02FE8AEF98EADB61B7C3349275F34B187C70467CE7023504F70F
          1FBD443897185C313CFAD4C9B9003AB29D874637F33E257868888888BED49552
          515545510B8B2589C1ED70EC20EA1588B05E23BF5A29ABA2D0095BAB9BF45DC8
          8F51D57A0888888888888B1DBAE3EB359AE228AA2A099B5D1E636EF363FB4564
          1148C9A36491B83D8F01CD734EA083C8AFD222222222222ABDD2577A168D8F71
          947AE92574B454AC3E9AA89C7FA2C72D20222296F64795B0ED3F95AE71D01C45
          44DF5999A07BCAFE81516A7FA61ED11419B981AE6D601354D95F4EE77788E773
          87FAD3ED5AFF0044445FD03EC9734B51B31E563A6F9630DD0B47D9103437DC02
          96569F3A5D2B8556D2D64801E14D8669984789A8A977DCE0A912222D9F7434D7
          F5964CD3A2D7F92A8B74DA7DB6D40FDC5B22445F0AEAEA7B6515456554CCA7A5
          A78DD2CB348EDD6B18D1A97127900013AAD016D599DB36D039E7897176FBFE0D
          926F26B644FE1D5D247E6C434EC2E1ABC8FA4F7288D11111111115B5E8D4CF9F
          E0833FE96C95F53D561FC5C196CA80E3A31951AFF1693F6C96780949EC5BAB44
          45AABE958DA67F4931253652586AF7ADB697B6AAF7244EE12D569AC70923988D
          A7788FA4E039B16BCD11116C6BA26F671175BCDC7376F74BAD2D017D0591B237
          83A72349A71F65A7701E5ABDFDAD5B4644E4B4B7D257B433B38B3C66C396CAAE
          B70CE122FA18446ED593556A3CA25F1D1C0463C23D47CA2AA1ABBDD1459BB70C
          2B9F52E077D4BDD66C4F492914AE779ADAA858656C80761EAD9234F7EA35E416
          E09518E976C38FB96CFB87AED1B778DB6FF1890E9F26392195A4FED060F5AD43
          2222C9F2C31FDC32AF30F0F62EB511E5D67AD8AB23693A09375C0B987C1C3569
          F0257F41D95B99564CDFC0165C5F87AA4555AAE94ED9A33A8DE8DDC9D1BC0E4E
          6B81691D841595A222D6874BAE79D24D061DCA9B6D4092AA295B78BA88DDC23F
          35CD82277890E7BC83C87567B42D6722BB7D125879D74DA4AEB7223E2AD9609E
          4DEFAEF962601EC2F3EA5B855F993F9377A0AFE6C7113E696FF737D4BB7AA1D5
          321909ED76F1D7DEBAF6FB854DA6BE9ABA8AA24A5ACA691B3433C2F2D7C6F69D
          5AE691C410402085BCDD87B6A0A7DA5F2920A9AE9A36E30B306525E69DBA02F7
          E9E65401F464009F07078E406B62D7046AA2CCD6D9732B73A992BB16E0CB6D7D
          64838DC618FA8AB07B0F5D1EEBCE9DC491E0A8CE7AF445CD45475574CABC4525
          748C05EDB15F0B5AF7F6EEC750D01BAF600F681DEF5AE9C45876E784AF95D66B
          CD0CF6CBAD0CAE82A692A5859244F0742D703C979E888BED434B25756D3D3C2D
          DF9A691B1B1A3B5C4E802DDCD3B5CCA789AF7BA47358D69738EA4E8345FB4444
          44444521E52623F24AE92D333B48AA3CF8B5EC781C47AC0F778A96D111111111
          116219898C3F46EDE29E99C3CBEA010C3FCDB7B5DF97FE8A11738BDC5CE25CE2
          7524F32A59CA3C446AE8E5B54CFD64A71BF0EA789613C47A8FDFE0A444444444
          44445467A5DB1232DBB3DE1FB435FA4F72BFC4EDDEF8E38652EFE93A35A85444
          5206CF3728ECD9F996D5F2BC47152E24B74CF71E41ADA98C9F705FD0F8E2172B
          511D2EB8C69AF39F587AC34F23647D9ACADF28DD3C592CB23DFB87C77046EFD7
          0A8B2222EDD9ED5557DBB515B686175456D64ECA78216737BDEE0D6B47892405
          FD19E5D6148F0265FE1AC351383A2B3DB29ADED70E444513580FF45644B4A1D2
          837B176DAEAFF4C0EBF06D051529D3B3585B2FFB555391116C27A1D312329332
          7302C25E03EBAD505635A4F13D4CA5A7FD7ADABA22A57D289B42372C7264608B
          5D508F10E2E0E8246B1DE7C3403F9671EEDFE118D79873F4F92B4E68A6ED98B6
          47C67B535E6E14F871D4B6EB5DB434D6DD6E05C218CBB5DD6343412F79009D07
          000712351ADB8A1E868AD918D3599AB040FD3CE6C16232007C09A86FDCBD23D0
          CF4BB800CD7983FB49B00D3D9E50BA93F432C80130E6D35C7B03F0F69EF15256
          3177E875C6B0877C198FAC557DDE574D341AFEC87AABDB406C9198FB364B4F26
          2EB546EB5D4BFAA82EF6F93AEA491FC4EE6F680B5DA02407069201D35D0A8691
          117EE09E4A69E39A27BA3963707B1EC3A1691C4107B0ADF96C799E71ED0590B8
          7712C93364BCC51F905D9839B6AE2003C91D9BE376403B9E14D68A19DADB682A
          3D9BB262EF89DEE8E4BC4A3C8ED14AFF00EFD56F077351DAD6805EEF0691CC85
          A10BC5DEB3105DAB6E771A992B2BEB667D454544AEDE7CB23DC5CE738F692492
          BA8888BD1C37639B13622B5D9E9DEC6545C2AA2A48DD21D1A1CF786824F60D4A
          FE8972B72F2D594F97987F08596311DB6D148CA68CE9A17903CE91DF59CE2E71
          F17159522A73B7A6DB769C90C1D70C25852E70D6661DCA27400533F7BE0A8DC0
          874CF23949A7C86F3D74711A001DA667BDD23DCF7B8B9CE3A924EA495C2B2BD1
          C546FACDB270006920466B65711D80514FF79D07AD6F2D431B63657C99BFB366
          39C3B4B01A8B8BA84D65146C1AB9F3C044AC6B7C5C59BBFACB40C416920F0211
          111588D9236D0C53B2D5EE482061BDE0EAD943EBAC92BCB7477232C2EF99269A
          03C34700011C011B6BC9DDB2F2933BA86192C78B68E8AE2FD03AD17791B4958C
          71EC0C71D1FE96170F15358918E1A87023C0AF2712E32B060CB7BABEFF007BB7
          D9285BF2AA6E354C8231FACF202A4BB4B74A6E10C196DACB3E57118B3113DA63
          1757C65B414A7E90D7433387600037B778F23AA5C518A2EB8D710DC2FB7CAE9A
          E777B84CEA8A9AB9DDABE57B8EA49FC8701C82F2D16D63A20B2B66B2E5EE2EC7
          7574E586F7571D0513DE38BA18038BDCDF02F9377D31782D842E08D410BF9E8D
          A47084980F3F7306C5233AB6D25EEAC4434D3589D2B9D19F5B1CD3EB51BA94F6
          6DDA0AFDB36667D0E2CB2FF18840EA2E16E73F7595B4C482E8C9EC3C016BB43A
          3803A11A83BC4C8CDA0F056D0D84A2BEE10BAC755A35BE5541210DAAA3791F22
          58F5D476E846AD3A1D090A49445A78E96982C516D256E7DB3AA17592C703AE82
          2D3532759208CBFEBF5619FAA18A932222973653C012662679E19A3EA8C94745
          38B8D59D3CD6C5090EE3E0E76E37F596D9911111111117D29EA24A4A88E789C5
          92C6E0F6B873041D4156170CDF63C4566A7AD8F40E70D2460F9AF1CC7FBF668B
          D54444444445D3BBDD20B2DBA7ADA976EC513753DE4F601E24F055F2F9789EFD
          749EB6A0F9F23B837B1A3B00F42E82F6308DD8D971150D56F6EB0481B27D93C0
          FB8AB0C8888888888B873831A5CE21AD1C493D8B4F1D287B4659738732AC985F
          0C574573B36168E66CD5D4EE0E8A6AB94B77C31C3839AC6C6D1BC386A5FA701A
          9A4E888BE94D512D1D4453C2F745344E0F63DA742D703A820ADCB6477499E546
          32C116D7634BE7E896298A0632BA9AAA9A574324A068E9227B1AE1BA48D403A1
          1AE9A1D353D3CE4E94ECA9C1763A96E0A9EA31BDF9CC2DA78E2A7929E958FD38
          192491AD25A3B980EBCB51CC6A473071E5E733F1ADE315621AA35B79BAD43AA6
          A253C06A7935A3B1AD00340EC000EC58FA222BBDD17BB36CF9919AADCC4BB529
          FD1AC2B26FD33A46F9B535FA6B1B477F56089091C8F57DEB704B00CEACF2C219
          05832A71262FBA47434CC6B853D3020CF57201A88A2673738F0F01AEA481A95A
          10CE4CCCAECE3CD1C4B8D2E2C10D4DE6B1F53D483A8899CA38C1ED0D606B75F0
          586A222CF723B39EFF009059936AC67871F19AEA225AFA79C1315444E1A3E278
          041D08F582011C405B93D9976EDCBDDA4BA8B5D34CFC398C1CC25D62B8386F48
          40D5C60938365000274E0ED0125A071564143FB40ED5597FB38D866ABC4D788A
          4BB18CBA96C748F6BEB2A5DD80335F35BF5DDA37C75D01D20E7DE76DFB683CCE
          BAE33C40E0DA8AB70653D231C4C749037F93859AF600789ED25C7992A3D45B8D
          E8A9BCE156ECDB0DAADB71A2388FE11AAA9BA50B656F9435C5C1AC7B99AEF6E9
          8DB1E8ED34E0473055D34445513A4DF30309597664C4186EEF5F4CEC41777530
          B65B83C1A873D93B1E640DE61AD6B5DABB971DDD7572D2D22222B49B04ED6F1E
          CC9983574D7F3349826FA1B1DC042D2F752CADD7ABA86B473D352D701C4B4EBC
          4B403B85CBECEEC039AD0B64C238BECF7F716EF1828EAD8E9983EB47AEFB7D60
          2CD9CE0C697388000D492B47FD205B4B9DA1339EA29AD55465C1F870BE86D818
          EF32776BF1B503EDB9A003F458CED2556044445CB5C58E0E69208E208EC562F0
          2F483E7B601B7C3414B8DA5B9D142C0C64577A68AADC00E5F18F6990FADCB2EA
          8E94BCF89A20C65D2CF03B4D3AC8ED7193EFD47B94638EB6D4CEDCC582482F19
          89776D349C1D05B9EDA163877110359A8F03AA856491F348E7C8E2F7B8EA5CE3
          A9257E515E4E890C08EBF67F5EB124911752D86CEF0D934E0D9E77B58C1AF8B0
          4DEC5B7C5C11A85A5AE912D94EAB22F342A71459689FFA0F88E774F0491B7565
          1D53B57494E7B86BAB99F549035DC2AA2A2222024723A2F5E8318DFAD51F5745
          7BB8D247A69B90553D834EED015D0AEB955DCE774D59553554CEE724D217B8FA
          CAEBA22CFF0022F25EFF009FB99769C1D87A12EA9AB7EF4F52E6931D24008EB2
          67F735A0FAC90071216FEF2D72FAD195580AC784AC50F516AB452B29A169F94E
          D3E53DDDEE7389713DA5C4AC9916A1BA5A3299F8533C2D78DA9A0DDB7E28A16B
          66900E1E57000C703DDAC661D3BF47772A308BDBC1D8DF1065EDF69EF586AF35
          B63BAC0758EAE866744F1DE3507883DA0F03DAAE5658F4B5E66E14A686971659
          AD58D618C686A0EB4554FF004BD80C7FE8D4CD49D321871F4E0D4E5BDCE29F4E
          2C8AE51BDBAFDA2C1F728EF343A5FB15DF2DD351E07C1D45862591A5A2E370A9
          F2D959F598CDC631A7ED6F8F0542F13E27BB633BFD75EEF970A8BADDABA53354
          D6553CBE495E7B493FEE068179888B96B4B9C000493C000B667B16641CB94B81
          E4BD5E69FAAC4B7C6B6492378F3E9A9C716447B9C75DE70EFD01F92AC7222222
          222222CDB2BB137C0F78F229DFA52D610DE278364EC3EBE5ECEE534222222222
          285B32B17FC3B70F21A57EB434CEE60F091FDA7D0390F5AC2911589C2D70374C
          3B6FA971DE7BE16EF1EF701A1F782BD54444444445ABCE949DA9715DBF1BBF29
          70FD74B67B1C54514D759299C592D6BE505C2273871110616EAD1F28B8EBA800
          2D712222222222229EB653D90B166D3F8AE28A8A096D984E9A502E57E963F8B8
          87331C7AFCB948E4D1CB505DA05BBECB2CB5B0651607B5613C3344DA0B3DB621
          14518E2E79E6E7BCFCE7B8EAE27B492BDFB9D68B6DBAAAADCC748D82274A58C1
          AB9C1A09D00EFE0BF9E9CF4CEDC4D9FB98772C5589AB649E69E470A6A5DF262A
          38753B90C6390681EB27527524951F222222F430F5E6E1876FD6EBA5AAA65A3B
          9D15447514D5109D1F1C8D702D737C41016CBFA4776BEC7B9713616C05862B65
          C315D71B2C574BBD7D21DCA90E91CE608637F38F431B892DE27568046841D63D
          7DC2AAEB59355D6D4CB5755338BE49E7797BDEE3CC971E24F895F0445D9B6DD2
          B2CD5B0D65055CF45570BB7E39E9E431C8C777870E20FA16D7FA2F36A0C619BF
          4B89706632B8CD7EA8B341155D15D2A897CE62738B5D1CAFE6FD0EE90E3E7717
          024E834BF08A9DF497ED118A322B2AEC947842B1F6ABB622AB929DF738BF95A7
          858C05E233F35EE2E680EE6003A71D08D37DE2F570C43719EE174AEA9B957CEE
          DF96AAAE574B2C8EEF739C4927D2BA688888BBB64BE5C30DDDA92E76AADA8B75
          C692412C1554B218E489E388735C3883E85B6CDAEF69EBCE0FD87306D6BE5752
          E34C7F67A481F247E63A26C94EC92AA40072D43B7469C41941EC5A86E6888888
          88888806A740B777D1D39075191FB3FD24D76A6F26C478964175AC63C68F8A32
          D02089DDC433CE20F10E91C3B15A5458EE60E5F61FCD2C2172C3189EDB15D6CB
          708FAB9E9A51CFB439A4716B8100870D082010B4DFB5C6C038BF678ADACBE58E
          29F13E012F2F65C2166F4F44DEC6D4B40E1A72EB079A786BBA486AAA28888888
          8A4DC89D9CF1CED1389D967C216892A236B9A2AEE5302CA4A369F9D2C9A68386
          A4346AE3A70056E93657D94B0BECB9830DB6D405CAFD581AEB9DEE58C365A970
          E4D68E3B91B78E8DD7C4924EAA6F445076D8FB3CC7B496495D30E402365FE95C
          2BECF3C8740DA9603A349EC6BDA5CC3DDBC0F62D0F5FAC371C2F79ADB4DDA8A7
          B75CE8A5741514B52C2C9227B4E85AE07910574511111117DE82DF5575AD828E
          8A9E5ABAB9DE238A08185EF7B8F001AD1C493DC15F6D94F630384AA68F1863CA
          763EF11912D0D9DDA39B4A7B2497B0BC730DE4DE678FC9B8A8888BF70C3254CA
          C8A263A491E775AC68D493DC16733E55D5D361996B5EF26E2DF8CF266F1019DA
          3C5DDBEAD38AC0D1111172090411C0853B600C4C31259186576B594FA473779E
          E77AFEF0564E8888888B00CCEC67F06533AD546FD2AE66FC6BDA7F9361ECF49F
          BBD21440888A6CCA8AAF28C24C66BAF5333E3FDEFDE5992222222222D7E74926
          C5588B36EED4999180E88DD6F34F4ADA4B9DA22D04D3C6C24B26881F94E00969
          6F32037404820EAF2ED81F11586BDD4373B0DCEDF5AD76EBA9EAA8E48E407B8B
          5C01D576A932D3175C1A1D4B85AF5520F2315BE577DCD5E9D3E4666455E9D460
          0C4F36BFCDD9EA1DF7317A30ECD59B952358B2BB19C83BD960AA23FD5AEC3765
          ACE47F2CAAC67EBB0D50FDC5F1A9D99737A8F8CD95B8CA31F48D86AB4F6F56BC
          AA9C91CC4A2D7CA301E26834E7D65A2A1BF7B17993E5C62CA5D7AEC31788B4FA
          74128FBDABCF970CDE2176EC96AAD63B968EA7783F72F52D39618C6FD288ED98
          52F77190F2652DBE6949F535A54BD807604CF5CC1961F26C075B67A679F3AA6F
          8E6D0B631DE59210F3EA692AE6E457447D8EC3534F73CD1BFF00E914F1B83FE0
          6B46F434848EC7CA7491E3C1A19E92AFDE1AC3168C1B64A4B358ADB4B68B5523
          3AB828E8A26C5146DEE0D68D02F5170407020F22B557B56F45DE27B7626B9E25
          CA6861BCD8EAE57543B0F991B154D197124B22DED1AF8C760D4380D068ED3534
          7B18654634CBF9E48712E14BCD89F19D1DF0850C908F51734023C42C58B1C3E6
          9F62E374F715C8638FCD3EC5EBD8F06DFF0013C9B967B1DC6EAFD74DDA2A4926
          3AFEA82A61C0FB0B679E3E922F21CBCBA5043211ACF786B685AD1F48898B5C47
          A012AF36CAFD16F4996D89ADD8B732AEB497FBA5048DA8A4B2DBDAE3491CAD3A
          B5F2BDC019343C777740D4712E1C17BDD23BB18E21CFE166C6B8221657625B4D
          29A1A9B5BE46C6EAAA60F2F618DCE21BBEC73E4E048DE0EE075003B5578BB2AB
          19E00A87C38970A5E6C5230E845C2825847A41734023C42C5CB1C3E69F62E374
          F715C88DCE3A06927C029472D765ECD4CDBAC861C3381EEF570C840F2D9A9CC1
          4AD07B4CD26EB3DFAADB9EC39B1EC7B2BE0EB84974AD86E78C2F66375C27A6D7
          A9818CD77218C900900B9C4B881A92386802B368A0FDAF3665A1DA8F2AE4C3AF
          AB6DB6F54737965AEBDED25914C1A5BBAF0389638120E9C4703A1DDD0E9D7327
          63BCE2CABB8CF4D78C0777A88227102BED94CEACA578EC70923040D79E8ED0F7
          80A23AEB556DAE774159473D24CDE71CF1398E1EA2175B71DDC7D8B8DD3DC534
          3DC57218E3F34FB165584B2971B63D9A28B0E612BDDF1D21D1A682825987A756
          B4803C4AB97B33F459E30C517DA1BCE69C6DC3387217891F6864CD7D75581C43
          0EE6AD89A7B493BDA70006BA8B31D24DB325FF0038F2A30BCF81AD62BEBF0A4D
          2065A29406BDF4B2318D7089BC896F551E8D1C48D74E2003AC19B659CE480E8E
          CAAC647EC58AA5DF7317CFFB98B38BFC14E36FF37AAFFB34FEE62CE2FF000538
          DBFCDEABFECD3FB98B38BFC14E36FF0037AAFF00B34FEE62CE2FF0538DBFCDEA
          BFECD3FB98B38BFC14E36FF37AAFFB34FEE62CE2FF000538DBFCDEABFECD3FB9
          8B38BFC14E36FF0037AAFF00B34FEE62CE2FF0538DBFCDEABFECD707662CE103
          539538D74FFE5EABFECD78D77C97CC0C3F0BA5BA606C476D89BF29F57699E268
          F497302C3DD0C8C716B98E6B81D08238857BF601D832EB981892DD9839816996
          DF84281EDA8A0B756C65925CE51A1638B08D7A81C0EA783F801A8D56DB80D068
          17288BF3246D958E63DA1EC70D0B5C35042A879FBD19B9619BF3555D2C0C7E02
          C4336AF335B230EA391FDEFA73A01FF6659DE75543F34BA32B3AB2F25965B65A
          A971A5B5BA9151649C1900ECD617EEBF5F06870F155AF1465FE27C0F54EA6C45
          876EB62A869DD315CA8A4A776BE8780BC1208E634445DDB5592E37DAC6525B68
          2A6E154FF93052C2E91EEF435A092A77CB5D81B3C333A58CD2E09ABB151BB4D6
          B3107F116341EDDD7FC6387D969574F24BA2370D61F929AE19978865C4B54C21
          CEB4DAB7A9E935FA2E90FC63C7A3AB2AF7E10C1561CBFB0D3D970DD9E8EC76AA
          71A4749430B628DBDE7403893DA4F13DABDA4444507E7F6C6F963B46B5D53896
          CC692FBBA18CBE5ADC20AC000D0073B42D900EC0F0ED3B345437343A21B1BD92
          49AA303628B6E26A40496D2DC5A68EA74EC683E731C7C496FA1564C6FB1DE746
          5EC920BC65C5F7AB8FE54F414C6B6103BCBE1DF681E92A24ADB7555B6A1F4F57
          4D352CEC3A3A29A32C734F883C42EBA2004F21AAC8B0BE5CE29C6D288EC3876E
          77724E9BD494AF91A3D2E03403C49560F2DFA3F31CE26921A8C4F554B85680E8
          5D1970A8AA23C18D3BA3D6ED4772B9993FB37608C9581AFB25BBCA2EA5BBB25D
          ABB492A5DDE01D0060F0681AF6EAA5144445F7A2A29EE3551D3D344E9A690EEB
          58D1C49535E09C094F86206CF306CF7178F3A4E619E0DFCFB5658A14CCAC27F0
          0DD3CAE9D9A515512401C98FED6FE23D7DCB0C444445EE60EC46FC337A8AA752
          60779933076B0FE239A9FE1999510B2589C1F1BDA1CD70E441E457ED11111639
          8D716C585ADA5C0B5F5B2822188F7FD23E0141353532D654493CEF32CD238B9C
          F71E2495F244452E64D484D96BA3EC151BDED68FC94848888888888BF258D3CD
          A0FA9371BDC3D8B9D0772E51171A0EE0B8DC6F70F62756DFA23D8B90D039003D
          4B9444445F9746D7821CD0E07982355E05C32EF0ADDA4325761AB4563CFCE9E8
          6279F696AE80C9BC02D7170C1187438F68B541AFF517A14197B85AD6EDEA2C37
          69A4777C143130FB9ABDD6431C4D0D631AC68E41A34017ED117E5CC6BC10E687
          03DE178370CBDC2D7671756E1BB45638F333D0C4F3EF6AF3BF81BC03BDBDFA11
          8777BBFE0A835FEA2F5AD58270ED89FBF6DB0DB2DEFF00A54B491C67FA202F68
          00390D172888B8D355F1A9A1A6AD88C7514F14F19E6C9181C0FA8AF0E7CB7C25
          53AF5D862CD2EBCF7E8223FBABA3364D600A8D7ADC0F8724D7E9DAA03FB8BE51
          647E5D42758F0161961EF6DA29C7EE2F5EDB97F85ECC41A0C3969A1239793D0C
          51E9EC6AF75AC6B79340F405FA444444444445C1683CC02BCDABC2F66B855C75
          75569A1A9AA8CEF326969D8E7B4F78246A17A4069C972888888BE35349056C2F
          86A218E789E3474723439AE1DC41E6B08BC640E58E2024DCF2EF0B57B8F3754D
          9A9DE7DA58BC17EC9192CF7879CADC2808EEB4C207B0357A56ED9A7292D32B65
          A4CB1C214F2B7948CB1D36F8F5EE6AB39B4E1EB5D861EA6D96DA4B745FCDD2C0
          D89BEC680BD04444444445C735E75E70CDA31141D4DD6D5457387F9BACA764AD
          F63815835CB665CA2BBBCBEAF2C708CD21E6F364A60E3EB0CD57952ECA39236E
          865A9972C3094713017BDD25AA12001E96A8BEE580702477532D8F03E1EB2D2C
          477616515AA084E83E71DD68E257A2C6363680D68681C00034D17288888BED49
          49357D4C74F4F1BA59A476EB58DE64A9C304E0A830B5207BC365B848DF8C97E8
          FD56F87DEB2845E7DF6CD05FED73D1540F3241C1DA716BBB08F42AF975B64F67
          B84F4752DDC9A276E9F1EE23C0F35D44444452A653E2BEBA2366A97F9EC05D4E
          E2798E65BEAE63D7DCA4A44445E4626C494B862DAFAAA876AF3C22881F3A4777
          0FC4A81AF378A9BF5C25ACAB7EFCAF3C00E4D1D80782E8A222296B2659A5A6E0
          EEF980FE8FFEAA44444444444444444444444444444444444444444444444444
          44444444444444444444444444444444444444444451366A62E357526CF4AFF8
          888EB3B9BF39FF0047D03EFF00428E91111117E98C748F6B5A0B9CE3A0006A49
          535E5FE08661DA415754C0EB94ADE3AFF7A1F4478F79FF007398A222C0F34B09
          FC2941F09D3335AAA66FC60038BE3FCC73F46AA1D444445F6A4AB9686AA2A881
          E639A2707B5C3B0856030AE2287135A22AB8F46CA3CD9631F31FDA3D1DA17B08
          8BC9C49896930CDBDD5352ED5C7847083E748EEE1F9A82B10620ABC49707D5D5
          BF52783183E4B1BDC179888888A67CA2A6EA70B3E4238CD50E76BE0001F8159B
          A222222222222222222222222222222222FC4D3474F13E595ED8E3602E73DE74
          0D03992543D8DF6B9CB0C0CE9629B10B2ED56CD41A6B430D4124766F8F301F4B
          82852FFD23946C2F659305CF30F9B2D7D688F4F4B1AD77F5961357D2258E5E4F
          9361FB0443B3AD64CFD3D9205D48BA42F3198EF3ED386E41DC69671FED964D64
          E91BBBC4F68BBE0DA3AA67CE34556F848F101CD7FB14B38376F3CB8C445915D7
          E10C3739E05D57075B16BE0E8F78FACB429720CEBC01516CF84198D2C268F4D4
          C86E110D3C082ED41F03C545D8AF6EACB0C375460A5A8B8DFDCD3A39F6CA51B8
          0FDA91CCD7D2350B3ACA5DA2704E737590D82E2F8EE31B77DF6DAD6755501BF4
          80D4870EFDD274EDD149888BC8C518BACB826D325CEFD73A6B55047C1D3D5481
          8DD7B00D7993D80712A02C4BB7D65B59A4923B7C776BEB9BC1B2535308E33EB9
          1CD3FD1581DC3A482918F2287024D333E9545CC467D82277DEBC89FA47AE4EFE
          470452C7F6EE0E77DD185F16748E5EC7CBC1B40EFB358F1FBABD5A0E9211BC05
          6E03D076BE0BA7EE98BF159A583A423015C1ED65CED579B4B8FCFEA993463D6D
          76F7F454E980337B07E6840E930CDFE92E8F6B779F031C5933077BA3768E03C4
          85982228D334B68AC0B9432793DFAEE0DCB74385BA8DBD7546846A3568E0DD7B
          3788D540B7BE91CB34121168C195D5ACEC75656329CFB1AD7FDEB1A9FA476ECE
          71EA70551B1BD81F5CF71F7302FCC5D239790475983285C3B776B5EDFDD2BDFB
          4748F504B235B74C11514ECED7D25C1B29FD9731BF7A9C32B76A7CBFCD9AB8A8
          2D9737D05DA5F916EB9B0432BCF730EA5AE3E0D713E0A5D44445E1E33C6B65CB
          EC3D537BBFD7C56EB7538D5D2CA799EC6B473738F601C4AA6D985D2215F255CD
          4F82F0FC10D2B4E8CADBB92F91E3BC46C2037D6E2A3E876F2CD28AA0C8E9AD32
          B3F9A7D179BEE703EF53165874845B6E955151E38B30B46FE83E12B71749083F
          5A33AB9A3C4171F056DECD7AA0C456BA6B95B2B21AFA0A960921A9A7787B1ED3
          DA085DD4444445F3A8A88A9209279E46430C6D2F7C923835AD68E24927905036
          36DB6F2C707D53E9A0AFAAC4550CD4385A210F8C1FF18F735A7D2D256013F48C
          E1B6BBE27095D1EDD79BE78DA7DDAAEDD2748A60D7E9E5386AF90F7F55D4BFEF
          7B57B14FD20796B3005F4588203DD252447EE94AECBB6F8CB06B7502F2E3DC28
          C6BFD75D3A9E906CB785A4C76EC4339EE652C43EF942F12B3A45F0A335F24C2D
          779BBBAE9228FEE2E5E354F490D2375F27C07349DDD65D033EE88AF32A3A47AB
          2586564781A289EE690C7FC284EE1EFF00E4B8AC3E876B4B4D4CBBD70B2D6C05
          C7573A195B31D7BF8EEACFF0D673E10C54F6474B788A0A87701055EB0B89EE1B
          DC09F412B360411A8E28888BC6C4F8CACB8328DB5379B8454313B50C0FD4B9FA
          73DD68D49F505E5E0DDAA72C30F57BAB6E15170AB9A33F12C828C96B4FD23BC4
          71EE59B3B6FF00CB369D053DF5DE228D9FDA2E3FE100CB3FF9B5FBFC923FED13
          FE100CB3FF009B5FBFC923FED13FE100CB3FF9B5FBFC923FED13FE100CB3FF00
          9B5FBFC923FED17076FF00CB320834B7D20F6791C7FDA289F106D538064BACF2
          5B29AF0291E779AC7D330166BCC7F29CBB97932ED57851A3CCA0BB3CFF008A8C
          0FF58BCBAFDAD2DB1B4F91582AA73FF5F3B63FB8396197BDA8F14579736DF4D4
          56B8FB0B586578F5BB87F4576F026D377AA2B9C50E2531DC6DF23835F3B226B2
          58BEB00D00380EED35F1567A96AA1AEA586A29E46CD04AC1247230EA1CD23504
          7A97D564781F14BF0BDDDB2389347368C9D83BBB1C3C47E6A788A564F13248DC
          1F1BC0735CD3A820F22BF6B12CC4CCCB1E5ADA1D5B77AEA7A67381EAA39A50CD
          E3EBECFF0070A9D63CDAF2C75771966859577BA8D7469637AA85A3B8177103F5
          546F70DACAF1239DE4563A2A76F609E47CBA7B37579C36AAC5BBFA9A1B411F47
          A993FB45EC5B76B4B8465A2E160A69C769A699D1FB8872CE2C5B4E612BA39ACA
          D1576979E6E9A2DF66BE966A7DC167F458F70DDC690D553DF6DF240D1BCE7F94
          B06E8FADA9E1EB58DDC33F7035BAA840FBD36676BA17C10BE460FD60343EAD56
          6764BF5BF11D0475B6CAC8AB695FCA485DA8D7B8F71F03C5593C1941F06E17B6
          C1A68EEA43DC3C5DE71FBD7B4BE3575905053C951533474F046379F2CAE0D6B4
          779278051662BDAAB2B7086FB6AB16D1D64CDE1D4DB77AA893DDAC60B47AC851
          55F7A4430651B9CDB561FBC5C88F9D3F57034FA3CE71F6858657F490563C9145
          8161887619EE45FEE1185E70E91AC43BFC7085B773BBCA64D7DBA2F468FA482B
          1AF6F956058646F6F53722D3EF88ACCEC7D22182EACB5B75C3F79B738F3741D5
          CEC6FA4EF34FB029C32E73DB03E6B799872FF4F57561BBCEA29758AA00EDF8B7
          00481DE351E2B3E4444444444444444444444450367BED7585F278CF6BA3D310
          62768D0D0C0FD23A73FF005CFE3A1FAA353DFA6BAAA1F9A7B41637CDEA993E1D
          BBC8DB7976ACB6521315333BBCC07CED3BDC49F151C22222222F430FDFEE185A
          F54776B555C94371A3904B0544474731C3FDF97223815B55D9F738E933AF2EE8
          EF4CDC8AE70FF17B8D337FBD4E00D481F45C0870F03A73054968B555B4FE68DD
          F327366FADAE9E416EB5D5CB434347A90C898C796976EFD2716EA4F3E3A72034
          891111117AD84F155D304E21A1BDD9AAE4A2B8D1CA258A58CE9C47307BC11C08
          3C082415B85C297BFD25C2F67BBF57D5797D1C355D5FD1DF60769EF5EAAF3712
          D6D4DB70E5D2AE8E2EBAAE0A5965863D35DF7B584B47AC80B4DB79BB565F6EB5
          771B85449575D552BA59A794EAE7BC9D492574D1117EE09E4A59E39A191D14D1
          B83D8F61D1CD2388208E456DFF0028EF75D8932B7095D6E7BC6E1596BA69E773
          8685EF746D25DA78F3F5ACB91116B076BACE1AFCCCCD4B9DB84EF6D8AC751251
          51D303E69730EEC929EF2E703A1FA200EFD60D445336CE1B475DB24311470CD2
          4B5B856AE402B6DE4EBB9AF0EB621D8F1DDC9C0687B08D9E58EF743896CF4774
          B65547596FAB89B3413C4756BD846A085DE4444454E7A4331FDD6D36AC3B85A8
          A6929ADF7212D4D616123AF0C2D0C613F4412491DA777B95154444444444520E
          5EE76E21C052C7089DD72B583A3A8AA5C4803EA3B9B7EEF056BF0363CB566059
          9B70B5CDAE9A36681FC2485DF45C3F1E4564488A9667ADEAAEF199B786D4BDDB
          94B2793C319E4C634767A4EA7D6B0044444444444569365EC68FBBE1CABB0D4C
          A5F35B9C1F06F1E3D4BBB3F55DAFED00A6E4528E5562FDE6FC0B56FE23534CE7
          1ECED67E23D7E0A2BDA2B6D1B665D4B5387F08086F388D84C73D538EF5351BB9
          11C3E5BC770E00F32482D542F17E36BEE3DBCCD75C4174A8BA574A49324EFD77
          7C1A3934780002F1111111165F96598F5F96F88E0AE80BA6A173DA2AE8B7B46C
          F183C4783B4D743D9E8D41DB2E09C5F6AC79856DB7EB2CE2A2D95B10922701A1
          1D85A476104104761057A376B8C567B5D657CDA9869617CEFDD1A9DD6B493A7A
          82D4E66FE79628CE4BF5455DE2BE56DBFAC269AD71BC8A7A76EBC006F22ED39B
          8F13EE51EA22222ECDB6E75766AFA7AEA0A9968EB29DE248A785E58F6381D410
          471055CFB0EDFD554F63B7C55F631575CCA78DB515035689640D1BCED0701A9D
          4E83BD5D844444444444444444444454CB6AFDB024B54F5983302D66ED533586
          E17884F188F231427E90E45FD9C871E228F4923E691CF91C5EF7125CE71D493D
          E57E5117EE0A796AA56C50C6F96471D1AC634924F800BDD765EE296C1D71C377
          710E9AF586865DDF6EEAF06589F0BDCC918E8DED3A16B868415F9444565B60BC
          C09B0D66F3F0F3E5D282FF004EE8CB09E1D746D2F63BD3A091BFACB6348A866D
          83B2CDD6DF882EB8F30BD2BABED558E7555C68E11ACB4D21E2F9037E7309D5C7
          4E2D24F672A84888880171000D49EC562324B632C5F98B574571BF533F0DE1C2
          E6BDEFAA1BB533B39911C7CC6A3E73B41C751BDC96C8682860B650D3D1D34622
          A6A78DB1451B7935AD1A003D002FBA7355633C3618B2E39ADACBDE10AB661FBB
          CE4C92514ADD68E679E248D38C649E7A6A3EA8545F1E601BEE5A624A8B1621A1
          7D05C21D0EEBB8B5ED3C9EC70E0E69D398F1ED0563C8BEF6FB7D4DD6BA9E8A8E
          092AAAEA246C50C3134B9F23DC740D0073249578B21F611A5B67925EF30DEDAD
          AB1A48CB1C2ED618CF302670F967BDA3CDF170571218594F1322898D8E363435
          AC68D0340E4005FB445C3BE49F42D30622AA35D882E752E7173A6A992424F6EA
          E2579E888ADEEC2B9F6EB1DE065E5EAA3FE2EAE797DAE591DC219CF1317A1FCC
          7D6FB4AF9A222228CB3E321AC99EF86A2A0B8CAFA1B85239CFA2B844DDE742E2
          06F02D3F29A741A8D4721A10B5CF9D1B3F62AC8FB8C71DEA06545B6A1C5B4D73
          A525D0CA79EE9ED6BB4F9A7B8E9A81AA8D111100D4A966D1B28E6BDF2D71DC29
          7075579348C0F6F5F3430BC83CBCC7BC3BDCA3DC51842F7826EAFB6DFAD75569
          AE60D4C157116388EC235E63C4705E42222CAB2DB1E55E5EE28A6B940E73A9C9
          0CAA801E12C44F11E91CC788578A8EB21B851C1554EF12C13B1B246F6F27348D
          41F615F65F5A5A596B6A62A78586496570635A3B495CE6D6C4963CC764371A0B
          A4964C44220DA89FABEB60A970ED7375041ECD41E406A0AA4D9C992388F24310
          436CBFC71491D4B0C94B5B4AE2E867683A1D090082351A82351A8EC209C01111
          776CB64B8623B9D3DBAD5453DC6BEA1DBB15353466491E7C1A389537597620CD
          7BB53B6596D1496C0E1A86D656C61DA78861769E83C57A6FD8233418387C0CFF
          00B35A7F162C7F10EC699AB8768A5AB92C30D5D3C4379EEA5AD89C40EFD0B813
          EA0A26BEE14BCE189432EB6CAAA024E8D33C45AD77A0F23EA5E522963665B83E
          8F336381A7CDAAA596270EFD007FEEAB748A0CDA073967C384E1CB154BA1B8BD
          A1D555713B47C0D3C98D239388E3AF60D3B4F0AC0492493C4944445CEE9EE2B8
          44456F3601CDC96D589AB30157D41343716BAAA81AF3F22768D5ED1E0E6027D2
          CF12AF7D55345594D2D3CCC12432B0B1EC3C9CD234216B37689D952FD93B70AA
          BADBA192ED841EF2E8EB231BCFA504F064C3B34E5BFC8F0E44E8A06444445603
          23763AC559B30D2DDEE2EFD1DC352E8F6D54EDD67A8677C51F711C9CED071D46
          F2BC96AD9BF2EED36BA3A26E1BA6A86D342C844D3EAE91FBAD0379C469A93A6A
          4E9CD49888888888888888888888AB26DA1B433F2D70EB70A586A4C7892ED113
          2CF1BB4751D39E05C0F63DDA103B8071E0745AEA24B8924EA4F6A2229FB665D9
          62BB3B6A4DDEEB24B6CC254F26E3E760D25AB78E6C8B5E000ED71D74E4013AE9
          B07C0B9598532D681949872C5476C686EEBA58E306693C5F21D5CE3E925655BA
          3B82C3F1F65060FCCEA37D3E23B0D25C1C468DA92CDC9D9F6646E8E1EDD1508D
          A3B644BAE4FB65BE58E496F58537BCF91CDD67A3D7909401A16FD7000EC2070D
          6BBA22CFB202B1F439DF812466BBC6F34B1F0EE74AD69F712B6E48B82351A1E2
          16B4F6DBCB2B7E5E66DB2A2D14ADA3B75E6945675313776364DBCE6C81A3B01D
          1AED3BDE557C44453FEC4381E9319E77D3CB5F4EDA9A6B452497011C83569903
          9AC6123C1CF0E1E2D5B31444454E3A46AC503F0F610BC885A2A62AA9A90CA071
          2D7303834F7F16123D27BD516453B6C4D6B8EE5B43585F246D91B4B0D45400E1
          A80444E683EA2E056CE91111742FD72659AC770B84A408E969E49DC4F201AD24
          FDCB4BF23B79EE27892495C2222FAD2D54D43550D4D3CAF86785E248E48CE8E6
          381D4107B082B6ADB36670C59CD965437495EDF86697F8A5CA21C3499A079FA7
          73C68E1E923B14AA88888A3BDA1306D363AC9AC576CA889B2BDB432D4D39238B
          668DA5EC20F671681E82476AD49F244459C646D9E2BFE71E0BA09D824825BB53
          758C70D43982405C0FA40216DDC700A0BDB0F025BF1BE54CCC9299925DE99E65
          A09F77CF63834B9CD07B9C1BBA472E20F605AC44444572F67BBC3EEF95B6C123
          B7A4A57494C49EE6B8EE8F53481EA523A92728B0E75D512DE2667991EB1C1AF6
          BBE73BD4387ACF72955571DBC307C57FC9096EDB80D4D92B22A86BF4F3B71EE1
          139BE825ED27EC85ADD4445743A3970C52CD598C2FF2C4D7D5C0D828E0791C58
          D76FBA4D3D3BACF62BC08BF2F63646398F68735C34208D410ABF665E04A6B7D6
          4F43554B1D5DA6AC12C64CD0E696F6B4EBDA3F22A94E7964F7E805736E56B6BD
          F62AA7E81A789A77FD027B41EC27BB43DE62852A6CD56D92B734296763496525
          3CB2BCF6005BB83DEF0ADF2F1F18E238B08E17B95DE600B69212F0D3F39DC9AD
          F5B881EB543AE972A8BC5C6A6BAAE43354D448E96479ED713A95D644456A7223
          27ED14386286FD73A38ABEE75AC13C7D7B43D90B0FC9DD0786A46875E7C741E3
          31BE8E9E487A97411BA2D34DC2C05BEC581E32C8AC2B8BA090B68196AAD23CDA
          AA1686107EB3479AEF66BE21563CC7CA8BCE5B5634563054D0487486BA10771D
          E07E8BBC0FA89585A2CB728EFD2E18CD1C297485FB8EA6B9D3B89EF6F580381F
          02D247AD6E081D402BF1514F155C1243346C9A191A58F8DED0E6B9A468410798
          5AC1DAEF28E8B29335E582D3175166BA402BA9A11F26125CE6BE31E01CD240EC
          0E03B1422888B3FC83C0B1664670618C3F50CEB292A6A83EA19F4A28DA6478F5
          B5847AD6DBA1863A6859144C6C7131A1AD630681A072007605FB444444444444
          444444445E3E30C53438230B5D2FD7293ABA1B7D3BEA253DA4346BA0F1274007
          790B5119838DEE198F8CEED88EE8FDEACAF9CCA5BAEA236F26B1BE0D680D1E01
          63C88B24CB7C135598F8EEC986A8CEECD71A96C25FA6BD5B39BDFE86B439DEA5
          B77C2B866DF8330E5BAC76AA76D35BE8216C10C6DEC00733DE4F327B49257AA8
          8BE35749057D2CD4D530B2A29E6618E48A568735ED2342083C0823B16B5F6B0D
          9B66C9CC406F36685F2610B8487AA3C5DE4729E3D4B8F7732D2798041E23535F
          514D1B20609A8C699EF879CC8CBA96D521B95449D8C11F167B642C1EB5B48445
          467A47E16B6F581E5F9CE82A9A7D01D17E6A9AA222B6DD1D106F6606299BB596
          C6B7DB2B4FE0AFD22222ABDD2194E24C98B44BA79D1DF21E3E0609F5FC16BC11
          58FD81E3DFCF727E8DAEA1DEF60FC56C851111439B5C631660DC84C4D2094475
          170885B611AE85E653BAF03FECFAC3EA5AB244444537EC8D9C4729F34E999593
          F5761BCEED156871D1AC24FC5CA7ECB8F13F45CE5B400750B944445D0BF402A6
          C771848D4494F2374EFD5A42D2FBFE51F4AE1114ADB2BD37956D058299A6BA56
          17FECB1CEFC16D6945F9D73EACB641CC1EB1EE1FB207E2B5517485B4F73AB899
          F26399ED1A770242EB2222B71B31C0F872C83DC0812D64AF6EBDDE68FBC152FD
          253495B55153C4DDE96578635BDE49D02B1765B5C765B552D145F261606EBDE7
          B4FACEA577947BB425985FB2431BD211BC7E0A9E668EF746C3237DED0B522888
          AF77472374C2B8C9DDF5900FE83BF3570979789F125BF07E1EB85EEEB38A6B75
          042E9E790F1D1AD1AF01DA4F203B4901523BE748B5FCDFDEEB3E17B732C8D7E8
          D8EB5F23AA1EDEF2E6B835A4F76E9D3C5599C0798162DA4F2D3E13B634D2D531
          C592D34A757D25401AEE93DAD20F03DA0F610408BB13E1AA7BCD057596ED4DBF
          0CA0C3344EE04107DC411A83DE1570B9EC9D756DC1E2DF79A47D11779AEA96B9
          B201E200209F58F529872AF2AA872C6D72C714A6B2E153A1A8AB737777B4E4D6
          8EC68D4FA7D9A670A1BDA96E8FA3C014B48C24795D6B1AFF0016B5AE77DE1AAA
          8A2222B73B3F663D0623C27456496664576B74421EA1C7432C6DF92E6F7E8340
          7BB4F10A5945D5BADAA8EF76F9E86BE9E3AAA499BBB24528D4387FBF6AAAD9B9
          B3DDDF0453545FED54B3D7E16126E3AA1ADDE752B8F26BFC3968EE5C403A1235
          88149BB38E5C5766666E582DF4D0B9F494D531D6574A079B1411B839DA9ECD74
          0D1E2E0B6C4068172A97748FDA43A8703DCDAD00B24AAA77BBBF7846E68FE8BB
          DAA902222B17B05DBC5667D45316EA692DB51303DC4EEB3F7D6C951111111111
          1111111111154EE908C7EFB3602B3615A797765BCD419EA003CE18B4201F4BDC
          C3FA85500444567FA3EF0D36EB9BF70BAC8D0596BB6BDCC3DA2491CD60FE8F58
          B6228888BCCC4986ED98BEC75967BC51C55F6DAC8CC5353CA356B87E04730471
          0402151BCD2E8FDC416DAE9AAB0357C378B7B892CA1AE9045531FD50F3E63FD2
          4B7D1DAB04C3FB0E66B5DEBD90D65A692CB013A3AA6B2BA27B40F444E7B8FB15
          E2C84C84B36446197D0D0C86BAE95643EBAE4F66EBA670D740071DD60D4E8353
          CC9278A94111517E91E935BF60967753551F6BA3FC9537444570BA3923D71563
          27F751C0DF6BDDF92BDC8888AB66DF90F5B91713BF9BBB53BBFA320FC56B8915
          97E8FD66FE78561FA3669CFF00A4887E2B6328888A84F4856630BA62DB2E0DA6
          977A0B5C5E5956D69E1D7483CC07C5AC1AFF00DA2A8A888889C96CFB63FCDBFE
          14B296922AC9FADBDD974A1ACDE3AB9ED03E2A43F69A3427B5CD729C911117CE
          A1A1D0480F105A41F62D2A3FE5BBD2B8445356C694DE53B47E11046A186A5E7D
          54D2E9EFD16D19433B405D62B2B595D50E0D82968E49DE4F70D49FB96AE2799D
          513C92BB8B9EE2E3E9257E1117EE185F5133228986491EE0D6B5A35249E402BD
          9975867F43F04DA2D2E004B4F00EB74E5D63BCE7FF0048952DE535A057E217D5
          BDBAC748CDE1AFD33C07BB53EA53322F131C51FC2182EFF4BA6BD7D04F1E9E98
          DC3F15A6A77071F4A222BE5D1CBA7E8662FE3E7797C5A8F0EACAB7CABBEDDB88
          0D9B216AA91B26E3AE95D4F49A03C4804CA7FD52D6BAB51D1F18C9D68CCFBB61
          E924229EEF42646335E06688EA3FA0E93D8ADDE6C613DF68BD533388D1B52D03
          98E41DF81F528B91141FB57D2B9F83ED15006AC8EB7709EEDE63B4FEAAABA888
          8BE94F532D24EC9A095F0CCC3BCC923716B9A7BC11C94A5857691C5787C322AD
          922BD530E1A550D2403C1E38FACEAA5AC37B4FE18BAEE32E70D4D9A63CDCF6F5
          B10FD66F1FE8A9630A5DEDF8DE7862B1D7D35C9F2B83408250ED35FA40711EB5
          64ED187292D96165A9D1327A731964AD91A0B65D7E56F03CC1D4F03D9C143388
          3622CABBF5C5F58CB5D5DACBDDBCE8682A9CC889F069D774780D0293B2EB2AF0
          BE545A1D6EC316A8ADD0C843A59012F96670E45EF712E7733A6A741AF0D165A8
          AA7F48A536FE58E1BA8FE6EEE23FDA8643FBAB5FE888AD07479C7BD9D37777D1
          B14C7FD3C0B620888888888888888888888B5BDB7AE2175DF3D1D41BC4C76BB7
          C14E1BD81CED6527D920F6055C11115CCE8E08986EF8E653F2DB052347A0BA5D
          7EE0AF2222222222222A1DD23526B8BF07B3BA8663ED907E4AA02222B97D1C11
          EB78C72FEE8291BED74BF92BCA8888ABBEDDED0EC82AA279B6E14C47B4AD6BA2
          B37D1F3FFB6EB87FF049FF00D742B62A888BCAC558928B07E1AB9DF2E3275745
          6FA77D4CAEEDDD6B49D0789D3403BCAD3FE37C5B598EF17DDF105C1DBD5771A9
          7D43C6BA86EA78347801A01E002F115E1D86B206D15F85E6C7388ED705C66AB9
          5D0DB61AC88491C71B0E8E9434F0DE2ED5A0F60670E6BC7DB5F66AA0C3B4231D
          E13B7C74346D708EE9434ACDD8D9A9D1B335A38346A435C070D4B4E9F28AA6C8
          88A6AD92336BF82BCDBA1355375765BBE9415BBC746B378FC5C87ECBB4D4F634
          B96D179AE51117CEA0E94F29FAA7EE5A547FCB77A57088A48D9D730E832B7387
          0FE23BA759F06D33E48EA0C4DDE7359244F8F7B4EDD0B81D0772BFB59B656515
          25299862B15074D5B14345505EEF0D0C634F5E8AA36D3FB53C39C3232D78768E
          A282CAC6EE4B3D4E826A9D0EA06E82435BAF1D3524F0E5C9573444561B67FC97
          A88EB20C517DA730B63F3E869656E8E73BB2570EC03B077F1EC1AD8C533651DB
          C52E1A7D491E754CCE76BF55BE68F782B3845F1AB884D4B34646A1EC7348F485
          A567FCB77A57088A6FD98F69176415CAED1D5DB1F75B45CC46658E19032489EC
          DEDD7B751A1E0E208E1D9C7871B351748865FBA3264B1E2363F4E01B04041F5F
          5C156CDA7B69A7E7D555B68E82DD25AAC56E73A48E39DE1D2CD23869BEED380D
          0700013CCF1E3C20952CECA576759B683C193B4FF2956EA73E2248DD1FEF2DA9
          CF0B2A617C52B43E37B4B5CD77220F30ABEE2CB34760BF5551C52B65898ED584
          3B5201E3A1F10BC74585E71615762FCBDBAD142CDFAA63054400732F61DED078
          91A8F5AA43C9111111176ED577AEB157455B6DACA8A0AC88EB1D452CAE8E461E
          F0E69042B17957B75635C1F3C34D89B7715DA468D719B48EA983BDB201E77EB8
          24F78578F2AF3930B671D93E11C397013398075F47368CA8A727B1ECD787811A
          83D84ACDD1155BE90F6EB935657775F621FF00DBCEB5E6888AD4F47747AE6DDF
          DFDD6478F6CF0FE4B60E888888888888888888888B565B5FC8F9768CC625FAEA
          2581A35EE14F101EE50E2222B77D1CD736C58DF16DBF51BD3DBE39C0F0649BBF
          ED02BEA88B1AC5F993857004224C457FB7DA3786F359553B5B23C7D566BBCEF5
          02A19C45B78E57D95CF6D1CD74BE39BC01A2A3DD69F5CA59C3D4B08AFE91BB14
          6EFE2583AE13B7BE7AB6447DCD72F3C749153EFE9FA0326EF7FC2C35F6752BBF
          43D2396491DFC7306D7C0DEF86B1927DED6ACCAC1B7C6595D9CD6D68BBD949E0
          5D55481ED1EB8DCE3A7A94CB82F35F07E62309C3988A82EAF0DDE7430CC3AD68
          EF319D1C3D616588A83748BC9AE606166775B1C7DB2BBF255211115D4E8DC8F5
          9F3024EE6D0B7DA6A3F257711111578DBBBFF60159FF00F7E9BFAC56B59159BE
          8F9FFDB75C3FF824FF00EBA15B15444551FA40B34FE06C276DC0F47369557670
          AAAC0D3C5B4EC7798D3F69E35FFB33DEA83AF4F0BE1EABC5B892D765A0675959
          70A98E9A26F66F3DC1A35F0E3C56E1707617A3C15856D361A06EED1DBA9A3A68
          F868486B40D4F89E67C4AEDDEACF47886D15B6CB840DA9A1AC85F04F0BF93D8E
          04381F515A91CE5CB4ABCA4CC5BBE1BAADE7C74F26FD34EE1FCB40EE31BFD638
          1EE208EC58522203A15B47D92F367F855CA3A07D54DD65E6D3A5056EF1D5CF2D
          037243F69BA6A7E9077729A51117C6B0E94939FA8EFB96959FF2DDE95C222222
          222B23B35E05C3571B1BAF73C715C2F31CCE618E6D1C2980F92437BCF3DE3EAE
          4558145607034220C256B681A030877B78FE2BDD45F97FC877A1695AAD9D5D5C
          CCFA2F70F7AF9222222290367D739B9E1818B481A5E298927B075835F76AB649
          8DB33C304943667EAEF92FAB1C87833F3F677A8B9CE2F7173897389D493CCAE1
          11549DA072B64C217E92F34109366AF90B8EE8E104A78969EE07891EB1D8A234
          44444445EE60AC6D7ACBDC45497CB057496FB8D33B56C919E0E1DAD70E4E69ED
          07815B3DD9DF3EADD9EB83C5635B1D1DF68F48EE340D77F26E3C9EDD78963B43
          A7768471D3532BA2AB9D21CFD3266CADEFBF43FF00879D6BC91115AAE8EE7E99
          B37F6F7D95E7FD3C3F9AD832222222222222222222222D626DB56D7D06D15886
          5737759570D2CECF11D43184FB585414888A74D8B315B30BE7F59592BB721BA4
          52DBDEED7B5CDDE60F5BD8C1EB5B3C4559B6CEDA1EE594F6AB7E1DC3928A6BED
          D6374B256680BA9A007775603F39C7500F6069EDD08D78DCAE95979AD96B2BEA
          E7ADAB95DBD24F512191EF3DE5C7895D644445F7A2AEA9B6D5455549512D2D4C
          4E0E8E685E58F61EF0471056C5362ECFEB966BE1EB858B10CFE557CB3B58E6D6
          3BE5D4C0ED402EEF7348D09EDDE6F6EA4D955AFDE9137EB9A38719D82CE0FB66
          93F255451115DDE8DD6014B8F9DDA5F423DD3FE6AE9A2222AF1B77103206AC13
          CEBE9B4FDA2B5AC8ACE747BB4BB3B6E47E8D92727FEFA05B14445F1ADAC86DF4
          73D554CAD869E063A492479D1AC681A924F70016A3B3B73226CD8CCDBE62390B
          BC9EA262CA48DDFDEE06F9B1B74EC3BA013E24AC19592D8270AD25FB3A64B8D5
          98C9B4504953046E23532B888C103B746BDDC7B0E8B63BA8EF09A8EF0AA0F488
          60CA0AAC2387B14B5D14773A5AAF2070D4074D0BDAE7E9E3BAE6F01F5DCA8722
          229EF631CD6FE0E33729A86AE6EAED17F0DA09F78E8D6CA4FC4BCFA1C7775EC0
          F256CD511175EBCE943507FEADDF72D2C3FE5BBD2B84445F53493B606CC61904
          2E3A090B4EE93E95F24445DDB3DF2E187EB1B576DAC9A86A5BCA481E5A7D074E
          63C14ED96DB4DCEDA88A831635B244E21A2E513774B3EDB47023C469E82AC5D3
          D445570473C12326864687B2463816B9A788208E61585C0D502A7095ADED3A81
          0867ECF0FC17BA8BF2FF0090EF42D2C57BFACAEA87FD291C7DEBE088BD6C2B85
          6EB8DF1051592C94525C2E758FDC869E3D3571D352493C00001249E00024A9E2
          6D8233422A1150DF81A697775F256569126BDDA9606EBFACA0CC63826FB97F7B
          96D1886D93DAAE318D4C33B798EC7348E0E69E3C412382F1167391F446BF3530
          FC6DD7CD98CA48FA8C73BF057651111752EF68A3BF5B6A282BE9D955493B7724
          89E3811FEFDBD8AA4E6CE475C700CD2D7D0B5F5F612ED44C06AF80760900ECFA
          DCBD0A2E444444445256CF19A9519459A768BC898B2DD2C8296E0CEC7D3BC80E
          2477B783878B42DB231ED958D7B48735C35041D410BF4AAAF488BF4CA6B033BE
          F4C3EC826FCD6BE51115A3E8F17E99CB7A6F7D8A53FF00DC40B61A8888888888
          88888888888A87F48AE12929B15E17C4AC67C4D5D23E824701C9F1BCBDBAFA44
          87F64AA7E888BBB64BBD4E1FBCD0DD28A43156514ECA88641F35EC70734FB405
          B82CBDC6747987826CD88E808F26B8D33260DD75DC711A3987C5AE05A7C42C85
          523E90ACB5BAD65CAC78DA929E4A9B74149F07D5BA304F9390F73D8E77707758
          E1AF2D401DA152B444444578BA3E32C6ED6965F319D7D3C949435D0368E8448D
          DD33B77B79F2007E6821A01EDF3BB95CE540BA45612DCC7C332E9C1D6A2DD7D1
          2BFF00355311115C7E8E2BD321C418D6D25C3ACA9A6A6AA6B7C2373DAE3FE95A
          AF4A2222AD1D2015ECA5C90A581C7CFA9BBC11B47A19238FF556B9915A6E8EFA
          773B37EFB369E6B2C72349F133C3A7DC56C291156DDB9B353F4232B061FA49B7
          2E9889C69C869F3994CDD0CA7D7AB59E21EEEE5AE145F5A4AC9E8276CF4D3C94
          F337E4C913CB5C3D042F5FF4EB127FD20BA7F9649FF993F4EB127FD20BA7F964
          9FF9979D71BBD75DE46C95D5B515AF6F00EA895CF23D64AEA2222E58F744F6BD
          8E2D734EA083A1056D7F66DCD36E6E6535A2F12CA1F7381BE47701DA276000B8
          FDA05AFF00D6528222E95EE4EA6CD5F27D182477B1A56975FF002DDE95C222CA
          F29B0FC18AB33F09D9EA9A1F4B5B74A6826691A831BA46870F66AB6F62D74628
          0510A483C8C304629FAB1D586E9A6EEEE9A69E0A9E6D8BB2D59E930CD5639C21
          6E8EDB5145F1972A0A566EC52444F1958C1C1AE6EBA9034046A798E347111115
          8DD97F30A5A8F28C2B5B29788D867A22E3C86BE7B3DFBC3F595E1C9EBB89ED55
          36F73BE3207F58C07E8BBFF507DAA4245F0AE9C52D1544CEF931C6E79F50D569
          5E43ABDC7C4AE1115A5E8F4B4C5579B979AD9230F7525A5FD593F35CE9631A8F
          1D3787ACAD83CF3C54B13A59A46C51B46AE7BCE800F12AA5EDBEEB1E39CBCF2A
          A2A7F28B9D9A66CACAE034F8B710D7B07691C43BF5068A83A9C3655C38EACC55
          71BC3D9AC3454FD531C7F9C79ECFD50EF6856891351DE8A2FCD8CF2A2CB8A98E
          DD4F4BF095D5ED0F7445FBAC85A79171D0F13DDDDC7870D7C9CB8DA428316DD2
          2B5DDA8C5A6AE6706C32B64DE8A471E4D3A805A4F673054C9246C9A3731ED0F6
          3868E6B86A08EE2A1ACC0D9A6D1885F25658646D96B5DC4C1BBAD3BCFA07167A
          B878280717655626C12F71B95B2434C395541F19111F6872F5E8562488888883
          815B6DD9FB15331764E612AD33B26AA16D822A8D1DA9123581A49EED4B49521A
          A9DD228FD32CF0DB7BEEDAFB2193F3540111159CE8F77EEE765C87D2B1CE3FD3
          407F05B1444444444444444444444450E6D65966FCCEC98BB52D2C7D65CADA45
          CA91A06A5CF8C1DE68F1730BC01DE42D5972444456FF0060FCF38EC574972FAF
          35019475F219AD72C8EE0C9CFCA8B8F20FD351F5811CDCAF8AF9CF047530BE19
          A36CB13DA5AF63C6AD703CC1079851FD6ECEF9677095F2CD81EC9BEF3A931D1B
          19A9F4340549F6D4C87B1E525FECB74C3501A2B55DDB2B5F45BE5CD86566E925
          A49D435C1E3876169EC200AD688BEF41433DCEBA9E8E9A332D45448D8A38DBCD
          CE71D001E9256D1B2CF657CBEC0364B747361CA1BBDDE28986A2BEBE2EBDD24B
          A0DE7343F50D1AF2000D3876F1530C71B626358C68631A340D68D000BF4A91F4
          8FDA5C27C0F736B75616D553BDDDC418DCD1EF77B152B444526ECE199EDCA5CD
          CB35EEA1E5B6D7B8D25769FCC49C0BBC774EEBF4FAAB6BF4F3C7550473432365
          864687B2461D5AE691A8208E617D111150DE90ACC782ED892C78368E6127C16D
          755D6869E02590011B4F8866A7D120550515C6E8E3B53A5C438D2E5A799052D3
          D3EBE2F7BDDFECD5EA45C39C1AD249D00E24AD54ED419A9FC2CE6EDD6E34F375
          B69A33E4341A1F34C4C27CF1F69C5CEF4387728991111111111597D85335BF43
          3331F86AB26DCB662168899BC7832A9BA98CFEB02E67892DEE5B19445E3E3298
          53611BDCAE3A08E8667127B348C95A6877CA3E95C2229136767B63CF4C0C5C35
          1F0B538F5978016DB1756E96DA7BCDB2AE82AE213525542F8268DDC9EC7021C0
          FA412B4EB8E70C4D82F195EEC33EBD6DB6B25A524FCEDC7900FAC0D7D6BC3444
          59065FE207617C6B66B987EE360A96190FFD593A3C7EC92B611857104986EF10
          56C7AB983CD9183E730F31F8FA40560282BE0B9D245554D20960906F35CD5D85
          8FE6157B6D78071256B8E8DA7B6D4CC4F706C4E3F82D3793A92888AC66C4D8C6
          6C258E3107510B2696A2D9A0EB09D1BA4ACE3A0E7CD59ABD625B9620977EB6A5
          F2B41D5B18E0C6FA00E0B18C4F638F12E1DB95AA576E32B207C3BDF4491A03EA
          3C554C1B39E39371F26F8362116F69E546A63EAF4FA5CF7B4F56BE0ACDE59E01
          A7CB9C2D0DAE2789E72E32D44E069D64874D48F000003D0B2B51F675664FF075
          85BACA62D376AC262A56BB8EEF0F3A423B43751EB21542AAC5579ADB81AE9EE9
          592566F6F75C6776F03E075E1EA569367BCCCAAC7362A9A1BA4BD75CEDE5A0CC
          79CD1BB5DD27C410413E8ED500677CCF9F35310BA43AB84E1A3D018D03DC02C1
          812D2083A11C410ADF641E687E9CE1F36FAF9B7AF56F686C85C78CD1F26C9E27
          B0F8E87B54A884070D08D4771584E28C99C238B37DF55698A9EA1DFF00BC51FC
          4BF5EF3A7027D20A86F17ECAF70A26493E1EB832E0C1C452D5011CBE80EF924F
          A77542172B655D9EBA6A3AEA79296AA176EC90CAD2D734F885D6444457F3668B
          BCF85B076149378B62929DA2669E4E63DDAFBB5042B68AA1F48CD486608C254F
          DAFB848FFD98F4FDE542D111590D816A853E7B3A33FDFED55118FDA63BF756C8
          11111111111111111111117046A16B0B6B7C939328F3227A8A280B30E5E5CEAA
          A273479B1389D6487C3749E1F54B7C541A888BF70CD2534CC9627BA296370731
          EC3A39A47220F6157D366CDB52DF7FA2A4C398FEAD96FBC4604705E253BB0D57
          60EB4F263FEB1F34F81E06DB4334751132489ED923780E6BD8750E0791057ED5
          00E902CCAB7E25C6165C2F6E9D9506C8C95F58F8CEA1B349BBF17AF7B5AC1AFD
          AD3982AA72229EF62CCB87E3ACEAB7D74B097DB6C23E1099C470EB070847A77F
          477A1856CD511575DBAF05BF13E484B708185F3D92AE3AD21A352633AC6FF50D
          F0E3F656B6511115ADD97F6C6397D474B84F19996A70FC643292E4D05F25137E
          839A38BA31D9A716F2008D00BDB86B15D9B18DAE3B958EE74B75A193E4CF4B28
          7B75EE3A723E07885EB2F9CD3C74D13E59646C51B01739EF3A0681CC92AB767B
          EDA5867005054DB70A54C189311B81636481DBF4B4C7E93DE383C8FA2D279712
          16BC6F77AAEC4777ACBA5CAA64ACAFAB95D34F3CA7573DEE3A92574916C57603
          C192583286AEF53C65935EEB9D24648D358631B8DFE9759ED566D140FB63E6D8
          CB2CA7AAA3A49FABBDDF77A869834E8E64647C6C83D0D3BBAF617B4AD63A2CC3
          2D32971466EDE24B7618B63ABA585A1F3CAE788E285A4E80B9EE200D78E8399D
          0E80E8A6AA5E8FACC9A86B4C970C3D4C48E2D92AE5247ECC4577BFE0EEC7DBBF
          FF003D8777BBBAE9F4FF0054BAF2F47A6633012DBB61B93C0554E0FBE15E25C3
          613CD5A2D7A9A1B6D769FF0037AE68D7F6F754438EB2CB14E59D7B28F13596AA
          D1348098CCCD059269CF75E356BBD44AC611117DA86B67B6D6D3D5D2CAE82A69
          E46CB14AC3A398E69D4107BC10B6E3927993066C659D9311C45A27A88432AA36
          FF007B9DBE6C8DD3B06F0247810B394580E7DDEE3C3D92D8DAB647F57BB69A88
          98EFAEF61633FA4E0B51A888B33C95AC6DBF3870454BCE8C8EF546E71F0EB99A
          FB96DF516B5F6EBC1FFA379E551708D9BB4F7AA48AB010386F81D5BC7A7CC0E3
          F6957744441C0ABEF81AE7F0CE0DB2576F6F3A7A389EE3F58B06BEFD567585F1
          A57E1694881DD75338EAFA790F9A7C4771525DAF35ACB5AC6F94BA4A190F36C8
          D2E6EBE047E3A2C3B68DCC5B352645E33753DC629259EDEFA56B1A7CE265D23E
          5FAEB568888A5DD97EAC536653E33FDFE8658C7ED35DFBAADAA222F8D6D6C16E
          A49AAAA656C14F0B0C9248F3A35AD035249549B36B1F3F30F185457B0B9B4110
          EA6923770D231DA47793A9F5E9D8B0C539EC9D13CE2BBCC835EADB441AEF4978
          D3EE2B17DA26D6EB766A5C9FBBBACAA8E29D9E237034FBDA5468BD9C1F8AEB70
          5621A4BBD03B49A076A584F9B234FCA6BBC08575B02E3DB566059995D6D98170
          004D4CE23AC85DDCE1F71E4564688ABDED6367A26D1D92E81AC65C1D23A02473
          923D35E3DFBA7FACAB8A222ECDB2DF35DAE34B454CC3254544AD8A368ED738E8
          07B4ABFD64B6C765B4505BE1FE4A9208E067A1AD007DCAD345AF56CD79E83554
          A7A482E4DFFF0042D003E70F2C9DC3C3E2837F795284445386C5F7616BDA230D
          35E7465536A29C9F130BC8F780B6808888888888888888888888B0BCDDCABB46
          71608ADC3B766EEB641D653D4B46AFA69803BB237D1AE847682476AD56665E5B
          5EF2A716D661FBED3186AA03AB246EA639E33F26461ED69F77107420858B2222
          2CEF02E7AE3DCB689B0E1EC4F5B434ADE2DA57B84D00F446F0E68F50595DFF00
          6C1CD8C436E7D14D8A1F4B0C8DDD7BA8A9E282423EDB5A1C3D44286E495F348E
          924739EF712E739C7524F792BF28BB16EB7D4DDABE9E8A8A092AAAEA246C50C3
          134B9F23DC740D00732495B4CD99B2523C93CB98286A1AC75F6B88A9B94CDD0F
          C611C2307B5AC1C3C4EF1ED52E222E9DE6D14B7FB456DB2BA16CF45590BE9E78
          9DC9EC734B5C3D6095A98CEDCA6B8E4D63FAFB056B5EFA66B8CB4556E6E82A20
          27CD70F1EC23B082B0244445E8597115D70DD58AAB4DCAAED752394D473BA278
          F5B482B378368FCCFA688C6CC737A2DEF92A9CF3ED3A958DE24CC9C598C5BB97
          CC4975BB47AEA23ACAC92460F4349D07A82C711166794396173CDDC776EC3B6D
          63875CF0FA9A80DD5B4F00237E477A072EF240ED5B6BC3787E8B0A61FB759ADD
          108282820653431F731AD006BDE78713DABD258EE3ACC0B065B5827BC621B943
          6EA2881D0C87CF91DF458DE6E71EE0B5739F99CB5B9DD8FEA6F73B5F4F6F8C75
          14146E3AF5308274D7EB124927BCE9C8051BA2D8EEC1165B7D06489AEA631BEB
          ABEBE6755B9A41734B346B187D0D01C07D727B5593444503EDB0CB3BF67FBD8B
          A3E165489607506FE9BFD7F58DE0CF1DCDFD74F9BBCB58E8888ACA6C61B40526
          55E24ABC3F882A85361BBB383C54487CCA5A80340F3DCD70D1A4F668D3C815B1
          3A0B9525D6963A9A2AA86AE9E41AB268240F63877823815D82401A9E0151FDB6
          B691B5620B4BF2FF000CD5B2E11999AFBA56C2EDE8BCC3AB6169E4E3BC039C47
          01BA071E3A5304445F7A0AD96DB5D4F5703B7268246CAC77739A7507DA16DEB2
          BB33EC79B184E8EF764AC8A76C91B7AFA70E064A6934E31BC73041D7D3CC6A0E
          AB2F5547A423027C3197767C4F0C7BD359AABA999C072866D06A7D0F6C63F58A
          D7EA2222B51B3A6645AEAF08D2E1FABAC8A9AE746E73238E670699985C5C0B75
          E646A469CF829A9142DB526238A8305D2DA1B20F29AFA86B8B35E3D5B3893FB5
          BBEFEE55591116499738B4607C676CBCBA374B153BC8963673731CD2D769E3A1
          2478856F6CF9C3836F7131F0620A388B86BB9552752E07BB47E8BD86634C3F20
          D5B7CB6B8778AB8CFE2BE15398585E91A5D3622B5B00EFAC8F5F66AB14BFED0F
          82EC91BFAAAF7DCE603845471176BFAC746FBD4019A19DD76CC5068D8CF836CE
          1DA8A58DDABA423917BBB7D1CBD3A6AA3745693656C3DE4384AE1767B7492BEA
          37187BD918D35FDA73BD8BC8DAC30C9920B3DFE3613D59751CCE1D80F9CCF7EF
          FB42AE48BBF63BFDC70D5C195B6BAC9A86A99CA485DA123B8F78F03C14D785B6
          ACB85246C86FD6B8EB80E06A695DD5BFD25A7504FA3459DD2ED4183A78C3A465
          C69DDDAD92007FAAE2BA179DAAB0ED2C0EF836DF5D5F3E9E689436267ACEA4FB
          957FC7F98575CC5BB8AEB9BDAD6C60B60A78B847137B8789ED2789F5058CA222
          9DB667CB792E17538A6BA2228E975651870FE525E45C3C1A351E93E0AD459E90
          D7DDA8A980D4CB3319ED202B1D3D445494F24D3C8C8618DA5EF91EE0D6B5A06A
          4927905AC6DB0737A8336B34CBECF28A8B35A601454F3B7E4CEEDE2E7C8DF024
          E83BC341ED5062222F530AE24ADC1D892D97CB6BC475D6FA8654C2E2351BCD70
          2011DA0E9A11DA16CD724B6A8C1F9C74F4F48DA96D9B11B9A03ED556F00BDDDB
          D53F9483C079DDE0299D111111111111111111111147D9CD9258773B70D9B65E
          A131D4C5ABA8EE1081D7533CF683DAD3C3569E07C08046B6739720715649DD8C
          378A43516C91E4535D69DA4C130EC1AFCD769F34F1EED47151B22222222EED9A
          CB5F88AE94D6DB5D1CD5F5F52F11C34F4EC2F7BDC7B000B61BB2C6C9F4F9534F
          1624C4F145578BA56FC545A87C76F691C9A791908E6E1CB90ED26CB222228EB3
          BF246C79E3850DAAEA0D3D643AC945718DA0C94D211EF69E1AB7B741C88046B3
          335F26B13E4DDF9D6DC4142E8E3738F93D7440BA0A968ED63BD9A83A11AF10B0
          74444444459665B657623CD8C45159F0E5BDF573B8832CC4110D3B3E9C8FE4D1
          EF3C802782D98E40E41D9F22B0BF91D296D65E6A835D5F72737474AE1C9ADFA2
          C1A9D07ACF12A5355876C0DA72ED93B536FC3786638A3BD56D3795CB5D3B03C5
          3C45C5ADDC69E05C4B5DC5DA800723AF0A0F8AF1ADFB1D5C9D70C4177ABBBD59
          D7492AE52FDD1DCD07834780D02F15117BD8471EE22C055DE5987AF55B679CE9
          BC69262C0FD3B1CDE4E1E04157FF0063CDA3EED9CB4774B2E2411497BB646C99
          B590B03054444E84B9A380703A720010E1C069C6C9A283B6B2CF4AFC91C0B493
          59A289F7ABA4E69E9E59DBBCC81A1BABA4DDED2356800F0D4EA75D343AE1C699
          85893312E5E5D892F35777A91AEE9A89356C60F30C68F35A3C1A0058F222222C
          8306E60622CBFBAC570C3F78ABB5D4C6E0FD609086BF4EC737938781042B6BB5
          CE7AE22A9CA8CBD82DF2C9698F155B057DC4C04B4BC16467AA6BB9866AF3AF78
          D3B35D695222222C932FF312FF0096388E9EF587AE1250D5C446F35A4F573375
          D4B246F2734F71FBF8ADB4E5CE308F1FE04B16228A3EA5B72A38EA0C5AEBB8E7
          37CE6EBDBA1D47A97D31F60EA2CC1C1978C3B701AD2DC699F039DA6A5848F35E
          3C5AED1C3C405A84C59862E182F12DCAC77484D3D7D04EE825611DA0F31DE08D
          083DA082BC9444407453BECD5985767E27FD1DABAA96B282785CE89B2B8B8C2E
          68D7CD279348D469DFA7AF39CE6CF77602AF365B552B2A2EBD587C93CFFC9C21
          DC8683E53B4E3DC351CF92AC3887125CB15DCE4B85D6AE4ACAB7F02F7F60EC00
          0E007805E6A222226A8888BB16DB7CF76B8535152C665A9A891B146C1CCB9C74
          015F5C2987E1C2986EDD69A7D3ABA485B1EF01A6F3BE73BD6753EB5D7C718560
          C6B856E3679C868A98F463C8F90F1C5AEF5101516BCD9EAEC174AAB75742E82A
          E99E6392377611F78EDD7B574D111111114A19459255F8FAAA2AEAF649456163
          B574A468EA8D3E6C7E1DEEE43C4AB736DB6D2D9E820A2A28194D4B0303238A31
          A0681D8B34CB1B79AEC5D4CED35653B5D33BD4341EF2155EDB333FEF78AB1D5D
          705D0554B43872D52F934D0C4E2D357337E59934E6D0ED406F2E1AF3E558D111
          117EE09E4A69A39A191D14B1B8398F61D1CD238820F6156D30FEDC18DE86C56E
          A696D4CAF961A68E37D54B138BE621A01793AF1279FAD5F94444444444444444
          4444445D4BADA286FB6F9E82E349057D14EDDC969EA631246F6F7169E05551CD
          9D802CB7D926AFC0D70F806A9DABBE0EACDE9299C7EABF8BD9FD2F001550C7BB
          3AE61E5C3E4377C33586959AFF001DA3679441A7797B35DDFD6D0A8DC82398D1
          1117A363C3976C4D5ADA3B45B2B2E954EE5051C0E95E7D4D04AB0D965B08E38C
          5D2435388DF0E14B6BB42E6CC44B54E1E11B4E83F59C08EE2AE9E51E4160FC98
          A1EAEC36FDFAF7B7766B9D5E9254CBE1BDA79A3EAB401EBE2A464444445E4E27
          C2967C69679AD57DB6D3DD2DF30F3E0A9607375EC23B88EC2388EC5507357A3D
          D92C93D7601BB887525C2D57424B478326009F40703E2E55771BE4663CCBB964
          17DC3170A5859CEAA38BAD834FF18CD5BEF582904731A2222004F21AACDF0464
          9E39CC57B3E00C335F5D0BF80A93175707FDE3F46FBD59CCAEE8F699D2435B8F
          2F2D6463471B5DA8EAE3E0F948E1E21A0F8395BFC19816C397B648AD3876D74F
          6AA08F8F570378B8FD2738F173BC49257BC8A9F6DD79157EC67556BC6787A865
          BA3E8E97C8AB6929985F2B630F73D9235A38B86AF783A711C0F2D74A272C3241
          23A3918E8DED3A39AE1A107B8AFC222F4AC186AED8A6E11D0D9EDB5574AC90E8
          D82921748F3EA016C3F63AD9DEE593965B8DE31106C57EBB358CF246383BC961
          692435C4702E713A9D350341C79AB1E8A19DA9F23E7CEFCBD651DB646457CB74
          DE5545D69D1929DD21D113D9BC34D0F7B46BC355ACFC5382AFD822E525BEFD68
          ABB4D5B091D5D54459AF8B4F270F11A85E2A2222FD450C93C8D646C748F71D1A
          D68D493DC14EB92BB21E32CCEBA52CF74B7D461CC381C1D356D6C7D5C8F6F745
          1BB8927B1C46E8EF3C8DD6CF3D9C2D19B99756EC3F4B236D559658C36D35046F
          3620181BD5BBB4B1C1AD074E23741E3A6875E99879038F32C2A666DEF0F55B69
          63FF00DFE95866A670EFEB1BC07A1DA1F051E904731A2222004F21AA94B29F66
          EC6F9B572A76505A67A0B539C3ADBAD6C663818DED2D27E59F06EBCC6BA0E2B6
          8B83B0BD2609C2968B050EF1A4B6D2C74B1B9FF29C1AD0353E274D4FA57B2AB4
          ED6BB2E3F37206E25C34C8E3C554B16E4903886B6BA31C9BAF20F1C813C08E04
          F01A6BCAF563B861CB9CF6EBAD14F6EAF81DB92D3D4C6637B0F883C5749117EE
          1864A8959144C74B23C86B58C1A9713C800AD16CF594557849B2DFEF31182E35
          11F57052BBE543193A92EEE71D070EC1E9D0629B47E59DDE7C4CEC476FA496BA
          8AA226367EA1A5CE85ED1BBA9038EE90071F4EBD9AC0EF89F1B8B5EC735C3982
          342B8DD3DC5374F714DD3DC5374F714DD3DC5374F714DD3DC5374F714DD3DC57
          1A688AC0ECC996CF9AADD8B2BE12D863063A10F1F29C783A41E006A07893DCAC
          8A2C2730F28AC398CC1256C4EA6B835BBACADA7E0F03B0387270F4FA88501E27
          D98F1459DCF7DAE4A7BD538E23AB77552E9E2D71D3D8E2A36BC60FBE61FDEF84
          AD15B44D69D0BE681CD6FB74D0AF21111002E3A01A9F0598E17CA2C598B9CC34
          5689A3A777FEF3543AA8C0EFD5DCFD5AA9DF00ECCD69B0BE3ABBFCCDBCD5B742
          29DA0B69D87C4737FAF41E0A688E36431B638DA18C680D6B5A34000E4005FA52
          BE4DDAFABA2AEAF7378C8F11309EE1C4FBC8F62AD1B5AEC977FBCE2BAFC6B836
          95D758EBB496BAD911F8E6480685F183F2C3B4D4B471D75D01078537B95A6BAC
          D56FA4B851D450D547C1F0D4C4E8DEDF482010BAA889A6ABD3B2616BCE259FA9
          B45A6BAE936BA757474EF95DEC682A7ECA9D8731BE32AFA6A8C4B07E8AD9490E
          90CEE0EAA7B7B43231AEE9FB7A69CF43C95F5B3E57615B25A68ADD4D62A234F4
          90329E33242D7BB75AD0D1AB88D49D0732B2A4444444444444444444444445C1
          1AAC5712653E0CC60E73EF585AD37295DCE69E8D864FDBD37BDEB01B86C71945
          717173B0932079EDA7ACA88C7B049A7B974A2D89728A376AEC3B3C83B9D70A8D
          3DCF0B22B36CB7955627B1D4D82ADD216F2F2B0FA91EB1239DAA91AD363B7586
          98535B28296DF4E39454B0B6360F53400BBC8888888888B8201E635589620CA2
          C118A8BDD76C2767AF91FC4CB2D14664FDBD37BDEB08AFD8FB28AE2E2E930845
          1BBBE0ABA88FDCD9005E69D89328B7F7BF47A7D3E8FC2151A7F5D7A341B1E651
          5BE40F66108E478FE7EB2A241EC74847B966D87B27B03E147B64B4E12B3D0CC3
          94D15147D67ED91AFBD65E001C868B944445E1DF70361BC5075BCD82D9763A69
          AD6D1C731D3F58158855ECD595D5A499303DA1BAFF00350757FD5D174BFB9532
          A37B5FD0BA1D7ED49A7F597A141B386585B5E1D0E07B2B88E3F1F4AD947B1FAA
          CE6D161B65829FC9ED96EA5B741FCD5242D89BEC680177D1117C2B2829AE1098
          6AA9E2A988F38E660734FA8AC4AE392B97F76739D5782AC13BDDCE475B61DE3F
          ADBBAAF165D99B2B65F95822D23ECC5BBF715D597654CA897E560BA11F65D237
          EE72F9B364DCA58CEA306519FB534A7EF7AF468B66ACAEA020C581ED0ED3F9E8
          3ADFEB6AB30B1E07C398674F81EC36CB569C079151C70E9FB202F6D170403CC6
          AB19BD65860FC48F2FBAE15B35C643F3EAA82291DED2DD562F53B31E56553CB9
          F822D4D27F9B8CB07B1A42EB0D9532A1AED460BA1D7C5D21FDE5DBA5D9A32BA8
          DDAC7822D2E3FF005B0F59FD6D564F65CB2C21871CD75AB0B59ADCF69D43E968
          228DC0F7EA1BAAC9400390D17288B0BCCCCA5C379A7677D25EED349593B5A7A8
          A99631D6447C1E3CE00F6805541C43B2961586BE7A7736E36C9A371698E19C38
          0FDB6B891EB5E30D9470DEF71BADD0B7B83A3FFC8BD1A0D98306D238198DC2B7
          4E626A8001FD96B567986F2FF0EE11E369B45351C9A69D686EF49A7DB76AEF7A
          C81171BA3B826E8EE09BA3B826E8EE09BA3B826E8EE09BA3B826E8EE09BA3B82
          FC4B4D0CE349226483B9CD057995B83EC3711A55D96DF523FEB6958EFBC2F0E5
          C9AC1534CD95D8768C39A7501AD2D6FB01D165F4F4F152411C1046C8618DA1AC
          8E3686B5A072000E417D1117BD84F085662AACDC887554CC3F1B50E1C1BE03BC
          F829AEDB862DD6BB4BADD1D331F4CF696C8240099351C4BBBD40599B91187ADF
          5AEA8970FD055D0CCEF326753337D87E89769AFA0F6A8CEAB21302551D5D6163
          0F7C53CACF7072EA7F739E04DED7E0B974EEF2A97FF32EE52E42E04A43AB6C2C
          79EF96795FEE2ED164D69C1961B096BADD66A1A378E4F869DAD77B74D57B288B
          9682E2001A93C0056270C5A458EC14547A68F8E31BFF0068F177BC95EA2F36F1
          86ED38861EA6EB6BA3B945CB72AE9D92B7D8E056155FB39658DC8932E06B2B09
          FE6291B17F5345E71D9572A1CED4E0BA1D7C1D201FD65D8A7D98B2B299C1CCC1
          36B247F391978F61257BF6CC9CC0765707D0E0CB0D2C83FBE476E843BDBBBAAC
          B29E961A389B1410C70C6DE4C8DA1A07A82FAA22222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222C3330F
          048C434BE5948C02E30B790FEFADFA3E9EEF67A216735CC716B816B81D082388
          2BF2888888888888888888B2CC19806AB1348D9E6DEA6B703C64238C9E0DFCD4
          D36EB753DAA8E3A5A589B0C118D035BFEFC4AECAF856D14171A4969AA636CB04
          8375CC7722141D8D7064F856B756EF4B4121F8A97BBEABBC7EFF00BB19444445
          9365DD94DEB13D307375869FE3E4EEE1C87B74F7A9E111111111111111111111
          1111111111111111111111111111111111111111111111111111111111111111
          11111111147D98797FF0A07DCEDB1FF1B03596168FE57C47D6FBFD3CE23734B5
          C410411C082B84444444444444445C8049D0712A47C13962EAAEAEBAF0C2C87E
          53294F073BC5DDC3C14A91C6C8636B18D0C63468D6B46800EE0BF488BAD71B75
          3DDA8E5A5AA8C4B04834734FDFE9506E32C1B53856B3B66A290FC54DA7F44F71
          FBD6388888A69CACC3FF0005587CAE56E9515843F8F30C1F247DE7D6166A8888
          8888888888888888888888888888888888888888888888888888888888888888
          88888888888888888888888888B04C77974CBD7595F6E6B62AFE6F8F9365FC9D
          F7FBD441514F2D2CCF8668DD14AC3BAE63C6841F10BE68888888888888BB76BB
          555DE6AD94D470BA799DD8DEC1DE4F60530E0ECB9A5C3E195357BB57701C4123
          CC8CFD51DFE3F72CC91111175AE36EA7BAD1CB4B55109609068E69FF007E6A11
          C65822A70B54191BACF40F3F17369CBEABBB8FDEB1844590E08C32FC4D7A8E27
          34F924443E777D5EEF49E5EDEE53DB18D8DA1AD01AD0340072017E9111111111
          1111111111111111111111111111111111111111111111111111111111111111
          11111111111111111111116398B30450E2988B9E3A8AC68D1950C1C7D0E1DA14
          378870BDC30D5498AB212184F993378B1FE83F8735E4222222222222CB70A65D
          57E222C9E6068E84F1EB5E3CE78FAA3F1E5E952FD8F0F50E1DA4EA28A11183F2
          9E78BDE7BC95E922222222F954D3455703E19E36CB13C68E63C6A0851762ACA7
          9A17BEA2CC7AD88F134AF3A39BF649E7EBE3E951F55D0D4D04A62A9824A7907C
          D9185A7DEBD0B0616B8623A96C74903BABD7474EE1A319E93F829C70D61CA6C3
          16C652D38DE773925238C8EEFF00FD17AC888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          888BE35747057D3BE0A8899342F1A398F1A82A37C4B9460EFCF66934EDF2594F
          F55DF9FB547370B655DAAA0C3594F253CA3E6C8DD35F11DEBAA8888888BD8B16
          13B9E22900A3A6718F5D0CCFF3583D7F9294B0CE585BECBB93D6695F5638F9E3
          E2DA7C1BDBE93EE599F25CA2222222222FC4913251A3D8D78EE70D57E9AD0D00
          00001D8172888888888888888888888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888BAD5F6DA5BA4061ABA
          78EA233F364683A7A3B961178CA0A0AA2E7DBEA1F46F3FDEDFE7B3F31ED2B0DB
          96585FA8092CA7655B07CE81FAFB8E8563F5768AEA12454D1CF011FCE465BF78
          5D4D0A684F62EFD1D82E570205350544C0F6B63247B564D6BCA6BCD696BAA4C5
          4319E7BEEDE77B07E242CDEC995D67B516C93B5D709876CDF235FB3F9EAB2F8E
          36C4C6B18D0C634681AD1A00BF48888888888888888888888888888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          88888888888888888B8D161F7E03AF97D2BEB8700EBE3E0B2C44444444444444
          44444444444444445FFFD9}
        mmHeight = 20373
        mmLeft = 115888
        mmTop = 1588
        mmWidth = 57679
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 91811
        mmTop = 68792
        mmWidth = 8202
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'C_ANO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 5292
        mmLeft = 82550
        mmTop = 12435
        mmWidth = 14023
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'Desde 1990'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 144727
        mmTop = 23019
        mmWidth = 19315
        BandType = 0
        LayerName = Foreground1
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 13229
        mmLeft = 148961
        mmTop = 31485
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'VALOR_VENDA'
        DataPipeline = dbCarga
        DisplayFormat = ',##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 6085
        mmLeft = 158486
        mmTop = 37042
        mmWidth = 27781
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Pre'#231'o unit'#225'rio de venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 32279
        mmWidth = 33867
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText16: TppDBText
        UserName = 'DBText101'
        DataField = 'NUM_NF'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 18521
        mmTop = 59002
        mmWidth = 46831
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'NF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 59002
        mmWidth = 5556
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 59002
        mmWidth = 8202
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText17: TppDBText
        UserName = 'DBText102'
        DataField = 'DATA_NF'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 82550
        mmTop = 59002
        mmWidth = 21696
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 10848
        mmTop = 73554
        mmWidth = 89165
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 52917
        mmWidth = 11907
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NOME_CONTATO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 52917
        mmWidth = 100013
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        UserName = 'Region1'
        mmHeight = 33073
        mmLeft = 121709
        mmTop = 0
        mmWidth = 67204
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel50: TppLabel
          UserName = 'Label50'
          Caption = 'Depositar o valor R$:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 123031
          mmTop = 2117
          mmWidth = 31751
          BandType = 4
          LayerName = Foreground1
        end
        object ppLabel51: TppLabel
          UserName = 'Label51'
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 122767
          mmTop = 7144
          mmWidth = 10848
          BandType = 4
          LayerName = Foreground1
        end
        object ppLabel52: TppLabel
          UserName = 'Label52'
          Caption = 'Ag:                       Ct:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4234
          mmLeft = 122767
          mmTop = 13229
          mmWidth = 34131
          BandType = 4
          LayerName = Foreground1
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          Caption = 'CNPJ/CPF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4234
          mmLeft = 123031
          mmTop = 18785
          mmWidth = 17728
          BandType = 4
          LayerName = Foreground1
        end
        object ppLabel54: TppLabel
          UserName = 'Label54'
          Caption = 'Cr'#233'dito/NF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 123031
          mmTop = 25400
          mmWidth = 17463
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBText26: TppDBText
          UserName = 'DBText26'
          DataField = 'VALOR_CARREGA'
          DataPipeline = dbCarga
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbCarga'
          mmHeight = 4498
          mmLeft = 156898
          mmTop = 1852
          mmWidth = 26723
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBText22: TppDBText
          UserName = 'DBText103'
          DataField = 'CTB_AGENCIA'
          DataPipeline = dbCarga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbCarga'
          mmHeight = 4498
          mmLeft = 128852
          mmTop = 13229
          mmWidth = 20902
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBText29: TppDBText
          UserName = 'DBText104'
          DataField = 'CTB_NUM_CONTA'
          DataPipeline = dbCarga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbCarga'
          mmHeight = 4498
          mmLeft = 160338
          mmTop = 13229
          mmWidth = 17198
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBText30: TppDBText
          UserName = 'DBText105'
          DataField = 'CTB_CNPJ'
          DataPipeline = dbCarga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbCarga'
          mmHeight = 4498
          mmLeft = 143140
          mmTop = 18521
          mmWidth = 40481
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBText31: TppDBText
          UserName = 'DBText106'
          DataField = 'CREDITO_NF'
          DataPipeline = dbCarga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbCarga'
          mmHeight = 4498
          mmLeft = 142082
          mmTop = 25400
          mmWidth = 43392
          BandType = 4
          LayerName = Foreground1
        end
        object ppDBText32: TppDBText
          UserName = 'DBText107'
          DataField = 'CTB_BANCO'
          DataPipeline = dbCarga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbCarga'
          mmHeight = 4498
          mmLeft = 135732
          mmTop = 7144
          mmWidth = 49477
          BandType = 4
          LayerName = Foreground1
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'dbParcelas'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = dbParcelas
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
          DataPipelineName = 'dbParcelas'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'VENCTO'
              DataPipeline = dbParcelas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'dbParcelas'
              mmHeight = 4498
              mmLeft = 10848
              mmTop = 0
              mmWidth = 26723
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'DESC_PAGTO'
              DataPipeline = dbParcelas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'dbParcelas'
              mmHeight = 4498
              mmLeft = 39159
              mmTop = 0
              mmWidth = 26458
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'VALOR'
              DataPipeline = dbParcelas
              DisplayFormat = ',##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbParcelas'
              mmHeight = 4498
              mmLeft = 70644
              mmTop = 0
              mmWidth = 29633
              BandType = 4
              LayerName = Foreground2
            end
          end
          object ppSummaryBand2: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDesignLayers3: TppDesignLayers
            object ppDesignLayer3: TppDesignLayer
              UserName = 'Foreground2'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 148432
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Frete:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 12700
        mmWidth = 8996
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 19050
        mmWidth = 10319
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Placas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 25400
        mmWidth = 11377
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Indica'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 31750
        mmWidth = 16140
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 19050
        mmWidth = 14023
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 31750
        mmWidth = 14023
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 42333
        mmWidth = 8202
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 27781
        mmTop = 44450
        mmWidth = 65352
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Visto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 95515
        mmTop = 42598
        mmWidth = 8731
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 106098
        mmTop = 44715
        mmWidth = 82550
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Observa'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 56621
        mmWidth = 21696
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NOME_MOTORISTA'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 18785
        mmWidth = 101600
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CONTATO_INDICACAO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 31485
        mmWidth = 50006
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'VALOR_FRETE'
        DataPipeline = dbCarga
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 12700
        mmWidth = 29633
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'QTDE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 46831
        mmTop = 50800
        mmWidth = 23283
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'C_Placas'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 25135
        mmWidth = 101600
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'FONE_MOTORISTA'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 150548
        mmTop = 18521
        mmWidth = 38100
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'FONE_TRANSPORTADOR'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 150548
        mmTop = 31485
        mmWidth = 38100
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Quantidade Entregue:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 50800
        mmWidth = 34396
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Saldo a Entregar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 50800
        mmWidth = 27252
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'SALDO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4233
        mmLeft = 103981
        mmTop = 50800
        mmWidth = 18785
        BandType = 7
        LayerName = Foreground1
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 21167
        mmLeft = 0
        mmTop = 121709
        mmWidth = 138907
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 43921
        mmTop = 121709
        mmWidth = 1323
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21167
        mmLeft = 89694
        mmTop = 121709
        mmWidth = 1588
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'e-mail comercial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 125413
        mmWidth = 42069
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'comercial@biazusacucar.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3705
        mmLeft = 1323
        mmTop = 130704
        mmWidth = 42069
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'e-mail logistica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 47625
        mmTop = 125413
        mmWidth = 40217
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'logistica@biazusacucar.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3705
        mmLeft = 47625
        mmTop = 130704
        mmWidth = 40217
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = 'e-mail financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 92869
        mmTop = 125413
        mmWidth = 42598
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'financeiro@biazusacucar.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3705
        mmLeft = 92869
        mmTop = 130704
        mmWidth = 42598
        BandType = 7
        LayerName = Foreground1
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'dbObs'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 61119
        mmWidth = 197300
        BandType = 7
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = dbObs
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
          DataPipelineName = 'dbObs'
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'TEXTO'
              DataPipeline = dbObs
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'dbObs'
              mmHeight = 3969
              mmLeft = 12171
              mmTop = 0
              mmWidth = 180975
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
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'CTe:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 80698
        mmTop = 31750
        mmWidth = 7144
        BandType = 7
        LayerName = Foreground1
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 21167
        mmLeft = 138113
        mmTop = 121709
        mmWidth = 46831
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'cadastro@biazusacucar.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3705
        mmLeft = 141023
        mmTop = 130704
        mmWidth = 41275
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'e-mail cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 141023
        mmTop = 125413
        mmWidth = 41275
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = '54.3292-2442'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 135467
        mmWidth = 42069
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = '54.3292-1207'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 135467
        mmWidth = 40217
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = '54.3292-9551'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 92869
        mmTop = 135467
        mmWidth = 42598
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = '54.3292-3967'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 141023
        mmTop = 136525
        mmWidth = 41275
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 10583
        mmTop = 6879
        mmWidth = 178065
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'NF.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 2646
        mmWidth = 6615
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'IR. R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 61119
        mmTop = 2646
        mmWidth = 10583
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Valor Nota Fiscal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 128852
        mmTop = 2646
        mmWidth = 27517
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText33: TppDBText
        UserName = 'DBText108'
        DataField = 'NUM_NOTA2'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 27517
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText34: TppDBText
        UserName = 'DBText109'
        DataField = 'IR'
        DataPipeline = dbCarga
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 74083
        mmTop = 2381
        mmWidth = 20638
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText35: TppDBText
        UserName = 'DBText1010'
        DataField = 'VALOR_NOTA2'
        DataPipeline = dbCarga
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 158486
        mmTop = 2381
        mmWidth = 30427
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
  object dbCarga: TppDBPipeline
    DataSource = dsCarga
    UserName = 'dbCarga'
    Left = 120
    Top = 72
  end
  object desRel: TppDesigner
    Caption = 'desCarga'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = Rel
    IniStorageType = 'IniFile'
    IniStorageName = '($LocalAppData)\RBuilder\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 264
    Top = 72
  end
  object QObs: TSQLQuery
    DataSource = dsPonte
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select'
      '   TEXTO,'
      '   NUM_LINHA'
      'from CAD_OBS'
      '   where CODIGO = :ID_CARGA'
      '   and TIPO = '#39'CAR'#39
      'order by NUM_LINHA'
      ' ')
    SQLConnection = DM.BancoDados
    Left = 48
    Top = 128
    object QObsTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 100
    end
    object QObsNUM_LINHA: TIntegerField
      FieldName = 'NUM_LINHA'
    end
  end
  object dsPonte: TDataSource
    DataSet = QCarga
    Left = 48
    Top = 80
  end
  object dspObs: TDataSetProvider
    DataSet = QObs
    Left = 120
    Top = 128
  end
  object Obs: TClientDataSet
    Aggregates = <>
    DataSetField = CargaQObs
    Params = <>
    Left = 192
    Top = 128
  end
  object dbObs: TppDBPipeline
    DataSource = dsObs
    RefreshAfterPost = True
    UserName = 'dbObs'
    Left = 304
    Top = 128
  end
  object dsObs: TDataSource
    DataSet = Obs
    Left = 264
    Top = 128
  end
  object QOutrasCargas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   NUM_CARGA,'
      '   LETRA'
      'from CARGA'
      '   where COD_EMPRESA = :COD_EMPRESA'
      '   and NUM_CARGA = :NUM_CARGA'
      '   and LETRA <> '#39#39)
    SQLConnection = DM.BancoDados
    Left = 128
    Top = 296
    object QOutrasCargasNUM_CARGA: TIntegerField
      FieldName = 'NUM_CARGA'
      Required = True
    end
    object QOutrasCargasLETRA: TStringField
      FieldName = 'LETRA'
      FixedChar = True
      Size = 2
    end
  end
  object QContas: TSQLQuery
    DataSource = dsPonte
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CO.NUM_PEDIDO,'
      '  CO.DATA_VENCTO,'
      '  CO.VALOR_PAGAR,'
      '  FORMA.DESC_PAGTO'
      'FROM CONTAS CO'
      '  left join FORMA_PAGTO FORMA on CO.COD_PAGTO = FORMA.COD_PAGTO'
      'WHERE CO.NUM_PEDIDO = :NUM_PEDIDO'
      'AND CO.TIPO_CONTA = 1'
      'ORDER BY CO.DATA_VENCTO')
    SQLConnection = DM.BancoDados
    Left = 48
    Top = 184
    object QContasNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object QContasDATA_VENCTO: TSQLTimeStampField
      FieldName = 'DATA_VENCTO'
    end
    object QContasVALOR_PAGAR: TFloatField
      FieldName = 'VALOR_PAGAR'
    end
    object QContasDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      Size = 30
    end
  end
  object dspContas: TDataSetProvider
    DataSet = QContas
    Left = 120
    Top = 184
  end
  object Contas: TClientDataSet
    Aggregates = <>
    DataSetField = CargaQContas
    Params = <>
    Left = 192
    Top = 184
  end
  object dsContas: TDataSource
    DataSet = Contas
    Left = 248
    Top = 184
  end
  object dbContas: TppDBPipeline
    DataSource = dsContas
    UserName = 'dbContas'
    Left = 304
    Top = 184
  end
  object QParcelas: TSQLQuery
    DataSource = dsPonte
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select '
      'V.CARGA_ID, '
      'V.DIAS, '
      'V.FORMAPAGTO_ID, '
      'V.ID, '
      'V.VALOR, '
      'V.VENCTO,'
      'F.DESC_PAGTO '
      'from CARGA_VENCTO V'
      'LEFT JOIN  FORMA_PAGTO F ON V.FORMAPAGTO_ID = F.COD_PAGTO'
      'WHERE CARGA_ID = :ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 48
    Top = 240
    object QParcelasCARGA_ID: TIntegerField
      FieldName = 'CARGA_ID'
      Required = True
    end
    object QParcelasDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object QParcelasFORMAPAGTO_ID: TIntegerField
      FieldName = 'FORMAPAGTO_ID'
    end
    object QParcelasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QParcelasVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QParcelasVENCTO: TSQLTimeStampField
      FieldName = 'VENCTO'
    end
    object QParcelasDESC_PAGTO: TStringField
      FieldName = 'DESC_PAGTO'
      Size = 30
    end
  end
  object dspParcelas: TDataSetProvider
    DataSet = QParcelas
    Left = 120
    Top = 240
  end
  object Parcelas: TClientDataSet
    Aggregates = <>
    DataSetField = CargaQParcelas
    Params = <>
    Left = 192
    Top = 240
  end
  object dsParcelas: TDataSource
    DataSet = Parcelas
    Left = 248
    Top = 240
  end
  object dbParcelas: TppDBPipeline
    DataSource = dsParcelas
    UserName = 'dbParcelas'
    Left = 304
    Top = 240
  end
end
