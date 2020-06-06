object fItensLista: TfItensLista
  Left = 269
  Top = 252
  Width = 337
  Height = 202
  Caption = 'Itens da Lista'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBRadioGroup1: TDBRadioGroup
    Left = 8
    Top = 16
    Width = 121
    Height = 81
    Caption = 'Situa'#231#227'o do Pedido:'
    DataField = 'SITUACAO'
    DataSource = dsCad
    Items.Strings = (
      'Aberto'
      'Entregue')
    TabOrder = 0
  end
  object dsCad: TDataSource
    DataSet = DM.dtCarga
    Left = 136
    Top = 48
  end
end
