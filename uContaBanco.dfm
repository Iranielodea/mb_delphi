inherited fContaBanco: TfContaBanco
  Caption = 'Contas Banc'#225'rias'
  ExplicitTop = 8
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CONTABANCO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CONTA'
        Title.Caption = 'N'#186'Conta'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AGENCIA'
        Title.Caption = 'Ag'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Visible = True
      end>
  end
  inherited P_Cad: TPanel
    Top = 72
    Height = 369
    ExplicitTop = 72
    ExplicitHeight = 369
    inherited PageControl1: TPageControl
      Height = 297
      ExplicitHeight = 297
      inherited sheetCad: TTabSheet
        ExplicitHeight = 266
        inherited Panel3: TPanel
          Height = 266
          ExplicitHeight = 266
          inherited Label3: TLabel
            Width = 105
            Caption = 'N'#250'mero da Conta'
            ExplicitWidth = 105
          end
          object Label4: TLabel [2]
            Left = 24
            Top = 104
            Width = 50
            Height = 16
            Caption = 'Ag'#234'ncia'
          end
          object Label7: TLabel [3]
            Left = 24
            Top = 144
            Width = 39
            Height = 16
            Caption = 'Banco'
          end
          object Label8: TLabel [4]
            Left = 24
            Top = 186
            Width = 65
            Height = 16
            Caption = 'CNPJ/CPF'
          end
          inherited Codigo: TDBEdit
            DataField = 'ID_CONTABANCO'
          end
          inherited Nome: TDBEdit
            Width = 217
            DataField = 'NUM_CONTA'
            ExplicitWidth = 217
          end
          object DBEdit1: TDBEdit
            Left = 24
            Top = 120
            Width = 217
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'AGENCIA'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 24
            Top = 160
            Width = 217
            Height = 22
            Ctl3D = False
            DataField = 'BANCO'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 24
            Top = 200
            Width = 217
            Height = 22
            Ctl3D = False
            DataField = 'CNPJ_CPF'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 4
          end
          object DBCheckBox1: TDBCheckBox
            Left = 24
            Top = 230
            Width = 97
            Height = 17
            Caption = 'Ativo'
            DataField = 'ATIVO'
            DataSource = dsCad
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      inherited TabSheet1: TTabSheet
        ExplicitHeight = 266
        inherited Panel4: TPanel
          Height = 266
          ExplicitHeight = 266
        end
      end
    end
    inherited Panel2: TPanel
      Top = 325
      ExplicitTop = 325
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.ContaBanco
  end
end
