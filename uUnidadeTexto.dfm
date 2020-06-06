inherited FUnidadeTexto: TFUnidadeTexto
  Caption = 'Textos para Unidades'
  OnShow = FormShow
  ExplicitTop = -81
  ExplicitWidth = 748
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACAO'
        Title.Caption = 'Observa'#231#227'o'
        Width = 439
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    Height = 342
    ExplicitHeight = 342
    inherited PageControl1: TPageControl
      Height = 270
      ExplicitHeight = 270
      inherited sheetCad: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 730
        ExplicitHeight = 239
        inherited Panel3: TPanel
          Height = 239
          ExplicitHeight = 239
          inherited Label3: TLabel
            Width = 75
            Caption = 'Observa'#231#227'o'
            ExplicitWidth = 75
          end
          object Label4: TLabel [2]
            Left = 24
            Top = 103
            Width = 34
            Height = 16
            Caption = 'Texto'
          end
          inherited Codigo: TDBEdit
            DataField = 'ID'
          end
          inherited Nome: TDBEdit
            DataField = 'OBSERVACAO'
          end
          object DBMemo1: TDBMemo
            Left = 24
            Top = 120
            Width = 673
            Height = 118
            DataField = 'TEXTO'
            DataSource = dsCad
            TabOrder = 2
            OnEnter = DBMemo1Enter
            OnExit = DBMemo1Exit
          end
        end
      end
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 730
        ExplicitHeight = 239
        inherited Panel4: TPanel
          Height = 239
          ExplicitHeight = 239
          inherited DBEdit2: TDBEdit
            Top = 44
            DataField = 'USU_INC'
            ExplicitTop = 44
          end
          inherited DBEdit3: TDBEdit
            DataField = 'USU_ALT'
          end
        end
      end
    end
    inherited Panel2: TPanel
      Top = 298
      ExplicitTop = 298
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.UnidadeTexto
  end
end
