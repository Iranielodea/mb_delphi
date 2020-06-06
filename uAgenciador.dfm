inherited fAgenciador: TfAgenciador
  Left = 167
  Top = 103
  Caption = 'Agenciadores'
  ClientHeight = 516
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited P_Rodape: TPanel
    Top = 478
    ExplicitTop = 478
  end
  inherited Grade: TDBGrid
    Height = 421
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_AGENCIA'
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
    Top = -4
    Width = 743
    Height = 520
    ExplicitTop = -4
    ExplicitWidth = 743
    ExplicitHeight = 520
    inherited PageControl1: TPageControl
      Width = 737
      Height = 448
      ExplicitWidth = 737
      ExplicitHeight = 448
      inherited sheetCad: TTabSheet
        inherited Panel3: TPanel
          Width = 729
          Height = 417
          ExplicitWidth = 729
          ExplicitHeight = 417
          object Label4: TLabel [2]
            Left = 544
            Top = 144
            Width = 50
            Height = 16
            Caption = 'Ag'#234'ncia'
          end
          object Label7: TLabel [3]
            Left = 24
            Top = 144
            Width = 36
            Height = 16
            Caption = 'Bairro'
          end
          object Label8: TLabel [4]
            Left = 24
            Top = 224
            Width = 27
            Height = 16
            Caption = 'CEP'
          end
          object Label9: TLabel [5]
            Left = 24
            Top = 264
            Width = 35
            Height = 16
            Caption = 'CNPJ'
          end
          object Label10: TLabel [6]
            Left = 24
            Top = 184
            Width = 44
            Height = 16
            Caption = 'Cidade'
          end
          object Label11: TLabel [7]
            Left = 544
            Top = 104
            Width = 50
            Height = 16
            Caption = 'N'#186'Conta'
          end
          object Label12: TLabel [8]
            Left = 24
            Top = 344
            Width = 34
            Height = 16
            Caption = 'Email'
          end
          object Label13: TLabel [9]
            Left = 24
            Top = 104
            Width = 59
            Height = 16
            Caption = 'Endere'#231'o'
          end
          object Label14: TLabel [10]
            Left = 24
            Top = 304
            Width = 41
            Height = 16
            Caption = 'Fone 1'
          end
          object Label15: TLabel [11]
            Left = 216
            Top = 304
            Width = 41
            Height = 16
            Caption = 'Fone 2'
          end
          object Label16: TLabel [12]
            Left = 216
            Top = 264
            Width = 80
            Height = 16
            Caption = 'Insc.Estadual'
          end
          object Label17: TLabel [13]
            Left = 544
            Top = 64
            Width = 98
            Height = 16
            Caption = 'Nome do Banco'
          end
          object Label18: TLabel [14]
            Left = 392
            Top = 240
            Width = 75
            Height = 16
            Caption = 'Observa'#231#227'o'
          end
          object Label19: TLabel [15]
            Left = 544
            Top = 184
            Width = 76
            Height = 16
            Caption = 'Comiss'#227'o %'
          end
          object Label20: TLabel [16]
            Left = 160
            Top = 224
            Width = 43
            Height = 16
            Caption = 'Estado'
          end
          object SpeedButton1: TSpeedButton [17]
            Left = 369
            Top = 200
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
            OnClick = SpeedButton1Click
          end
          inherited Codigo: TDBEdit
            DataField = 'COD_AGENCIA'
          end
          inherited Nome: TDBEdit
            DataField = 'NOME'
          end
          object DBEdit1: TDBEdit
            Left = 544
            Top = 160
            Width = 145
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'AGENCIA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 15
          end
          object DBEdit4: TDBEdit
            Left = 24
            Top = 160
            Width = 241
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'BAIRRO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 24
            Top = 240
            Width = 121
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'CEP'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 6
          end
          object Cnpj: TDBEdit
            Left = 24
            Top = 280
            Width = 169
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'CNPJ'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 8
            OnExit = CnpjExit
          end
          object Cod_Cidade: TDBEdit
            Left = 24
            Top = 200
            Width = 41
            Height = 22
            TabStop = False
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'COD_CIDADE'
            DataSource = dsCad
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit8: TDBEdit
            Left = 544
            Top = 120
            Width = 145
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'CONTA_BANCO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 14
          end
          object Desc_Cidade: TDBEdit
            Left = 72
            Top = 200
            Width = 297
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'DESC_CIDADE'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 5
            OnExit = Desc_CidadeExit
          end
          object DBEdit10: TDBEdit
            Left = 24
            Top = 360
            Width = 353
            Height = 22
            CharCase = ecLowerCase
            Ctl3D = False
            DataField = 'EMAIL'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 12
          end
          object DBEdit11: TDBEdit
            Left = 24
            Top = 120
            Width = 369
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'ENDERECO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
          object DBEdit12: TDBEdit
            Left = 24
            Top = 320
            Width = 169
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FONE1'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 10
          end
          object DBEdit13: TDBEdit
            Left = 216
            Top = 320
            Width = 161
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FONE2'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 11
          end
          object Insc_Estadual: TDBEdit
            Left = 216
            Top = 280
            Width = 161
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'INSC_ESTADUAL'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 9
            OnExit = Insc_EstadualExit
          end
          object DBEdit15: TDBEdit
            Left = 544
            Top = 80
            Width = 145
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'NOME_BANCO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 13
          end
          object DBEdit17: TDBEdit
            Left = 544
            Top = 200
            Width = 81
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'PERC_COMISSAO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 16
          end
          object UF: TDBEdit
            Left = 160
            Top = 240
            Width = 57
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
          object DBMemo1: TDBMemo
            Left = 392
            Top = 256
            Width = 305
            Height = 129
            Ctl3D = False
            DataField = 'OBS'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 17
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited Panel4: TPanel
          Width = 729
          Height = 417
          ExplicitWidth = 729
          ExplicitHeight = 417
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
      Top = 476
      Width = 737
      ExplicitTop = 476
      ExplicitWidth = 737
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
    inherited Panel1: TPanel
      Width = 737
      ExplicitWidth = 737
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Agenciador
    Left = 336
    Top = 64
  end
end
