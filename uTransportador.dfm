inherited fTransportador: TfTransportador
  Caption = 'Transportadores'
  ClientHeight = 556
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitHeight = 585
  PixelsPerInch = 96
  TextHeight = 16
  inherited P_Rodape: TPanel
    Top = 518
    ExplicitTop = 518
  end
  inherited P_Cabec: TGroupBox
    Height = 91
    ExplicitHeight = 91
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
    inherited butPesq: TBitBtn
      Left = 491
      Top = 60
      TabOrder = 3
      ExplicitLeft = 491
      ExplicitTop = 60
    end
    inherited ROpcao: TRadioGroup
      TabOrder = 4
    end
    inherited TipoCad: TEdit
      Left = 479
      Top = 30
      TabOrder = 5
      ExplicitLeft = 479
      ExplicitTop = 30
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
      TabOrder = 1
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
      TabOrder = 2
      Text = ''
    end
  end
  inherited Grade: TDBGrid
    Top = 91
    Height = 427
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_TRANS'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 439
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    Left = 40
    Top = 112
    Width = 705
    Height = 401
    ExplicitLeft = 40
    ExplicitTop = 112
    ExplicitWidth = 705
    ExplicitHeight = 401
    inherited PageControl1: TPageControl
      Width = 699
      Height = 329
      ExplicitWidth = 699
      ExplicitHeight = 329
      inherited sheetCad: TTabSheet
        ExplicitWidth = 691
        ExplicitHeight = 298
        inherited Panel3: TPanel
          Width = 691
          Height = 298
          ExplicitWidth = 691
          ExplicitHeight = 298
          inherited Label2: TLabel
            Top = 4
            ExplicitTop = 4
          end
          inherited Label3: TLabel
            Left = 87
            Top = 4
            ExplicitLeft = 87
            ExplicitTop = 4
          end
          object Label4: TLabel [2]
            Left = 416
            Top = 88
            Width = 36
            Height = 16
            Caption = 'Bairro'
          end
          object Label7: TLabel [3]
            Left = 416
            Top = 128
            Width = 25
            Height = 16
            Caption = 'Cep'
          end
          object Label8: TLabel [4]
            Left = 416
            Top = 48
            Width = 35
            Height = 16
            Caption = 'CNPJ'
          end
          object Label9: TLabel [5]
            Left = 24
            Top = 248
            Width = 70
            Height = 16
            Caption = 'Agenciador'
            Visible = False
          end
          object Label10: TLabel [6]
            Left = 24
            Top = 128
            Width = 44
            Height = 16
            Caption = 'Cidade'
          end
          object Label11: TLabel [7]
            Left = 24
            Top = 208
            Width = 115
            Height = 16
            Caption = 'Contato / Indica'#231#227'o'
          end
          object Label12: TLabel [8]
            Left = 24
            Top = 168
            Width = 30
            Height = 16
            Caption = 'DDD'
          end
          object Label14: TLabel [9]
            Left = 24
            Top = 88
            Width = 59
            Height = 16
            Caption = 'Endere'#231'o'
          end
          object Label15: TLabel [10]
            Left = 96
            Top = 168
            Width = 38
            Height = 16
            Caption = 'Fone1'
          end
          object Label16: TLabel [11]
            Left = 256
            Top = 168
            Width = 38
            Height = 16
            Caption = 'Fone2'
          end
          object Label17: TLabel [12]
            Left = 576
            Top = 48
            Width = 80
            Height = 16
            Caption = 'Insc.Estadual'
          end
          object Label18: TLabel [13]
            Left = 416
            Top = 208
            Width = 75
            Height = 16
            Caption = 'Observa'#231#227'o'
          end
          object Label19: TLabel [14]
            Left = 552
            Top = 128
            Width = 43
            Height = 16
            Caption = 'Estado'
          end
          object SpeedButton1: TSpeedButton [15]
            Left = 370
            Top = 145
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
          object SpeedButton2: TSpeedButton [16]
            Left = 370
            Top = 264
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
            Visible = False
            OnClick = SpeedButton2Click
          end
          object Label13: TLabel [17]
            Left = 416
            Top = 168
            Width = 22
            Height = 16
            Caption = 'Fax'
          end
          object Label20: TLabel [18]
            Left = 576
            Top = 168
            Width = 104
            Height = 16
            Caption = 'Data Nascimento'
          end
          object Label27: TLabel [19]
            Left = 24
            Top = 288
            Width = 34
            Height = 16
            Caption = 'Email'
          end
          object Label28: TLabel [20]
            Left = 24
            Top = 44
            Width = 26
            Height = 16
            Caption = 'CPF'
          end
          inherited Codigo: TDBEdit
            Top = 20
            DataField = 'COD_TRANS'
            ExplicitTop = 20
          end
          inherited Nome: TDBEdit
            Left = 87
            Top = 20
            Width = 474
            DataField = 'NOME'
            ExplicitLeft = 87
            ExplicitTop = 20
            ExplicitWidth = 474
          end
          object DBEdit1: TDBEdit
            Left = 416
            Top = 104
            Width = 305
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'BAIRRO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 6
          end
          object DBEdit4: TDBEdit
            Left = 416
            Top = 144
            Width = 121
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'CEP'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 9
          end
          object cnpj: TDBEdit
            Left = 416
            Top = 64
            Width = 145
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'CNPJ'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 3
            OnExit = cnpjExit
          end
          object Cod_Agencia: TDBEdit
            Left = 24
            Top = 264
            Width = 49
            Height = 22
            TabStop = False
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'COD_AGENCIA'
            DataSource = dsCad
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 16
            Visible = False
          end
          object Cod_Cidade: TDBEdit
            Left = 24
            Top = 144
            Width = 49
            Height = 22
            TabStop = False
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'COD_CIDADE'
            DataSource = dsCad
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEdit8: TDBEdit
            Left = 24
            Top = 224
            Width = 369
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'CONTATO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 18
          end
          object DBEdit9: TDBEdit
            Left = 24
            Top = 184
            Width = 57
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'DDD'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 11
          end
          object Desc_Cidade: TDBEdit
            Left = 80
            Top = 144
            Width = 289
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'DESC_CIDADE'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 8
            OnExit = Desc_CidadeExit
          end
          object DBEdit12: TDBEdit
            Left = 24
            Top = 104
            Width = 369
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'ENDERECO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 5
          end
          object DBEdit13: TDBEdit
            Left = 96
            Top = 184
            Width = 145
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FONE1'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 12
          end
          object DBEdit14: TDBEdit
            Left = 256
            Top = 184
            Width = 137
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FONE2'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 13
          end
          object Insc_Estadual: TDBEdit
            Left = 576
            Top = 64
            Width = 145
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'INSC_ESTADUAL'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 4
          end
          object EditEstado: TDBEdit
            Left = 552
            Top = 144
            Width = 49
            Height = 22
            TabStop = False
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'SIGLA'
            DataSource = dsCad
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 10
          end
          object Desc_Agencia: TDBEdit
            Left = 80
            Top = 264
            Width = 289
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NOME_AGENCIADOR'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 17
            Visible = False
            OnExit = Desc_AgenciaExit
          end
          object DBMemo1: TDBMemo
            Left = 416
            Top = 224
            Width = 305
            Height = 65
            Ctl3D = False
            DataField = 'OBS'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 20
          end
          object DBCheckBox1: TDBCheckBox
            Left = 552
            Top = 206
            Width = 169
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Transportador Importante'
            Ctl3D = False
            DataField = 'DESTAQUE'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 19
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBEdit5: TDBEdit
            Left = 416
            Top = 184
            Width = 145
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FAX'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 14
          end
          object DBEdit6: TDBEdit
            Left = 576
            Top = 184
            Width = 105
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'DATANASC'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 15
            OnKeyDown = DBEdit6KeyDown
          end
          object DBEdit18: TDBEdit
            Left = 24
            Top = 304
            Width = 697
            Height = 22
            CharCase = ecLowerCase
            Ctl3D = False
            DataField = 'EMAIL'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 21
          end
          object edtCPF: TDBEdit
            Left = 24
            Top = 60
            Width = 204
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'CPF_TRANSP'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
            OnExit = edtCPFExit
          end
        end
      end
      object TabSheet3: TTabSheet [1]
        Caption = 'Complemento'
        ImageIndex = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 691
          Height = 298
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label31: TLabel
            Left = 16
            Top = 16
            Width = 37
            Height = 16
            Caption = 'ANTT'
          end
          object Label32: TLabel
            Left = 16
            Top = 64
            Width = 67
            Height = 16
            Caption = 'RENAVAM'
          end
          object DBEdit19: TDBEdit
            Left = 16
            Top = 30
            Width = 233
            Height = 24
            DataField = 'ANTT'
            DataSource = dsCad
            TabOrder = 0
          end
          object DBEdit20: TDBEdit
            Left = 16
            Top = 78
            Width = 233
            Height = 24
            DataField = 'RENAVAN'
            DataSource = dsCad
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet [2]
        Caption = 'Dados Banc'#225'rios'
        ImageIndex = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 691
          Height = 298
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label21: TLabel
            Left = 15
            Top = 16
            Width = 64
            Height = 16
            Caption = 'Nro Banco'
          end
          object Label22: TLabel
            Left = 151
            Top = 16
            Width = 79
            Height = 16
            Caption = 'Nome Banco'
          end
          object Label23: TLabel
            Left = 471
            Top = 16
            Width = 75
            Height = 16
            Caption = 'Nro Ag'#234'ncia'
          end
          object Label24: TLabel
            Left = 15
            Top = 64
            Width = 60
            Height = 16
            Caption = 'Nro Conta'
          end
          object Label25: TLabel
            Left = 207
            Top = 64
            Width = 96
            Height = 16
            Caption = 'Nome do Titular'
          end
          object Label26: TLabel
            Left = 471
            Top = 64
            Width = 113
            Height = 16
            Caption = 'Nome Depositante'
          end
          object DBEdit7: TDBEdit
            Left = 15
            Top = 32
            Width = 121
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NUM_BANCO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 0
          end
          object DBEdit10: TDBEdit
            Left = 151
            Top = 32
            Width = 305
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NOME_BANCO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 1
          end
          object DBEdit11: TDBEdit
            Left = 471
            Top = 32
            Width = 241
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NUM_AGENCIA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
          object DBEdit15: TDBEdit
            Left = 15
            Top = 80
            Width = 177
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NUM_CONTA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 3
          end
          object DBEdit16: TDBEdit
            Left = 207
            Top = 80
            Width = 249
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NOME_TITULAR'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 4
          end
          object DBEdit17: TDBEdit
            Left = 471
            Top = 80
            Width = 241
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NOME_DESPOSITANTE'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 5
          end
        end
      end
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 691
        ExplicitHeight = 298
        inherited Panel4: TPanel
          Width = 691
          Height = 298
          ExplicitWidth = 691
          ExplicitHeight = 298
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
      Top = 357
      Width = 699
      ExplicitTop = 357
      ExplicitWidth = 699
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
    inherited Panel1: TPanel
      Width = 699
      ExplicitWidth = 699
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Transportador
    Left = 424
    Top = 16
  end
end
