unit uCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfCadUsuario = class(TfBase)
    Label4: TLabel;
    EditSenha: TDBEdit;
    Gr_Gerente: TDBRadioGroup;
    editConfirmaSenha: TEdit;
    Label7: TLabel;
    procedure butOkClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function Retorna_Usuario: boolean;
    procedure Mostra_Gerente;
  public
    { Public declarations }
  end;

var
  fCadUsuario: TfCadUsuario;

implementation

uses uDM, UUtil;

var vu_Gerente: string[1];

{$R *.dfm}

procedure TfCadUsuario.butOkClick(Sender: TObject);
begin
   if Nome.Text = 'SUPERVISOR' then
   begin
      mensagem('Usuário Supervisor não poderá ser cadastrado');
      Nome.SetFocus;
      exit;
   end;
   if EditSenha.Text <> editConfirmaSenha.Text then
   begin
      mensagem('Senha não Confere com a Repetição');
      EditSenha.SetFocus;
      exit;
   end;
   if dscad.DataSet.State = dsInsert then
   begin
      ComandoQsql('select NOME from CAD_USUARIO where COD_EMPRESA = '+vgCod_Empresa+' and NOME = '''+Nome.Text+'''');
      if not dm.Qsql.FieldByName('NOME').IsNull then
      begin
         mensagem('Usuário já Cadastrado');
         dm.Qsql.Close;
      end;
   end
   else begin
      ComandoQsql('select ID_USUARIO, NOME from CAD_USUARIO where COD_EMPRESA = '+vgCod_Empresa+' and NOME = '''+Nome.Text+'''');
      if (dm.Qsql.FieldByName('ID_USUARIO').Text <> Codigo.Text) and (dm.Qsql.FieldByName('NOME').Text = Nome.Text) then
      begin
         mensagem('Usuário já Cadastrado');
         dm.Qsql.Close;
      end;
   end;
   dm.Qsql.Close;
   dm.Cad_UsuarioCOD_EMPRESA.Text:=vgCod_Empresa;
  inherited;

end;

procedure TfCadUsuario.GradeDblClick(Sender: TObject);
begin
   if Retorna_Usuario = false then
      exit;
  inherited;
  Mostra_Gerente;
end;

procedure TfCadUsuario.butExcluirClick(Sender: TObject);
begin
   if Retorna_Usuario = false then
      exit;
  inherited;
end;

function TfCadUsuario.Retorna_Usuario: boolean;
begin
   if vu_Gerente = 'S' then
   begin
      result:=true;
      exit;
   end;
   if vgUsuario = 'SUPERVISOR' then
   begin
      result:=true;
      exit;
   end;
   if dm.Cad_UsuarioNOME.Text <> vgUsuario then
   begin
      mensagem('Usuário sem Permissão');
      Result:=false;
      exit;
   end;
   Result:=True;
end;

procedure TfCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
   ComandoQsql('select GERENTE from CAD_USUARIO where COD_EMPRESA = '+vgCod_Empresa+' and NOME = '''+Nome.Text+'''');
   vu_Gerente:=dm.Qsql.Fields[0].Text;
   dm.Qsql.Close;
end;

procedure TfCadUsuario.butAlterarClick(Sender: TObject);
begin
   if Retorna_Usuario = false then
      exit;
  inherited;
end;

procedure TfCadUsuario.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
   begin
      if Retorna_Usuario = false then
         exit;
      Mostra_Gerente;
   end;
  inherited;
end;

procedure TfCadUsuario.Mostra_Gerente;
begin
   editConfirmaSenha.Text:=dm.Cad_UsuarioSENHA.Text;
   if (vgUsuario = 'SUPERVISOR') then
      Gr_Gerente.Visible:=true;
   if (dm.Cad_UsuarioGERENTE.Text = 'S') then
      Gr_Gerente.Visible:=true;
end;

procedure TfCadUsuario.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fCadUsuario);
  inherited;
end;

procedure TfCadUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F3 then
   begin
      if Retorna_Usuario = false then
         exit;
   end;

  inherited;

end;

end.
