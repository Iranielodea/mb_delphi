inherited fEmpresa: TfEmpresa
  Caption = 'Minha Empresa'
  ClientHeight = 574
  ClientWidth = 852
  OldCreateOrder = True
  ExplicitWidth = 858
  ExplicitHeight = 603
  PixelsPerInch = 96
  TextHeight = 16
  inherited P_Rodape: TPanel
    Top = 536
    Width = 852
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitTop = 536
    ExplicitWidth = 852
    inherited butNovo: TSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited butAlterar: TSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited butExcluir: TSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited butSair: TSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited butImprimir: TSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited lblFiltro: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited P_Cabec: TGroupBox
    Width = 852
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 852
    inherited Label1: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited EditNome: TEdit
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited butPesq: TBitBtn
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited ROpcao: TRadioGroup
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited TipoCad: TEdit
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited Grade: TDBGrid
    Width = 852
    Height = 479
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_EMPRESA'
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
    Left = 11
    Top = 15
    Width = 837
    Height = 508
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 11
    ExplicitTop = 15
    ExplicitWidth = 837
    ExplicitHeight = 508
    inherited PageControl1: TPageControl
      Width = 831
      Height = 436
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 831
      ExplicitHeight = 436
      inherited sheetCad: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 823
        ExplicitHeight = 405
        inherited Panel3: TPanel
          Width = 823
          Height = 405
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitTop = 4
          ExplicitWidth = 823
          ExplicitHeight = 405
          inherited Label2: TLabel
            Left = 10
            Top = 10
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 10
            ExplicitTop = 10
          end
          inherited Label3: TLabel
            Left = 69
            Top = 10
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 69
            ExplicitTop = 10
          end
          object Label16: TLabel [2]
            Left = 10
            Top = 325
            Width = 34
            Height = 16
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Email'
          end
          object Label17: TLabel [3]
            Left = 679
            Top = 10
            Width = 44
            Height = 16
            Caption = 'Vers'#227'o'
          end
          inherited Codigo: TDBEdit
            Left = 10
            Top = 30
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'COD_EMPRESA'
            ExplicitLeft = 10
            ExplicitTop = 30
          end
          inherited Nome: TDBEdit
            Left = 69
            Top = 30
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'NOME'
            ExplicitLeft = 69
            ExplicitTop = 30
          end
          object GroupBox1: TGroupBox
            Left = 10
            Top = 59
            Width = 567
            Height = 179
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Endere'#231'o:'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 2
            object Label4: TLabel
              Left = 10
              Top = 25
              Width = 59
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Endere'#231'o'
            end
            object Label7: TLabel
              Left = 459
              Top = 25
              Width = 48
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'N'#250'mero'
            end
            object Label8: TLabel
              Left = 10
              Top = 74
              Width = 36
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Bairro'
            end
            object Label9: TLabel
              Left = 268
              Top = 74
              Width = 44
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Cidade'
            end
            object Label10: TLabel
              Left = 10
              Top = 123
              Width = 27
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'CEP'
            end
            object Label11: TLabel
              Left = 167
              Top = 123
              Width = 43
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Estado'
            end
            object DBEdit1: TDBEdit
              Left = 10
              Top = 44
              Width = 351
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'ENDERECO'
              DataSource = dsCad
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 459
              Top = 44
              Width = 96
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'NUMERO'
              DataSource = dsCad
              TabOrder = 1
            end
            object DBEdit5: TDBEdit
              Left = 10
              Top = 94
              Width = 247
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'BAIRRO'
              DataSource = dsCad
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 268
              Top = 94
              Width = 287
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'DESC_CIDADE'
              DataSource = dsCad
              TabOrder = 3
            end
            object DBEdit7: TDBEdit
              Left = 10
              Top = 143
              Width = 149
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'CEP'
              DataSource = dsCad
              TabOrder = 4
            end
            object DBEdit8: TDBEdit
              Left = 167
              Top = 143
              Width = 71
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'ESTADO'
              DataSource = dsCad
              TabOrder = 5
            end
          end
          object GroupBox2: TGroupBox
            Left = 585
            Top = 59
            Width = 169
            Height = 179
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Telefone/Fax:'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 3
            object Label12: TLabel
              Left = 9
              Top = 25
              Width = 54
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Telefone'
            end
            object Label13: TLabel
              Left = 10
              Top = 74
              Width = 22
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Fax'
            end
            object DBEdit9: TDBEdit
              Left = 10
              Top = 44
              Width = 149
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'FONE'
              DataSource = dsCad
              TabOrder = 0
            end
            object DBEdit10: TDBEdit
              Left = 10
              Top = 94
              Width = 149
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'FAX'
              DataSource = dsCad
              TabOrder = 1
            end
          end
          object GroupBox3: TGroupBox
            Left = 10
            Top = 239
            Width = 744
            Height = 80
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Documentos:'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 4
            object Label14: TLabel
              Left = 10
              Top = 20
              Width = 35
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'CNPJ'
            end
            object Label15: TLabel
              Left = 217
              Top = 20
              Width = 80
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Insc.Estadual'
            end
            object DBEdit11: TDBEdit
              Left = 10
              Top = 39
              Width = 188
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'CNPJ'
              DataSource = dsCad
              TabOrder = 0
            end
            object DBEdit12: TDBEdit
              Left = 217
              Top = 39
              Width = 188
              Height = 22
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              CharCase = ecUpperCase
              DataField = 'INSC_ESTADUAL'
              DataSource = dsCad
              TabOrder = 1
            end
          end
          object DBEdit13: TDBEdit
            Left = 10
            Top = 345
            Width = 503
            Height = 22
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            CharCase = ecLowerCase
            Ctl3D = False
            DataField = 'EMAIL'
            DataSource = dsCad
            ParentCtl3D = False
            TabOrder = 5
          end
          object DBEdit14: TDBEdit
            Left = 679
            Top = 27
            Width = 75
            Height = 22
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabStop = False
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'VERSAO'
            DataSource = dsCad
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 6
          end
        end
      end
      inherited TabSheet1: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 4
        ExplicitTop = 27
        ExplicitWidth = 823
        ExplicitHeight = 405
        inherited Panel4: TPanel
          Width = 823
          Height = 405
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 823
          ExplicitHeight = 405
          inherited Label5: TLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited Label6: TLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited DBEdit2: TDBEdit
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'USU_INC'
          end
          inherited DBEdit3: TDBEdit
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'USU_ALT'
          end
        end
      end
    end
    inherited Panel2: TPanel
      Top = 464
      Width = 831
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitTop = 464
      ExplicitWidth = 831
      inherited butOk: TBitBtn
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited butCancelar: TBitBtn
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited DBNavigator1: TDBNavigator
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Hints.Strings = ()
      end
      inherited butIncluir: TBitBtn
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
    end
    inherited Panel1: TPanel
      Width = 831
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 831
    end
  end
  inherited dsCad: TDataSource
    DataSet = DM.Empresa
    Left = 240
    Top = 128
  end
end
