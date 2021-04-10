inherited fFornecedor: TfFornecedor
  Left = 175
  Top = 132
  Caption = 'Fornecedores'
  OldCreateOrder = True
  ExplicitWidth = 748
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 16
  inherited P_Cabec: TGroupBox
    Height = 92
    ExplicitHeight = 92
    object Label29: TLabel [1]
      Left = 152
      Top = 69
      Width = 26
      Height = 16
      Caption = 'CPF'
    end
    object Label30: TLabel [2]
      Left = 303
      Top = 65
      Width = 35
      Height = 16
      Caption = 'CNPJ'
    end
    inherited butPesq: TBitBtn
      Left = 494
      Top = 61
      TabOrder = 3
      ExplicitLeft = 494
      ExplicitTop = 61
    end
    inherited ROpcao: TRadioGroup
      TabOrder = 4
    end
    inherited TipoCad: TEdit
      TabOrder = 5
    end
    object edtCpfTransp: TMaskEdit
      Left = 184
      Top = 60
      Width = 105
      Height = 22
      Ctl3D = False
      EditMask = '###.###.###-##;0;_'
      MaxLength = 14
      ParentCtl3D = False
      TabOrder = 1
      Text = ''
    end
    object edtCNPJ: TMaskEdit
      Left = 344
      Top = 60
      Width = 129
      Height = 22
      Ctl3D = False
      EditMask = '##.###.###/####-##;0;_'
      MaxLength = 18
      ParentCtl3D = False
      TabOrder = 2
      Text = ''
    end
  end
  inherited Grade: TDBGrid
    Top = 92
    Height = 356
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_FOR'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 439
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSC_ESTADUAL'
        Title.Caption = 'Insc.Estadual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONE'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX'
        Title.Caption = 'Fax'
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    Left = 8
    Top = 104
    Width = 891
    Height = 350
    ExplicitLeft = 8
    ExplicitTop = 104
    ExplicitWidth = 891
    ExplicitHeight = 350
    inherited PageControl1: TPageControl
      Width = 885
      Height = 278
      ExplicitWidth = 885
      ExplicitHeight = 278
      inherited sheetCad: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 877
        ExplicitHeight = 247
        inherited Panel3: TPanel
          Width = 877
          Height = 247
          ExplicitWidth = 877
          ExplicitHeight = 247
          inherited Label2: TLabel
            Left = 10
            Top = 10
            ExplicitLeft = 10
            ExplicitTop = 10
          end
          inherited Label3: TLabel
            Left = 63
            Top = 10
            ExplicitLeft = 63
            ExplicitTop = 10
          end
          object Label9: TLabel [2]
            Left = 438
            Top = 10
            Width = 52
            Height = 16
            Caption = 'Fantasia'
          end
          inherited Codigo: TDBEdit
            Left = 10
            Top = 30
            DataField = 'COD_FOR'
            ExplicitLeft = 10
            ExplicitTop = 30
          end
          inherited Nome: TDBEdit
            Left = 63
            Top = 30
            DataField = 'NOME'
            ExplicitLeft = 63
            ExplicitTop = 30
          end
          object GroupBox1: TGroupBox
            Left = 10
            Top = 59
            Width = 711
            Height = 70
            Caption = 'Documenta'#231#227'o'
            TabOrder = 3
            object Label7: TLabel
              Left = 10
              Top = 20
              Width = 35
              Height = 16
              Caption = 'CNPJ'
            end
            object Label8: TLabel
              Left = 226
              Top = 20
              Width = 80
              Height = 16
              Caption = 'Insc.Estadual'
            end
            object Cnpj: TDBEdit
              Left = 10
              Top = 39
              Width = 198
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'CNPJ'
              DataSource = dsCad
              ParentCtl3D = False
              TabOrder = 0
              OnExit = CnpjExit
            end
            object Insc_Estadual: TDBEdit
              Left = 226
              Top = 39
              Width = 208
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'INSC_ESTADUAL'
              DataSource = dsCad
              ParentCtl3D = False
              TabOrder = 1
              OnExit = Insc_EstadualExit
            end
          end
          object PageControl2: TPageControl
            Left = 10
            Top = 130
            Width = 858
            Height = 215
            ActivePage = sheetEnd
            TabOrder = 4
            object sheetEnd: TTabSheet
              Caption = 'Endere'#231'o'
              object GroupBox2: TGroupBox
                Left = 0
                Top = 0
                Width = 848
                Height = 185
                TabOrder = 0
                object Label12: TLabel
                  Left = 10
                  Top = 12
                  Width = 44
                  Height = 16
                  Caption = 'Av.Rua'
                end
                object Label13: TLabel
                  Left = 10
                  Top = 53
                  Width = 36
                  Height = 16
                  Caption = 'Bairro'
                end
                object Label14: TLabel
                  Left = 10
                  Top = 94
                  Width = 44
                  Height = 16
                  Caption = 'Cidade'
                end
                object Label15: TLabel
                  Left = 433
                  Top = 118
                  Width = 25
                  Height = 16
                  Caption = 'Cep'
                end
                object Label16: TLabel
                  Left = 601
                  Top = 94
                  Width = 43
                  Height = 16
                  Caption = 'Estado'
                end
                object Label17: TLabel
                  Left = 361
                  Top = 12
                  Width = 48
                  Height = 16
                  Caption = 'N'#250'mero'
                end
                object SpeedButton1: TSpeedButton
                  Left = 386
                  Top = 115
                  Width = 29
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
                object Label18: TLabel
                  Left = 481
                  Top = 12
                  Width = 84
                  Height = 16
                  Caption = 'Complemento'
                end
                object Label19: TLabel
                  Left = 10
                  Top = 135
                  Width = 54
                  Height = 16
                  Caption = 'Telefone'
                end
                object Label20: TLabel
                  Left = 137
                  Top = 135
                  Width = 22
                  Height = 16
                  Caption = 'Fax'
                end
                object Label4: TLabel
                  Left = 265
                  Top = 135
                  Width = 34
                  Height = 16
                  Caption = 'Email'
                end
                object DBEdit8: TDBEdit
                  Left = 10
                  Top = 31
                  Width = 343
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'ENDERECO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 0
                end
                object DBEdit9: TDBEdit
                  Left = 361
                  Top = 31
                  Width = 112
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NUMERO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 1
                end
                object DBEdit10: TDBEdit
                  Left = 10
                  Top = 73
                  Width = 343
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'BAIRRO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 3
                end
                object Cod_Cidade: TDBEdit
                  Left = 10
                  Top = 114
                  Width = 60
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'COD_CIDADE'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 4
                  OnExit = Cod_CidadeExit
                end
                object Desc_Cidade: TDBEdit
                  Left = 79
                  Top = 114
                  Width = 306
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'DESC_CIDADE'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 5
                  OnExit = Desc_CidadeExit
                end
                object DBEdit13: TDBEdit
                  Left = 433
                  Top = 114
                  Width = 149
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'CEP'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 6
                end
                object editEstado: TDBEdit
                  Left = 601
                  Top = 114
                  Width = 60
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'SIGLA'
                  DataSource = dsCad
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 7
                end
                object DBEdit15: TDBEdit
                  Left = 481
                  Top = 31
                  Width = 227
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'COMPLEMENTO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 2
                end
                object DBEdit16: TDBEdit
                  Left = 10
                  Top = 155
                  Width = 119
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'FONE'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 8
                end
                object DBEdit17: TDBEdit
                  Left = 137
                  Top = 155
                  Width = 120
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'FAX'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 9
                end
                object butContato: TBitBtn
                  Left = 581
                  Top = 56
                  Width = 123
                  Height = 31
                  Caption = 'Contatos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF004B82004B82005C91FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484898989FF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF313131342F2D
                    28373F0F35470C272F36ADD4009ACB00679C005C92FF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FF8282828181818383837B7B7B707070B8B8B89999998D
                    8D8D898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FF004B827BDEF45BD7F243CFEF34CAEE0080B2005D93FF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484D8D8D8CDCDCDC4C4C4BE
                    BEBE939393898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FF004B82ACEBFA4E7F896ADAF34ED3F01466980C7FB0005990FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484E9E9E9ABABABD3D3D3C8
                    C8C89898989B9B9B888888FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FF004B825F9FBFBCEFFB9DE7F81466981466989DCBE22984AF005B92FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484C1C1C1EDEDEDE4E4E498
                    9898989898DEDEDEA8A8A8898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF004B82004B82077EB198EAFFF3FFFFCBE5EE2188B50052
                    8AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848499
                    9999E4E4E4FEFEFEEEEEEEA7A7A7868686FF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B82EBF7FCD1F7FF5BCFF00382
                    B5005C92FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FF848484FBFBFBF5F5F5CDCDCD969696898989FF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B82AFF2FF35C2E9186E
                    9F01AAD900699EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FF848484EBEBEBBDBDBD9C9C9C9E9E9E8D8D8DFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF044E83186E9F186E9F6FD5
                    EE186E9F008CBF00588FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FF8888889C9C9C9C9C9CD3D3D39C9C9C969696888888FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF044E8378DEFB78DEFB43C0
                    CA64CFDD186E9F005D93FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FF888888D9D9D9D9D9D9BABABACACACA9C9C9C8A8A8AFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B82BFDEEEB8E6F60390
                    BC5BE2ED2CC0E6005389FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FF848484EBEBEBEBEBEB999999CCCCCCB9B9B9868686FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0650862EB1E118D4
                    FF27C7F3035B91004F87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FF8B8B8BB8B8B8B7B7B7BABABA8C8C8C868686FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF045288075A
                    8F02558CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FF8A8A8A8E8E8E8A8A8AFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  NumGlyphs = 2
                  ParentFont = False
                  TabOrder = 10
                  TabStop = False
                  OnClick = butContatoClick
                end
                object DBEdit1: TDBEdit
                  Left = 265
                  Top = 155
                  Width = 440
                  Height = 22
                  CharCase = ecLowerCase
                  Ctl3D = False
                  DataField = 'EMAIL'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 11
                end
              end
            end
            object TabSheet3: TTabSheet
              Caption = 'Complemento'
              ImageIndex = 1
              object GroupBox3: TGroupBox
                Left = 0
                Top = 2
                Width = 848
                Height = 238
                TabOrder = 0
                object Label24: TLabel
                  Left = 10
                  Top = 20
                  Width = 75
                  Height = 16
                  Caption = 'Observa'#231#227'o'
                end
                object Label27: TLabel
                  Left = 10
                  Top = 135
                  Width = 86
                  Height = 16
                  Caption = 'Tipo Empresa'
                end
                object SpeedButton2: TSpeedButton
                  Left = 386
                  Top = 155
                  Width = 29
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
                object DBMemo1: TDBMemo
                  Left = 10
                  Top = 39
                  Width = 424
                  Height = 90
                  Ctl3D = False
                  DataField = 'OBS'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 0
                end
                object Desc_Tipo: TDBEdit
                  Left = 79
                  Top = 154
                  Width = 306
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'DESC_TIPO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 1
                  OnExit = Desc_TipoExit
                end
                object IdTipoEmpresa: TDBEdit
                  Left = 10
                  Top = 154
                  Width = 60
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'ID_TIPO_EMPRESA'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 2
                  OnExit = IdTipoEmpresaExit
                end
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Dados Banc'#225'rios'
              ImageIndex = 2
              object GroupBox4: TGroupBox
                Left = 0
                Top = 0
                Width = 850
                Height = 184
                Align = alClient
                TabOrder = 0
                object Label10: TLabel
                  Left = 16
                  Top = 24
                  Width = 64
                  Height = 16
                  Caption = 'Nro Banco'
                end
                object Label11: TLabel
                  Left = 152
                  Top = 24
                  Width = 79
                  Height = 16
                  Caption = 'Nome Banco'
                end
                object Label21: TLabel
                  Left = 488
                  Top = 24
                  Width = 75
                  Height = 16
                  Caption = 'Nro Ag'#234'ncia'
                end
                object Label22: TLabel
                  Left = 16
                  Top = 72
                  Width = 60
                  Height = 16
                  Caption = 'Nro Conta'
                end
                object Label23: TLabel
                  Left = 224
                  Top = 72
                  Width = 77
                  Height = 16
                  Caption = 'Nome Titular'
                end
                object Label25: TLabel
                  Left = 464
                  Top = 120
                  Width = 26
                  Height = 16
                  Caption = 'CPF'
                end
                object Label26: TLabel
                  Left = 16
                  Top = 120
                  Width = 113
                  Height = 16
                  Caption = 'Nome Depositante'
                end
                object DBEdit5: TDBEdit
                  Left = 16
                  Top = 40
                  Width = 121
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NUM_BANCO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 0
                end
                object DBEdit6: TDBEdit
                  Left = 152
                  Top = 40
                  Width = 321
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NOME_BANCO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 1
                end
                object DBEdit7: TDBEdit
                  Left = 488
                  Top = 40
                  Width = 161
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NUM_AGENCIA'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 2
                end
                object DBEdit11: TDBEdit
                  Left = 16
                  Top = 88
                  Width = 193
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NUM_CONTA'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 3
                end
                object DBEdit12: TDBEdit
                  Left = 224
                  Top = 88
                  Width = 425
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NOME_TITULAR'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 4
                end
                object DBEdit14: TDBEdit
                  Left = 16
                  Top = 136
                  Width = 433
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NOME_DESPOSITANTE'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 5
                end
                object CPF1: TDBEdit
                  Left = 464
                  Top = 136
                  Width = 185
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'CPF'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 6
                  OnExit = CPF1Exit
                end
              end
            end
          end
          object DBEdit4: TDBEdit
            Left = 438
            Top = 30
            Width = 283
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FANTASIA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
        end
      end
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 877
        ExplicitHeight = 247
        inherited Panel4: TPanel
          Width = 877
          Height = 247
          ExplicitWidth = 877
          ExplicitHeight = 247
          inherited DBEdit2: TDBEdit
            DataField = 'USU_INC'
          end
          inherited DBEdit3: TDBEdit
            DataField = 'USU_ALT'
          end
        end
      end
    end
    inherited Panel2: TPanel
      Top = 306
      Width = 885
      ExplicitTop = 306
      ExplicitWidth = 885
      inherited butOk: TBitBtn
        Left = 498
        TabOrder = 1
        ExplicitLeft = 498
      end
      inherited butCancelar: TBitBtn
        Left = 600
        ExplicitLeft = 600
      end
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
      inherited butIncluir: TBitBtn
        Left = 394
        TabOrder = 0
        ExplicitLeft = 394
      end
    end
    inherited Panel1: TPanel
      Width = 885
      ExplicitWidth = 885
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Fornecedor
    Left = 768
    Top = 128
  end
end
