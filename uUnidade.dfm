inherited fUnidade: TfUnidade
  Caption = 'Unidades'
  OldCreateOrder = True
  ExplicitWidth = 748
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_UNIDADE'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGLA'
        Title.Caption = 'Nome'
        Width = 439
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    inherited PageControl1: TPageControl
      inherited sheetCad: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 730
        ExplicitHeight = 197
        inherited Panel3: TPanel
          inherited Label2: TLabel
            Left = 22
            ExplicitLeft = 22
          end
          inherited Label3: TLabel
            Left = 22
            ExplicitLeft = 22
          end
          object Label4: TLabel [2]
            Left = 22
            Top = 104
            Width = 31
            Height = 16
            Caption = 'Sigla'
          end
          object Label7: TLabel [3]
            Left = 126
            Top = 104
            Width = 84
            Height = 16
            Caption = 'Complemento'
          end
          object Label8: TLabel [4]
            Left = 22
            Top = 153
            Width = 100
            Height = 16
            Caption = 'Fator Convers'#227'o'
          end
          object Label9: TLabel [5]
            Left = 152
            Top = 152
            Width = 34
            Height = 16
            Caption = 'Texto'
          end
          object btnTexto: TSpeedButton [6]
            Left = 543
            Top = 173
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
            OnClick = btnTextoClick
          end
          inherited Codigo: TDBEdit
            Left = 22
            DataField = 'ID_UNIDADE'
            ExplicitLeft = 22
          end
          inherited Nome: TDBEdit
            Left = 22
            DataField = 'DESC_UNIDADE'
            ExplicitLeft = 22
          end
          object Sigla: TDBEdit
            Left = 22
            Top = 125
            Width = 89
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'SIGLA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
          object DBEdit1: TDBEdit
            Left = 126
            Top = 124
            Width = 265
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'COMPL_UNIDADE'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 22
            Top = 173
            Width = 89
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'FATOR_CONVERSAO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 4
          end
          object DBEdit5: TDBEdit
            Left = 152
            Top = 173
            Width = 34
            Height = 22
            TabStop = False
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'ID_TEXTO'
            DataSource = dsCad
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit6: TDBEdit
            Left = 192
            Top = 173
            Width = 345
            Height = 22
            TabStop = False
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'OBSERVACAO'
            DataSource = dsCad
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 6
          end
        end
      end
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 730
        ExplicitHeight = 197
        inherited Panel4: TPanel
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
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Unidade
  end
end
