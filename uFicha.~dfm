object fFicha: TfFicha
  Left = 162
  Top = 49
  BorderStyle = bsDialog
  Caption = 'Ficha Cadastral'
  ClientHeight = 539
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 762
    Height = 498
    ActivePage = sheetFicha
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object sheetFicha: TTabSheet
      Caption = '&Ficha'
      object DBRadioGroup1: TDBRadioGroup
        Left = 8
        Top = 8
        Width = 185
        Height = 65
        Ctl3D = False
        DataField = 'TIPO_FICHA'
        DataSource = dsCad
        Items.Strings = (
          'Abertura de Cliente'
          'Altera'#231#227'o do Cadastro')
        ParentCtl3D = False
        TabOrder = 0
        Values.Strings = (
          'N'
          'A')
      end
      object GroupBox1: TGroupBox
        Left = 200
        Top = 8
        Width = 553
        Height = 65
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 200
          Height = 16
          Caption = 'Data da Constitui'#231#227'o da Firma'
        end
        object Label2: TLabel
          Left = 240
          Top = 16
          Width = 70
          Height = 16
          Caption = 'Comprador'
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 32
          Width = 201
          Height = 22
          CharCase = ecUpperCase
          DataField = 'DATA_ABERTURA'
          DataSource = dsCad
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 240
          Top = 32
          Width = 305
          Height = 22
          CharCase = ecUpperCase
          DataField = 'COMPRADOR'
          DataSource = dsCad
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 73
        Width = 745
        Height = 73
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 124
          Height = 16
          Caption = 'N'#186' de Funcion'#225'rios'
        end
        object Label4: TLabel
          Left = 144
          Top = 16
          Width = 140
          Height = 16
          Caption = 'Raz'#227'o Social Anterior'
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 32
          Width = 121
          Height = 22
          CharCase = ecUpperCase
          DataField = 'NUM_FUNC'
          DataSource = dsCad
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 144
          Top = 32
          Width = 393
          Height = 22
          CharCase = ecUpperCase
          DataField = 'NOME_ANTERIOR'
          DataSource = dsCad
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 146
        Width = 745
        Height = 65
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        object Label5: TLabel
          Left = 8
          Top = 16
          Width = 160
          Height = 16
          Caption = 'Endere'#231'o de Pagamento'
        end
        object Label6: TLabel
          Left = 376
          Top = 16
          Width = 111
          Height = 16
          Caption = 'Local de Entrega'
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 32
          Width = 353
          Height = 22
          CharCase = ecUpperCase
          DataField = 'END_PAGAMENTO'
          DataSource = dsCad
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 376
          Top = 32
          Width = 361
          Height = 22
          CharCase = ecUpperCase
          DataField = 'END_ENTREGA'
          DataSource = dsCad
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 211
        Width = 257
        Height = 65
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        object Label7: TLabel
          Left = 8
          Top = 16
          Width = 90
          Height = 16
          Caption = 'Pr'#233'dio Pr'#243'prio'
        end
        object Label8: TLabel
          Left = 120
          Top = 16
          Width = 106
          Height = 16
          Caption = 'Valor do Alugu'#233'l'
        end
        object DBComboBox1: TDBComboBox
          Left = 8
          Top = 32
          Width = 89
          Height = 24
          DataField = 'PREDIO_PROPRIO'
          DataSource = dsCad
          ItemHeight = 16
          Items.Strings = (
            'S'
            'N')
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 120
          Top = 32
          Width = 121
          Height = 22
          CharCase = ecUpperCase
          DataField = 'VALOR_ALUGUEL'
          DataSource = dsCad
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 272
        Top = 211
        Width = 481
        Height = 65
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        object Label9: TLabel
          Left = 8
          Top = 16
          Width = 100
          Height = 16
          Caption = 'Segmento/Tipo'
        end
        object Label10: TLabel
          Left = 152
          Top = 16
          Width = 130
          Height = 16
          Caption = 'Categoria/Atividade'
        end
        object Label11: TLabel
          Left = 312
          Top = 16
          Width = 126
          Height = 16
          Caption = 'Porte/Classifica'#231#227'o'
        end
        object DBEdit8: TDBEdit
          Left = 8
          Top = 32
          Width = 97
          Height = 22
          CharCase = ecUpperCase
          DataField = 'SEGMENTO'
          DataSource = dsCad
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 152
          Top = 32
          Width = 97
          Height = 22
          CharCase = ecUpperCase
          DataField = 'CATEGORIA'
          DataSource = dsCad
          TabOrder = 1
        end
        object DBEdit10: TDBEdit
          Left = 312
          Top = 32
          Width = 97
          Height = 22
          CharCase = ecUpperCase
          DataField = 'CLASSIFICACAO'
          DataSource = dsCad
          TabOrder = 2
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 276
        Width = 745
        Height = 65
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        object Label12: TLabel
          Left = 8
          Top = 16
          Width = 146
          Height = 16
          Caption = 'Qtde Compra Semanal'
        end
        object Label13: TLabel
          Left = 168
          Top = 16
          Width = 77
          Height = 16
          Caption = 'Dias Aprazo'
        end
        object Label14: TLabel
          Left = 264
          Top = 16
          Width = 109
          Height = 16
          Caption = 'Consumo Mensal'
        end
        object Label15: TLabel
          Left = 392
          Top = 16
          Width = 102
          Height = 16
          Caption = 'Valor do Pedido'
        end
        object DBEdit11: TDBEdit
          Left = 8
          Top = 32
          Width = 145
          Height = 22
          CharCase = ecUpperCase
          DataField = 'QTDE_COMPRA_SEMANA'
          DataSource = dsCad
          TabOrder = 0
        end
        object DBEdit12: TDBEdit
          Left = 168
          Top = 32
          Width = 73
          Height = 22
          CharCase = ecUpperCase
          DataField = 'DIAS_APRAZO'
          DataSource = dsCad
          TabOrder = 1
        end
        object DBEdit13: TDBEdit
          Left = 264
          Top = 32
          Width = 105
          Height = 22
          CharCase = ecUpperCase
          DataField = 'CONSUMO_MENSAL'
          DataSource = dsCad
          TabOrder = 2
        end
        object DBEdit14: TDBEdit
          Left = 392
          Top = 32
          Width = 121
          Height = 22
          CharCase = ecUpperCase
          DataField = 'VALOR_PEDIDO'
          DataSource = dsCad
          TabOrder = 3
        end
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 341
        Width = 745
        Height = 121
        Caption = 'Documentos a Serem Anexados'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        object DBCheckBox1: TDBCheckBox
          Left = 16
          Top = 24
          Width = 177
          Height = 17
          Caption = 'Ficha Cadastral'
          DataField = 'FICHA_CADASTRAL'
          DataSource = dsCad
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 16
          Top = 48
          Width = 561
          Height = 17
          Caption = 
            'Contrato Social ou Estatudo c/ '#218'ltima Altera'#231#227'o Registrada na Ju' +
            'nta Comercial'
          DataField = 'CONTRATO_SOCIAL'
          DataSource = dsCad
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 16
          Top = 72
          Width = 425
          Height = 17
          Caption = 'Cart'#227'o do CNPJ/Inscri'#231#227'o Estadual, Alvar'#225' Municipal'
          DataField = 'CARTAO_CADASTRAL'
          DataSource = dsCad
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 16
          Top = 96
          Width = 409
          Height = 17
          Caption = 'Carteira de Identidade e CPF dos Propriet'#225'rios / Diretores'
          DataField = 'DOC_PROPRIETARIO'
          DataSource = dsCad
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CodCliente: TEdit
          Left = 656
          Top = 72
          Width = 33
          Height = 22
          TabOrder = 4
          Visible = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Complemento'
      ImageIndex = 1
      object GroupBox8: TGroupBox
        Left = 8
        Top = 8
        Width = 745
        Height = 137
        Caption = 'Dados do Propret'#225'rio / Diretores'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Grade1: TDBGrid
          Left = 8
          Top = 24
          Width = 649
          Height = 105
          DataSource = dsDiretor
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 377
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FONE'
              Title.Caption = 'Telefone'
              Width = 109
              Visible = True
            end>
        end
        object butNovo1: TBitBtn
          Left = 664
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = butNovo1Click
        end
        object butExcluir1: TBitBtn
          Left = 664
          Top = 88
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = butExcluir1Click
        end
        object butAlterar1: TBitBtn
          Left = 664
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 3
          OnClick = butAlterar1Click
        end
      end
      object GroupBox9: TGroupBox
        Left = 9
        Top = 145
        Width = 745
        Height = 145
        Caption = 'Refer'#234'ncias Banc'#225'rias'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object Grade2: TDBGrid
          Left = 8
          Top = 24
          Width = 649
          Height = 113
          DataSource = dsBanco
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME_BANCO'
              Title.Caption = 'Banco'
              Width = 206
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_AGENCIA'
              Title.Caption = 'Ag'#234'ncia'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO'
              Title.Caption = 'N'#250'mero'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_CONTA'
              Title.Caption = 'N'#186' Conta'
              Width = 179
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_PESSOA'
              Title.Caption = 'F/J'
              Visible = True
            end>
        end
        object butNovo2: TBitBtn
          Left = 664
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = butNovo2Click
        end
        object butExcluir2: TBitBtn
          Left = 664
          Top = 88
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = butExcluir2Click
        end
        object butAlterar2: TBitBtn
          Left = 664
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 3
          OnClick = butAlterar2Click
        end
      end
      object GroupBox10: TGroupBox
        Left = 9
        Top = 290
        Width = 745
        Height = 145
        Caption = 'Refer'#234'ncias Comerciais'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        object Grade3: TDBGrid
          Left = 8
          Top = 24
          Width = 649
          Height = 113
          DataSource = dsComercio
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME_FORNECEDOR'
              Title.Caption = 'Fornecedor'
              Width = 319
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ'
              Width = 157
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FONE'
              Title.Caption = 'Telefone'
              Width = 126
              Visible = True
            end>
        end
        object butNovo3: TBitBtn
          Left = 664
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = butNovo3Click
        end
        object butExcluir3: TBitBtn
          Left = 664
          Top = 88
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = butExcluir3Click
        end
        object buAlterar3: TBitBtn
          Left = 664
          Top = 56
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 3
          OnClick = buAlterar3Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '&Observa'#231#227'o'
      ImageIndex = 2
      object GroupBox11: TGroupBox
        Left = 8
        Top = 8
        Width = 745
        Height = 361
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object butExcluir: TSpeedButton
          Left = 639
          Top = 328
          Width = 97
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
          OnClick = butExcluirClick
        end
        object Memo1: TMemo
          Left = 8
          Top = 16
          Width = 729
          Height = 305
          TabOrder = 0
          OnChange = Memo1Change
          OnEnter = Memo1Enter
          OnExit = Memo1Exit
          OnKeyDown = Memo1KeyDown
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 498
    Width = 762
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object butOk: TBitBtn
      Left = 449
      Top = 8
      Width = 100
      Height = 25
      Caption = 'F6-&Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
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
    object butCancelar: TBitBtn
      Left = 655
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = butCancelarClick
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
    object butImprimir: TBitBtn
      Left = 552
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
      TabOrder = 2
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
  end
  object dsCad: TDataSource
    DataSet = DM.Cliente
    OnStateChange = dsCadStateChange
    Left = 568
    Top = 424
  end
  object dsDiretor: TDataSource
    DataSet = DM.Diretor
    Left = 88
    Top = 440
  end
  object dsBanco: TDataSource
    DataSet = DM.RefBanco
    Left = 152
    Top = 440
  end
  object dsComercio: TDataSource
    DataSet = DM.RefComercio
    Left = 24
    Top = 440
  end
  object dsObs: TDataSource
    DataSet = DM.Cad_Obs
    Left = 216
    Top = 440
  end
  object QImpFicha: TSQLQuery
    SQLConnection = DM.BancoDados
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '   CLI.TIPO_FICHA,'
      '   CLI.CNPJ,'
      '   CLI.COD_CLIENTE,'
      '   CLI.INSC_ESTADUAL,'
      '   CLI.DATA_ABERTURA,'
      '   CLI.NOME,'
      '   CLI.FANTASIA,'
      '   CLI.ENDERECO,'
      '   CLI.NUMERO,'
      '   CLI.BAIRRO,'
      '   CLI.CEP,'
      '   CLI.FONE,'
      '   CLI.COMPRADOR,'
      '   CLI.NUM_FUNC,'
      '   CLI.NOME_ANTERIOR,'
      '   CLI.END_PAGAMENTO,'
      '   CLI.END_ENTREGA,'
      '   CLI.PREDIO_PROPRIO,'
      '   CLI.VALOR_ALUGUEL,'
      '   CLI.SEGMENTO,'
      '   CLI.CATEGORIA,'
      '   CLI.CLASSIFICACAO,'
      '   CLI.QTDE_COMPRA_SEMANA,'
      '   CLI.DIAS_APRAZO,'
      '   CLI.CONSUMO_MENSAL,'
      '   CLI.VALOR_PEDIDO,'
      '   CLI.FICHA_CADASTRAL,'
      '   CLI.CONTRATO_SOCIAL,'
      '   CLI.CARTAO_CADASTRAL,'
      '   CLI.DOC_PROPRIETARIO,'
      '   CID.DESC_CIDADE,'
      '   EST.SIGLA'
      'from CLIENTE CLI'
      '   left join CIDADE CID on CLI.COD_CIDADE = CID.COD_CIDADE'
      '   left join ESTADO EST ON CID.ID_ESTADO = EST.ID_ESTADO'
      '   where CLI.COD_CLIENTE = :COD_CLIENTE')
    Left = 776
    Top = 48
    object QImpFichaTIPO_FICHA: TStringField
      FieldName = 'TIPO_FICHA'
      FixedChar = True
      Size = 1
    end
    object QImpFichaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object QImpFichaINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object QImpFichaDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
    end
    object QImpFichaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QImpFichaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object QImpFichaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object QImpFichaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object QImpFichaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object QImpFichaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object QImpFichaFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object QImpFichaCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      Size = 40
    end
    object QImpFichaNUM_FUNC: TIntegerField
      FieldName = 'NUM_FUNC'
    end
    object QImpFichaNOME_ANTERIOR: TStringField
      FieldName = 'NOME_ANTERIOR'
      Size = 50
    end
    object QImpFichaEND_PAGAMENTO: TStringField
      FieldName = 'END_PAGAMENTO'
      Size = 50
    end
    object QImpFichaEND_ENTREGA: TStringField
      FieldName = 'END_ENTREGA'
      Size = 50
    end
    object QImpFichaPREDIO_PROPRIO: TStringField
      FieldName = 'PREDIO_PROPRIO'
      FixedChar = True
      Size = 1
    end
    object QImpFichaVALOR_ALUGUEL: TFloatField
      FieldName = 'VALOR_ALUGUEL'
    end
    object QImpFichaSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      FixedChar = True
      Size = 5
    end
    object QImpFichaCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 5
    end
    object QImpFichaCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      FixedChar = True
      Size = 5
    end
    object QImpFichaQTDE_COMPRA_SEMANA: TFloatField
      FieldName = 'QTDE_COMPRA_SEMANA'
    end
    object QImpFichaDIAS_APRAZO: TIntegerField
      FieldName = 'DIAS_APRAZO'
    end
    object QImpFichaCONSUMO_MENSAL: TFloatField
      FieldName = 'CONSUMO_MENSAL'
    end
    object QImpFichaVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
    end
    object QImpFichaFICHA_CADASTRAL: TStringField
      FieldName = 'FICHA_CADASTRAL'
      FixedChar = True
      Size = 1
    end
    object QImpFichaCONTRATO_SOCIAL: TStringField
      FieldName = 'CONTRATO_SOCIAL'
      FixedChar = True
      Size = 1
    end
    object QImpFichaCARTAO_CADASTRAL: TStringField
      FieldName = 'CARTAO_CADASTRAL'
      FixedChar = True
      Size = 1
    end
    object QImpFichaDOC_PROPRIETARIO: TStringField
      FieldName = 'DOC_PROPRIETARIO'
      FixedChar = True
      Size = 1
    end
    object QImpFichaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object QImpFichaSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
    object QImpFichaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
  end
  object dspFicha: TDataSetProvider
    DataSet = QImpFicha
    Constraints = True
    Left = 832
    Top = 48
  end
  object ImpFicha: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspFicha'
    OnCalcFields = ImpFichaCalcFields
    Left = 888
    Top = 48
    object ImpFichaTIPO_FICHA: TStringField
      FieldName = 'TIPO_FICHA'
      FixedChar = True
      Size = 1
    end
    object ImpFichaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object ImpFichaINSC_ESTADUAL: TStringField
      FieldName = 'INSC_ESTADUAL'
    end
    object ImpFichaDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
    end
    object ImpFichaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object ImpFichaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 50
    end
    object ImpFichaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object ImpFichaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object ImpFichaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object ImpFichaCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object ImpFichaFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object ImpFichaCOMPRADOR: TStringField
      FieldName = 'COMPRADOR'
      Size = 40
    end
    object ImpFichaNUM_FUNC: TIntegerField
      FieldName = 'NUM_FUNC'
    end
    object ImpFichaNOME_ANTERIOR: TStringField
      FieldName = 'NOME_ANTERIOR'
      Size = 50
    end
    object ImpFichaEND_PAGAMENTO: TStringField
      FieldName = 'END_PAGAMENTO'
      Size = 50
    end
    object ImpFichaEND_ENTREGA: TStringField
      FieldName = 'END_ENTREGA'
      Size = 50
    end
    object ImpFichaPREDIO_PROPRIO: TStringField
      FieldName = 'PREDIO_PROPRIO'
      FixedChar = True
      Size = 1
    end
    object ImpFichaVALOR_ALUGUEL: TFloatField
      FieldName = 'VALOR_ALUGUEL'
    end
    object ImpFichaSEGMENTO: TStringField
      FieldName = 'SEGMENTO'
      FixedChar = True
      Size = 5
    end
    object ImpFichaCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 5
    end
    object ImpFichaCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      FixedChar = True
      Size = 5
    end
    object ImpFichaQTDE_COMPRA_SEMANA: TFloatField
      FieldName = 'QTDE_COMPRA_SEMANA'
    end
    object ImpFichaDIAS_APRAZO: TIntegerField
      FieldName = 'DIAS_APRAZO'
    end
    object ImpFichaCONSUMO_MENSAL: TFloatField
      FieldName = 'CONSUMO_MENSAL'
    end
    object ImpFichaVALOR_PEDIDO: TFloatField
      FieldName = 'VALOR_PEDIDO'
    end
    object ImpFichaFICHA_CADASTRAL: TStringField
      FieldName = 'FICHA_CADASTRAL'
      FixedChar = True
      Size = 1
    end
    object ImpFichaCONTRATO_SOCIAL: TStringField
      FieldName = 'CONTRATO_SOCIAL'
      FixedChar = True
      Size = 1
    end
    object ImpFichaCARTAO_CADASTRAL: TStringField
      FieldName = 'CARTAO_CADASTRAL'
      FixedChar = True
      Size = 1
    end
    object ImpFichaDOC_PROPRIETARIO: TStringField
      FieldName = 'DOC_PROPRIETARIO'
      FixedChar = True
      Size = 1
    end
    object ImpFichaDESC_CIDADE: TStringField
      FieldName = 'DESC_CIDADE'
      Size = 50
    end
    object ImpFichaSIGLA: TStringField
      FieldName = 'SIGLA'
      FixedChar = True
      Size = 2
    end
    object ImpFichaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Required = True
    end
    object ImpFichaQdiretor: TDataSetField
      FieldName = 'Qdiretor'
    end
    object ImpFichaQRefBanco: TDataSetField
      FieldName = 'QRefBanco'
    end
    object ImpFichaQRefComercio: TDataSetField
      FieldName = 'QRefComercio'
    end
    object ImpFichaQobs: TDataSetField
      FieldName = 'Qobs'
    end
    object ImpFichaC_ABERTURA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_ABERTURA'
      Size = 1
    end
    object ImpFichaC_ALTERACAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_ALTERACAO'
      Size = 1
    end
    object ImpFichaC_FICHA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_FICHA'
      Size = 1
    end
    object ImpFichaC_CONTRATO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CONTRATO'
      Size = 1
    end
    object ImpFichaC_CARTAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CARTAO'
      Size = 1
    end
    object ImpFichaC_CARTEIRA: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_CARTEIRA'
      Size = 1
    end
  end
  object dsFicha: TDataSource
    DataSet = ImpFicha
    Left = 936
    Top = 48
  end
  object dbFicha: TppDBPipeline
    DataSource = dsFicha
    UserName = 'dbFicha'
    Left = 776
    Top = 104
  end
  object dbRefBanco: TppDBPipeline
    DataSource = dsRelRefBanco
    SkipWhenNoRecords = False
    UserName = 'dbRefBanco'
    Left = 960
    Top = 208
  end
  object dbDiretor: TppDBPipeline
    DataSource = dsRelDiretor
    SkipWhenNoRecords = False
    UserName = 'dbDiretor'
    Left = 960
    Top = 160
  end
  object RelFicha: TppReport
    AutoStop = False
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
    OnPreviewFormCreate = RelFichaPreviewFormCreate
    Left = 832
    Top = 104
    Version = '6.0'
    mmColumnWidth = 0
    DataPipelineName = 'dbFicha'
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 282046
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 273051
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'PARA USO EXCLUSIVO DO REPRESENTANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 57150
        mmTop = 2117
        mmWidth = 78052
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'FICHA CADASTRAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6879
        mmLeft = 71967
        mmTop = 10583
        mmWidth = 52917
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 5292
        mmLeft = 33073
        mmTop = 21696
        mmWidth = 7408
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 5292
        mmLeft = 103717
        mmTop = 21696
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'ABERTURA DE CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 23283
        mmWidth = 37042
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'ALTERA'#199#195'O DO CADASTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 23283
        mmWidth = 43656
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 27517
        mmWidth = 197380
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 35983
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'CNPJ N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 30163
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'INSCRI'#199#195'O ESTADUAL N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 63500
        mmTop = 30163
        mmWidth = 34925
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'DATA CONSTITUI'#199#195'O FIRMA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 30163
        mmWidth = 39158
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 61383
        mmTop = 29898
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CNPJ'
        DisplayFormat = '##.###.###/####-##;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 33867
        mmWidth = 49742
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'INSC_ESTADUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 63500
        mmTop = 33867
        mmWidth = 61383
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATA_ABERTURA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 33867
        mmWidth = 29633
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 44450
        mmWidth = 197380
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 120650
        mmTop = 38365
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'RAZ'#195'O SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 38365
        mmWidth = 20638
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'NOME FANTASIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 122767
        mmTop = 38365
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 42333
        mmWidth = 115623
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FANTASIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 122767
        mmTop = 42333
        mmWidth = 72496
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 52917
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'ENDERE'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 47096
        mmWidth = 15875
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'N'#218'MERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 105834
        mmTop = 47361
        mmWidth = 12435
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'LOGRADOURO / BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 47096
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ENDERECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 50800
        mmWidth = 92869
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 105834
        mmTop = 50800
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'BAIRRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 50800
        mmWidth = 63765
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 143934
        mmTop = 29898
        mmWidth = 5027
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 103717
        mmTop = 46831
        mmWidth = 5027
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 129117
        mmTop = 46831
        mmWidth = 5027
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 61383
        mmWidth = 197380
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 105834
        mmTop = 55298
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'MUNIC'#205'PIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 55563
        mmWidth = 14817
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'ESTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 74083
        mmTop = 55563
        mmWidth = 11642
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 55563
        mmWidth = 5821
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 107950
        mmTop = 55298
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'COMPRADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 135467
        mmTop = 55298
        mmWidth = 18521
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 71967
        mmTop = 55298
        mmWidth = 5027
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 86784
        mmTop = 55298
        mmWidth = 3440
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 133350
        mmTop = 55298
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DESC_CIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 59267
        mmWidth = 69056
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SIGLA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 74083
        mmTop = 59267
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CEP'
        DisplayFormat = '#####-###;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 59267
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 107950
        mmTop = 59267
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'COMPRADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 135467
        mmTop = 59267
        mmWidth = 60061
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line101'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 69850
        mmWidth = 197380
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 33867
        mmTop = 63765
        mmWidth = 3440
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'N'#186' DE FUNCION'#193'RIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 64029
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'RAZ'#195'O SOCIAL ANTERIOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35983
        mmTop = 64029
        mmWidth = 35983
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'NUM_FUNC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 67733
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NOME_ANTERIOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 35983
        mmTop = 67733
        mmWidth = 159279
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 78317
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'ENDERE'#199'O DE PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 72496
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'END_PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 76200
        mmWidth = 192617
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 86784
        mmWidth = 197380
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 114300
        mmTop = 80698
        mmWidth = 3440
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'LOCAL DE ENTREGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 80963
        mmWidth = 28310
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'PR'#201'DIO PR'#211'PRIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 116417
        mmTop = 80698
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'VALOR DO ALUGU'#201'L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143934
        mmTop = 80698
        mmWidth = 28310
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 141817
        mmTop = 80698
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'END_ENTREGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 84667
        mmWidth = 109538
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'VALOR_ALUGUEL'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 143934
        mmTop = 84667
        mmWidth = 26988
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 95250
        mmWidth = 197380
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 5292
        mmLeft = 16933
        mmTop = 91017
        mmWidth = 15081
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 5292
        mmLeft = 69850
        mmTop = 91017
        mmWidth = 15081
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 5292
        mmLeft = 124884
        mmTop = 91017
        mmWidth = 15081
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'SEGMENTO / TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 93134
        mmWidth = 24871
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'CATEGORIA / ATIVIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 86784
        mmTop = 93134
        mmWidth = 33602
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'PORTE / CLASSIFICA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 93134
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'SEGMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 19050
        mmTop = 92604
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CATEGORIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 71967
        mmTop = 92604
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'CLASSIFICACAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 127000
        mmTop = 92604
        mmWidth = 10583
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 103717
        mmWidth = 197380
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line201'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 55033
        mmTop = 97631
        mmWidth = 3440
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line202'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 95250
        mmTop = 97631
        mmWidth = 3440
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line203'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 137584
        mmTop = 97631
        mmWidth = 3440
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'QUANTIDADE DE COMPRA SEMANAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 97896
        mmWidth = 50271
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'QUANTOS DIAS DE PRAZO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 57150
        mmTop = 97896
        mmWidth = 36248
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'CONSUMO SEMANAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 97367
        mmTop = 97896
        mmWidth = 28575
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'VALOR DESTE PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 139700
        mmTop = 97896
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'QTDE_COMPRA_SEMANA'
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 101600
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'DIAS_APRAZO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 57150
        mmTop = 101600
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'CONSUMO_MENSAL'
        DisplayFormat = ',###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 97367
        mmTop = 101600
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'VALOR_PEDIDO'
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 139700
        mmTop = 101600
        mmWidth = 17198
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 110067
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'DADOS DO PROPRIET'#193'RIO/ DIRETORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 107950
        mmWidth = 54240
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 133350
        mmWidth = 197380
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 139700
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'REFER'#202'NCIAS BANC'#193'RIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 137584
        mmWidth = 37042
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 167217
        mmWidth = 197380
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 173567
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'REFER'#202'NCIAS COMERCIAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 171450
        mmWidth = 38629
        BandType = 4
      end
      object ppLine31: TppLine
        UserName = 'Line301'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 220134
        mmWidth = 197380
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 213784
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 
          #201' OBRIGAT'#211'RIO PARA O REPRESENTANTE OUTRAS INFORMA'#199#213'ES QUE JULGUE' +
          ' NECESS'#193'RIAS SOBRE O CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 218017
        mmWidth = 158750
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'DOCUMENTOS A SEREM ANEXADOS (EMPRESA / PROPRIET'#193'RIO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 247650
        mmWidth = 89694
        BandType = 4
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 249767
        mmWidth = 197380
        BandType = 4
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 265
        mmTop = 243417
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = '(    ) FICHA CADASTRAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 254001
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 
          '(    ) CONTRATO SOCIAL OU ESTATUTO C/ '#218'LTIMA ALTERA'#199#195'O REGISTRAD' +
          'A NA JUNTA COMERCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 258234
        mmWidth = 136790
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = '(    ) CART'#195'O DO CNPJ / INSCRI'#199#195'O ESTADUAL, ALVAR'#193' MUNICIPAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 262467
        mmWidth = 92340
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 
          '(    ) CARTEIRA DE IDENTIDADE E CPF DOS PROPRIET'#193'RIOS / DIRETORE' +
          'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 266701
        mmWidth = 100806
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 
          'OBS: PARA LIBERA'#199#195'O DE ENDAS '#201' NECESS'#193'RIO O PREENCHIMENTO COMPLE' +
          'TO DETA E O ENVIO DOS XER'#211'X DOS DOCUMENTOS AUTENTICADOS.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 2117
        mmTop = 270934
        mmWidth = 152400
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 
          '( '#201' OBRIGAT'#211'RIO COLOCAR O NUMERO O NOME DA AG'#202'NCIA E N'#218'MERO DA C' +
          'ONTA )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 137584
        mmWidth = 118004
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = '( '#201' OBRIGAT'#211'RIO COLOCAR O NUMERO E O NOME DO FORNECEDOR)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 171450
        mmWidth = 96309
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        DataPipelineName = 'dbDiretor'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 112184
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
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
          Version = '6.0'
          mmColumnWidth = 0
          DataPipelineName = 'dbDiretor'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppLabel43: TppLabel
              UserName = 'Label43'
              Caption = 'FORNECEDOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 2117
              mmTop = 0
              mmWidth = 20108
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              Caption = 'ENDERE'#199'O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 78317
              mmTop = 0
              mmWidth = 15875
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              Caption = 'CPF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 146050
              mmTop = 0
              mmWidth = 5556
              BandType = 1
            end
            object ppLabel46: TppLabel
              UserName = 'Label46'
              Caption = 'DATA NASCIMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 171450
              mmTop = 0
              mmWidth = 26988
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'NOME'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbDiretor'
              mmHeight = 3175
              mmLeft = 2117
              mmTop = 0
              mmWidth = 73025
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'ENDERECO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbDiretor'
              mmHeight = 3175
              mmLeft = 78317
              mmTop = 0
              mmWidth = 65352
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'CPF'
              DisplayFormat = '###.###.###-##;0;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbDiretor'
              mmHeight = 3175
              mmLeft = 146050
              mmTop = 0
              mmWidth = 21696
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'DATANASC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbDiretor'
              mmHeight = 3175
              mmLeft = 171450
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        DataPipelineName = 'dbRefBanco'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 141817
        mmWidth = 197380
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
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
          Version = '6.0'
          mmColumnWidth = 0
          DataPipelineName = 'dbRefBanco'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppLabel47: TppLabel
              UserName = 'Label47'
              Caption = 'BANCO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 2117
              mmTop = 0
              mmWidth = 10054
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label48'
              Caption = 'FONE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 61383
              mmTop = 0
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              Caption = 'NOME AG'#202'NCIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 82550
              mmTop = 0
              mmWidth = 21696
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              Caption = 'N'#186
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 120650
              mmTop = 0
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel51: TppLabel
              UserName = 'Label51'
              Caption = 'N'#186' DA CONTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 139700
              mmTop = 0
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel52: TppLabel
              UserName = 'Label52'
              Caption = 'PESSOA (F/J)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 175684
              mmTop = 0
              mmWidth = 17992
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'NOME_BANCO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefBanco'
              mmHeight = 3175
              mmLeft = 2117
              mmTop = 0
              mmWidth = 58208
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'FONE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefBanco'
              mmHeight = 3175
              mmLeft = 61383
              mmTop = 0
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'NOME_AGENCIA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefBanco'
              mmHeight = 3175
              mmLeft = 82550
              mmTop = 0
              mmWidth = 35719
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              DataField = 'NUMERO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefBanco'
              mmHeight = 3175
              mmLeft = 120650
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              DataField = 'NUM_CONTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefBanco'
              mmHeight = 3175
              mmLeft = 139171
              mmTop = 0
              mmWidth = 33867
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              DataField = 'TIPO_PESSOA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefBanco'
              mmHeight = 3175
              mmLeft = 188384
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
          end
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        DataPipelineName = 'dbRefComercio'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 175684
        mmWidth = 197380
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
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
          Version = '6.0'
          mmColumnWidth = 0
          DataPipelineName = 'dbRefComercio'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppLabel53: TppLabel
              UserName = 'Label53'
              Caption = 'FORNECEDOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 2117
              mmTop = 0
              mmWidth = 20108
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'CNPJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 91017
              mmTop = 0
              mmWidth = 7408
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'TELEFONE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 127000
              mmTop = 0
              mmWidth = 14817
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              DataField = 'NOME_FORNECEDOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefComercio'
              mmHeight = 3175
              mmLeft = 2117
              mmTop = 0
              mmWidth = 85725
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText37'
              DataField = 'CNPJ'
              DisplayFormat = '##.###.###/####-##;0;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefComercio'
              mmHeight = 3175
              mmLeft = 91017
              mmTop = 0
              mmWidth = 34396
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText38'
              DataField = 'FONE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRefComercio'
              mmHeight = 3175
              mmLeft = 127000
              mmTop = 0
              mmWidth = 44186
              BandType = 4
            end
          end
        end
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        DataPipelineName = 'dbObs'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 222250
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
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
          Version = '6.0'
          mmColumnWidth = 0
          DataPipelineName = 'dbObs'
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'TEXTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbObs'
              mmHeight = 3175
              mmLeft = 0
              mmTop = 0
              mmWidth = 183092
              BandType = 4
            end
          end
        end
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'C_ABERTURA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 22490
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText401'
        DataField = 'C_ALTERACAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3969
        mmLeft = 104775
        mmTop = 22490
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'C_FICHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 254265
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'C_CONTRATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 258498
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'C_CARTAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 262732
        mmWidth = 2910
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'C_CARTEIRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbFicha'
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 266965
        mmWidth = 3969
        BandType = 4
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 203200
        mmWidth = 197380
        BandType = 4
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'CR'#201'DITO SUGERIDO P/ REPRESENTANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 206111
        mmWidth = 52917
        BandType = 4
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10848
        mmLeft = 55033
        mmTop = 205582
        mmWidth = 3440
        BandType = 4
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10848
        mmLeft = 74083
        mmTop = 205582
        mmWidth = 3440
        BandType = 4
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 59267
        mmTop = 212725
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = 'ASSINATURA DO REPRESENTANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 80433
        mmTop = 212725
        mmWidth = 48419
        BandType = 4
      end
      object ppLine38: TppLine
        UserName = 'Line15'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 78317
        mmTop = 209550
        mmWidth = 52388
        BandType = 4
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10848
        mmLeft = 135467
        mmTop = 205582
        mmWidth = 3440
        BandType = 4
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'DEPTO. DE VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 212725
        mmWidth = 27517
        BandType = 4
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 139700
        mmTop = 209550
        mmWidth = 52388
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line23'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 56092
        mmTop = 211932
        mmWidth = 16933
        BandType = 4
      end
    end
  end
  object dsPonte: TDataSource
    DataSet = QImpFicha
    Left = 936
    Top = 104
  end
  object Qdiretor: TSQLQuery
    SQLConnection = DM.BancoDados
    DataSource = dsPonte
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select'
      '   NOME,'
      '   CPF,'
      '   FONE,'
      '   ENDERECO,'
      '   DATANASC'
      'from DIRETOR'
      '   WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 776
    Top = 160
    object QdiretorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object QdiretorCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object QdiretorFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object QdiretorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object QdiretorDATANASC: TSQLTimeStampField
      FieldName = 'DATANASC'
    end
  end
  object dspDiretor: TDataSetProvider
    DataSet = Qdiretor
    Constraints = True
    Left = 824
    Top = 160
  end
  object Diretor: TClientDataSet
    Aggregates = <>
    DataSetField = ImpFichaQdiretor
    Params = <>
    Left = 872
    Top = 160
    object DiretorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object DiretorCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object DiretorFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object DiretorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object DiretorDATANASC: TSQLTimeStampField
      FieldName = 'DATANASC'
    end
  end
  object dsRelDiretor: TDataSource
    DataSet = Diretor
    Left = 920
    Top = 160
  end
  object QRefBanco: TSQLQuery
    SQLConnection = DM.BancoDados
    DataSource = dsPonte
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select'
      '   NOME_BANCO,'
      '   FONE,'
      '   TIPO_PESSOA,'
      '   NOME_AGENCIA,'
      '   NUMERO,'
      '   NUM_CONTA'
      'from REF_BANCARIA'
      '   WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 776
    Top = 208
    object QRefBancoNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      Size = 50
    end
    object QRefBancoFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object QRefBancoTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      FixedChar = True
      Size = 1
    end
    object QRefBancoNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 50
    end
    object QRefBancoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 15
    end
    object QRefBancoNUM_CONTA: TStringField
      FieldName = 'NUM_CONTA'
    end
  end
  object dspRefBanco: TDataSetProvider
    DataSet = QRefBanco
    Constraints = True
    Left = 824
    Top = 208
  end
  object RefBanco: TClientDataSet
    Aggregates = <>
    DataSetField = ImpFichaQRefBanco
    Params = <>
    Left = 872
    Top = 208
  end
  object dsRelRefBanco: TDataSource
    DataSet = RefBanco
    Left = 920
    Top = 208
  end
  object QRefComercio: TSQLQuery
    SQLConnection = DM.BancoDados
    DataSource = dsPonte
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select'
      '   NOME_FORNECEDOR,'
      '   FONE,'
      '   CNPJ'
      'from REF_COMERCIAL'
      '   WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 776
    Top = 256
    object QRefComercioNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 50
    end
    object QRefComercioFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object QRefComercioCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
  end
  object RelRefComercio: TClientDataSet
    Aggregates = <>
    DataSetField = ImpFichaQRefComercio
    Params = <>
    Left = 872
    Top = 256
    object RelRefComercioNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 50
    end
    object RelRefComercioFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object RelRefComercioCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
  end
  object dspRelRefComercio: TDataSetProvider
    DataSet = QRefComercio
    Constraints = True
    Left = 824
    Top = 256
  end
  object dsRelComercio: TDataSource
    DataSet = RelRefComercio
    Left = 920
    Top = 256
  end
  object dbRefComercio: TppDBPipeline
    DataSource = dsRelComercio
    SkipWhenNoRecords = False
    UserName = 'dbRefComercio'
    Left = 960
    Top = 256
  end
  object dbObs: TppDBPipeline
    DataSource = dsRelObs
    SkipWhenNoRecords = False
    UserName = 'dbObs'
    Left = 960
    Top = 304
  end
  object Qobs: TSQLQuery
    SQLConnection = DM.BancoDados
    DataSource = dsPonte
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select'
      '   CODIGO,'
      '   NUM_LINHA,'
      '   TEXTO,'
      '   TIPO'
      'from CAD_OBS'
      '   where  CODIGO = :COD_CLIENTE'
      '   and  TIPO = '#39'CLI'#39
      '   order by NUM_LINHA')
    Left = 776
    Top = 304
    object QobsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QobsNUM_LINHA: TIntegerField
      FieldName = 'NUM_LINHA'
    end
    object QobsTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 100
    end
    object QobsTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
  end
  object dspObs: TDataSetProvider
    DataSet = Qobs
    Constraints = True
    Left = 824
    Top = 304
  end
  object Obs: TClientDataSet
    Aggregates = <>
    DataSetField = ImpFichaQobs
    Params = <>
    Left = 872
    Top = 304
    object ObsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object ObsNUM_LINHA: TIntegerField
      FieldName = 'NUM_LINHA'
    end
    object ObsTEXTO: TStringField
      FieldName = 'TEXTO'
      Size = 100
    end
    object ObsTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
  end
  object dsRelObs: TDataSource
    DataSet = Obs
    Left = 920
    Top = 304
  end
end
