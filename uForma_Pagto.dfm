inherited fForma_Pagto: TfForma_Pagto
  Caption = 'Forma de Pagamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PAGTO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PAGTO'
        Title.Caption = 'Nome'
        Width = 439
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGLA'
        Title.Caption = 'Abrev.'
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    inherited PageControl1: TPageControl
      inherited sheetCad: TTabSheet
        inherited Panel3: TPanel
          object Label4: TLabel [2]
            Left = 24
            Top = 104
            Width = 69
            Height = 16
            Caption = 'Abreviatura'
          end
          inherited Codigo: TDBEdit
            DataField = 'COD_PAGTO'
          end
          inherited Nome: TDBEdit
            DataField = 'DESC_PAGTO'
          end
          object DBEdit1: TDBEdit
            Left = 24
            Top = 124
            Width = 148
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'SIGLA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
        end
      end
      inherited TabSheet1: TTabSheet
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
    DataSet = DM.Forma_Pagto
  end
end
