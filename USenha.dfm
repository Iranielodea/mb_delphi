object fSenha: TfSenha
  Left = 244
  Top = 157
  BorderStyle = bsDialog
  Caption = 'Usu'#225'rio'
  ClientHeight = 217
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 44
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 49
    Height = 13
    Caption = 'Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVersao: TLabel
    Left = 357
    Top = 8
    Width = 113
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'lblVersao'
  end
  object EditUsuario: TEdit
    Left = 24
    Top = 40
    Width = 129
    Height = 22
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object editSenha: TEdit
    Left = 24
    Top = 80
    Width = 129
    Height = 22
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 176
    Width = 494
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 110
      Top = 8
      Width = 100
      Height = 25
      Caption = 'OK'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 8
      Width = 100
      Height = 25
      Caption = '&Cancelar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object CodEmpresa: TMaskEdit
    Left = 24
    Top = 123
    Width = 39
    Height = 22
    Ctl3D = False
    EditMask = '####;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    Text = '1'
    OnEnter = CodEmpresaEnter
    OnExit = CodEmpresaExit
  end
  object Nome: TEdit
    Left = 72
    Top = 123
    Width = 398
    Height = 22
    TabStop = False
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object Qsenha: TSQLDataSet
    CommandText = 
      'select '#13#10'COD_EMPRESA, '#13#10'NOME, '#13#10'SENHA '#13#10'from CAD_USUARIO'#13#10' where' +
      ' COD_EMPRESA = :CODEMPRESA'#13#10' and NOME = :NOME'#13#10' and SENHA = :SEN' +
      'HA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'SENHA'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 248
    Top = 40
    object QsenhaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object QsenhaNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object QsenhaSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      FixedChar = True
    end
  end
  object QEmpresa: TSQLDataSet
    CommandText = 
      'select COD_EMPRESA, NOME, VERSAO from EMPRESA'#13#10' where COD_EMPRES' +
      'A = :CODEMPRESA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODEMPRESA'
        ParamType = ptInput
      end>
    SQLConnection = DM.BancoDados
    Left = 304
    Top = 40
    object QEmpresaCOD_EMPRESA: TIntegerField
      FieldName = 'COD_EMPRESA'
      Required = True
    end
    object QEmpresaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object QEmpresaVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 10
    end
  end
end
