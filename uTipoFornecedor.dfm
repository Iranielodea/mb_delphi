inherited fTipoFornecedor: TfTipoFornecedor
  Caption = 'Tipo de Fornecedor'
  OnShow = FormShow
  ExplicitWidth = 748
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_TIPO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO'
        Title.Caption = 'Nome'
        Width = 439
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGLA'
        Title.Caption = 'Sigla'
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
          object Label4: TLabel [2]
            Left = 24
            Top = 104
            Width = 31
            Height = 16
            Caption = 'Sigla'
          end
          inherited Codigo: TDBEdit
            DataField = 'ID_TIPO'
          end
          inherited Nome: TDBEdit
            DataField = 'DESC_TIPO'
          end
          object DBEdit1: TDBEdit
            Left = 24
            Top = 122
            Width = 57
            Height = 24
            CharCase = ecUpperCase
            DataField = 'SIGLA'
            DataSource = dsCad
            TabOrder = 2
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
    DataSet = DM.TipoFornecedor
  end
end
