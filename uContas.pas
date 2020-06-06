unit uContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, Buttons, DB, DBClient, Provider, SqlExpr,
  Grids, DBGrids, Mask, ExtCtrls, DBCtrls;

type
  TfContas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Cod_Cliente: TMaskEdit;
    NomeCli: TEdit;
    Grade: TDBGrid;
    QContas: TSQLQuery;
    QContasID_CONTA: TIntegerField;
    QContasDOCUMENTO: TStringField;
    QContasDATA_EMISSAO: TSQLTimeStampField;
    QContasDIAS: TIntegerField;
    QContasDATA_VENCTO: TSQLTimeStampField;
    QContasVALOR_PAGAR: TFloatField;
    QContasDATA_PAGO: TSQLTimeStampField;
    QContasCOD_PAGTO: TIntegerField;
    QContasVALOR_PAGO: TFloatField;
    QContasSITUACAO: TStringField;
    QContasDESC_PAGTO: TStringField;
    dspContas: TDataSetProvider;
    Contas: TClientDataSet;
    ContasDOCUMENTO: TStringField;
    ContasDATA_EMISSAO: TSQLTimeStampField;
    ContasDIAS: TIntegerField;
    ContasDATA_VENCTO: TSQLTimeStampField;
    ContasVALOR_PAGAR: TFloatField;
    ContasDATA_PAGO: TSQLTimeStampField;
    ContasID_CONTA: TIntegerField;
    ContasCOD_PAGTO: TIntegerField;
    ContasVALOR_PAGO: TFloatField;
    ContasSITUACAO: TStringField;
    ContasDESC_PAGTO: TStringField;
    ContasC_VALORTOTAL: TAggregateField;
    ContasC_NUMPARCELA: TAggregateField;
    dsCad: TDataSource;
    Panel2: TPanel;
    butExcluir: TSpeedButton;
    butSair: TSpeedButton;
    butAlterar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ContasC_TOTAL_RECEBER: TAggregateField;
    ContasC_TOTAL_PAGO: TAggregateField;
    ContasC_SALDO: TAggregateField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    SpeedButton1: TSpeedButton;
    QContasNUM_PEDIDO: TIntegerField;
    ContasNUM_PEDIDO: TIntegerField;
    Label5: TLabel;
    NumDoc: TEdit;
    QAux: TSQLQuery;
    QDoc: TSQLQuery;
    QDocDOCUMENTO: TStringField;
    QDocCOD_CLIENTE: TIntegerField;
    QDocNOME: TStringField;
    butNovo: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Cod_ClienteExit(Sender: TObject);
    procedure NomeCliExit(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GradeDblClick(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NumDocEnter(Sender: TObject);
    procedure NumDocExit(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaCliente(Tipo: String);
    procedure MostraContas;
  public
    { Public declarations }
  end;

var
  fContas: TfContas;

implementation

uses uDM, uCliente, UUtil, uBaixaConta, UPesqDoc, uDMRegra, uNovaConta;

{$R *.dfm}

procedure TfContas.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fContas);
end;

procedure TfContas.PesquisaCliente(Tipo: String);
var vreg: integer;
begin
   if (Cod_Cliente.Modified = false) and (NomeCli.Modified = false) then exit;
   if ((Cod_Cliente.Text = '') and (Tipo = 'C')) or ((NomeCli.Text = '') and (Tipo = 'D')) then
   begin
      Cod_Cliente.Clear;
      NomeCli.Clear;
      Cod_Cliente.Modified:=false;
      NomeCli.Modified:=false;
      Contas.Close;
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
      MostraContas;
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
         MostraContas;
      end
      else begin
         Cod_Cliente.Clear;
         NomeCli.Clear;
         Contas.Close;
      end;
      dm.Cliente.close;
      fCliente.Free;
   end;
   dm.Qsql.close;
   Cod_Cliente.Modified:=false;
   NomeCli.Modified:=false;
end;

procedure TfContas.SpeedButton1Click(Sender: TObject);
begin
   fCliente:=TfCliente.create(Self);
   fCliente.TipoCad.Text:='P';
   if fCliente.ShowModal = mrOk then
   begin
      Cod_Cliente.Text:=dm.ClienteCOD_CLIENTE.Text;
      NomeCli.Text:=dm.ClienteNOME.Text;
      MostraContas;
      Cod_Cliente.Modified:=false;
      NomeCli.Modified:=false;
   end;
   dm.Cliente.close;
   fCliente.Free;
end;

procedure TfContas.Cod_ClienteExit(Sender: TObject);
begin
   PesquisaCliente('C');
end;

procedure TfContas.NomeCliExit(Sender: TObject);
begin
   PesquisaCliente('D');
end;

procedure TfContas.MostraContas;
begin
   Contas.close;
   QContas.SQL.Text:=QAux.SQL.Text;
   QContas.SQL.Add(' where CON.COD_EMPRESA > 0');
   if Cod_Cliente.Text <> '' then
      QContas.SQL.Add(' and CON.COD_CLIENTE = '+COD_CLIENTE.Text);
   if NumDoc.Text <> '' then
      QContas.SQL.Add(' and CON.DOCUMENTO = '''+NumDoc.Text+'''');
   QContas.SQL.Add(' and CON.TIPO_CONTA = 2');
   QContas.SQL.Add(' order by CON.SITUACAO, CON.DATA_PAGO desc, CON.DATA_VENCTO');
   contas.Open;
   Grade.SetFocus;
end;

procedure TfContas.butAlterarClick(Sender: TObject);
begin
   if contas.Active = false then exit;
   if contas.IsEmpty then exit;
   fBaixaConta:=TfBaixaConta.create(self);
   fBaixaConta.id_Conta.Text:=ContasID_CONTA.Text;
   fBaixaConta.showModal;
   fBaixaConta.free;
   MostraContas;
end;

procedure TfContas.butExcluirClick(Sender: TObject);
begin
   if contas.Active = false then exit;
   if contas.IsEmpty then exit;
   if ContasNUM_PEDIDO.AsInteger > 0 then
   begin
      showmessage('Parcela faz parte do pedido '+ContasNUM_PEDIDO.Text+' não será possível excluir'+#10
         +' Entre o Pedido para excluir');
      exit;
   end;
   if confirma('Confirma Exclusão desta Parcela ?','N')=idno then
      exit;
   dm.IniTrans;
   dm.Get_Contas(ContasID_CONTA.Text);
   dmRegra.ExcluirParcela(ContasID_CONTA.Text);
   Contas.Delete;
   dm.SalvaTab(dm.Contas);
   dm.SalvaTrans;
   MostraContas;
end;

procedure TfContas.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_F2: butNovoClick(self);
      vk_F3: butAlterarClick(self);
      vk_F4: butExcluirClick(self);
      vk_Escape: begin
                     if NomeCli.Focused then
                        close
                     else
                        NomeCli.SetFocus;
                 end;
   end;
end;

procedure TfContas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   contas.Close;
   action:=cafree;
end;

procedure TfContas.GradeDblClick(Sender: TObject);
var vpos: integer;
begin
   vpos:=Contas.RecNo;
   butAlterarClick(Self);
   if vpos > 0 then
      Contas.RecNo:=vpos;
   Grade.SetFocus;
end;

procedure TfContas.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
      GradeDblClick(self);
end;

procedure TfContas.NumDocEnter(Sender: TObject);
begin
   NumDoc.Modified:=false;   
end;

procedure TfContas.NumDocExit(Sender: TObject);
var vconta: integer;
begin
   if NumDoc.Modified then
   begin
      if trim(NumDoc.Text) = '' then
      begin
         NumDoc.Clear;
         exit;
      end;

      QDoc.Close;
      QDoc.Params[0].Text:=NumDoc.Text;
      Qdoc.Open;
      vConta:=Conta_Registros3(Qdoc);
      if vconta = 0 then
      begin
         Qdoc.Close;
         Contas.Close;
         Cod_Cliente.Clear;
         NomeCli.Clear;
         NumDoc.Clear;
         mensagem('Documento não Encontrado');
         exit;
      end;
      if vconta = 1 then
      begin
         Cod_Cliente.Text:=QDocCOD_CLIENTE.Text;
         NomeCli.Text:=QDocNOME.Text;
         MostraContas;
      end;
      Qdoc.Close;
      if vconta > 1 then
      begin
         fPesqDoc:=TfPesqDoc.create(self);
         fPesqDoc.NumDoc.Text:=NumDoc.Text;
         fPesqDoc.Tipo_Conta.Text:='2';
         if fPesqDoc.ShowModal = mrOk then
         begin
            Cod_Cliente.Text:=fPesqDoc.PesqCOD_CLIENTE.Text;
            NomeCli.Text:=fPesqDoc.PesqNOME.Text;
            NumDoc.Text:=fPesqDoc.PesqDOCUMENTO.Text;
            MostraContas;
         end;
         fPesqDoc.Pesq.Close;
         fPesqDoc.Free;
      end;
   end;
end;

procedure TfContas.butNovoClick(Sender: TObject);
begin
   if contas.Active = false then exit;
   if Cod_Cliente.Text = '' then
   begin
      mensagem('Informe o Contato');
      Cod_Cliente.SetFocus;
      exit;
   end;
   fNovaConta:=TfNovaConta.create(self);
   fNovaConta.Cod_Pessoa.Text:=Cod_Cliente.Text;
   fNovaConta.Tipo.Text:='R';
   fNovaConta.showModal;
   fNovaConta.free;
   MostraContas;
end;

end.
