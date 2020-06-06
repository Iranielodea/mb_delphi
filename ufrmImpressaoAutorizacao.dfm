object frmImpressaoAutorizacao: TfrmImpressaoAutorizacao
  Left = 0
  Top = 0
  Caption = 'frmImpressaoAutorizacao'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cdsCarga: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarga'
    Left = 152
    Top = 32
    object cdsCargaCIDADE_DATA: TStringField
      FieldName = 'CIDADE_DATA'
      Size = 100
    end
    object cdsCargaUSINA: TStringField
      FieldName = 'USINA'
      Size = 100
    end
    object cdsCargaNUM_PEDIDO: TStringField
      FieldName = 'NUM_PEDIDO'
      Size = 15
    end
    object cdsCargaTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 1000
    end
    object cdsCargaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsCargaENDERECO_CLIENTE: TStringField
      FieldName = 'ENDERECO_CLIENTE'
      Size = 150
    end
    object cdsCargaDOCUMENTO_CLIENTE: TStringField
      FieldName = 'DOCUMENTO_CLIENTE'
      Size = 150
    end
    object cdsCargaOBS2: TStringField
      FieldName = 'OBS2'
      Size = 150
    end
  end
  object dsCarga: TDataSource
    DataSet = cdsCarga
    Left = 104
    Top = 88
  end
  object QCarga: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_carga'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   CLI.ENDERECO AS CLI_ENDERECO,'
      '   CLI.NUMERO AS CLI_NUMERO,'
      '   CLI.COMPLEMENTO AS CLI_COMPL,'
      '   CLI.CEP AS CLI_CEP,'
      '   CLI.CNPJ AS CLI_CNPJ,'
      '   CLI.INSC_ESTADUAL AS CLI_IE,'
      '   CLI.nome AS CLI_NOME,'
      '   CLI.BAIRRO AS CLI_BAIRRO,'
      '   CID.DESC_CIDADE AS CLI_CIDADE,'
      '   EST.SIGLA AS CLI_UF,'
      ''
      '   TRA.CONTATO as TRANS_CONTATO,'
      '   TRA.INSC_ESTADUAL AS TRANS_IE,'
      '   MOT.CPF AS MOT_CPF,'
      '   MOT.ESTADO_CPF AS MOT_ESTADO_CPF,'
      '   MOT.PLACA_REBOQUE1 AS MOT_PLACA_REB1,'
      '   MOT.PLACA_REBOQUE2 AS MOT_PLACA_REB2,'
      '   MOT.PLACA_REBOQUE3 AS MOT_PLACA_REB3,'
      '   MOT.CNH AS MOT_CNH,'
      '   MOT.nome AS MOT_NOME,'
      ''
      '   CAR.data AS CAR_DATA,'
      '   CAR.QTDE AS CAR_QTDE,'
      '   CAR.placa AS CAR_PLACA,'
      '   CAR.qtde * CAR.qtde_cada AS CAR_QTDE_TONELAGEM,'
      '   CAR.unidade AS CAR_UNIDADE,'
      '   CAR.COMPLUNIDADE AS CAR_COMP_UNIDADE,'
      '   CAR.armazem as CAR_ARMAZEN,'
      '   CAR.num_pedido AS CAR_NUM_PEDIDO,'
      '   CAR.OBS2 AS CAR_OBS2,'
      '   UNT.texto as TEXTO'
      ''
      'from carga car'
      '    LEFT JOIN cliente cli ON car.cod_cliente = cli.cod_cliente'
      '    LEFT JOIN cidade cid ON cli.cod_cidade = cid.cod_cidade'
      '    LEFT JOIN estado est ON cid.id_estado = est.id_estado'
      
        '    LEFT JOIN motorista mot ON car.cod_motorista = mot.cod_motor' +
        'ista'
      '    LEFT JOIN transportador tra ON mot.cod_trans = tra.cod_trans'
      '    LEFT JOIN unidade un ON car.id_unidade = un.id_unidade'
      '    LEFT JOIN unidade_texto unt ON un.id_texto = unt.id'
      'WHERE car.id_carga = :id_carga'
      ''
      '')
    SQLConnection = DM.BancoDados
    Left = 32
    Top = 24
    object QCargaCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object QCargaCLI_NUMERO: TStringField
      FieldName = 'CLI_NUMERO'
      Size = 8
    end
    object QCargaCLI_COMPL: TStringField
      FieldName = 'CLI_COMPL'
      Size = 30
    end
    object QCargaCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      FixedChar = True
      Size = 8
    end
    object QCargaCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      Size = 14
    end
    object QCargaCLI_IE: TStringField
      FieldName = 'CLI_IE'
    end
    object QCargaCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 60
    end
    object QCargaCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 50
    end
    object QCargaCLI_UF: TStringField
      FieldName = 'CLI_UF'
      FixedChar = True
      Size = 2
    end
    object QCargaTRANS_CONTATO: TStringField
      FieldName = 'TRANS_CONTATO'
      Size = 40
    end
    object QCargaTRANS_IE: TStringField
      FieldName = 'TRANS_IE'
    end
    object QCargaMOT_CPF: TStringField
      FieldName = 'MOT_CPF'
      FixedChar = True
      Size = 11
    end
    object QCargaMOT_ESTADO_CPF: TStringField
      FieldName = 'MOT_ESTADO_CPF'
      Size = 10
    end
    object QCargaMOT_PLACA_REB1: TStringField
      FieldName = 'MOT_PLACA_REB1'
      Size = 10
    end
    object QCargaMOT_PLACA_REB2: TStringField
      FieldName = 'MOT_PLACA_REB2'
      Size = 10
    end
    object QCargaMOT_CNH: TStringField
      FieldName = 'MOT_CNH'
      Size = 30
    end
    object QCargaMOT_NOME: TStringField
      FieldName = 'MOT_NOME'
      Size = 40
    end
    object QCargaCAR_DATA: TSQLTimeStampField
      FieldName = 'CAR_DATA'
      Required = True
    end
    object QCargaCAR_QTDE: TFloatField
      FieldName = 'CAR_QTDE'
    end
    object QCargaCAR_PLACA: TStringField
      FieldName = 'CAR_PLACA'
      Size = 30
    end
    object QCargaCAR_QTDE_TONELAGEM: TFloatField
      FieldName = 'CAR_QTDE_TONELAGEM'
    end
    object QCargaCAR_UNIDADE: TStringField
      FieldName = 'CAR_UNIDADE'
    end
    object QCargaCAR_COMP_UNIDADE: TStringField
      FieldName = 'CAR_COMP_UNIDADE'
      Size = 40
    end
    object QCargaCAR_ARMAZEN: TStringField
      FieldName = 'CAR_ARMAZEN'
      Size = 40
    end
    object QCargaTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 500
    end
    object QCargaCAR_NUM_PEDIDO: TIntegerField
      FieldName = 'CAR_NUM_PEDIDO'
      Required = True
    end
    object QCargaCAR_OBS2: TStringField
      FieldName = 'CAR_OBS2'
      Size = 150
    end
    object QCargaMOT_PLACA_REB3: TStringField
      FieldName = 'MOT_PLACA_REB3'
      Size = 10
    end
    object QCargaCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 40
    end
  end
  object dbCarga: TppDBPipeline
    DataSource = dsCarga
    UserName = 'dbCarga'
    Left = 216
    Top = 104
    object dbCargappField1: TppField
      FieldAlias = 'CIDADE_DATA'
      FieldName = 'CIDADE_DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbCargappField2: TppField
      FieldAlias = 'USINA'
      FieldName = 'USINA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbCargappField3: TppField
      FieldAlias = 'NUM_PEDIDO'
      FieldName = 'NUM_PEDIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbCargappField4: TppField
      FieldAlias = 'TEXTO'
      FieldName = 'TEXTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbCargappField5: TppField
      FieldAlias = 'NOME_CLIENTE'
      FieldName = 'NOME_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbCargappField6: TppField
      FieldAlias = 'ENDERECO_CLIENTE'
      FieldName = 'ENDERECO_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbCargappField7: TppField
      FieldAlias = 'DOCUMENTO_CLIENTE'
      FieldName = 'DOCUMENTO_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object dbCargappField8: TppField
      FieldAlias = 'OBS2'
      FieldName = 'OBS2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
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
    Template.FileName = 'C:\Projetos\mb\Autoriza2.rtm'
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
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 280
    Top = 112
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbCarga'
    object ppTitleBand1: TppTitleBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 253736
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIDADE_DATA'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 5821
        mmLeft = 19844
        mmTop = 19050
        mmWidth = 172773
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 6085
        mmLeft = 117475
        mmTop = 29633
        mmWidth = 27517
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 6085
        mmLeft = 19844
        mmTop = 38100
        mmWidth = 3175
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'USINA'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 6085
        mmLeft = 19844
        mmTop = 45773
        mmWidth = 172773
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'ORDEM PARA CARREGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 6085
        mmLeft = 70379
        mmTop = 66146
        mmWidth = 66940
        BandType = 1
        LayerName = Foreground
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TEXTO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 52917
        mmLeft = 19844
        mmTop = 74083
        mmWidth = 165365
        BandType = 1
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'ATENCIOSAMENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 6085
        mmLeft = 19844
        mmTop = 142875
        mmWidth = 42333
        BandType = 1
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 19844
        mmTop = 155311
        mmWidth = 127265
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME_CLIENTE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 5821
        mmLeft = 19844
        mmTop = 158749
        mmWidth = 127265
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'EXPEDI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 6085
        mmLeft = 19844
        mmTop = 52917
        mmWidth = 25400
        BandType = 1
        LayerName = Foreground
      end
      object mmTransp: TppMemo
        UserName = 'mmTransp'
        Caption = 'mmTransp'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 37571
        mmLeft = 89694
        mmTop = 168011
        mmWidth = 101071
        BandType = 1
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object mmCte: TppMemo
        UserName = 'mmCte'
        Caption = 'mmCTe'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 40217
        mmLeft = 89694
        mmTop = 210344
        mmWidth = 101071
        BandType = 1
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBRichText1: TppDBRichText
        UserName = 'DBRichText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Comic Sans MS'
        Font.Size = 12
        Font.Style = []
        DataField = 'OBS2'
        DataPipeline = dbCarga
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 12435
        mmLeft = 19844
        mmTop = 129117
        mmWidth = 165365
        BandType = 1
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
      end
    end
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
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
  object QForn: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_motorista'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    tra.cod_trans,'
      '    tra.nome,'
      '    tra.cnpj,'
      '    tra.cpf_transp,'
      '    tra.endereco,'
      
        '    COALESCE(cid.desc_cidade , '#39#39') ||'#39' - '#39' || COALESCE(est.sigla' +
        ', '#39#39') as cidade_uf,'
      '    tra.cep,'
      '    tra.fone1,'
      '    tra.email,'
      '    tra.bairro,'
      '    tra.insc_estadual'
      'FROM motorista mot'
      
        '    INNER JOIN transportador tra ON mot.cod_trans = tra.cod_tran' +
        's'
      '    LEFT JOIN cidade cid ON'
      '        tra.cod_cidade = cid.cod_cidade'
      '    LEFT JOIN estado est ON'
      '        cid.id_estado = est.id_estado'
      '    WHERE mot.cod_motorista = :cod_motorista')
    SQLConnection = DM.BancoDados
    Left = 323
    Top = 53
    object QFornNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QFornCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object QFornENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object QFornCIDADE_UF: TStringField
      FieldName = 'CIDADE_UF'
      Size = 55
    end
    object QFornCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object QFornFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object QFornEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object QFornBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object QFornCPF_TRANSP: TStringField
      FieldName = 'CPF_TRANSP'
      Size = 11
    end
    object QFornCOD_TRANS: TIntegerField
      FieldName = 'COD_TRANS'
      Required = True
    end
    object QFornINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
  end
  object QTransp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'cod_trans'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '    tra.cod_trans,'
      '    tra.nome,'
      '    tra.cnpj,'
      '    tra.cpf_transp,'
      '    tra.endereco,'
      
        '    COALESCE(cid.desc_cidade , '#39#39') ||'#39' - '#39' || COALESCE(est.sigla' +
        ', '#39#39') as cidade_uf,'
      '    tra.cep,'
      '    tra.fone1,'
      '    tra.email,'
      '    tra.bairro,'
      '    tra.insc_estadual'
      'FROM transportador tra'
      '    LEFT JOIN cidade cid ON'
      '        tra.cod_cidade = cid.cod_cidade'
      '    LEFT JOIN estado est ON'
      '        cid.id_estado = est.id_estado'
      '    WHERE tra.cod_trans = :cod_trans')
    SQLConnection = DM.BancoDados
    Left = 344
    Top = 173
    object QTranspCOD_TRANS: TIntegerField
      FieldName = 'COD_TRANS'
      Required = True
    end
    object QTranspNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QTranspCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object QTranspCPF_TRANSP: TStringField
      FieldName = 'CPF_TRANSP'
      Size = 11
    end
    object QTranspENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object QTranspCIDADE_UF: TStringField
      FieldName = 'CIDADE_UF'
      Size = 55
    end
    object QTranspCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object QTranspFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object QTranspEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object QTranspBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object QTranspINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
  end
  object DesRel: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
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
    Left = 336
    Top = 112
  end
end
