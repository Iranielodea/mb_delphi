inherited fVendedor: TfVendedor
  Caption = 'Vendedores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_VENDEDOR'
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
        FieldName = 'PERC_COMISSAO'
        Title.Caption = '%Comiss'#227'o'
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    inherited PageControl1: TPageControl
      inherited sheetCad: TTabSheet
        inherited Panel3: TPanel
          inherited Codigo: TDBEdit
            DataField = 'COD_VENDEDOR'
          end
          inherited Nome: TDBEdit
            DataField = 'NOME'
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
    DataSet = DM.Vendedor
    Left = 672
    Top = 152
  end
end
