object fExtratoBanco: TfExtratoBanco
  Left = 255
  Top = 149
  BorderStyle = bsSingle
  Caption = 'Extrato de Contas Banc'#225'rias'
  ClientHeight = 269
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 55
    Height = 16
    Caption = 'Dt. Pagto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 136
    Top = 24
    Width = 20
    Height = 16
    Caption = 'At'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 80
    Width = 35
    Height = 16
    Caption = 'Conta'
  end
  object butNumConta: TSpeedButton
    Left = 314
    Top = 97
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
    OnClick = butNumContaClick
  end
  object DataIni: TMaskEdit
    Left = 40
    Top = 40
    Width = 81
    Height = 22
    Ctl3D = False
    EditMask = '##/##/####'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
  end
  object Datafin: TMaskEdit
    Left = 136
    Top = 40
    Width = 81
    Height = 22
    Ctl3D = False
    EditMask = '##/##/####'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Text = '  /  /    '
  end
  object Num_Conta: TEdit
    Left = 88
    Top = 96
    Width = 225
    Height = 22
    CharCase = ecUpperCase
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    OnEnter = Num_ContaEnter
    OnExit = Num_ContaExit
  end
  object Id_ContaBanco: TMaskEdit
    Left = 40
    Top = 96
    Width = 49
    Height = 22
    TabStop = False
    Ctl3D = False
    EditMask = '####;0;_'
    MaxLength = 4
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 3
    Text = ''
    OnExit = Id_ContaBancoExit
  end
  object Panel1: TPanel
    Left = 0
    Top = 228
    Width = 464
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object butImprimir: TBitBtn
      Left = 112
      Top = 8
      Width = 100
      Height = 25
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB3B1B2FF00FFFF00FFFF00FF9A99999A9999A4A1
        A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA8A8A8FF
        00FFFF00FFFF00FF8F8F8F8F8F8F989898FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFB3B1B2B3B1B2DEDCDCABA9A95553546F6D6EAEACACD2D0D1E0DF
        DF9A9999FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA8A8A8A8A8A8D3D3D3A0
        A0A04A4A4A646464A3A3A3C7C7C7D5D5D58F8F8FFF00FFFF00FFFF00FFFF00FF
        B3B1B2B3B1B2FBFBFBFFFFFFE0DEDFB2B0B05F5E603131333131344F4D4F8180
        819A9999A4A1A2FF00FFFF00FFFF00FFA8A8A8A8A8A8F1F1F1F5F5F5D5D5D5A7
        A7A75555552828282828284444447676768F8F8F989898FF00FFA7A4A5B3B1B2
        F4F2F3FFFFFFF2F0F0D6D5D5B3B1B2A4A1A1ACA9AA9E9D9D7E7D7D5655573536
        383635378D8B8CFF00FF9B9B9BA8A8A8E9E9E9F5F5F5E7E7E7CBCBCBA8A8A898
        9898A0A0A09393937373734C4C4C2C2C2C2C2C2C828282FF00FFB0ADAEEEEDED
        EBEBEBCCCACAB9B7B7C4C2C2D0CFCFB7B5B5ABA8A9A8A6A6ACA9AAAFADADA4A1
        A28584849A9999FF00FFA4A4A4E3E3E3E1E1E1C1C1C1AEAEAEB9B9B9C5C5C5AC
        ACAC9F9F9F9D9D9DA0A0A0A4A4A49898987A7A7A8F8F8FFF00FFAAA7A8BFBDBE
        B7B5B5C1C0C0D5D5D5DCDDDDF1F1F0F4F2F4E4E3E3D2D1D1BFBDBDAFADAEA9A6
        A6ACA9AAA4A1A2FF00FF9E9E9EB4B4B4ACACACB6B6B6CBCBCBD2D2D2E6E6E6E9
        E9E9D9D9D9C7C7C7B4B4B4A4A4A49D9D9DA0A0A0989898FF00FFA7A4A5C0BFC0
        D5D4D4D9D9D9D5D5D5E9E9E9DCDADAB5BDB5CCCBCBD7D9DADFDFDFDDDDDDD3D2
        D2C6C6C6ADACACFF00FF9B9B9BB5B5B5CACACACFCFCFCBCBCBDFDFDFD1D1D1AF
        AFAFC1C1C1CECECED5D5D5D3D3D3C8C8C8BCBCBCA2A2A2FF00FFFF00FFB0AEAF
        DBDCDCDADADAE4E4E4D5D3D3C5C1C4B8DCBAC9D1CBD2BAB5BFB7B6BBB9BAC4C2
        C3D0CFCFBBB9BAFF00FFFF00FFA5A5A5D1D1D1D0D0D0DADADACACACAB9B9B9C0
        C0C0C3C3C3B9B9B9B0B0B0B0B0B0B9B9B9C5C5C5B0B0B0FF00FFFF00FFFF00FF
        B0AEAFCFCDCDC0BFBFC2C1C1EAEAEAF8F6F6F2F1F2F1E8E6E4E1E1D8D8D8C4C4
        C4A9A6A7FF00FFFF00FFFF00FFFF00FFA5A5A5C4C4C4B5B5B5B7B7B7E0E0E0ED
        EDEDE7E7E7E1E1E1D8D8D8CECECEBABABA9D9D9DFF00FFFF00FFFF00FFFF00FF
        FF00FFB0AEAFE1E3E3D6D6D7B1B3B4CACDCFDDDFE0DEE2E2DFDFDFD3D2D3C0BF
        BFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5A5A5C4C4C4B8B8B8969696AE
        AEAEC0C0C0C2C2C2C1C1C1C8C8C8B5B5B5FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFCEBE8FAE7DEEED5CCEAD4CCE9D8D4E6DDD9DBD9D8AAA8AAFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4CECECEBFBFBFBD
        BDBDC0C0C0C1C1C1BBBBBB9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFD9B3B1FFE6D9FFDACCFFD1C0FFC9B6FFC2AEFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A7CECECEC7C7C7C1
        C1C1BCBCBCB8B8B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFD9B3B1FFE5D9FFD8CBFED0C1FFCAB7F9BBA8FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A7CECECEC7C7C7C1
        C1C1BDBDBDB2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFD9B3B1FFE5D9FFD8CBFED0C1FEC8B6FBC1AEFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A7CECECEC7C7C7C1
        C1C1BCBCBCB6B6B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD9B3B1FBE7DFFFE3D8FFD9CCFFD3C2FDC8B6FABFAEFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A7CFCFCFCDCDCDC7C7C7C2
        C2C2BBBBBBB6B6B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD9B3B1D9B3B1D9B3B1D9B3B1F6BFB1F6BFB1FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A7A7A7A7A7A7A7A7A7A7B5
        B5B5B5B5B5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = butImprimirClick
    end
    object butSair: TBitBtn
      Left = 216
      Top = 8
      Width = 100
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
      TabOrder = 1
      OnClick = butSairClick
    end
  end
  object QContas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA2'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '    CON.DATA_EMISSAO,'
      '    CON.DATA_PAGO,'
      '    CON.DOCUMENTO,'
      '    CON.TIPO_CONTA,'
      '    CON.VALOR_PAGAR,'
      '    CON.VALOR_PAGO,'
      '    CON.ID_CONTABANCO,'
      '    CAR.NUM_PEDIDO,'
      '    BAN.NUM_CONTA,'
      '    OBS.TEXTO'
      ''
      'from CONTAS CON'
      '   left join CARGA CAR on CON.NUM_PEDIDO = CAR.ID_CARGA'
      ''
      
        '   left join CONTABANCO BAN on CON.ID_CONTABANCO = BAN.ID_CONTAB' +
        'ANCO'
      '   left join OBS_CONTAS OBS on CON.ID_CONTA = OBS.ID_CONTA'
      ''
      '   where CON.COD_EMPRESA = :CODEMPRESA'
      '   and CON.DATA_PAGO between :DATAINI and :DATAFIN'
      '   and CON.TIPO_CONTA IN (2,3)'
      '   and ((CON.ID_CONTABANCO = :CONTA1) or (:CONTA2 = 0))'
      '   and CON.VALOR_PAGO > 0'
      '   order by 2'
      '')
    SQLConnection = DM.BancoDados
    Left = 312
    Top = 32
    object QContasDATA_EMISSAO: TSQLTimeStampField
      FieldName = 'DATA_EMISSAO'
    end
    object QContasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object QContasTIPO_CONTA: TIntegerField
      FieldName = 'TIPO_CONTA'
    end
    object QContasVALOR_PAGAR: TFloatField
      FieldName = 'VALOR_PAGAR'
    end
    object QContasVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
    end
    object QContasID_CONTABANCO: TIntegerField
      FieldName = 'ID_CONTABANCO'
    end
    object QContasNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object QContasNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
    end
    object QContasDATA_PAGO: TSQLTimeStampField
      FieldName = 'DATA_PAGO'
    end
    object QContasTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 200
    end
  end
  object Contas: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUM_PEDIDO'
        DataType = ftInteger
      end
      item
        Name = 'CREDITO'
        DataType = ftFloat
      end
      item
        Name = 'DEBITO'
        DataType = ftFloat
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end
      item
        Name = 'CONTA_BANCO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftFloat
      end
      item
        Name = 'TEXTO'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 168
    Data = {
      D60000009619E0BD010000001800000009000000000003000000D60004444154
      41040006000000000009444F43554D454E544F01004900000001000557494454
      480200020014000A4E554D5F50454449444F0400010000000000074352454449
      544F08000400000000000644454249544F08000400000000000553414C444F08
      000400000000000B434F4E54415F42414E434F01004900000001000557494454
      480200020014000E53414C444F5F414E544552494F5208000400000000000554
      4558544F01004900000001000557494454480200020064000000}
    object ContasDATA: TDateField
      FieldName = 'DATA'
    end
    object ContasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object ContasNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object ContasCREDITO: TFloatField
      FieldName = 'CREDITO'
    end
    object ContasDEBITO: TFloatField
      FieldName = 'DEBITO'
    end
    object ContasSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object ContasCONTA_BANCO: TStringField
      FieldName = 'CONTA_BANCO'
    end
    object ContasSALDO_ANTERIOR: TFloatField
      FieldName = 'SALDO_ANTERIOR'
    end
    object ContasTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 100
    end
  end
  object dsContas: TDataSource
    DataSet = Contas
    Left = 104
    Top = 168
  end
  object dbContas: TppDBPipeline
    DataSource = dsContas
    UserName = 'dbContas'
    Left = 160
    Top = 168
    object dbContasppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 0
    end
    object dbContasppField2: TppField
      FieldAlias = 'DOCUMENTO'
      FieldName = 'DOCUMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object dbContasppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_PEDIDO'
      FieldName = 'NUM_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object dbContasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CREDITO'
      FieldName = 'CREDITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object dbContasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBITO'
      FieldName = 'DEBITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object dbContasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object dbContasppField7: TppField
      FieldAlias = 'CONTA_BANCO'
      FieldName = 'CONTA_BANCO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object dbContasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_ANTERIOR'
      FieldName = 'SALDO_ANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object dbContasppField9: TppField
      FieldAlias = 'TEXTO'
      FieldName = 'TEXTO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
  end
  object Rel: TppReport
    AutoStop = False
    DataPipeline = dbContas
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
    OnPreviewFormCreate = RelPreviewFormCreate
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
    Left = 216
    Top = 168
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbContas'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkEnabled = False
        Caption = 'Dt.Pagto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 14288
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        HyperlinkEnabled = False
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 14288
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        HyperlinkEnabled = False
        Caption = 'N'#186'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 171450
        mmTop = 14288
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        HyperlinkEnabled = False
        Caption = 'Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 210344
        mmTop = 14288
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        HyperlinkEnabled = False
        Caption = 'D'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 232834
        mmTop = 14288
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        HyperlinkEnabled = False
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 264584
        mmTop = 14288
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        HyperlinkEnabled = False
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 191030
        mmTop = 14288
        mmWidth = 9790
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 12171
        mmTop = 17198
        mmWidth = 263261
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'Extrato do Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 63500
        mmTop = 0
        mmWidth = 102129
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        HyperlinkEnabled = False
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 63500
        mmTop = 4233
        mmWidth = 102129
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        HyperlinkEnabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        HyperlinkEnabled = False
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        HyperlinkEnabled = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 228600
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        HyperlinkEnabled = False
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 84667
        mmTop = 8467
        mmWidth = 29104
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'SALDO_ANTERIOR'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 116152
        mmTop = 8467
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        HyperlinkEnabled = False
        Caption = 'Obseva'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 63500
        mmTop = 14288
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        HyperlinkEnabled = False
        DataField = 'DATA'
        DataPipeline = dbContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        HyperlinkEnabled = False
        DataField = 'DOCUMENTO'
        DataPipeline = dbContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 0
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        HyperlinkEnabled = False
        DataField = 'NUM_PEDIDO'
        DataPipeline = dbContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 171450
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        HyperlinkEnabled = False
        DataField = 'CONTA_BANCO'
        DataPipeline = dbContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 186267
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        HyperlinkEnabled = False
        DataField = 'CREDITO'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 205317
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        HyperlinkEnabled = False
        DataField = 'DEBITO'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 226484
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        HyperlinkEnabled = False
        DataField = 'SALDO'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 247650
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = True
        DataField = 'TEXTO'
        DataPipeline = dbContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 63765
        mmTop = 0
        mmWidth = 105304
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        HyperlinkEnabled = False
        DataField = 'CREDITO'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 245534
        mmTop = 10054
        mmWidth = 23283
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 12435
        mmTop = 0
        mmWidth = 262996
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        HyperlinkEnabled = False
        DataField = 'DEBITO'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 245269
        mmTop = 14288
        mmWidth = 23548
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        HyperlinkEnabled = False
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 175684
        mmTop = 12171
        mmWidth = 27252
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17463
        mmLeft = 207434
        mmTop = 5821
        mmWidth = 4498
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        HyperlinkEnabled = False
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 211667
        mmTop = 5821
        mmWidth = 27252
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        HyperlinkEnabled = False
        Caption = 'Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 211667
        mmTop = 10054
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        HyperlinkEnabled = False
        Caption = 'D'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 211667
        mmTop = 14288
        mmWidth = 11642
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        HyperlinkEnabled = False
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 211667
        mmTop = 18521
        mmWidth = 21431
        BandType = 7
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        HyperlinkEnabled = False
        DataField = 'SALDO'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 245005
        mmTop = 18521
        mmWidth = 23813
        BandType = 7
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'SALDO_ANTERIOR'
        DataPipeline = dbContas
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbContas'
        mmHeight = 3440
        mmLeft = 245269
        mmTop = 5821
        mmWidth = 23548
        BandType = 7
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
  object QSaldoAntR: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA_REC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_REC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODEMPRESA_PAG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_PAG'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTA4'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   REC.TIPO_CONTA,'
      '   sum(REC.VALOR_PAGO) as SALDO'
      'from CONTAS REC'
      '   where REC.COD_EMPRESA = :CODEMPRESA_REC'
      '   and REC.DATA_PAGO < :DATA_REC'
      '   and REC.TIPO_CONTA = 2'
      '   and REC.VALOR_PAGO > 0'
      '   and ((REC.ID_CONTABANCO = :CONTA1) or (:CONTA2 = 0))'
      '   GROUP BY REC.TIPO_CONTA'
      ''
      'union'
      'select'
      '   PAG.TIPO_CONTA,'
      '   sum(PAG.VALOR_PAGO) as SALDO'
      'from CONTAS PAG'
      '   where PAG.COD_EMPRESA = :CODEMPRESA_PAG'
      '   and PAG.DATA_PAGO < :DATA_PAG'
      '   and PAG.TIPO_CONTA = 3'
      '   and PAG.VALOR_PAGO > 0'
      '   and ((PAG.ID_CONTABANCO = :CONTA3) or (:CONTA4 = 0))'
      '   GROUP BY PAG.TIPO_CONTA'
      'order by 1')
    SQLConnection = DM.BancoDados
    Left = 384
    Top = 32
    object QSaldoAntRTIPO_CONTA: TIntegerField
      FieldName = 'TIPO_CONTA'
    end
    object QSaldoAntRSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
end
