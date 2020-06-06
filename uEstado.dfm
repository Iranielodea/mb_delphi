inherited fEstado: TfEstado
  Caption = 'Estados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'SIGLA'
        Title.Caption = 'Sigla'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ESTADO'
        Title.Caption = 'Nome'
        Width = 439
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    Height = 349
    inherited PageControl1: TPageControl
      Height = 277
      inherited sheetCad: TTabSheet
        inherited Panel3: TPanel
          Height = 246
          inherited Label3: TLabel
            Width = 31
            Caption = 'Sigla'
          end
          object Label4: TLabel [2]
            Left = 24
            Top = 104
            Width = 37
            Height = 16
            Caption = 'Nome'
          end
          object Label7: TLabel [3]
            Left = 24
            Top = 147
            Width = 44
            Height = 16
            Caption = 'ICMS%'
          end
          inherited Codigo: TDBEdit
            DataField = 'ID_ESTADO'
          end
          inherited Nome: TDBEdit
            Width = 70
            DataField = 'SIGLA'
          end
          object DBEdit1: TDBEdit
            Left = 24
            Top = 124
            Width = 434
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'DESC_ESTADO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 24
            Top = 167
            Width = 89
            Height = 22
            Ctl3D = False
            DataField = 'ICMS'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 3
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
      Top = 305
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Estado
  end
end
