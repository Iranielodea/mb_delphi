object fICaixa: TfICaixa
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio do Caixa'
  ClientHeight = 300
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
  TextHeight = 13
  object lblPeriodo: TLabel
    Left = 144
    Top = 48
    Width = 42
    Height = 16
    Caption = 'Vencto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 240
    Top = 48
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 121
    Height = 81
    Caption = 'Tipo de Relat'#243'rio:'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object RPrevisao: TRadioButton
      Left = 8
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Previs'#227'o'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnEnter = RPrevisaoEnter
    end
    object RReal: TRadioButton
      Left = 8
      Top = 48
      Width = 65
      Height = 17
      Caption = 'Realizado'
      TabOrder = 1
      OnEnter = RRealEnter
    end
  end
  object DataIni: TMaskEdit
    Left = 144
    Top = 64
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
  object Datafin: TMaskEdit
    Left = 240
    Top = 64
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
    TabOrder = 2
    Text = '  /  /    '
  end
  object Panel1: TPanel
    Left = 0
    Top = 259
    Width = 468
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
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
  object QSaldoAntP: TSQLQuery
    SQLConnection = DM.BancoDados
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
        Name = 'CODEMPRESA_PAG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_PAG'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   REC.TIPO_CONTA,'
      '   sum(REC.VALOR_PAGAR) - sum(REC.VALOR_PAGO) as SALDO'
      'from CONTAS REC'
      '   where REC.COD_EMPRESA = :CODEMPRESA_REC'
      '   and REC.DATA_VENCTO < :DATA_REC'
      '   and REC.TIPO_CONTA = 2'
      '   group by REC.TIPO_CONTA'
      ''
      'union'
      'select'
      '   PAG.TIPO_CONTA,'
      '   sum(PAG.VALOR_PAGAR) - sum(PAG.VALOR_PAGO) as SALDO'
      'from CONTAS PAG'
      '   where PAG.COD_EMPRESA = :CODEMPRESA_PAG'
      '   and PAG.DATA_VENCTO < :DATA_PAG'
      '   and PAG.TIPO_CONTA = 3'
      '   group by PAG.TIPO_CONTA'
      'order by 1')
    Left = 352
    Top = 24
    object QSaldoAntPSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object QSaldoAntR: TSQLQuery
    SQLConnection = DM.BancoDados
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
        Name = 'CODEMPRESA_PAG'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA_PAG'
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
      '   GROUP BY PAG.TIPO_CONTA'
      'order by 1')
    Left = 416
    Top = 24
    object QSaldoAntRSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object Rel: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 120
    Data = {
      650000009619E0BD010000001800000005000000000003000000650004444154
      4104000600000000000752454345424552080004000000000005504147415208
      00040000000000094449464552454E434108000400000000000553414C444F08
      000400000000000000}
    object RelDATA: TDateField
      FieldName = 'DATA'
    end
    object RelRECEBER: TFloatField
      FieldName = 'RECEBER'
    end
    object RelPAGAR: TFloatField
      FieldName = 'PAGAR'
    end
    object RelDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
    object RelSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object Qprev: TSQLQuery
    SQLConnection = DM.BancoDados
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
      end>
    SQL.Strings = (
      'select DISTINCT'
      '    CON.DATA_VENCTO,'
      '    ('
      
        '        select sum(REC.VALOR_PAGAR) - sum(REC.VALOR_PAGO) from C' +
        'ONTAS REC'
      '            where REC.COD_EMPRESA = CON.COD_EMPRESA'
      '            and REC.DATA_VENCTO = CON.DATA_VENCTO'
      '            and REC.TIPO_CONTA = 2'
      '    ) AS RECEBER,'
      ''
      '    ('
      
        '        select sum(PAG.VALOR_PAGAR) - sum(PAG.VALOR_PAGO) from C' +
        'ONTAS PAG'
      '            where PAG.COD_EMPRESA = CON.COD_EMPRESA'
      '            and PAG.DATA_VENCTO = CON.DATA_VENCTO'
      '            and PAG.TIPO_CONTA = 3'
      '    ) AS PAGAR'
      ''
      'from CONTAS CON'
      '   where CON.COD_EMPRESA = :CODEMPRESA'
      '   and CON.DATA_VENCTO between :DATAINI and :DATAFIN'
      '   and CON.TIPO_CONTA IN (2,3)'
      '   order by 1'
      '')
    Left = 344
    Top = 120
    object QprevDATA_VENCTO: TSQLTimeStampField
      FieldName = 'DATA_VENCTO'
    end
    object QprevRECEBER: TFloatField
      FieldName = 'RECEBER'
    end
    object QprevPAGAR: TFloatField
      FieldName = 'PAGAR'
    end
  end
  object dbRel: TppDBPipeline
    DataSource = dsRel
    UserName = 'dbRel'
    Left = 224
    Top = 120
    object dbRelppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 0
    end
    object dbRelppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEBER'
      FieldName = 'RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object dbRelppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAGAR'
      FieldName = 'PAGAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object dbRelppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object dbRelppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object Relatorio1: TppReport
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
    OnPreviewFormCreate = Relatorio1PreviewFormCreate
    Left = 280
    Top = 120
    Version = '6.0'
    mmColumnWidth = 0
    DataPipelineName = 'dbRel'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Data Vencto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 23283
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 23283
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 59267
        mmTop = 23283
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Diferen'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 76200
        mmTop = 23283
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 23283
        mmWidth = 8996
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Relat'#243'rio de Previs'#227'o de Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 38100
        mmTop = 0
        mmWidth = 126736
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 6350
        mmWidth = 127000
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 17727
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 4233
        mmWidth = 13758
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 0
        mmWidth = 21960
        BandType = 0
      end
      object lblSaldoAnt: TppLabel
        UserName = 'lblSaldoAnt'
        AutoSize = False
        Caption = 'lblSaldoAnt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 10583
        mmWidth = 127000
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'RECEBER'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 23283
        mmTop = 264
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PAGAR'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 46567
        mmTop = 264
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DIFERENCA'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 69850
        mmTop = 264
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDO'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 93134
        mmTop = 0
        mmWidth = 33338
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
        mmWidth = 197115
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'RECEBER'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 23019
        mmTop = 1323
        mmWidth = 22490
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PAGAR'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 46302
        mmTop = 1323
        mmWidth = 22490
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'DIFERENCA'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3439
        mmLeft = 69850
        mmTop = 1323
        mmWidth = 22490
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Total=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 13758
        BandType = 7
      end
    end
  end
  object dsRel: TDataSource
    DataSet = Rel
    Left = 168
    Top = 120
  end
  object Qreal: TSQLQuery
    SQLConnection = DM.BancoDados
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
      end>
    SQL.Strings = (
      'select DISTINCT'
      '    CON.DATA_PAGO,'
      '    ('
      '        select sum(REC.VALOR_PAGO) from CONTAS REC'
      '            where REC.COD_EMPRESA = CON.COD_EMPRESA'
      '            and REC.DATA_PAGO = CON.DATA_PAGO'
      '            and REC.TIPO_CONTA = 2'
      '    ) AS RECEBER,'
      ''
      '    ('
      '        select sum(PAG.VALOR_PAGO) from CONTAS PAG'
      '            where PAG.COD_EMPRESA = CON.COD_EMPRESA'
      '            and PAG.DATA_PAGO= CON.DATA_PAGO'
      '            and PAG.TIPO_CONTA = 3'
      '    ) AS PAGAR'
      ''
      'from CONTAS CON'
      '   where CON.COD_EMPRESA = :CODEMPRESA'
      '   and CON.DATA_PAGO between :DATAINI and :DATAFIN'
      '   and CON.TIPO_CONTA IN (2,3)'
      '   order by 1'
      '')
    Left = 400
    Top = 120
    object QrealDATA_PAGO: TSQLTimeStampField
      FieldName = 'DATA_PAGO'
    end
    object QrealRECEBER: TFloatField
      FieldName = 'RECEBER'
    end
    object QrealPAGAR: TFloatField
      FieldName = 'PAGAR'
    end
  end
  object Relatorio2: TppReport
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
    OnPreviewFormCreate = Relatorio1PreviewFormCreate
    Left = 280
    Top = 168
    Version = '6.0'
    mmColumnWidth = 0
    DataPipelineName = 'dbRel'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label1'
        Caption = 'Data Pagto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 23283
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label3'
        Caption = 'Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 23283
        mmWidth = 14817
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Relat'#243'rio de Caixa Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 38100
        mmTop = 0
        mmWidth = 126736
        BandType = 0
      end
      object lblData1: TppLabel
        UserName = 'lblData'
        AutoSize = False
        Caption = 'lblData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 6350
        mmWidth = 127000
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 17727
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 4233
        mmWidth = 13758
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 0
        mmWidth = 21960
        BandType = 0
      end
      object lblSaldoAnt1: TppLabel
        UserName = 'lblSaldoAnt'
        AutoSize = False
        Caption = 'lblSaldoAnt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 10583
        mmWidth = 127000
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        DataField = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        DataField = 'PAGAR'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 24342
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PAGAR'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRel'
        mmHeight = 3440
        mmLeft = 24077
        mmTop = 1323
        mmWidth = 22490
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label7'
        Caption = 'Total=>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 13758
        BandType = 7
      end
    end
  end
end
