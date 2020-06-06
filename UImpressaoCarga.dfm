object fImpressaoCarga: TfImpressaoCarga
  Left = 0
  Top = 0
  Caption = 'fImpressaoCarga'
  ClientHeight = 214
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object QCarga: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IdCarga'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  usi.nome as usi_nome,'
      '  usi.cnpj as usi_cnpj,'
      '  usi.fone as usi_fone,'
      '  usi.email as usi_email,'
      '  usi.cep as usi_cep,'
      
        '  usi.endereco || '#39' - '#39' ||coalesce(usi.bairro, '#39#39')||'#39' - '#39' || coa' +
        'lesce(usi.numero, '#39#39') ||'#39' - '#39'|| coalesce(usi.complemento, '#39#39') as' +
        ' usi_endereco,'
      
        '  coalesce(usi_cid.desc_cidade,'#39#39') ||'#39' - '#39'||coalesce(usi_est.sig' +
        'la,'#39#39') as usi_cidade,'
      '  car.id_carga as car_id,'
      '  car.armazem as car_usina,'
      '  car.complunidade as car_complunidade,'
      '  car.data as car_data,'
      '  car.num_pedido as car_numpedido,'
      '  car.obs2 as car_obs,'
      '  car.qtde as car_qtde,'
      '  uni.desc_unidade,'
      ''
      '  adq.nome as adq_nome,'
      '  adq.cnpj as adq_cnpj,'
      '  adq.cep as adq_cep,'
      '  adq.fone as adq_fone,'
      '  adq.email as adq_email,'
      
        '  adq.endereco || '#39' - '#39' ||coalesce(adq.bairro, '#39#39')||'#39' - '#39' || coa' +
        'lesce(adq.numero, '#39#39') ||'#39' - '#39'|| coalesce(adq.complemento, '#39#39') as' +
        ' adq_endereco,'
      
        '  coalesce(cid_adq.desc_cidade,'#39#39') ||'#39' - '#39'||coalesce(est_adq.sig' +
        'la,'#39#39') as adq_cidade,'
      ''
      '  cli.nome as cli_nome,'
      '  cli.endereco as cli_endereco,'
      '  cli.numero as cli_numero,'
      '  cli.bairro as cli_bairro,'
      '  cli.cep as cli_cep,'
      '  cid.desc_cidade as cli_cidade,'
      '  cli.cnpj as cli_cnpj,'
      '  cli.fone as cli_telefone,'
      '  cli.email as cli_email,'
      '  est.sigla as cli_uf,'
      
        '  cli.endereco||'#39' - '#39'||coalesce(cli.numero,'#39#39')||'#39' - '#39'||coalesce(' +
        'cli.bairro,'#39#39') as Cli_EnderecoCompleto,'
      '  cid.desc_cidade||'#39' - '#39'||est.sigla as Cli_CidadeCompleta,'
      ''
      '  tra.nome as tra_nome,'
      '  tra.endereco as tra_endereco,'
      '  tra.bairro as tra_bairro,'
      '  cidtra.desc_cidade as tra_cidade,'
      '  esttra.sigla as tra_uf,'
      '  tra.cep as tra_cep,'
      '  tra.fone1 as tra_fone1,'
      '  tra.fax as tra_fax,'
      '  tra.cnpj as tra_cnpj,'
      '  tra.cpf_transp as tra_cpf,'
      '  tra.antt as tra_antt,'
      '  tra.renavan as tra_renavan,'
      '  tra.email as tra_email,'
      
        '  tra.endereco||'#39' - '#39'||coalesce(tra.bairro,'#39#39') as tra_EnderecoCo' +
        'mpleto,'
      '  cidtra.desc_cidade||'#39' - '#39'||esttra.sigla as tra_CidadeCompleta,'
      ''
      '  mot.nome as mot_nome,'
      '  mot.cpf as mot_cpf,'
      '  mot.cnh as mot_cnh,'
      '  mot.placa as mot_placa,'
      '  mot.renavan as mot_renavan,'
      '  mot.placa_reboque1 as mot_reboque1,'
      '  mot.placa_reboque2 as mot_reboque2,'
      '  mot.placa_reboque3 as mot_reboque3,'
      ''
      '  cte.nome as cte_nome,'
      '  cte.endereco as cte_endereco,'
      '  cte.bairro as cte_bairro,'
      '  cidcte.desc_cidade as cte_cidade,'
      '  estcte.sigla as cte_uf,'
      '  cte.cep as cte_cep,'
      '  cte.fone1 as cte_telefone,'
      '  cte.fax as cte_fax,'
      '  cte.cnpj as cte_cnpj,'
      '  cte.insc_estadual as cte_ie,'
      '  cte.antt as cte_antt,'
      '  cte.email as cte_email,'
      ''
      '  entr.endereco as entr_endereco,'
      '  entr.numero as entr_numero,'
      '  entr.bairro as entr_bairro,'
      '  entr.cep as entr_cep,'
      '  cidentr.desc_cidade as entr_cidade,'
      '  estentr.sigla as entr_uf'
      'FROM carga car'
      '  INNER JOIN cliente cli ON car.cod_cliente = cli.cod_cliente'
      '  LEFT JOIN cidade cid ON cli.cod_cidade = cid.cod_cidade'
      '  LEFT JOIN estado est ON cid.id_estado = est.id_estado'
      
        '  LEFT JOIN motorista mot ON car.cod_motorista = mot.cod_motoris' +
        'ta'
      ''
      '  LEFT JOIN transportador tra ON mot.cod_trans = tra.cod_trans'
      
        '  LEFT JOIN cidade as cidtra ON tra.cod_cidade = cidtra.cod_cida' +
        'de'
      
        '  LEFT JOIN estado as esttra ON cidtra.id_estado = esttra.id_est' +
        'ado'
      ''
      
        '  LEFT JOIN transportador cte ON car.cod_manifesto = cte.cod_tra' +
        'ns'
      
        '  LEFT JOIN cidade as cidcte ON cte.cod_cidade = cidcte.cod_cida' +
        'de'
      
        '  LEFT JOIN estado as estcte ON cidcte.id_estado = estcte.id_est' +
        'ado'
      ''
      
        '  LEFT JOIN end_entrega entr ON car.cod_cliente = entr.cod_clien' +
        'te'
      
        '  LEFT JOIN cidade cidentr ON entr.cod_cidade = cidentr.cod_cida' +
        'de'
      
        '  LEFT JOIN estado estentr ON cidentr.id_estado = estentr.id_est' +
        'ado'
      ''
      '  LEFT JOIN fornecedor adq ON car.cod_for = adq.cod_for'
      
        '  LEFT JOIN cidade cid_adq ON adq.cod_cidade = cid_adq.cod_cidad' +
        'e'
      
        '  LEFT JOIN estado est_adq ON cid_adq.id_estado = est_adq.id_est' +
        'ado'
      ''
      '  LEFT JOIN fornecedor usi ON car.cod_usina = usi.cod_for'
      
        '  LEFT JOIN cidade usi_cid ON usi.cod_cidade = usi_cid.cod_cidad' +
        'e'
      
        '  LEFT JOIN estado usi_est ON usi_cid.id_estado = usi_est.id_est' +
        'ado'
      ''
      '  LEFT JOIN unidade uni ON car.cod_empresa = uni.cod_empresa'
      '    AND car.id_unidade = uni.id_unidade'
      'WHERE car.id_carga = :IdCarga'
      '')
    SQLConnection = DM.BancoDados
    Left = 24
    Top = 16
  end
  object cdsCarga: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IdCarga'
        ParamType = ptInput
      end>
    ProviderName = 'dspCarga'
    OnCalcFields = cdsCargaCalcFields
    Left = 192
    Top = 16
    object cdsCargaCAR_ID: TIntegerField
      FieldName = 'CAR_ID'
      Required = True
    end
    object cdsCargaCAR_USINA: TStringField
      FieldName = 'CAR_USINA'
      Size = 40
    end
    object cdsCargaCAR_COMPLUNIDADE: TStringField
      FieldName = 'CAR_COMPLUNIDADE'
      Size = 40
    end
    object cdsCargaCAR_DATA: TSQLTimeStampField
      FieldName = 'CAR_DATA'
      Required = True
    end
    object cdsCargaCAR_NUMPEDIDO: TIntegerField
      FieldName = 'CAR_NUMPEDIDO'
      Required = True
    end
    object cdsCargaCAR_OBS: TStringField
      FieldName = 'CAR_OBS'
      Size = 150
    end
    object cdsCargaCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 60
    end
    object cdsCargaCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object cdsCargaCLI_NUMERO: TStringField
      FieldName = 'CLI_NUMERO'
      Size = 8
    end
    object cdsCargaCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 40
    end
    object cdsCargaCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      FixedChar = True
      Size = 8
    end
    object cdsCargaCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 50
    end
    object cdsCargaCLI_CNPJ: TStringField
      FieldName = 'CLI_CNPJ'
      Size = 14
    end
    object cdsCargaCLI_TELEFONE: TStringField
      FieldName = 'CLI_TELEFONE'
      Size = 15
    end
    object cdsCargaCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 80
    end
    object cdsCargaCLI_UF: TStringField
      FieldName = 'CLI_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCargaTRA_NOME: TStringField
      FieldName = 'TRA_NOME'
      Size = 50
    end
    object cdsCargaTRA_ENDERECO: TStringField
      FieldName = 'TRA_ENDERECO'
      Size = 40
    end
    object cdsCargaTRA_BAIRRO: TStringField
      FieldName = 'TRA_BAIRRO'
      Size = 40
    end
    object cdsCargaTRA_CIDADE: TStringField
      FieldName = 'TRA_CIDADE'
      Size = 50
    end
    object cdsCargaTRA_CEP: TStringField
      FieldName = 'TRA_CEP'
      FixedChar = True
      Size = 8
    end
    object cdsCargaTRA_FONE1: TStringField
      FieldName = 'TRA_FONE1'
      Size = 15
    end
    object cdsCargaTRA_FAX: TStringField
      FieldName = 'TRA_FAX'
      Size = 15
    end
    object cdsCargaTRA_CNPJ: TStringField
      FieldName = 'TRA_CNPJ'
      Size = 14
    end
    object cdsCargaTRA_ANTT: TStringField
      FieldName = 'TRA_ANTT'
      Size = 50
    end
    object cdsCargaTRA_RENAVAN: TStringField
      FieldName = 'TRA_RENAVAN'
      Size = 50
    end
    object cdsCargaTRA_EMAIL: TStringField
      FieldName = 'TRA_EMAIL'
      Size = 80
    end
    object cdsCargaMOT_NOME: TStringField
      FieldName = 'MOT_NOME'
      Size = 40
    end
    object cdsCargaMOT_CPF: TStringField
      FieldName = 'MOT_CPF'
      FixedChar = True
      Size = 11
    end
    object cdsCargaMOT_CNH: TStringField
      FieldName = 'MOT_CNH'
      Size = 30
    end
    object cdsCargaMOT_PLACA: TStringField
      FieldName = 'MOT_PLACA'
    end
    object cdsCargaMOT_REBOQUE1: TStringField
      FieldName = 'MOT_REBOQUE1'
      Size = 10
    end
    object cdsCargaMOT_REBOQUE2: TStringField
      FieldName = 'MOT_REBOQUE2'
      Size = 10
    end
    object cdsCargaMOT_REBOQUE3: TStringField
      FieldName = 'MOT_REBOQUE3'
      Size = 10
    end
    object cdsCargaCTE_NOME: TStringField
      FieldName = 'CTE_NOME'
      Size = 50
    end
    object cdsCargaCTE_ENDERECO: TStringField
      FieldName = 'CTE_ENDERECO'
      Size = 40
    end
    object cdsCargaCTE_BAIRRO: TStringField
      FieldName = 'CTE_BAIRRO'
      Size = 40
    end
    object cdsCargaCTE_CIDADE: TStringField
      FieldName = 'CTE_CIDADE'
      Size = 50
    end
    object cdsCargaCTE_UF: TStringField
      FieldName = 'CTE_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCargaCTE_TELEFONE: TStringField
      FieldName = 'CTE_TELEFONE'
      Size = 15
    end
    object cdsCargaCTE_FAX: TStringField
      FieldName = 'CTE_FAX'
      Size = 15
    end
    object cdsCargaCTE_CNPJ: TStringField
      FieldName = 'CTE_CNPJ'
      Size = 14
    end
    object cdsCargaCTE_IE: TStringField
      FieldName = 'CTE_IE'
    end
    object cdsCargaCTE_ANTT: TStringField
      FieldName = 'CTE_ANTT'
      Size = 50
    end
    object cdsCargaCTE_EMAIL: TStringField
      FieldName = 'CTE_EMAIL'
      Size = 80
    end
    object cdsCargaENTR_ENDERECO: TStringField
      FieldName = 'ENTR_ENDERECO'
      Size = 100
    end
    object cdsCargaENTR_NUMERO: TStringField
      FieldName = 'ENTR_NUMERO'
      Size = 10
    end
    object cdsCargaENTR_BAIRRO: TStringField
      FieldName = 'ENTR_BAIRRO'
      Size = 50
    end
    object cdsCargaENTR_CEP: TStringField
      FieldName = 'ENTR_CEP'
      Size = 8
    end
    object cdsCargaENTR_CIDADE: TStringField
      FieldName = 'ENTR_CIDADE'
      Size = 50
    end
    object cdsCargaENTR_UF: TStringField
      FieldName = 'ENTR_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCargaC_CLI_ENDERECO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CLI_ENDERECO'
      Size = 150
    end
    object cdsCargaC_ENTR_ENDERECO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_ENTR_ENDERECO'
      Size = 150
    end
    object cdsCargaC_Placas: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_Placas'
      Size = 100
    end
    object cdsCargaC_CIDADE_DATA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CIDADE_DATA'
      Size = 100
    end
    object cdsCargaTRA_UF: TStringField
      FieldName = 'TRA_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCargaCTE_CEP: TStringField
      FieldName = 'CTE_CEP'
      FixedChar = True
      Size = 8
    end
    object cdsCargaC_TRA_CIDADE_UF: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_TRA_CIDADE_UF'
      Size = 100
    end
    object cdsCargaC_CTE_CIDADE_UF: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CTE_CIDADE_UF'
      Size = 100
    end
    object cdsCargaCAR_QTDE: TFloatField
      FieldName = 'CAR_QTDE'
    end
    object cdsCargaDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 40
    end
    object cdsCargaC_QTDE_UNIDADE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_QTDE_UNIDADE'
      Size = 50
    end
    object cdsCargaMOT_RENAVAN: TStringField
      FieldName = 'MOT_RENAVAN'
      Size = 50
    end
    object cdsCargaUSI_NOME: TStringField
      FieldName = 'USI_NOME'
      Size = 60
    end
    object cdsCargaUSI_CNPJ: TStringField
      FieldName = 'USI_CNPJ'
      Size = 14
    end
    object cdsCargaUSI_FONE: TStringField
      FieldName = 'USI_FONE'
      Size = 15
    end
    object cdsCargaUSI_EMAIL: TStringField
      FieldName = 'USI_EMAIL'
      Size = 80
    end
    object cdsCargaUSI_ENDERECO: TStringField
      FieldName = 'USI_ENDERECO'
      Size = 137
    end
    object cdsCargaUSI_CIDADE: TStringField
      FieldName = 'USI_CIDADE'
      Size = 55
    end
    object cdsCargaADQ_NOME: TStringField
      FieldName = 'ADQ_NOME'
      Size = 60
    end
    object cdsCargaADQ_CNPJ: TStringField
      FieldName = 'ADQ_CNPJ'
      Size = 14
    end
    object cdsCargaADQ_CEP: TStringField
      FieldName = 'ADQ_CEP'
      FixedChar = True
      Size = 8
    end
    object cdsCargaADQ_FONE: TStringField
      FieldName = 'ADQ_FONE'
      Size = 15
    end
    object cdsCargaADQ_EMAIL: TStringField
      FieldName = 'ADQ_EMAIL'
      Size = 80
    end
    object cdsCargaADQ_ENDERECO: TStringField
      FieldName = 'ADQ_ENDERECO'
      Size = 137
    end
    object cdsCargaADQ_CIDADE: TStringField
      FieldName = 'ADQ_CIDADE'
      Size = 55
    end
    object cdsCargaC_USI_RAZAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_USI_RAZAO'
      Size = 200
    end
    object cdsCargaC_USI_CIDADE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_USI_CIDADE'
      Size = 200
    end
    object cdsCargaC_ADQ_RAZAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_ADQ_RAZAO'
      Size = 200
    end
    object cdsCargaC_ADQ_CIDADE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_ADQ_CIDADE'
      Size = 200
    end
    object cdsCargaUSI_CEP: TStringField
      FieldName = 'USI_CEP'
      FixedChar = True
      Size = 8
    end
    object cdsCargaCLI_ENDERECOCOMPLETO: TStringField
      FieldName = 'CLI_ENDERECOCOMPLETO'
      Size = 104
    end
    object cdsCargaCLI_CIDADECOMPLETA: TStringField
      FieldName = 'CLI_CIDADECOMPLETA'
      Size = 52
    end
    object cdsCargaTRA_ENDERECOCOMPLETO: TStringField
      FieldName = 'TRA_ENDERECOCOMPLETO'
      Size = 83
    end
    object cdsCargaTRA_CIDADECOMPLETA: TStringField
      FieldName = 'TRA_CIDADECOMPLETA'
      Size = 55
    end
    object cdsCargaC_CLI_CIDADE_COMPLETO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CLI_CIDADE_COMPLETO'
      Size = 200
    end
    object cdsCargaC_TRA_ENDERECO_COMPLETO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_TRA_ENDERECO_COMPLETO'
      Size = 200
    end
    object cdsCargaC_TRA_CIDADE_COMPLETO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_TRA_CIDADE_COMPLETO'
      Size = 200
    end
    object cdsCargaC_CLI_RAZAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CLI_RAZAO'
      Size = 200
    end
    object cdsCargaC_TRA_RAZAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_TRA_RAZAO'
      Size = 200
    end
    object cdsCargaC_MOT_NOME: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_MOT_NOME'
      Size = 200
    end
    object cdsCargaTRA_CPF: TStringField
      FieldName = 'TRA_CPF'
      Size = 11
    end
  end
  object dspCarga: TDataSetProvider
    DataSet = QCarga
    Left = 104
    Top = 16
  end
  object dsCarga: TDataSource
    DataSet = cdsCarga
    Left = 272
    Top = 16
  end
  object dbCarga: TppDBPipeline
    DataSource = dsCarga
    UserName = 'dbCarga'
    Left = 344
    Top = 16
  end
  object RepCarga: TppReport
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
    Template.FileName = 'C:\Projetos\MB\Autoriza3.rtm'
    Units = utMillimeters
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
    Left = 400
    Top = 16
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbCarga'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 266965
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Local de Retirada do a'#231#250'car:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 19308
        mmWidth = 42863
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'C_USI_RAZAO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 25658
        mmWidth = 135467
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'USI_ENDERECO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 30685
        mmWidth = 135467
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Dados do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 82287
        mmWidth = 28575
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Raz'#227'o Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 88637
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 92870
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 102924
        mmWidth = 13758
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 107422
        mmWidth = 8996
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'C_CLI_RAZAO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 88637
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'C_CLI_ENDERECO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 92870
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CLI_TELEFONE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 102924
        mmWidth = 118534
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CLI_EMAIL'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 106893
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Quantidade que o ve'#237'culo ir'#225' carregar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 13488
        mmWidth = 57150
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'C_QTDE_UNIDADE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 69850
        mmTop = 13488
        mmWidth = 42333
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Dados da Transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 114566
        mmWidth = 42333
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Raz'#227'o Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 120916
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'C_TRA_RAZAO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 120916
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 125414
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'TRA_ENDERECOCOMPLETO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 125414
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 129912
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'C_TRA_CIDADE_COMPLETO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 130441
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Fone/Fax:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 135204
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TRA_FONE1'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 134939
        mmWidth = 48683
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'ANTT:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 172511
        mmWidth = 22225
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'TRA_ANTT'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 172511
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'RENAVAM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 177273
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'MOT_RENAVAN'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 177273
        mmWidth = 152665
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Dados do Motorista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 149757
        mmWidth = 32015
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Motorista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 156107
        mmWidth = 22225
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'C_MOT_NOME'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 156107
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'CNH:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 162457
        mmWidth = 21431
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'MOT_CNH'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 162457
        mmWidth = 96309
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'Placas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 167219
        mmWidth = 26723
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'C_Placas'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 167219
        mmWidth = 152136
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'A Servi'#231'o da Transportadora Emissora da CTE.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 186267
        mmWidth = 78317
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'CTE_NOME'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 192617
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 196850
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'CTE_ENDERECO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 196850
        mmWidth = 152136
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 201613
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'C_CTE_CIDADE_UF'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 201613
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 206375
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'CTE_BAIRRO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 206375
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Fone/Fax:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 211138
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'CTE_TELEFONE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 211138
        mmWidth = 122502
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 215636
        mmWidth = 23019
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'CTE_CNPJ'
        DataPipeline = dbCarga
        DisplayFormat = '##.###.###/####-##;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 215636
        mmWidth = 122767
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'I.E.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 220134
        mmWidth = 15610
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'CTE_IE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 220134
        mmWidth = 64558
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 224632
        mmWidth = 24342
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'CTE_EMAIL'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 224632
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 140495
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'TRA_EMAIL'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 140495
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Local de Descarga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 232305
        mmWidth = 31221
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'C_ENTR_ENDERECO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 10054
        mmTop = 236538
        mmWidth = 152400
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'C_CIDADE_DATA'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 10054
        mmTop = 243417
        mmWidth = 173567
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'CLI_NOME'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 260351
        mmWidth = 194734
        BandType = 4
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 25135
        mmTop = 256117
        mmWidth = 148167
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Raz'#227'o Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 192617
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Ordem de Carregamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 69850
        mmTop = 2381
        mmWidth = 46302
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 7667
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CAR_NUMPEDIDO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 7667
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Raz'#227'o Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 25658
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 30685
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 9790
        mmTop = 35448
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'C_USI_CIDADE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 35448
        mmWidth = 135467
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 40475
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText36: TppDBText
        UserName = 'DBText301'
        DataField = 'USI_EMAIL'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 40475
        mmWidth = 135467
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel41: TppLabel
        UserName = 'Label401'
        AutoSize = False
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 45767
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'USI_FONE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4763
        mmLeft = 38100
        mmTop = 45767
        mmWidth = 135467
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 97897
        mmWidth = 11113
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'C_CLI_CIDADE_COMPLETO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 97897
        mmWidth = 118534
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'A'#231'ucar Adquirido da Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 51852
        mmWidth = 44715
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Raz'#227'o Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 56879
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 61113
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 71167
        mmWidth = 13758
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 75665
        mmWidth = 8996
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 66140
        mmWidth = 11113
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'C_ADQ_RAZAO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 56886
        mmWidth = 135732
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'ADQ_ENDERECO'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 61119
        mmWidth = 135202
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'C_ADQ_CIDADE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 66146
        mmWidth = 135202
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText38: TppDBText
        UserName = 'DBText36'
        DataField = 'ADQ_FONE'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 71173
        mmWidth = 135202
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText39: TppDBText
        UserName = 'DBText38'
        DataField = 'ADQ_EMAIL'
        DataPipeline = dbCarga
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbCarga'
        mmHeight = 4498
        mmLeft = 38100
        mmTop = 75671
        mmWidth = 135202
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
    object ppParameterList1: TppParameterList
    end
  end
  object desRel: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = RepCarga
    IniStorageType = 'IniFile'
    IniStorageName = '($LocalAppData)\RBuilder\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 360
    Top = 72
  end
end
