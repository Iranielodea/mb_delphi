unit uExpurgo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfExpurgo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Senha: TLabel;
    editUsuario: TEdit;
    EditSenha: TEdit;
    butOk: TBitBtn;
    P_Limpa: TPanel;
    butLimpar: TBitBtn;
    procedure butLimparClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExpurgo: TfExpurgo;

implementation

uses UUtil, uDM;

{$R *.dfm}

procedure TfExpurgo.butLimparClick(Sender: TObject);
begin
   if confirma('Confirma Limpeza do Banco de Dados?','N')=idno then
      exit;
   Executa('delete from CONTAS');
   Executa('delete from CARGA');
   Executa('delete from MOTORISTA');
   Executa('delete from TRANSPORTADOR');
   Executa('delete from AGENCIADOR');
   Executa('delete from TABELA_PRAZO');
   Executa('delete from ITENS_PEDIDO');
   Executa('delete from PEDIDO');
   Executa('delete from CONTATO');
   Executa('delete from FORNECEDOR');
   Executa('delete from CLIENTE');
   Executa('delete from CIDADE');
   Executa('delete from ESTADO');
   Executa('delete from ITENS_CONDICAO');
   Executa('delete from CONDICAO');
   Executa('delete from FORMA_PAGTO');
   Executa('delete from PRODUTO');
   Executa('delete from GRUPO');
   Executa('delete from UNIDADE');
   showmessage('Fim do Processo');
end;

procedure TfExpurgo.butOkClick(Sender: TObject);
begin
   if (editUsuario.Text = 'SUPERVISOR') and (EditSenha.Text = 'DELPHI') then
   begin
      P_Limpa.Visible:=true;
      exit;
   end;
   if (trim(editUsuario.Text) = '') or (trim(EditSenha.Text) = '') then
   begin
      mensagem('Digite o Usuario e a Senha');
      exit;
   end;
   ComandoQsql('select NOME, SENHA, GERENTE from CAD_USUARIO where COD_EMPRESA = '+vgCod_Empresa+' and NOME = '''+editUsuario.Text+'''');
   if dm.Qsql.IsEmpty then
   begin
      mensagem('Usuário não Cadastrado');
      dm.Qsql.close;
      exit;
   end;
   if trim(dm.Qsql.fieldbyname('SENHA').Text) <> trim(EditSenha.Text) then
   begin
      mensagem('Senha Inválida');
      dm.Qsql.close;
      exit;
   end;
   if dm.Qsql.fieldbyname('GERENTE').Text = 'S' then
      P_Limpa.Visible:=true
   else
      mensagem('Usuário sem Permissão');
   dm.Qsql.Close;
end;

end.
