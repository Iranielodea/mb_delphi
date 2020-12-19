inherited fCliente: TfCliente
  Left = 256
  Top = 218
  Caption = 'Clientes'
  ClientHeight = 671
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitTop = 2
  ExplicitWidth = 748
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 16
  inherited P_Rodape: TPanel
    Top = 633
    TabOrder = 3
    ExplicitTop = 633
    inherited butNovo: TSpeedButton
      Left = 232
      ExplicitLeft = 232
    end
    inherited butAlterar: TSpeedButton
      Left = 331
      ExplicitLeft = 331
    end
    inherited butExcluir: TSpeedButton
      Left = 431
      ExplicitLeft = 431
    end
    inherited butSair: TSpeedButton
      Left = 631
      ExplicitLeft = 631
    end
    inherited butImprimir: TSpeedButton
      Left = 531
      ExplicitLeft = 531
    end
    inherited lblFiltro: TLabel
      Left = 6
      ExplicitLeft = 6
    end
  end
  inherited P_Cabec: TGroupBox
    Height = 89
    TabOrder = 0
    ExplicitHeight = 89
    object Label29: TLabel [1]
      Left = 152
      Top = 69
      Width = 26
      Height = 16
      Caption = 'CPF'
    end
    object Label30: TLabel [2]
      Left = 303
      Top = 69
      Width = 35
      Height = 16
      Caption = 'CNPJ'
    end
    inherited EditNome: TEdit
      TabOrder = 2
    end
    inherited butPesq: TBitBtn
      Left = 501
      Top = 58
      TabOrder = 3
      ExplicitLeft = 501
      ExplicitTop = 58
    end
    inherited ROpcao: TRadioGroup
      TabOrder = 0
    end
    inherited TipoCad: TEdit
      TabOrder = 1
    end
    object edtCpfTransp: TMaskEdit
      Left = 184
      Top = 63
      Width = 105
      Height = 22
      Ctl3D = False
      EditMask = '###.###.###-##;0;_'
      MaxLength = 14
      ParentCtl3D = False
      TabOrder = 4
      Text = ''
    end
    object edtCNPJ: TMaskEdit
      Left = 344
      Top = 63
      Width = 129
      Height = 22
      Ctl3D = False
      EditMask = '##.###.###/####-##;0;_'
      MaxLength = 18
      ParentCtl3D = False
      TabOrder = 5
      Text = ''
    end
  end
  inherited Grade: TDBGrid
    Top = 89
    Height = 544
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CLIENTE'
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
        FieldName = 'CPF'
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
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'E-mail'
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    Left = -5
    Top = 112
    Width = 758
    Height = 497
    TabOrder = 2
    ExplicitLeft = -5
    ExplicitTop = 112
    ExplicitWidth = 758
    ExplicitHeight = 497
    inherited PageControl1: TPageControl
      Width = 752
      Height = 419
      TabOrder = 1
      ExplicitWidth = 752
      ExplicitHeight = 419
      inherited sheetCad: TTabSheet
        OnShow = sheetCadShow
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 744
        ExplicitHeight = 388
        inherited Panel3: TPanel
          Width = 744
          Height = 388
          ExplicitWidth = 744
          ExplicitHeight = 388
          inherited Label2: TLabel
            Left = 10
            Top = 10
            ExplicitLeft = 10
            ExplicitTop = 10
          end
          inherited Label3: TLabel
            Left = 79
            Top = 10
            ExplicitLeft = 79
            ExplicitTop = 10
          end
          object Label4: TLabel [2]
            Left = 463
            Top = 10
            Width = 87
            Height = 16
            Caption = 'F'#237'sica/Jur'#237'dica'
          end
          object Label11: TLabel [3]
            Left = 566
            Top = 10
            Width = 106
            Height = 16
            Caption = 'Data do Cadastro'
          end
          object Label21: TLabel [4]
            Left = 10
            Top = 57
            Width = 92
            Height = 16
            Caption = 'Nome Fantasia'
          end
          inherited Codigo: TDBEdit
            Left = 10
            Top = 30
            DataField = 'COD_CLIENTE'
            ExplicitLeft = 10
            ExplicitTop = 30
          end
          inherited Nome: TDBEdit
            Left = 79
            Top = 30
            DataField = 'NOME'
            ExplicitLeft = 79
            ExplicitTop = 30
          end
          object CboTipo: TDBComboBox
            Left = 463
            Top = 30
            Width = 90
            Height = 24
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'TIPO_PESSOA'
            DataSource = dsCad
            Items.Strings = (
              'F'
              'J')
            ParentCtl3D = False
            TabOrder = 2
            OnClick = CboTipoClick
          end
          object GroupBox1: TGroupBox
            Left = 10
            Top = 98
            Width = 711
            Height = 80
            Caption = 'Documenta'#231#227'o'
            TabOrder = 6
            object Label7: TLabel
              Left = 10
              Top = 20
              Width = 35
              Height = 16
              Caption = 'CNPJ'
            end
            object Label8: TLabel
              Left = 177
              Top = 20
              Width = 80
              Height = 16
              Caption = 'Insc.Estadual'
            end
            object Label9: TLabel
              Left = 345
              Top = 20
              Width = 26
              Height = 16
              Caption = 'CPF'
            end
            object Label10: TLabel
              Left = 512
              Top = 20
              Width = 20
              Height = 16
              Caption = 'RG'
            end
            object Cnpj: TDBEdit
              Left = 10
              Top = 39
              Width = 149
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
              Left = 177
              Top = 39
              Width = 149
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'INSC_ESTADUAL'
              DataSource = dsCad
              ParentCtl3D = False
              TabOrder = 1
              OnExit = Insc_EstadualExit
            end
            object Cpf: TDBEdit
              Left = 345
              Top = 39
              Width = 149
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'CPF'
              DataSource = dsCad
              ParentCtl3D = False
              TabOrder = 2
              OnExit = CpfExit
            end
            object RG: TDBEdit
              Left = 512
              Top = 39
              Width = 149
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'RG'
              DataSource = dsCad
              ParentCtl3D = False
              TabOrder = 3
            end
          end
          object DBEdit7: TDBEdit
            Left = 566
            Top = 30
            Width = 115
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'DATA_CADASTRO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 3
          end
          object PageControl2: TPageControl
            Left = 10
            Top = 179
            Width = 711
            Height = 207
            ActivePage = sheetCompl
            TabOrder = 7
            object sheetEnd: TTabSheet
              Caption = 'Endere'#231'o'
              object GroupBox2: TGroupBox
                Left = 0
                Top = -6
                Width = 703
                Height = 183
                TabOrder = 0
                object Label12: TLabel
                  Left = 10
                  Top = 12
                  Width = 44
                  Height = 16
                  Caption = 'Av.Rua'
                end
                object Label13: TLabel
                  Left = 242
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
                  Top = 94
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
                  Left = 433
                  Top = 12
                  Width = 48
                  Height = 16
                  Caption = 'N'#250'mero'
                end
                object SpeedButton1: TSpeedButton
                  Left = 391
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
                  Left = 9
                  Top = 52
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
                  Left = 177
                  Top = 135
                  Width = 22
                  Height = 16
                  Caption = 'Fax'
                end
                object Label25: TLabel
                  Left = 336
                  Top = 136
                  Width = 34
                  Height = 16
                  Caption = 'Email'
                end
                object DBEdit8: TDBEdit
                  Left = 10
                  Top = 31
                  Width = 405
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'ENDERECO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 1
                end
                object DBEdit9: TDBEdit
                  Left = 436
                  Top = 31
                  Width = 149
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NUMERO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 2
                end
                object DBEdit10: TDBEdit
                  Left = 242
                  Top = 71
                  Width = 343
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'BAIRRO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 5
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
                  TabOrder = 6
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
                  TabOrder = 7
                  OnExit = Desc_CidadeExit
                end
                object DBEdit13: TDBEdit
                  Left = 436
                  Top = 114
                  Width = 149
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'CEP'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 8
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
                  TabOrder = 9
                end
                object DBEdit15: TDBEdit
                  Left = 9
                  Top = 71
                  Width = 227
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'COMPLEMENTO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 4
                end
                object DBEdit16: TDBEdit
                  Left = 10
                  Top = 155
                  Width = 149
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'FONE'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 10
                end
                object DBEdit17: TDBEdit
                  Left = 177
                  Top = 155
                  Width = 149
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'FAX'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 11
                end
                object butContato: TBitBtn
                  Left = 591
                  Top = 22
                  Width = 100
                  Height = 31
                  Caption = '&Contatos'
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
                  TabOrder = 0
                  TabStop = False
                  OnClick = butContatoClick
                end
                object butUltPedido: TBitBtn
                  Left = 591
                  Top = 59
                  Width = 100
                  Height = 31
                  Caption = #218'&lt.Pedidos'
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
                  TabOrder = 3
                  TabStop = False
                  OnClick = butUltPedidoClick
                end
                object DBEdit1: TDBEdit
                  Left = 336
                  Top = 155
                  Width = 361
                  Height = 22
                  CharCase = ecLowerCase
                  Ctl3D = False
                  DataField = 'EMAIL'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 12
                end
              end
            end
            object sheetCompl: TTabSheet
              Caption = 'Complemento'
              ImageIndex = 1
              OnShow = sheetComplShow
              object GroupBox3: TGroupBox
                Left = 0
                Top = 0
                Width = 703
                Height = 176
                Align = alClient
                TabOrder = 0
                object Label22: TLabel
                  Left = 10
                  Top = 12
                  Width = 131
                  Height = 16
                  Caption = 'Forma de Pagamento'
                end
                object SpeedButton2: TSpeedButton
                  Left = 406
                  Top = 31
                  Width = 28
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
                object Label23: TLabel
                  Left = 10
                  Top = 53
                  Width = 157
                  Height = 16
                  Caption = 'Condi'#231#245'es de Pagamento'
                  Visible = False
                end
                object SpeedButton3: TSpeedButton
                  Left = 406
                  Top = 74
                  Width = 28
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
                  Visible = False
                  OnClick = SpeedButton3Click
                end
                object Label24: TLabel
                  Left = 10
                  Top = 97
                  Width = 75
                  Height = 16
                  Caption = 'Observa'#231#227'o'
                end
                object Cod_Pagto: TDBEdit
                  Left = 10
                  Top = 31
                  Width = 60
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'COD_PAGTO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 1
                  OnExit = Cod_PagtoExit
                end
                object Desc_Pagto: TDBEdit
                  Left = 79
                  Top = 31
                  Width = 326
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'DESC_PAGTO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 2
                  OnExit = Desc_PagtoExit
                end
                object Cod_Condicao: TDBEdit
                  Left = 10
                  Top = 73
                  Width = 60
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'COD_CONDICAO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 3
                  Visible = False
                  OnExit = Cod_CondicaoExit
                end
                object Desc_Condicao: TDBEdit
                  Left = 79
                  Top = 73
                  Width = 326
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'DESC_CONDICAO'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 4
                  Visible = False
                  OnExit = Desc_CondicaoExit
                end
                object DBMemo1: TDBMemo
                  Left = 10
                  Top = 114
                  Width = 424
                  Height = 60
                  Ctl3D = False
                  DataField = 'OBS'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 5
                end
                object GroupBox4: TGroupBox
                  Left = 464
                  Top = 16
                  Width = 217
                  Height = 145
                  Caption = 'Cr'#233'dito:'
                  TabOrder = 0
                  object Label26: TLabel
                    Left = 8
                    Top = 52
                    Width = 70
                    Height = 16
                    Caption = 'Quantidade'
                  end
                  object Label27: TLabel
                    Left = 8
                    Top = 30
                    Width = 29
                    Height = 16
                    Caption = 'Data'
                  end
                  object Label28: TLabel
                    Left = 8
                    Top = 74
                    Width = 73
                    Height = 16
                    Caption = 'Qtde Usada'
                  end
                  object Label31: TLabel
                    Left = 11
                    Top = 96
                    Width = 36
                    Height = 16
                    Caption = 'Saldo'
                  end
                  object btnExcluirCredito: TSpeedButton
                    Left = 120
                    Top = 117
                    Width = 85
                    Height = 25
                    Caption = 'Excluir'
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
                    OnClick = btnExcluirCreditoClick
                  end
                  object DBEdit4: TDBEdit
                    Left = 84
                    Top = 44
                    Width = 121
                    Height = 22
                    Ctl3D = False
                    DataField = 'QTDE_CREDITO'
                    DataSource = dsPessoaCredito
                    ParentCtl3D = False
                    TabOrder = 1
                  end
                  object edtDataCredito: TDBEdit
                    Left = 84
                    Top = 22
                    Width = 121
                    Height = 22
                    Ctl3D = False
                    DataField = 'DATA_CREDITO'
                    DataSource = dsPessoaCredito
                    ParentCtl3D = False
                    TabOrder = 0
                  end
                  object DBEdit6: TDBEdit
                    Left = 84
                    Top = 66
                    Width = 121
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    Ctl3D = False
                    DataField = 'QTDE_USADO'
                    DataSource = dsPessoaCredito
                    ParentCtl3D = False
                    ReadOnly = True
                    TabOrder = 2
                  end
                  object DBEdit11: TDBEdit
                    Left = 84
                    Top = 88
                    Width = 121
                    Height = 22
                    TabStop = False
                    Color = clBtnFace
                    Ctl3D = False
                    DataField = 'QTDE_SALDO'
                    DataSource = dsPessoaCredito
                    ParentCtl3D = False
                    ReadOnly = True
                    TabOrder = 3
                  end
                  object btnExtrato: TBitBtn
                    Left = 29
                    Top = 117
                    Width = 85
                    Height = 25
                    Caption = 'Extrato'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 4
                    TabStop = False
                    OnClick = btnExtratoClick
                  end
                end
              end
            end
            object TabSheet2: TTabSheet
              Caption = 'Vendedores'
              ImageIndex = 2
              object GroupBox5: TGroupBox
                Left = 0
                Top = 0
                Width = 703
                Height = 176
                Align = alClient
                TabOrder = 0
                object Label32: TLabel
                  Left = 9
                  Top = 8
                  Width = 60
                  Height = 16
                  Caption = 'Vendedor'
                end
                object SpeedButton4: TSpeedButton
                  Left = 379
                  Top = 24
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
                  OnClick = SpeedButton4Click
                end
                object Nome_Vendedor: TDBEdit
                  Left = 65
                  Top = 24
                  Width = 313
                  Height = 22
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'VEN_NOME'
                  DataSource = dsCad
                  ParentCtl3D = False
                  TabOrder = 1
                  OnExit = Nome_VendedorExit
                end
                object Cod_Vendedor: TDBEdit
                  Left = 9
                  Top = 24
                  Width = 49
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'COD_VENDEDOR'
                  DataSource = dsCad
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
          end
          object DBEdit18: TDBEdit
            Left = 10
            Top = 73
            Width = 523
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FANTASIA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 5
          end
          object butFicha: TBitBtn
            Left = 568
            Top = 56
            Width = 113
            Height = 25
            Caption = '&Ficha'
            TabOrder = 4
            OnClick = butFichaClick
          end
        end
      end
      object ts1: TTabSheet [1]
        Caption = 'Complemento'
        ImageIndex = 2
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 744
          Height = 388
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label33: TLabel
            Left = 24
            Top = 24
            Width = 34
            Height = 16
            Caption = 'Email'
          end
          object dbmmoEMAIL: TDBMemo
            Left = 24
            Top = 46
            Width = 681
            Height = 123
            DataField = 'EMAIL'
            DataSource = dsCad
            TabOrder = 0
          end
        end
      end
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 744
        ExplicitHeight = 388
        inherited Panel4: TPanel
          Width = 744
          Height = 388
          ExplicitWidth = 744
          ExplicitHeight = 388
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
      Top = 447
      Width = 752
      Height = 47
      TabOrder = 2
      ExplicitTop = 447
      ExplicitWidth = 752
      ExplicitHeight = 47
      inherited butOk: TBitBtn
        Left = 422
        Top = 6
        TabOrder = 1
        ExplicitLeft = 422
        ExplicitTop = 6
      end
      inherited butCancelar: TBitBtn
        Left = 628
        Top = 6
        TabOrder = 3
        ExplicitLeft = 628
        ExplicitTop = 6
      end
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
        TabOrder = 4
        OnClick = DBNavigator1Click
      end
      inherited butIncluir: TBitBtn
        Left = 318
        Top = 6
        TabOrder = 0
        ExplicitLeft = 318
        ExplicitTop = 6
      end
      object btnEndereco: TBitBtn
        Left = 525
        Top = 6
        Width = 97
        Height = 25
        Caption = 'Endere'#231'o'
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
        TabOrder = 2
        OnClick = btnEnderecoClick
      end
    end
    inherited Panel1: TPanel
      Width = 752
      TabOrder = 0
      ExplicitWidth = 752
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Cliente
    Left = 688
    Top = 192
  end
  object dsPessoaCredito: TDataSource
    DataSet = dmPessoaCredito.cdsPessoaCredito
    OnStateChange = dsPessoaCreditoStateChange
    Left = 456
    Top = 320
  end
end
