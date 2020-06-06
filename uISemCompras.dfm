object fISemCompras: TfISemCompras
  Left = 126
  Top = 120
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Clientes sem Compras dentro do Per'#237'odo'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 64
    Height = 16
    Caption = 'Data Base'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 200
    Height = 16
    Caption = 'Quantidade de Dias sem Compra'
  end
  object Label3: TLabel
    Left = 472
    Top = 56
    Width = 253
    Height = 16
    Caption = 'Duplo Click para Ver o Hist'#243'rico do Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Database: TMaskEdit
    Left = 224
    Top = 8
    Width = 81
    Height = 22
    Ctl3D = False
    EditMask = '##/##/####'
    MaxLength = 10
    ParentCtl3D = False
    TabOrder = 0
    Text = '  /  /    '
    OnExit = DatabaseExit
  end
  object QtdeDias: TMaskEdit
    Left = 224
    Top = 40
    Width = 81
    Height = 22
    Ctl3D = False
    EditMask = '#####;0;_'
    MaxLength = 5
    ParentCtl3D = False
    TabOrder = 1
    OnExit = QtdeDiasExit
  end
  object Panel1: TPanel
    Left = 0
    Top = 475
    Width = 742
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object butImprimir: TBitBtn
      Left = 280
      Top = 8
      Width = 100
      Height = 25
      Caption = '&Imprimir'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = butImprimirClick
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
    end
    object butSair: TBitBtn
      Left = 384
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Sai&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = butSairClick
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
    end
  end
  object Data: TEdit
    Left = 120
    Top = 16
    Width = 89
    Height = 24
    TabOrder = 4
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 72
    Width = 721
    Height = 393
    DataSource = dsCliente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object butOk: TBitBtn
    Left = 316
    Top = 16
    Width = 100
    Height = 41
    Caption = '&Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = butOkClick
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
  end
  object Qcliente: TSQLQuery
    SQLConnection = DM.BancoDados
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
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
      end>
    SQL.Strings = (
      'select'
      '   CLI.COD_CLIENTE,'
      '   CLI.NOME,'
      '   CLI.FONE,'
      '   CLI.FAX,'
      '   CID.DESC_CIDADE,'
      '   UF.SIGLA'
      'from CLIENTE CLI'
      '   left join CIDADE CID on CLI.COD_CIDADE = CID.COD_CIDADE'
      '   left join ESTADO UF on CID.ID_ESTADO = UF.ID_ESTADO'
      '   where not exists'
      '   ('
      '      select 1 from PEDIDO PED'
      '      where CLI.COD_CLIENTE = PED.COD_CLIENTE'
      '      and PED.COD_EMPRESA = :COD_EMPRESA'
      '      and PED.DATA between :DATAINI and :DATAFIN'
      '   )'
      '   order by CLI.NOME')
    Left = 48
    Top = 168
  end
  object dspCliente: TDataSetProvider
    DataSet = Qcliente
    Constraints = True
    Left = 112
    Top = 168
  end
  object Cliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_EMPRESA'
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
        ParamType = ptUnknown
      end>
    ProviderName = 'dspCliente'
    Left = 176
    Top = 168
    object ClienteCOD_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object ClienteNOME: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object ClienteFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FONE'
      Size = 15
    end
    object ClienteFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Size = 15
    end
    object ClienteDESC_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object ClienteSIGLA: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
  end
  object dsCliente: TDataSource
    DataSet = Cliente
    OnStateChange = dsClienteStateChange
    Left = 240
    Top = 168
  end
  object dbCliente: TppDBPipeline
    DataSource = dsCliente
    UserName = 'dbCliente'
    Left = 296
    Top = 168
  end
  object Rel: TppReport
    AutoStop = False
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OnPreviewFormCreate = RelPreviewFormCreate
    Left = 352
    Top = 168
    Version = '6.0'
    mmColumnWidth = 0
    DataPipelineName = 'dbCliente'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 19050
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 19050
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 82550
        mmTop = 19050
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 135467
        mmTop = 19050
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 18256
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 122767
        mmTop = 19050
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Relat'#243'rio de Clientes sem Compras dentro do Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 33867
        mmTop = 0
        mmWidth = 136261
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197380
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 57150
        mmTop = 4233
        mmWidth = 92869
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 4233
        mmWidth = 15610
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 160867
        mmTop = 6350
        mmWidth = 24077
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbCliente'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbCliente'
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 0
        mmWidth = 66411
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESC_CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbCliente'
        mmHeight = 3440
        mmLeft = 82550
        mmTop = 0
        mmWidth = 39688
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbCliente'
        mmHeight = 3440
        mmLeft = 135467
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbCliente'
        mmHeight = 3440
        mmLeft = 165100
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SIGLA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbCliente'
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 7
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Total Geral =>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1588
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'COD_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbCliente'
        mmHeight = 3440
        mmLeft = 29633
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
    end
  end
end
