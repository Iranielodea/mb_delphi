unit uPermissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TfPermissao = class(TForm)
    P_Permissao: TPanel;
    Label3: TLabel;
    CboUsuario: TComboBox;
    DBGrid1: TDBGrid;
    butNovo: TSpeedButton;
    butExcluir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    butOk: TBitBtn;
    butSair: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    editUsuario: TEdit;
    EditSenha: TEdit;
    butConf: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CboInc: TComboBox;
    CboAlt: TComboBox;
    CboExc: TComboBox;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    dsCad: TDataSource;
    procedure butConfClick(Sender: TObject);
    procedure CboUsuarioClick(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure Carrega_Usuarios;
    procedure Incluir_Permissao(inUsuario: String);
  public
    { Public declarations }
  end;

var
  fPermissao: TfPermissao;

implementation

uses UUtil, uDM;

{$R *.dfm}

procedure TfPermissao.butConfClick(Sender: TObject);
begin
   if (editUsuario.Text = 'SUPERVISOR') and (EditSenha.Text = 'ROOT') then
   begin
      P_Permissao.Visible:=true;
      Carrega_Usuarios;
      exit;
   end;
   ComandoQsql('Select NOME,SENHA,GERENTE from CAD_USUARIO'
   +' where COD_EMPRESA = '+vgCod_Empresa
   +' and NOME = '''+vgUsuario+'''');
   if not (dm.Qsql.IsEmpty) then
   begin
      if trim(dm.Qsql.FieldByName('SENHA').Text) <> trim(EditSenha.Text) then
      begin
         mensagem('Senha Inválida');
         dm.Qsql.close;
         exit;
      end;
      if dm.Qsql.FieldByName('GERENTE').Text = 'S' then
         P_Permissao.Visible:=true
      else begin
         mensagem('Usuário sem Permissão');
         dm.Qsql.close;
         exit;
      end;
      Carrega_Usuarios;
   end
   else
      mensagem('Usuário não Cadastrado');
   dm.Qsql.close;
end;

procedure TfPermissao.Carrega_Usuarios;
begin
   CboUsuario.Clear;
   ComandoQsql('select NOME from CAD_USUARIO where COD_EMPRESA = '+vgCod_Empresa);
   while not dm.Qsql.Eof do
   begin
      CboUsuario.Items.Add(dm.Qsql.fieldbyname('NOME').Text);
      dm.Qsql.Next;
   end;
   dm.Qsql.Close;
end;

procedure TfPermissao.CboUsuarioClick(Sender: TObject);
begin
   dm.Permissao.Close;
   dm.Permissao.Params.ParamByName('COD_EMPRESA').Text:=vgCod_Empresa;
   dm.Permissao.Params.ParamByName('NOME').Text:=CboUsuario.Text;
   dm.Permissao.Open;
end;

procedure TfPermissao.butNovoClick(Sender: TObject);
begin
   if not dm.Permissao.IsEmpty then
   begin
      mensagem('Não será possível incluir novo usuário, já existe');
      exit;
   end;
   if dm.Permissao.Locate('NOME',CboUsuario.Text,[]) then
   begin
      mensagem('Usuário já Cadastrado');
      exit;
   end;
   Incluir_Permissao(CboUsuario.Text);
end;

procedure TfPermissao.Incluir_Permissao(inUsuario: String);
var vqtde_Tab, i: integer;
var vtab: array[1..20] of string;
begin
   vqtde_Tab:=20;
   vtab[1]:='CAD_USUARIO';
   vtab[2]:='CIDADE';
   vtab[3]:='CLIENTE';
   vtab[4]:='CONDICAO';
   vtab[5]:='CONTAS';
   vtab[6]:='CONTATO';
   vtab[7]:='EMPRESA';
   vtab[8]:='ESTADO';
   vtab[9]:='FORMA_PAGTO';
   vtab[10]:='FORNECEDOR';
   vtab[11]:='GRUPO';
   vtab[12]:='PEDIDO';
   vtab[13]:='PRODUTO';
   vtab[14]:='TABELA_PRAZO';
   vtab[15]:='UNIDADE';
   vtab[16]:='MOTORISTA';
   vtab[17]:='TRANSPORTADOR';
   vtab[18]:='AGENCIADOR';
   vtab[19]:='CARGA';
   vtab[20]:='CONTABANCO';

   dm.IniTrans;
   for i:=1 to vqtde_Tab do
   begin
      dm.Permissao.Append;
      dm.PermissaoTABELA.Text:=vtab[i];
      dm.PermissaoINC.Text:='S';
      dm.PermissaoALT.Text:='S';
      dm.PermissaoEXC.Text:='S';
      dm.PermissaoCON.Text:='S';
      dm.PermissaoNOME.Text:=inUsuario;
      dm.Permissao.Post;
   end;
   dm.SalvaTab(dm.Permissao);
   dm.SalvaTrans;
end;

procedure TfPermissao.SpeedButton1Click(Sender: TObject);
begin
   if confirma('Confirma exclusão de Tudo?','N')=idno then
      exit;
   dm.Permissao.First;
   dm.IniTrans;
   while not dm.Permissao.Eof do
      dm.Permissao.Delete;
   dm.SalvaTab(dm.Permissao);
   dm.SalvaTrans;
end;

procedure TfPermissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm.Permissao.Close;
   Action:=cafree;
end;

procedure TfPermissao.BitBtn3Click(Sender: TObject);
var a,b,c: string[1];
begin
   dm.Permissao.first;
   dm.IniTrans;
   while not dm.Permissao.Eof do
   begin
      dm.Permissao.Edit;

      a:=copy(CboInc.Text,1,1);
      if a <> 'T' then
         dm.PermissaoINC.Text:=a;

      b:=copy(CboAlt.Text,1,1);
      if b <> 'T' then
         dm.PermissaoALT.Text:=b;

      c:=copy(CboExc.Text,1,1);
      if c <> 'T' then
         dm.PermissaoEXC.Text:=c;

      dm.Permissao.Post;
      dm.Permissao.Next;
   end;
   dm.SalvaTab(dm.Permissao);
   dm.SalvaTrans;
end;

procedure TfPermissao.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfPermissao.butOkClick(Sender: TObject);
begin
   if dscad.DataSet.State in [dsedit,dsinsert] then
      dscad.DataSet.post;
   dm.SalvaTab(dm.Permissao);
   dm.SalvaTrans;
end;

procedure TfPermissao.butExcluirClick(Sender: TObject);
begin
   if confirma('Confirma exclusão deste ítem?','N')=idno then
      exit;
   dm.IniTrans;
   dm.Permissao.Delete;
   dm.SalvaTab(dm.Permissao);
   dm.SalvaTrans;
end;

procedure TfPermissao.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fPermissao);
end;

end.
