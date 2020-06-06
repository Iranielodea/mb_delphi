unit uPesqCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, Grids, DBGrids, ExtCtrls, FMTBcd,
  SqlExpr, DB, DBClient, Provider, Menus;

type
  TfPesqCarga = class(TForm)
    Panel2: TPanel;
    butNovo: TSpeedButton;
    butAlterar: TSpeedButton;
    butExcluir: TSpeedButton;
    butSair: TSpeedButton;
    lblFiltro: TLabel;
    Panel1: TPanel;
    Grade: TDBGrid;
    Qcarga: TSQLQuery;
    SQLDataSet1: TSQLDataSet;
    QAux: TSQLQuery;
    dspCarga: TDataSetProvider;
    Carga: TClientDataSet;
    dsCarga: TDataSource;
    CargaDATA: TSQLTimeStampField;
    CargaLETRA: TStringField;
    CargaNUM_CARGA: TIntegerField;
    CargaID_CARGA: TIntegerField;
    CargaQTDE: TFloatField;
    CargaVALOR_FRETE: TFloatField;
    CargaQTDE_PEDIDO: TFloatField;
    CargaVALOR_PEDIDO: TFloatField;
    CargaNOME: TStringField;
    CargaNUM_PEDIDO: TIntegerField;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DataIni: TMaskEdit;
    DataFin: TMaskEdit;
    Cod_For: TMaskEdit;
    Nome_For: TEdit;
    Cod_Cliente: TMaskEdit;
    Nome_Cliente: TEdit;
    Num_Carga: TMaskEdit;
    butPesq: TBitBtn;
    Menu_Auxiliar: TPopupMenu;
    VerPedido1: TMenuItem;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butPesqClick(Sender: TObject);
    procedure Nome_ForExit(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Nome_ClienteExit(Sender: TObject);
    procedure GradeTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GradeDblClick(Sender: TObject);
    procedure VerPedido1Click(Sender: TObject);
    procedure Num_CargaExit(Sender: TObject);
  private
    { Private declarations }
    procedure ControleMetodo(mensgem: string);
  public
    { Public declarations }
  end;

var
  fPesqCarga: TfPesqCarga;

implementation

uses uDMRegra, uDM, uFornecedor, UUtil, uCliente, uCarga, uPedido;

{$R *.dfm}

procedure TfPesqCarga.FormCreate(Sender: TObject);
begin
   dataini.Text:=datetostr(date-7);
   datafin.Text:=datetostr(date);
   butPesqClick(self);
end;

procedure TfPesqCarga.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfPesqCarga.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfPesqCarga.butPesqClick(Sender: TObject);
begin
   if ValidaDatas(Dataini.Text,Datafin.Text) = false then
      exit;
   Carga.close;
   Qcarga.SQL.Text:=QAux.SQL.Text;
   Qcarga.SQL.Add(' where CAR.COD_EMPRESA = '+vgCod_Empresa);
   Qcarga.SQL.Add(' and CAR.DATA between '+DataIngles2(Dataini.Text)+' and '+DataIngles2(Datafin.Text));
   if Cod_For.Text <> '' then
      Qcarga.SQL.Add(' and CAR.COD_FOR = '+Cod_For.Text);
   if Cod_Cliente.Text <> '' then
      Qcarga.SQL.Add(' and CAR.COD_CLIENTE = '+Cod_Cliente.Text);
   if Num_Carga.Text <> '' then
      Qcarga.SQL.Add(' and CAR.NUM_CARGA = '+Num_Carga.Text);
   Qcarga.SQL.Add(' order by CAR.NUM_PEDIDO DESC, CAR.NUM_CARGA');
   Carga.Open;
end;

procedure TfPesqCarga.Nome_ForExit(Sender: TObject);
begin
   if Nome_For.Modified then
   begin
      dmRegra.PesquisaFornecedor(Nome_For.Text);
      Cod_For.Text:=dm.FornecedorCOD_FOR.text;
      Nome_For.text:=dm.FornecedorNOME.text;
      dm.Fornecedor.Close;
      fFornecedor.Free;
      Nome_For.Modified:=false;
   end;
end;

procedure TfPesqCarga.butNovoClick(Sender: TObject);
begin
  ControleMetodo('Novo');
   fCarga:=TfCarga.create(self);
   fCarga.showModal;
   fCarga.free;
   butPesqClick(self);
end;

procedure TfPesqCarga.butAlterarClick(Sender: TObject);
var vlPos: Integer;
begin
   if Carga.IsEmpty then exit;
   vlPos:=Carga.RecNo;
   fCarga:=TfCarga.create(self);
   fCarga.EditId_Carga.Text:=CargaID_CARGA.Text;
   fCarga.showModal;
   fCarga.free;
   butPesqClick(self);
   Grade.SetFocus;
   if not Carga.IsEmpty then
      Carga.RecNo:=vlPos;
end;

procedure TfPesqCarga.butExcluirClick(Sender: TObject);
begin
   if Carga.IsEmpty then exit;
   if dm.permite(vgUsuario,'E','CARGA') = false then  exit;
   if Confirma('Confirma Exclus�o desta Carga?','N')=idno then  exit;
   dmRegra.Excluir_Carga(CargaID_CARGA.Text);
   dm.SalvaTrans;
   Carga.Delete;
end;

procedure TfPesqCarga.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfPesqCarga.ControleMetodo(mensgem: string);
begin
  Exit;
  if vgUsuario = 'SUPERVISOR' then
  begin
    ShowMessage(mensgem);
  end;
end;

procedure TfPesqCarga.SpeedButton1Click(Sender: TObject);
begin
   if dmRegra.PesquisaFornecedor('') = true then
   begin
      Cod_For.Text:=dm.FornecedorCOD_FOR.text;
      Nome_For.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.Close;
   fFornecedor.Free;
end;

procedure TfPesqCarga.SpeedButton2Click(Sender: TObject);
begin
   if dmRegra.PesquisaCliente('') = true then
   begin
      Cod_Cliente.Text:=dm.ClienteCOD_CLIENTE.text;
      Nome_Cliente.Text:=dm.ClienteNOME.Text;
   end;
   dm.Cliente.Close;
   fCliente.Free;
end;

procedure TfPesqCarga.Nome_ClienteExit(Sender: TObject);
begin
   if Nome_Cliente.Modified then
   begin
      dmRegra.PesquisaCliente(Nome_Cliente.Text);
      Cod_Cliente.Text:=dm.ClienteCOD_CLIENTE.text;
      Nome_Cliente.text:=dm.ClienteNOME.text;
      dm.Cliente.Close;
      fCliente.Free;
      Nome_Cliente.Modified:=false;
   end;
end;

procedure TfPesqCarga.GradeTitleClick(Column: TColumn);
begin
   Carga.IndexFieldNames:=Column.FieldName;
end;

procedure TfPesqCarga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Carga.close;
end;

procedure TfPesqCarga.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fPesqCarga);
end;

procedure TfPesqCarga.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
      butAlterarClick(self);   
end;

procedure TfPesqCarga.GradeDblClick(Sender: TObject);
begin
   butAlterarClick(self);
end;

procedure TfPesqCarga.VerPedido1Click(Sender: TObject);
begin
   if Carga.IsEmpty then
      exit;
   fPedido:=TfPedido.create(self);
   fPedido.Num_Pedido.Text:=CargaNUM_PEDIDO.text;
   fPedido.Operacao.Text:='ALTERAR';
   fPedido.showModal;
   fPedido.free;
end;

procedure TfPesqCarga.Num_CargaExit(Sender: TObject);
begin
   if Num_Carga.Text <> '' then
      butPesqClick(self);
end;

end.
