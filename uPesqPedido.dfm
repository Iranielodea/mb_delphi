object fPesqPedido: TfPesqPedido
  Left = 151
  Top = 121
  BorderStyle = bsSingle
  Caption = 'Pedidos'
  ClientHeight = 516
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 121
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 48
      Height = 16
      Caption = 'Data de'
    end
    object Label2: TLabel
      Left = 167
      Top = 24
      Width = 20
      Height = 16
      Caption = 'At'#233
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 41
      Height = 16
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 16
      Top = 72
      Width = 70
      Height = 16
      Caption = 'Fornecedor'
    end
    object SpeedButton1: TSpeedButton
      Left = 466
      Top = 40
      Width = 23
      Height = 22
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000420B0000420B00000000000000000000FF00FF2173B5
        636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9C948C9C948CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2173B5218CEF
        2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF9C948CB5BDC6B5BDC69C948CFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF
        218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF
        52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF31A5FF52BDFF218CEF5A6B73FF00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9
        B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6A5948CFF
        00FF9C948C9C948C9C948C9C948C9C948CFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F9EFC8FDF2CBFEF4CCECD8
        C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C9C948CB5BDC69C
        948CFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBB9F88F3E3B6FCF3D1FEF6CDFEF7CFFEF9D0FDF7
        D2F5E6C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1FFF3C2FFF5C4FFF7C5FFFA
        C7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EFE3B6FBECBEFDEFBFFEF1C1FFF2C2FFF4C4FFF7
        C5FFF9C7EEE2BBD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3FCF0C9FEF0C1FFF1C2FFF4
        C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFB5BDC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EBDEB2F2E6BBFCF2D7FCF1D3FCEEC0FEEFC2FFF2
        C2FEF2C2EFE1BBD2B3A3FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFB5BDC6B5BDC6FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6F3E7BCF8EBC0F9EBBCFBEDBEFAEC
        BDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD6ADA5EADFBCECE0B6F0E3B6F1E5B7F2E5B7EFE3
        B5F5E7BCD5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4EBDEB1E8DBB1D6AD
        A5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C
        948CFF00FFFF00FFFF00FFFF00FF9C948C9C948CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9C948C9C948C9C948C9C948CFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 466
      Top = 67
      Width = 23
      Height = 22
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000420B0000420B00000000000000000000FF00FF2173B5
        636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9C948C9C948CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2173B5218CEF
        2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF9C948CB5BDC6B5BDC69C948CFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF
        218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF
        52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF31A5FF52BDFF218CEF5A6B73FF00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9
        B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6A5948CFF
        00FF9C948C9C948C9C948C9C948C9C948CFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F9EFC8FDF2CBFEF4CCECD8
        C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C9C948CB5BDC69C
        948CFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBB9F88F3E3B6FCF3D1FEF6CDFEF7CFFEF9D0FDF7
        D2F5E6C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1FFF3C2FFF5C4FFF7C5FFFA
        C7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EFE3B6FBECBEFDEFBFFEF1C1FFF2C2FFF4C4FFF7
        C5FFF9C7EEE2BBD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3FCF0C9FEF0C1FFF1C2FFF4
        C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFB5BDC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EBDEB2F2E6BBFCF2D7FCF1D3FCEEC0FEEFC2FFF2
        C2FEF2C2EFE1BBD2B3A3FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFB5BDC6B5BDC6FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6F3E7BCF8EBC0F9EBBCFBEDBEFAEC
        BDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD6ADA5EADFBCECE0B6F0E3B6F1E5B7F2E5B7EFE3
        B5F5E7BCD5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4EBDEB1E8DBB1D6AD
        A5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C
        948CFF00FFFF00FFFF00FFFF00FF9C948C9C948CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9C948C9C948C9C948C9C948CFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    object Label5: TLabel
      Left = 16
      Top = 96
      Width = 59
      Height = 16
      Caption = 'N'#186'Pedido'
    end
    object DataIni: TMaskEdit
      Left = 87
      Top = 16
      Width = 73
      Height = 22
      Ctl3D = False
      EditMask = '##/##/####'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object Datafin: TMaskEdit
      Left = 191
      Top = 16
      Width = 73
      Height = 22
      Ctl3D = False
      EditMask = '##/##/####'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object Cod_Cliente: TMaskEdit
      Left = 88
      Top = 40
      Width = 49
      Height = 22
      TabStop = False
      Ctl3D = False
      EditMask = '#####;0;_'
      MaxLength = 5
      ParentCtl3D = False
      TabOrder = 2
      OnExit = Cod_ClienteExit
    end
    object NomeCli: TEdit
      Left = 144
      Top = 40
      Width = 321
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnExit = NomeCliExit
    end
    object Cod_For: TMaskEdit
      Left = 88
      Top = 66
      Width = 49
      Height = 22
      TabStop = False
      Ctl3D = False
      EditMask = '#####;0;_'
      MaxLength = 5
      ParentCtl3D = False
      TabOrder = 4
      OnExit = Cod_ForExit
    end
    object NomeFor: TEdit
      Left = 144
      Top = 66
      Width = 321
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      OnExit = NomeForExit
    end
    object R_Situacao: TRadioGroup
      Left = 496
      Top = 4
      Width = 81
      Height = 81
      Caption = 'Situa'#231#227'o:'
      Ctl3D = False
      ItemIndex = 2
      Items.Strings = (
        'Aberto'
        'Entregue'
        'Todos')
      ParentCtl3D = False
      TabOrder = 7
    end
    object butPesq: TBitBtn
      Left = 584
      Top = 36
      Width = 105
      Height = 49
      Caption = 'F5-&Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = butPesqClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000420B0000420B00000000000000000000FF00FF2173B5
        636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9C948C9C948CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2173B5218CEF
        2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF9C948CB5BDC6B5BDC69C948CFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF
        218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF
        52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6B5BDC69C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF31A5FF52BDFF218CEF5A6B73FF00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9
        B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C496474B5BDC6A5948CFF
        00FF9C948C9C948C9C948C9C948C9C948CFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F9EFC8FDF2CBFEF4CCECD8
        C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948C9C948CB5BDC69C
        948CFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBB9F88F3E3B6FCF3D1FEF6CDFEF7CFFEF9D0FDF7
        D2F5E6C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1FFF3C2FFF5C4FFF7C5FFFA
        C7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EFE3B6FBECBEFDEFBFFEF1C1FFF2C2FFF4C4FFF7
        C5FFF9C7EEE2BBD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3FCF0C9FEF0C1FFF1C2FFF4
        C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFB5BDC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EBDEB2F2E6BBFCF2D7FCF1D3FCEEC0FEEFC2FFF2
        C2FEF2C2EFE1BBD2B3A3FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFB5BDC6B5BDC6FF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6F3E7BCF8EBC0F9EBBCFBEDBEFAEC
        BDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD6ADA5EADFBCECE0B6F0E3B6F1E5B7F2E5B7EFE3
        B5F5E7BCD5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C948CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4EBDEB1E8DBB1D6AD
        A5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C
        948CFF00FFFF00FFFF00FFFF00FF9C948C9C948CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9C948C9C948C9C948C9C948CFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
    object EditConsulta: TEdit
      Left = 632
      Top = 88
      Width = 49
      Height = 24
      TabOrder = 9
      Visible = False
    end
    object Num_Pedido: TMaskEdit
      Left = 88
      Top = 91
      Width = 73
      Height = 22
      Ctl3D = False
      EditMask = '########;0;_'
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 6
      OnEnter = Num_PedidoEnter
      OnExit = Num_PedidoExit
    end
  end
  object Grade: TDBGrid
    Left = 0
    Top = 121
    Width = 742
    Height = 354
    Align = alClient
    DataSource = dsPedido
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GradeDblClick
    OnKeyDown = GradeKeyDown
    OnTitleClick = GradeTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_LIQUIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_FOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_FOR'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 475
    Width = 742
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object butNovo: TSpeedButton
      Left = 280
      Top = 8
      Width = 97
      Height = 25
      Caption = 'F2-&Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF08780E08780EFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF68
        6868686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A70DA31B08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDF808080686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A70EAA1D08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDF848484686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A70EA81C08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDF838383686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A710AA1F08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDF858585686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        08780E08780E08780E08780E08780E76F9A719B02C08780E08780E08780E0878
        0E08780EFF00FFFF00FFFF00FFFF00FF686868686868686868686868686868DF
        DFDF8C8C8C686868686868686868686868686868FF00FFFF00FFFF00FF08780E
        76F9A755E38349DA7242D36837C8562AB94322B3371CB23016AF270FA81D0EA9
        1B0DA21B08780EFF00FFFF00FF686868DFDFDFC4C4C4B9B9B9B2B2B2A7A7A799
        99999292928F8F8F8A8A8A8383838383837F7F7F686868FF00FFFF00FF08780E
        76F9A776F9A776F9A776F9A776F9A776F9A72CBB4876F9A776F9A776F9A776F9
        A776F9A708780EFF00FFFF00FF686868DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDF9B9B9BDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF686868FF00FFFF00FFFF00FF
        08780E08780E08780E08780E08780E76F9A73CCB5D08780E08780E08780E0878
        0E08780EFF00FFFF00FFFF00FFFF00FF686868686868686868686868686868DF
        DFDFABABAB686868686868686868686868686868FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A749D97208780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDFB9B9B9686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A755E28208780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDFC3C3C3686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A763F09708780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDFD1D1D1686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A776F9A708780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF686868DF
        DFDFDFDFDF686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF08780E08780EFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF68
        6868686868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentFont = False
      OnClick = butNovoClick
    end
    object butAlterar: TSpeedButton
      Left = 379
      Top = 8
      Width = 97
      Height = 25
      Caption = 'F3-&Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
        9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
        9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
        65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
        00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
        00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentFont = False
      OnClick = butAlterarClick
    end
    object butExcluir: TSpeedButton
      Left = 479
      Top = 8
      Width = 97
      Height = 25
      Caption = 'F4-&Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFF4C692F4C692F4C692F4C692F4C692F4C692F4C692FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4B4B4B4B4B4B4B4B4
        B4B4B4B4B4B4B4B4B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFF4C692FDF4D1FEF9D8FCF0CEF5E6C2FBE3C3F3DAB5F8D1A9F4C692FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4B4D8D8D8DCDCDCD6D6D6CC
        CCCCD0D0D0C5C5C5C1C1C1B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        F4C692FFFDDEFFFFE0FFFDDEFFF8DDB6D49245A9320C9A0C40A226EAD3A9F4C6
        92FF00FFFF00FFFF00FFFF00FFFF00FFB4B4B4DFDFDFE0E0E0DFDFDFDFDFDFD6
        D6D6909090767676878787BABABAB4B4B4FF00FFFF00FFFF00FFFF00FFFF00FF
        F4C692FEFBDCFFFFE1FFFEE0FFFFE8ACD791008D0030A3233EA72D73C367FFE3
        C4FF00FFFF00FFFF00FFFF00FFFF00FFB4B4B4DEDEDEE1E1E1E0E0E0E4E4E4D7
        D7D76969698686868D8D8DB8B8B8D2D2D2FF00FFFF00FFFF00FFFF00FFFF00FF
        F2B475F9C78DFBE1B4FEF2CFFEF8DFB9DC9D36A2246EB855FFF8F087C672FCE5
        C6F4C692FF00FFFF00FFFF00FFFF00FFA4A4A4B4B4B4C8C8C8D7D7D7DFDFDFDF
        DFDF868686A9A9A9E8E8E8BFBFBFD2D2D2B4B4B4FF00FFFF00FFFF00FFF2BC84
        F5B776F8BB7CF9C185FCD09BFEE3C085C269FDF4DB89C36C4EB14662B953FCF4
        DCF4C692FF00FFFF00FFFF00FFACACACA6A6A6ABABABB0B0B0BCBCBCD0D0D0B8
        B8B8DDDDDDBABABA9E9E9EA9A9A9DDDDDDB4B4B4FF00FFFF00FFFF00FFF3BA81
        F7B776F8BE81FAC68DFDD09CFFE7C55EAF417DC46BA7D694008F0021A320FFFC
        ECF4C692FF00FFFF00FFFF00FFABABABA7A7A7ADADADB4B4B4BDBDBDD3D3D39B
        9B9BBABABAD8D8D86A6A6A848484E6E6E6B4B4B4FF00FFFF00FFFF00FFF0B77A
        F7B877F8BF82FBC88EFDD29DFFE5C0D0DEAA06980600940000960027A526FFFC
        F1F2C084FF00FFFF00FFFF00FFA6A6A6A8A8A8AEAEAEB5B5B5BEBEBED0D0D0E7
        E7E77272726D6D6D6E6E6E888888E9E9E9ACACACFF00FFFF00FFF2BD87F5B97A
        F7B776F8BD7FF7C48AF9CC96FBD4A4FDE1BDCBCE9170AF49A3C87CAFD593F9FB
        E5F2C084F3C18BFF00FFADADADA8A8A8A7A7A7ACACACB1B1B1B8B8B8C0C0C0CE
        CECED2D2D29F9F9FC5C5C5D7D7D7E1E1E1ACACACB0B0B0FF00FFF1BA82F5B97A
        F6C995F6C995F6C995EFC087EFC087EFC087F1C896F2CD9FFFDFB9FED8ADF3D6
        A7F6DCB1F3C18BFF00FFAAAAAAA8A8A8B6B6B6B6B6B6B6B6B6ACACACACACACAC
        ACACB4B4B4B9B9B9CDCDCDC6C6C6BEBEBEC4C4C4B0B0B0FF00FFF3C18AF6C995
        F0B87CECAE6EEEB475F1BF86F4CD99F7DCAFFBEBC6FEF8D9FFFCDEFEF9DAFBE9
        C1F5D09BF2C088FF00FFAFAFAFB6B6B6A7A7A79E9E9EA2A2A2ACACACB7B7B7C4
        C4C4D1D1D1DCDCDCDFDFDFDDDDDDCFCFCFB9B9B9AEAEAEFF00FFF6C995EDAF6F
        ECAB6AECAD6CEEB577F1C188F4CE9BF7DCAFFBEBC4FEF9D8FFFCDEFFFCDDFFFE
        E1FEFBDBF1C084FF00FFB6B6B69F9F9F9C9C9C9D9D9DA3A3A3ADADADB8B8B8C4
        C4C4D0D0D0DCDCDCDFDFDFDFDFDFE1E1E1DDDDDDABABABFF00FFF2BE86EBAA68
        ECAD6CECAD6CEEB679F2C28AF4CF9DF8DDB1FBECC6FEFAD9FFFCDDFFFCDDFFFC
        DDFFFFE5F1C084FF00FFADADAD9A9A9A9D9D9D9D9D9DA4A4A4AFAFAFB9B9B9C5
        C5C5D1D1D1DCDCDCDFDFDFDFDFDFDFDFDFE3E3E3ABABABFF00FFF5C894EFB579
        ECAC6AECAD6CEFB67AF2C48DF5D29FF8DFB4FCEEC9FFFCDDFFFEE0FFFFE1FFFE
        DFFBE8BFF1C084FF00FFB5B5B5A5A5A59C9C9C9D9D9DA5A5A5B0B0B0BBBBBBC7
        C7C7D3D3D3DFDFDFE0E0E0E1E1E1E0E0E0CECECEABABABFF00FFFF00FFF2C084
        F2C084EEB475F0B97EF2C58FF5D4A4F9E3BAFDF2CFFEF8D7FDF1CCFBE8C0F6D0
        9DF2C084FF00FFFF00FFFF00FFACACACACACACA2A2A2A8A8A8B1B1B1BDBDBDCA
        CACAD7D7D7DBDBDBD5D5D5CECECEBABABAACACACFF00FFFF00FFFF00FFFF00FF
        FF00FFF2C084F2C084F2C084F2C084F2C084F2C084F2C084F2C084F2C084FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACACACACACACACACACACACAC
        ACACACACACACACACACACACACACACFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentFont = False
      OnClick = butExcluirClick
    end
    object butSair: TSpeedButton
      Left = 580
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Sai&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
        9090808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF9A66669A6666B96666BB6868693334FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9494949494948F8F8F91
        9191808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
        669A66669A6666FF00FFFF00FFFF00FF9494949494949898989D9D9D9D9D9D95
        9595808080949494949494949494949494949494949494FF00FFFF00FFFF00FF
        9A6666DE7374D77071D56F70D56D6EC76A6D693334FEA2A3FCAFB0FABCBDF9C5
        C6F9C5C69A6666FF00FFFF00FFFF00FF949494A8A8A8A3A3A3A2A2A2A1A1A198
        9898808080D0D0D0D5D5D5DBDBDBDFDFDFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
        5BF9C5C69A6666FF00FFFF00FFFF00FF949494ABABABA8A8A8A7A7A7A6A6A69D
        9D9D8080808F8F8F8E8E8E8E8E8E868686DFDFDF949494FF00FFFF00FFFF00FF
        9A6666E57D7EE07A7BDF797ADF7778D0727569333442C46830CD6733CB6724CB
        60F9C5C69A6666FF00FFFF00FFFF00FF949494B1B1B1ADADADACACACABABABA1
        A1A18080809292929292929393938B8B8BDFDFDF949494FF00FFFF00FFFF00FF
        9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
        5EF9C5C69A6666FF00FFFF00FFFF00FF949494B6B6B6B2B2B2B0B0B0B3B3B3A3
        A3A38080808F8F8F8E8E8E909090898989DFDFDF949494FF00FFFF00FFFF00FF
        9A6666F08788E98182EC9697FBDDDED8888A693334B8E1AC6BDC895DD58046D4
        73F9C5C69A6666FF00FFFF00FFFF00FF949494BBBBBBB5B5B5C1C1C1ECECECB0
        B0B0808080DADADAB7B7B7ADADADA1A1A1DFDFDF949494FF00FFFF00FFFF00FF
        9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
        D4F9C5C69A6666FF00FFFF00FFFF00FF949494C0C0C0BABABAC4C4C4ECECECB1
        B1B1808080F1F1F1EFEFEFEEEEEEE8E8E8DFDFDF949494FF00FFFF00FFFF00FF
        9A6666FA9192F48E8FF28B8CF48C8DDC7F80693334FDF3D4FFFFDFFFFFDDFFFF
        E0F9C5C69A6666FF00FFFF00FFFF00FF949494C5C5C5C1C1C1BEBEBEC0C0C0AD
        ADAD808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF949494CACACAC6C6C6C5C5C5C4C4C4B2
        B2B2808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666FF9B9CFD9798FC9697FE9798E38889693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF949494CDCDCDCACACAC9C9C9CACACAB5
        B5B5808080EEEEEEEFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF949494CFCFCFCCCCCCCCCCCCCCCCCCB9
        B9B9808080E8E8E8EFEFEFEEEEEEEFEFEFDFDFDF949494FF00FFFF00FFFF00FF
        9A66669A6666E98E8FFE999AFF9D9EEB8F90693334FBF0D2FDFCDCFDFCDAFDFC
        DCF9C5C69A6666FF00FFFF00FFFF00FF949494949494BBBBBBCBCBCBCECECEBD
        BDBD808080E6E6E6ECECECEBEBEBECECECDFDFDF949494FF00FFFF00FFFF00FF
        FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
        669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FF949494A4A4A4AEAEAEB1
        B1B1808080949494949494949494949494949494949494FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF9A66669A6666693334FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92929290
        9090808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentFont = False
      OnClick = butSairClick
    end
    object lblFiltro: TLabel
      Left = 8
      Top = 16
      Width = 89
      Height = 16
      Caption = 'F1-Ir para Data'
    end
  end
  object Pedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido'
    Left = 184
    Top = 136
    object PedidoNUM_PEDIDO: TIntegerField
      DisplayLabel = 'N'#186'Pedido'
      FieldName = 'NUM_PEDIDO'
      Required = True
    end
    object PedidoCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd.Cliente'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object PedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object PedidoCOD_FOR: TIntegerField
      DisplayLabel = 'Cod.Fornecedor'
      FieldName = 'COD_FOR'
      Required = True
    end
    object PedidoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object PedidoSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object PedidoTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Valor '
      FieldName = 'TOTAL_LIQUIDO'
      DisplayFormat = ',##0.00'
    end
    object PedidoNOME_CLI: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLI'
      Size = 60
    end
    object PedidoNOME_FOR: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'NOME_FOR'
      Size = 60
    end
  end
  object dsPedido: TDataSource
    DataSet = Pedido
    Left = 240
    Top = 136
  end
  object dspPedido: TDataSetProvider
    DataSet = QPedido
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 136
  end
  object QPedido: TSQLQuery
    SQLConnection = DM.BancoDados
    Params = <>
    SQL.Strings = (
      'select'
      '   PED.COD_CLIENTE,'
      '   PED.COD_EMPRESA,'
      '   PED.COD_FOR,'
      '   PED.DATA,'
      '   PED.NUM_PEDIDO,'
      '   PED.SITUACAO,'
      '   PED.TOTAL_LIQUIDO,'
      '   CLI.NOME AS NOME_CLI,'
      '   FO.NOME AS NOME_FOR'
      'from PEDIDO PED'
      '   left join CLIENTE CLI on PED.COD_CLIENTE = CLI.COD_CLIENTE'
      '   left join FORNECEDOR FO on PED.COD_FOR = FO.COD_FOR')
    Left = 48
    Top = 136
    object QPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPedidoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QPedidoCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QPedidoCOD_FOR: TIntegerField
      FieldName = 'COD_FOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QPedidoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QPedidoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object QPedidoTOTAL_LIQUIDO: TFloatField
      FieldName = 'TOTAL_LIQUIDO'
      ProviderFlags = [pfInUpdate]
    end
    object QPedidoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      ProviderFlags = []
      Size = 60
    end
    object QPedidoNOME_FOR: TStringField
      FieldName = 'NOME_FOR'
      ProviderFlags = []
      Size = 60
    end
  end
  object QAux: TSQLQuery
    SQLConnection = DM.BancoDados
    Params = <>
    SQL.Strings = (
      'select'
      '   PED.COD_CLIENTE,'
      '   PED.COD_EMPRESA,'
      '   PED.COD_FOR,'
      '   PED.DATA,'
      '   PED.NUM_PEDIDO,'
      '   PED.SITUACAO,'
      '   PED.TOTAL_LIQUIDO,'
      '   CLI.NOME AS NOME_CLI,'
      '   FO.NOME AS NOME_FOR'
      'from PEDIDO PED'
      '   left join CLIENTE CLI on PED.COD_CLIENTE = CLI.COD_CLIENTE'
      '   left join FORNECEDOR FO on PED.COD_FOR = FO.COD_FOR')
    Left = 312
    Top = 136
  end
end
