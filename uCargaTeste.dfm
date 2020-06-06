object frmCargaTeste: TfrmCargaTeste
  Left = 0
  Top = 0
  Caption = 'frmCargaTeste'
  ClientHeight = 392
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 79
    Top = 75
    Width = 12
    Height = 13
    Caption = '28'
  end
  object Label2: TLabel
    Left = 8
    Top = 225
    Width = 101
    Height = 13
    Caption = 'Id Carga e N'#186' Pedido'
  end
  object dbgrd1: TDBGrid
    Left = 8
    Top = 99
    Width = 505
    Height = 120
    DataSource = dsExemplo1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplo1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 89
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplo2'
    TabOrder = 1
    OnClick = btn2Click
  end
  object lbledtId: TLabeledEdit
    Left = 16
    Top = 72
    Width = 57
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Id Carga'
    TabOrder = 3
    Text = '28'
  end
  object btn3: TBitBtn
    Left = 170
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplo 3'
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn4: TBitBtn
    Left = 251
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplo 4'
    TabOrder = 5
    OnClick = btn4Click
  end
  object btn5: TBitBtn
    Left = 332
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplo 5'
    TabOrder = 6
    OnClick = btn5Click
  end
  object btn6: TBitBtn
    Left = 413
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplo 6'
    TabOrder = 7
    OnClick = btn6Click
  end
  object lbledtNumPedido: TLabeledEdit
    Left = 8
    Top = 272
    Width = 57
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#186' Pedido'
    TabOrder = 8
    Text = '28'
  end
  object btn7: TBitBtn
    Left = 89
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 9
    OnClick = btn7Click
  end
  object QExe1: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      'CAR.ID_CARGA,'
      'CAR.ARMAZEM,'
      'CAR.COD_AGENCIA,'
      'CAR.COD_CLIENTE,'
      'CAR.COD_CONTATO,'
      'CAR.COD_EMPRESA,'
      'CAR.COD_FOR,'
      'CAR.COD_MOTORISTA,'
      'CAR.DATA,'
      'CAR.QTDE_PEDIDO,'
      'CAR.FINANCEIRO,'
      'CAR.LETRA, '
      'CAR.SITUACAO, '
      'CAR.OBS,'
      'CAR.NUM_CARGA, '
      'CAR.NUM_PEDIDO, '
      'CAR.QTDE, '
      'CAR.USU_ALT, '
      'CAR.USU_INC, '
      'CAR.VALOR_CARREGA, '
      'CAR.COMPLEMENTO,'
      'CAR.VALOR_FRETE, '
      'CAR.VALOR_PEDIDO, '
      'CAR.VISTO,'
      'CAR.PLACA,'
      'CAR.SALDO,'
      'CAR.UNIDADE,'
      'CAR.COMPLUNIDADE,'
      'CAR.CONTATO_INDICACAO,'
      'CAR.OBS2,'
      'CAR.NUM_NF,'
      'CAR.DATA_NF,'
      'CAR.QTDE_CADA,'
      'CAR.ID_UNIDADE,'
      'CAR.COD_MANIFESTO,'
      'CLI.NOME AS NOME_CLIENTE,'
      'CON.NOME AS NOME_CONTATO,'
      'FO.NOME AS NOME_FORNECEDOR,'
      'MOT.NOME AS NOME_MOTORISTA,'
      'TRA.NOME AS NOME_MANIFESTO'
      'from CARGA CAR'
      ''
      ' left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE'
      ''
      ' left join CLIENTE CON on CAR.COD_CONTATO = CON.COD_CLIENTE'
      ''
      ' left join FORNECEDOR FO on CAR.COD_FOR = FO.COD_FOR'
      ''
      
        ' left join MOTORISTA MOT on CAR.COD_MOTORISTA = MOT.COD_MOTORIST' +
        'A'
      ''
      
        ' left join TRANSPORTADOR TRA on CAR.COD_MANIFESTO = TRA.COD_TRAN' +
        'S'
      ''
      ' where CAR.COD_EMPRESA = :COD_EMPRESA'
      ' and CAR.ID_CARGA = :ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 272
    Top = 48
  end
  object dspExemplo: TDataSetProvider
    Left = 344
    Top = 328
  end
  object cdsExemplo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExemplo'
    Left = 408
    Top = 328
  end
  object dsExemplo1: TDataSource
    DataSet = cdsExemplo
    Left = 472
    Top = 328
  end
  object QExe2: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      'CAR.ID_CARGA,'
      'CAR.ARMAZEM,'
      'CAR.COD_AGENCIA,'
      'CAR.COD_CLIENTE,'
      'CAR.COD_CONTATO,'
      'CAR.COD_EMPRESA,'
      'CAR.COD_FOR,'
      'CAR.COD_MOTORISTA,'
      'CAR.DATA,'
      'CAR.QTDE_PEDIDO,'
      'CAR.FINANCEIRO,'
      'CAR.LETRA,'
      'CAR.SITUACAO,'
      'CAR.OBS,'
      'CAR.NUM_CARGA,'
      'CAR.NUM_PEDIDO,'
      'CAR.QTDE,'
      'CAR.USU_ALT,'
      'CAR.USU_INC,'
      'CAR.VALOR_CARREGA,'
      'CAR.COMPLEMENTO,'
      'CAR.VALOR_FRETE,'
      'CAR.VALOR_PEDIDO,'
      'CAR.VISTO,'
      'CAR.PLACA,'
      'CAR.SALDO,'
      'CAR.UNIDADE,'
      'CAR.COMPLUNIDADE,'
      'CAR.CONTATO_INDICACAO,'
      'CAR.OBS2,'
      'CAR.NUM_NF,'
      'CAR.DATA_NF,'
      'CAR.QTDE_CADA,'
      'CAR.ID_UNIDADE,'
      'CAR.COD_MANIFESTO,'
      'CLI.NOME AS NOME_CLIENTE,'
      'CON.NOME AS NOME_CONTATO,'
      'FO.NOME AS NOME_FORNECEDOR,'
      'MOT.NOME AS NOME_MOTORISTA'
      'from CARGA CAR'
      ''
      ' left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE'
      ''
      ' left join CLIENTE CON on CAR.COD_CONTATO = CON.COD_CLIENTE'
      ''
      ' left join FORNECEDOR FO on CAR.COD_FOR = FO.COD_FOR'
      ''
      
        ' left join MOTORISTA MOT on CAR.COD_MOTORISTA = MOT.COD_MOTORIST' +
        'A'
      ''
      ' where CAR.COD_EMPRESA = :COD_EMPRESA'
      ' and CAR.ID_CARGA = :ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 320
    Top = 48
  end
  object QExe3: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      'CAR.ID_CARGA,'
      'CAR.ARMAZEM,'
      'CAR.COD_AGENCIA,'
      'CAR.COD_CLIENTE,'
      'CAR.COD_CONTATO,'
      'CAR.COD_EMPRESA,'
      'CAR.COD_FOR,'
      'CAR.COD_MOTORISTA,'
      'CAR.DATA,'
      'CAR.QTDE_PEDIDO,'
      'CAR.FINANCEIRO,'
      'CAR.LETRA,'
      'CAR.SITUACAO,'
      'CAR.OBS,'
      'CAR.NUM_CARGA,'
      'CAR.NUM_PEDIDO,'
      'CAR.QTDE,'
      'CAR.USU_ALT,'
      'CAR.USU_INC,'
      'CAR.VALOR_CARREGA,'
      'CAR.COMPLEMENTO,'
      'CAR.VALOR_FRETE,'
      'CAR.VALOR_PEDIDO,'
      'CAR.VISTO,'
      'CAR.PLACA,'
      'CAR.SALDO,'
      'CAR.UNIDADE,'
      'CAR.COMPLUNIDADE,'
      'CAR.CONTATO_INDICACAO,'
      'CAR.OBS2,'
      'CAR.NUM_NF,'
      'CAR.DATA_NF,'
      'CAR.QTDE_CADA,'
      'CAR.ID_UNIDADE,'
      'CAR.COD_MANIFESTO,'
      'CLI.NOME AS NOME_CLIENTE,'
      'CON.NOME AS NOME_CONTATO,'
      'FO.NOME AS NOME_FORNECEDOR'
      'from CARGA CAR'
      ''
      ' left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE'
      ''
      ' left join CLIENTE CON on CAR.COD_CONTATO = CON.COD_CLIENTE'
      ''
      ' left join FORNECEDOR FO on CAR.COD_FOR = FO.COD_FOR'
      ''
      ' where CAR.COD_EMPRESA = :COD_EMPRESA'
      ' and CAR.ID_CARGA = :ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 368
    Top = 48
  end
  object QExe4: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      'CAR.ID_CARGA,'
      'CAR.ARMAZEM,'
      'CAR.COD_AGENCIA,'
      'CAR.COD_CLIENTE,'
      'CAR.COD_CONTATO,'
      'CAR.COD_EMPRESA,'
      'CAR.COD_FOR,'
      'CAR.COD_MOTORISTA,'
      'CAR.DATA,'
      'CAR.QTDE_PEDIDO,'
      'CAR.FINANCEIRO,'
      'CAR.LETRA,'
      'CAR.SITUACAO,'
      'CAR.OBS,'
      'CAR.NUM_CARGA,'
      'CAR.NUM_PEDIDO,'
      'CAR.QTDE,'
      'CAR.USU_ALT,'
      'CAR.USU_INC,'
      'CAR.VALOR_CARREGA,'
      'CAR.COMPLEMENTO,'
      'CAR.VALOR_FRETE,'
      'CAR.VALOR_PEDIDO,'
      'CAR.VISTO,'
      'CAR.PLACA,'
      'CAR.SALDO,'
      'CAR.UNIDADE,'
      'CAR.COMPLUNIDADE,'
      'CAR.CONTATO_INDICACAO,'
      'CAR.OBS2,'
      'CAR.NUM_NF,'
      'CAR.DATA_NF,'
      'CAR.QTDE_CADA,'
      'CAR.ID_UNIDADE,'
      'CAR.COD_MANIFESTO,'
      'CLI.NOME AS NOME_CLIENTE,'
      'CON.NOME AS NOME_CONTATO'
      'from CARGA CAR'
      ''
      ' left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE'
      ''
      ' left join CLIENTE CON on CAR.COD_CONTATO = CON.COD_CLIENTE'
      ''
      ' where CAR.COD_EMPRESA = :COD_EMPRESA'
      ' and CAR.ID_CARGA = :ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 408
    Top = 48
  end
  object QExe5: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      'CAR.ID_CARGA,'
      'CAR.ARMAZEM,'
      'CAR.COD_AGENCIA,'
      'CAR.COD_CLIENTE,'
      'CAR.COD_CONTATO,'
      'CAR.COD_EMPRESA,'
      'CAR.COD_FOR,'
      'CAR.COD_MOTORISTA,'
      'CAR.DATA,'
      'CAR.QTDE_PEDIDO,'
      'CAR.FINANCEIRO,'
      'CAR.LETRA,'
      'CAR.SITUACAO,'
      'CAR.OBS,'
      'CAR.NUM_CARGA,'
      'CAR.NUM_PEDIDO,'
      'CAR.QTDE,'
      'CAR.USU_ALT,'
      'CAR.USU_INC,'
      'CAR.VALOR_CARREGA,'
      'CAR.COMPLEMENTO,'
      'CAR.VALOR_FRETE,'
      'CAR.VALOR_PEDIDO,'
      'CAR.VISTO,'
      'CAR.PLACA,'
      'CAR.SALDO,'
      'CAR.UNIDADE,'
      'CAR.COMPLUNIDADE,'
      'CAR.CONTATO_INDICACAO,'
      'CAR.OBS2,'
      'CAR.NUM_NF,'
      'CAR.DATA_NF,'
      'CAR.QTDE_CADA,'
      'CAR.ID_UNIDADE,'
      'CAR.COD_MANIFESTO,'
      'CLI.NOME AS NOME_CLIENTE'
      'from CARGA CAR'
      ''
      ' left join CLIENTE CLI on CAR.COD_CLIENTE = CLI.COD_CLIENTE'
      ''
      ' where CAR.COD_EMPRESA = :COD_EMPRESA'
      ' and CAR.ID_CARGA = :ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 448
    Top = 48
  end
  object QExe6: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'COD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_CARGA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      'CAR.ID_CARGA,'
      'CAR.ARMAZEM,'
      'CAR.COD_AGENCIA,'
      'CAR.COD_CLIENTE,'
      'CAR.COD_CONTATO,'
      'CAR.COD_EMPRESA,'
      'CAR.COD_FOR,'
      'CAR.COD_MOTORISTA,'
      'CAR.DATA,'
      'CAR.QTDE_PEDIDO,'
      'CAR.FINANCEIRO,'
      'CAR.LETRA,'
      'CAR.SITUACAO,'
      'CAR.OBS,'
      'CAR.NUM_CARGA,'
      'CAR.NUM_PEDIDO,'
      'CAR.QTDE,'
      'CAR.USU_ALT,'
      'CAR.USU_INC,'
      'CAR.VALOR_CARREGA,'
      'CAR.COMPLEMENTO,'
      'CAR.VALOR_FRETE,'
      'CAR.VALOR_PEDIDO,'
      'CAR.VISTO,'
      'CAR.PLACA,'
      'CAR.SALDO,'
      'CAR.UNIDADE,'
      'CAR.COMPLUNIDADE,'
      'CAR.CONTATO_INDICACAO,'
      'CAR.OBS2,'
      'CAR.NUM_NF,'
      'CAR.DATA_NF,'
      'CAR.QTDE_CADA,'
      'CAR.ID_UNIDADE,'
      'CAR.COD_MANIFESTO'
      'from CARGA CAR'
      ''
      ' where CAR.COD_EMPRESA = :COD_EMPRESA'
      ' and CAR.ID_CARGA = :ID_CARGA')
    SQLConnection = DM.BancoDados
    Left = 488
    Top = 48
  end
end
