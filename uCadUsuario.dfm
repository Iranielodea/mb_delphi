inherited fCadUsuario: TfCadUsuario
  Caption = 'Cadastro de Usu'#225'rios'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  inherited Grade: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_USUARIO'
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
    inherited PageControl1: TPageControl
      inherited sheetCad: TTabSheet
        inherited Panel3: TPanel
          object Label4: TLabel [2]
            Left = 30
            Top = 128
            Width = 39
            Height = 16
            Caption = 'Senha'
          end
          object Label7: TLabel [3]
            Left = 30
            Top = 177
            Width = 137
            Height = 16
            Caption = 'Confirma'#231#227'o da Senha'
          end
          inherited Codigo: TDBEdit
            DataField = 'ID_USUARIO'
          end
          inherited Nome: TDBEdit
            DataField = 'NOME'
          end
          object EditSenha: TDBEdit
            Left = 30
            Top = 148
            Width = 148
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'SENHA'
            DataSource = dsCad
            ParentCtl3D = False
            PasswordChar = '*'
            TabOrder = 2
          end
          object Gr_Gerente: TDBRadioGroup
            Left = 256
            Top = 128
            Width = 228
            Height = 90
            Caption = 'Gerente:'
            Columns = 2
            Ctl3D = False
            DataField = 'GERENTE'
            DataSource = dsCad
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ParentCtl3D = False
            TabOrder = 4
            Values.Strings = (
              'S'
              'N')
            Visible = False
          end
          object editConfirmaSenha: TEdit
            Left = 30
            Top = 197
            Width = 148
            Height = 22
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            PasswordChar = '*'
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
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
        Visible = False
      end
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Cad_Usuario
  end
end
