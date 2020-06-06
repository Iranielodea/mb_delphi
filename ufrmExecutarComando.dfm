object frmExecutarComando: TfrmExecutarComando
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Executar Comandos'
  ClientHeight = 418
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 9
    Top = 8
    Width = 633
    Height = 93
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 107
    Width = 650
    Height = 272
    DataSource = dsSql
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 377
    Width = 650
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 112
    ExplicitTop = 312
    ExplicitWidth = 185
    object btnExecutar: TBitBtn
      Left = 459
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Executar'
      TabOrder = 0
      OnClick = btnExecutarClick
    end
    object btnSair: TBitBtn
      Left = 540
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sai&r'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object QSql: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.BancoDados
    Left = 80
    Top = 160
  end
  object dspSql: TDataSetProvider
    DataSet = QSql
    Left = 136
    Top = 160
  end
  object cdsSql: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSql'
    Left = 208
    Top = 160
  end
  object dsSql: TDataSource
    DataSet = cdsSql
    Left = 296
    Top = 168
  end
end
