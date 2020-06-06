unit uPesqPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, Buttons, Grids, DBGrids, FMTBcd, DB,
  SqlExpr, Provider, DBClient;

type
  TfPesqPedido = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DataIni: TMaskEdit;
    Datafin: TMaskEdit;
    Label3: TLabel;
    Cod_Cliente: TMaskEdit;
    NomeCli: TEdit;
    Label4: TLabel;
    Cod_For: TMaskEdit;
    NomeFor: TEdit;
    R_Situacao: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    butPesq: TBitBtn;
    Grade: TDBGrid;
    Panel2: TPanel;
    butNovo: TSpeedButton;
    butAlterar: TSpeedButton;
    butExcluir: TSpeedButton;
    butSair: TSpeedButton;
    Pedido: TClientDataSet;
    dsPedido: TDataSource;
    dspPedido: TDataSetProvider;
    QPedido: TSQLQuery;
    QPedidoCOD_CLIENTE: TIntegerField;
    QPedidoCOD_EMPRESA: TIntegerField;
    QPedidoCOD_FOR: TIntegerField;
    QPedidoDATA: TSQLTimeStampField;
    QPedidoNUM_PEDIDO: TIntegerField;
    QPedidoSITUACAO: TStringField;
    QPedidoTOTAL_LIQUIDO: TFloatField;
    QPedidoNOME_CLI: TStringField;
    QPedidoNOME_FOR: TStringField;
    PedidoNUM_PEDIDO: TIntegerField;
    PedidoCOD_CLIENTE: TIntegerField;
    PedidoCOD_EMPRESA: TIntegerField;
    PedidoCOD_FOR: TIntegerField;
    PedidoDATA: TSQLTimeStampField;
    PedidoSITUACAO: TStringField;
    PedidoTOTAL_LIQUIDO: TFloatField;
    PedidoNOME_CLI: TStringField;
    PedidoNOME_FOR: TStringField;
    QAux: TSQLQuery;
    EditConsulta: TEdit;
    Label5: TLabel;
    Num_Pedido: TMaskEdit;
    lblFiltro: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cod_ClienteExit(Sender: TObject);
    procedure NomeCliExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Cod_ForExit(Sender: TObject);
    procedure NomeForExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butNovoClick(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure Num_PedidoEnter(Sender: TObject);
    procedure Num_PedidoExit(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GradeTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure PesquisaCliente(Tipo: String);
    procedure PesquisaFor(Tipo: String);
  public
    { Public declarations }
  end;

var
  fPesqPedido: TfPesqPedido;

implementation

uses uDM, UUtil, uCliente, uFornecedor, uPedido, uDMRegra;

{$R *.dfm}

procedure TfPesqPedido.FormCreate(Sender: TObject);
begin
   dataini.Text:=datetostr(date-7);
   datafin.Text:=datetostr(date);
end;

procedure TfPesqPedido.butPesqClick(Sender: TObject);
var vlSit: string[1];
begin
   if ValidaDatas(Dataini.Text,Datafin.Text) = false then
      exit;
   if R_Situacao.ItemIndex = 0 then vlSit:='A';
   if R_Situacao.ItemIndex = 1 then vlSit:='E';
   Pedido.Close;
   Qpedido.SQL.Clear;
   Qpedido.SQL.Text:=QAux.SQL.Text;
   Qpedido.SQL.Add(' where PED.COD_EMPRESA = '+vgCod_Empresa);
   if trim(Num_Pedido.Text) = '' then
      Qpedido.SQL.Add(' and PED.DATA between '+DataIngles2(Dataini.Text)+' and '+DataIngles2(Datafin.Text));
   if Cod_Cliente.Text <> '' then
      Qpedido.SQL.Add(' and PED.COD_CLIENTE = '+Cod_Cliente.Text);
   if Cod_For.Text <> '' then
      Qpedido.SQL.Add(' and PED.COD_FOR = '+Cod_For.Text);
   if (R_Situacao.ItemIndex = 0) or (R_Situacao.ItemIndex = 1) then
      Qpedido.SQL.Add(' and PED.SITUACAO = '''+vlSit+'''');
   if trim(Num_Pedido.Text) <> '' then
      Qpedido.SQL.Add(' and PED.NUM_PEDIDO = '+Num_Pedido.Text);
   Qpedido.SQL.Add(' order by PED.NUM_PEDIDO desc');
   Pedido.Open;
   Grade.SetFocus;
end;

procedure TfPesqPedido.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fPesqPedido);
   butPesqClick(self);
end;

procedure TfPesqPedido.PesquisaCliente(Tipo: String);
var vreg: integer;
begin
   if (Cod_Cliente.Modified = false) and (NomeCli.Modified = false) then exit;
   if ((Cod_Cliente.Text = '') and (Tipo = 'C')) or ((NomeCli.Text = '') and (Tipo = 'D')) then
   begin
      Cod_Cliente.Clear;
      NomeCli.Clear;
      Cod_Cliente.Modified:=false;
      NomeCli.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select COD_CLIENTE, NOME from CLIENTE where COD_CLIENTE = '+Cod_Cliente.Text)
   else
      ComandoQSql('select COD_CLIENTE, NOME from CLIENTE where NOME like  '''+NomeCli.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Cod_Cliente.Text:=dm.Qsql.Fields[0].Text;
      NomeCli.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fCliente:=TfCliente.create(Self);
      fCliente.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCliente.EditNome.Text:=NomeCli.Text;
      if fCliente.ShowModal = mrOk then
      begin
         Cod_Cliente.Text:=dm.ClienteCOD_CLIENTE.Text;
         NomeCli.Text:=dm.ClienteNOME.Text;
      end
      else begin
         Cod_Cliente.Clear;
         NomeCli.Clear;
      end;
      dm.Cliente.close;
      fCliente.Free;
   end;
   dm.Qsql.close;
   Cod_Cliente.Modified:=false;
   NomeCli.Modified:=false;
end;

procedure TfPesqPedido.Cod_ClienteExit(Sender: TObject);
begin
   PesquisaCliente('C');
end;

procedure TfPesqPedido.NomeCliExit(Sender: TObject);
begin
   PesquisaCliente('D');
end;

procedure TfPesqPedido.SpeedButton1Click(Sender: TObject);
begin
   fCliente:=TfCliente.create(Self);
   fCliente.TipoCad.Text:='P';
   if fCliente.ShowModal = mrOk then
   begin
      Cod_Cliente.Text:=dm.ClienteCOD_CLIENTE.Text;
      NomeCli.Text:=dm.ClienteNOME.Text;
      Cod_Cliente.Modified:=false;
      NomeCli.Modified:=false;
   end;
   dm.Cliente.close;
   fCliente.Free;
end;

procedure TfPesqPedido.PesquisaFor(Tipo: String);
var vreg: integer;
begin
   if (Cod_For.Modified = false) and (NomeFor.Modified = false) then exit;
   if ((Cod_For.Text = '') and (Tipo = 'C')) or ((NomeFor.Text = '') and (Tipo = 'D')) then
   begin
      Cod_For.Clear;
      NomeFor.Clear;
      Cod_For.Modified:=false;
      NomeFor.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where Cod_For = '+Cod_For.Text)
   else
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where NOME like  '''+NomeFor.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Cod_For.Text:=dm.Qsql.Fields[0].Text;
      NomeFor.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fFornecedor:=TfFornecedor.create(Self);
      fFornecedor.TipoCad.Text:='P';
      if Tipo = 'D' then
         fFornecedor.EditNome.Text:=NomeFor.Text;
      if fFornecedor.ShowModal = mrOk then
      begin
         Cod_For.Text:=dm.FornecedorCOD_FOR.Text;
         NomeFor.Text:=dm.FornecedorNOME.Text;
      end
      else begin
         Cod_For.Clear;
         NomeFor.Clear;
      end;
      dm.Fornecedor.close;
      fFornecedor.Free;
   end;
   dm.Qsql.close;
   Cod_For.Modified:=false;
   NomeFor.Modified:=false;
end;

procedure TfPesqPedido.Cod_ForExit(Sender: TObject);
begin
   PesquisaFor('C');
end;

procedure TfPesqPedido.NomeForExit(Sender: TObject);
begin
   PesquisaFor('D');
end;

procedure TfPesqPedido.SpeedButton2Click(Sender: TObject);
begin
   fFornecedor:=TfFornecedor.create(Self);
   fFornecedor.TipoCad.Text:='P';
   if fFornecedor.ShowModal = mrOk then
   begin
      Cod_For.Text:=dm.FornecedorCOD_FOR.Text;
      NomeFor.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.close;
   fFornecedor.Free;
   dm.Qsql.close;
   Cod_For.Modified:=false;
   NomeFor.Modified:=false;
end;

procedure TfPesqPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfPesqPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_F1: DataIni.SetFocus;
      vk_F2: butNovoClick(self);
      vk_F3: butAlterarClick(self);
      vk_F4: butExcluirClick(self);
      vk_F5: butPesqClick(self);
      vk_Escape: close;
   end;
end;

procedure TfPesqPedido.butNovoClick(Sender: TObject);
begin
   if dm.permite(vgUsuario,'I','PEDIDO') = false then
      exit;
   fPedido:=TfPedido.create(self);
   fPedido.Operacao.Text:='INCLUIR';
   fPedido.ShowModal;
   fPedido.free;
   butPesqClick(self);
end;

procedure TfPesqPedido.butAlterarClick(Sender: TObject);
var vlReg: integer;
begin
   if Pedido.IsEmpty then exit;
   vlReg:=Pedido.RecNo;
   fPedido:=TfPedido.create(self);
   fPedido.Num_Pedido.Text:=PedidoNUM_PEDIDO.Text;
   fPedido.Operacao.Text:='ALTERAR';
   fPedido.showModal;
   fPedido.free;
   butPesqClick(Self);
   Pedido.RecNo:=vlReg;
   Grade.SetFocus;
end;

procedure TfPesqPedido.GradeDblClick(Sender: TObject);
begin
   if EditConsulta.Text = '' then
      butAlterarClick(self)
   else begin
      close;
      ModalResult:=mrOk;
   end;
end;

procedure TfPesqPedido.butExcluirClick(Sender: TObject);
begin
   if Pedido.IsEmpty then exit;
   if dm.permite(vgUsuario,'E','PEDIDO') = false then  exit;
   if Confirma('Confirma Exclusão deste Pedido?','N')=idno then  exit;
   if dmRegra.Excluir_Pedido(PedidoNUM_PEDIDO.Text) = true then
   begin
      dm.SalvaTrans;
      Pedido.Delete;
   end;
end;

procedure TfPesqPedido.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfPesqPedido.Num_PedidoEnter(Sender: TObject);
begin
   Num_Pedido.Modified:=false;
end;

procedure TfPesqPedido.Num_PedidoExit(Sender: TObject);
begin
   if trim(Num_Pedido.Text) = '' then exit;
   if Num_Pedido.Modified then
      butPesqClick(self);
end;

procedure TfPesqPedido.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
      GradeDblClick(self);
end;

procedure TfPesqPedido.GradeTitleClick(Column: TColumn);
begin
   Pedido.IndexFieldNames:=Column.FieldName;
end;

end.
