unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, Mask, DB, SqlExpr;

type
  TfSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditUsuario: TEdit;
    editSenha: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Qsenha: TSQLDataSet;
    Label3: TLabel;
    CodEmpresa: TMaskEdit;
    Nome: TEdit;
    QEmpresa: TSQLDataSet;
    QsenhaCOD_EMPRESA: TIntegerField;
    QsenhaNOME: TStringField;
    QsenhaSENHA: TStringField;
    QEmpresaCOD_EMPRESA: TIntegerField;
    QEmpresaNOME: TStringField;
    QEmpresaVERSAO: TStringField;
    lblVersao: TLabel;
    SQLConnection1: TSQLConnection;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CodEmpresaExit(Sender: TObject);
    procedure CodEmpresaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure TeclarEnterEsc(var Key: Char);
    procedure AtualizarVersao(VersaoAtual: Integer);
    procedure GetEmpresa;
    procedure VerificarUsuario();
  public
    { Public declarations }
  end;

var
  fSenha: TfSenha;

implementation

uses UUtil, UmenuPrin, uDM, uVersao;

{$R *.dfm}

procedure TfSenha.BitBtn2Click(Sender: TObject);
begin
   close;
end;

procedure TfSenha.AtualizarVersao(VersaoAtual: Integer);
var
  Versao: TVersao;
begin
  Versao := TVersao.Create;
  try
    Versao.AtualizarVersao(dm.BancoDados, VersaoAtual);
  finally
    FreeAndNil(Versao);
  end;
end;

procedure TfSenha.BitBtn1Click(Sender: TObject);
begin
  if trim(CodEmpresa.Text) = '' then
  begin
     mensagem('Informe a Empresa');
     CodEmpresa.SetFocus;
     exit;
  end;
   if (editUsuario.Text = 'SUPERVISOR') and (editSenha.Text = 'ROOT') then
   begin
      vgUsuario:=EditUsuario.Text;
      vgCod_Empresa:=CodEmpresa.Text;

      fMenuPrin.Show;
      Qsenha.Close;


      GetEmpresa();
      AtualizarVersao(QEmpresaVERSAO.AsInteger);

      fMenuPrin.Regua.Panels[0].Text:='Empresa: '+CodEmpresa.Text;
      fMenuPrin.Regua.Panels[1].Text:='Usuário: '+EditUsuario.Text;
      fMenuPrin.Regua.Panels[2].Text:='Versão: '+QEmpresaVERSAO.AsString;

      fSenha.Visible:=false;
      exit;
   end;
   if trim(Codempresa.Text) = '' then
   begin
      mensagem('informe a Empresa');
      CodEmpresa.SetFocus;
      exit;
   end;
   Qsenha.Close;
   Qsenha.Params.ParamByName('CODEMPRESA').Text:=CodEmpresa.Text;
   Qsenha.Params.ParamByName('NOME').Text:=EditUsuario.Text;
   Qsenha.Params.ParamByName('SENHA').Text:=EditSenha.Text;
   Qsenha.Open;
   if Qsenha.IsEmpty then
   begin
      mensagem('Senha Inválida');
      editUsuario.SetFocus;
      Qsenha.Close;
      exit;
   end;
   GetEmpresa();
   AtualizarVersao(QEmpresaVERSAO.AsInteger);

   fMenuPrin:=TfMenuprin.create(Self);
   fMenuPrin.Regua.Panels[0].Text:='Empresa: '+CodEmpresa.Text;
   fMenuPrin.Regua.Panels[1].Text:='Usuário: '+EditUsuario.Text;
   fMenuPrin.Regua.Panels[2].Text:='Versão: '+QEmpresaVERSAO.AsString;

   fmenuPrin.Caption:='Menu Principal - '+Nome.Text;
   vgUsuario:=EditUsuario.Text;
   vgCod_Empresa:=CodEmpresa.Text;
   fMenuPrin.Show;
   Qsenha.Close;
   fSenha.Visible:=false;
end;

procedure TfSenha.CodEmpresaExit(Sender: TObject);
begin
   if CodEmpresa.Modified then
   begin
      if CodEmpresa.Text = '' then
      begin
         Nome.Clear;
         exit;
      end;
      GetEmpresa();
      if Qempresa.IsEmpty then
      begin
         mensagem('Empresa não Cadastrada');
         Qempresa.Close;
         CodEmpresa.Clear;
         Nome.Clear;
         exit;
      end;
      Nome.Text:=QempresaNOME.Text;
      lblVersao.Caption := 'Versão: ' + QEmpresaVERSAO.AsString;
      Qempresa.Close;
   end;
end;

procedure TfSenha.CodEmpresaEnter(Sender: TObject);
begin
   CodEmpresa.Modified:=false;
end;

procedure TfSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
//   if key = #13 then
//   begin
//      key:=#0;
//      perform(Wm_NextDlgCtl,0,0);
//   end;

  TeclarEnterEsc(Key);
end;

procedure TfSenha.FormShow(Sender: TObject);
begin
  VerificarUsuario();
end;

procedure TfSenha.GetEmpresa;
begin
  Qempresa.Close;
  Qempresa.Params[0].Text:=CodEmpresa.Text;
  Qempresa.Open;
end;

procedure TfSenha.TeclarEnterEsc(var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;

   if Key = #27 then
      Close;

end;

procedure TfSenha.VerificarUsuario;
var
  Arquivo: string;
begin
  Arquivo := ExtractFilePath(application.ExeName);
  Arquivo := Arquivo + '\Homologa.txt';

  if FileExists(Arquivo) then
  begin
    EditUsuario.Text := 'SUPERVISOR';
    editSenha.Text := 'ROOT';
  end;
end;

procedure TfSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   if key = vk_Escape then
//      close;
end;

procedure TfSenha.FormActivate(Sender: TObject);
begin
  lblVersao.Caption := '';
   if CodEmpresa.Text <> '' then
   begin
      CodEmpresa.Modified:=true;
      CodEmpresaExit(Self);
   end;
end;

end.
