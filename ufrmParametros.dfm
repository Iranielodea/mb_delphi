inherited frmParametros: TfrmParametros
  Caption = 'Par'#226'metros do Sistema'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  inherited P_Rodape: TPanel
    ExplicitLeft = 1
    ExplicitTop = 454
  end
  inherited P_Cabec: TGroupBox
    inherited butPesq: TBitBtn
      Left = 479
      ExplicitLeft = 479
    end
  end
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Width = 439
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    inherited PageControl1: TPageControl
      inherited sheetCad: TTabSheet
        inherited Panel3: TPanel
          object Label4: TLabel [2]
            Left = 24
            Top = 108
            Width = 32
            Height = 16
            Caption = 'Valor'
          end
          object Label7: TLabel [3]
            Left = 24
            Top = 152
            Width = 75
            Height = 16
            Caption = 'Observa'#231#227'o'
          end
          inherited Codigo: TDBEdit
            DataField = 'CODIGO'
          end
          inherited Nome: TDBEdit
            Width = 697
            DataField = 'NOME'
            ExplicitWidth = 697
          end
          object DBEdit1: TDBEdit
            Left = 24
            Top = 124
            Width = 697
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'VALOR'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
          object DBMemo1: TDBMemo
            Left = 24
            Top = 168
            Width = 551
            Height = 89
            DataField = 'OBSERVACAO'
            DataSource = dsCad
            TabOrder = 3
          end
        end
      end
      inherited TabSheet1: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 730
        ExplicitHeight = 197
      end
    end
    inherited Panel2: TPanel
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited dsCad: TDataSource
    DataSet = dmParametros.cdsParametro
  end
end
