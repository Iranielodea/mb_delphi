unit uListaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, DateUtils,
  FMTBcd, DB, DBClient, Provider, SqlExpr, DBCtrls, Menus, uCargaII;

type
  TfListaVenda = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DataIni: TMaskEdit;
    Datafin: TMaskEdit;
    butOk: TBitBtn;
    Grade: TDBGrid;
    Panel2: TPanel;
    QLista: TSQLQuery;
    dspLista: TDataSetProvider;
    Lista: TClientDataSet;
    dsLista: TDataSource;
    ListaNOME_FOR: TStringField;
    ListaNOME_CLIENTE: TStringField;
    ListaNOME_CONTATO: TStringField;
    ListaSITUACAO: TStringField;
    ListaNUM_PEDIDO: TIntegerField;
    ListaID_CARGA: TIntegerField;
    ListaTOTAL_LIQUIDO: TFloatField;
    ListaTOTAL_VENDA: TFloatField;
    ListaTOTAL_QTDE: TFloatField;
    ListaNUM_CARGA: TIntegerField;
    ListaLETRA: TStringField;
    ListaPRECO_CUSTO: TFloatField;
    ListaPRECO_VENDA: TFloatField;
    ListaVALOR_LUCRO: TFloatField;
    ListaVALOR_FRETE: TFloatField;
    Label3: TLabel;
    ListaSOMA_CARGAS: TAggregateField;
    ListaSOMA_LUCRO: TAggregateField;
    ListaSOMA_FRETE: TAggregateField;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    ListaPED_ENCERRADO: TStringField;
    Label6: TLabel;
    P_MenuAux: TPopupMenu;
    CargaOk: TMenuItem;
    Parcelas: TMenuItem;
    ListaDATA: TSQLTimeStampField;
    ListaVALOR_CARREGA: TFloatField;
    VerPedido: TMenuItem;
    VerCarga: TMenuItem;
    FinanceiroOk: TMenuItem;
    ListaFINANCEIRO: TStringField;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Cod_For: TMaskEdit;
    NomeFor: TEdit;
    Cod_Cliente: TMaskEdit;
    NomeCli: TEdit;
    Cod_Contato: TMaskEdit;
    NomeContato: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label10: TLabel;
    Cod_Motorista: TMaskEdit;
    Nome_Motorista: TEdit;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Cod_Agencia: TMaskEdit;
    Nome_Agencia: TEdit;
    SpeedButton5: TSpeedButton;
    RSituacao: TRadioGroup;
    Obs: TMenuItem;
    VerCondicoes: TMenuItem;
    ListaCOD_CLIENTE: TIntegerField;
    Qcontas: TSQLDataSet;
    QcontasVALORPAGO: TFloatField;
    ListaC_VALORPAGO: TFloatField;
    QcontasNUM_CONTA: TStringField;
    ListaC_NUM_CONTA: TStringField;
    Label4: TLabel;
    QtdePedidos: TEdit;
    ListaCOMPLEMENTO: TStringField;
    Shape1: TShape;
    Label12: TLabel;
    Shape2: TShape;
    Label13: TLabel;
    Shape3: TShape;
    Label14: TLabel;
    Shape4: TShape;
    Label15: TLabel;
    Label16: TLabel;
    Num_Pedido: TMaskEdit;
    Label17: TLabel;
    NumCarga: TMaskEdit;
    QListaAux: TSQLQuery;
    chkCancelados: TCheckBox;
    ListaNOME_USINA: TStringField;
    Label18: TLabel;
    Cod_Usina: TEdit;
    Nome_Usina: TEdit;
    SpeedButton6: TSpeedButton;
    ListaFATOR_CONVERSAO_QTDE: TFloatField;
    ListaFATOR_CONVERSAO: TFMTBCDField;
    Label19: TLabel;
    edtQtdeKilos: TEdit;
    procedure butOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ParcelasClick(Sender: TObject);
    procedure CargaOkClick(Sender: TObject);
    procedure GradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure VerPedidoClick(Sender: TObject);
    procedure VerCargaClick(Sender: TObject);
    procedure FinanceiroOkClick(Sender: TObject);
    procedure NomeCliExit(Sender: TObject);
    procedure NomeForExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure NomeContatoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Nome_MotoristaExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Nome_AgenciaExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ObsClick(Sender: TObject);
    procedure VerCondicoesClick(Sender: TObject);
    procedure ListaCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Nome_UsinaExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaCliente(Tipo: String);
    procedure PesquisaFor(Tipo: String);
    procedure PesquisaUsina(Tipo: String);
    procedure PesquisaContato(Tipo: String);
    procedure MostraDados;
  public
    { Public declarations }
  end;

var
  fListaVenda: TfListaVenda;

implementation

uses UUtil, uDM, uParcelas, uPedido, uCarga, uCliente, uFornecedor,
  uDMRegra, uMotorista, uAgenciador, uObsLista;

{$R *.dfm}

procedure TfListaVenda.butOkClick(Sender: TObject);
begin
   MostraDados;
end;

procedure TfListaVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Lista.close;
   action:=cafree;
end;

procedure TfListaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfListaVenda.ParcelasClick(Sender: TObject);
var vpos: integer;
begin
   if (Lista.IsEmpty) or (ListaNUM_CARGA.IsNull) then
      exit;
   vpos:=Lista.RecNo;
   fParcelas:=TfParcelas.create(Self);
   fParcelas.ValorPedido.Text:=formatfloat(',#0.00',ListaVALOR_CARREGA.AsFloat);
   fParcelas.DataEmissao.Text:=ListaData.Text;
   fParcelas.editNumPedido.Text:=ListaNUM_PEDIDO.Text;
   fParcelas.editCarga.Text:='S';
   fParcelas.EditNumCarga.Text:=ListaID_CARGA.Text;
   fParcelas.showModal;
   fParcelas.free;
   butOkClick(self);
   if vpos > 0 then
      Lista.RecNo:=vpos;
   Grade.SetFocus;
end;

procedure TfListaVenda.CargaOkClick(Sender: TObject);
begin
{
   if Lista.IsEmpty then
      exit;
   Lista.Edit;
   if ListaSITUACAO.Text = 'A' then
   begin
      ListaSITUACAO.Text:='E';
      ExecutaSql('update CARGA set SITUACAO = ''E'' where ID_CARGA = '+ListaID_CARGA.Text);
   end
   else begin
      ListaSITUACAO.Text:='A';
      ExecutaSql('update CARGA set SITUACAO = ''A'' where ID_CARGA = '+ListaID_CARGA.Text);
   end;
   Lista.Post;
}
end;

procedure TfListaVenda.GradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

   if (ListaFINANCEIRO.Text = 'A') then
   begin
      Grade.Canvas.Font.Color:= clRed; // .Brush.Color := clGreen;
      Grade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   if ListaFINANCEIRO.Text = 'E' then
   begin
      Grade.Canvas.Font.Color:= clBlack; // .Brush.Color := clGreen;
      Grade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if ListaPED_ENCERRADO.Text = 'C' then
   begin
      Grade.Canvas.Font.Color:= clBlue; // .Brush.Color := clGreen;
      Grade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   if (ListaNUM_CARGA.Text = '') and (ListaPED_ENCERRADO.Text <> 'C') then
   begin
      Grade.Canvas.Font.Color:= clMaroon; // .Brush.Color := clGreen;
      Grade.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   {
   MudaCorGradeSel(Grade,Rect,DataCol,Column,State,
                Grade.Canvas.Brush.Color,
                Grade.Canvas.Font.Color,
                Grade.Canvas.Font.Style,'N');
   }

end;

procedure TfListaVenda.VerPedidoClick(Sender: TObject);
begin
   if Lista.IsEmpty then
      exit;
   fPedido:=TfPedido.create(self);
   fPedido.Num_Pedido.Text:=ListaNUM_PEDIDO.text;
   fPedido.Operacao.Text:='ALTERAR';
   fPedido.showModal;
   fPedido.free;

end;

procedure TfListaVenda.VerCargaClick(Sender: TObject);
begin
   if (Lista.IsEmpty) or (ListaNUM_CARGA.IsNull) then
      exit;

  if UpperCase(vgUsuario) = 'MARCOS' then
  begin
     fCargaII:=TfCargaII.create(self);
     fCargaII.EditId_Carga.Text:=ListaID_CARGA.text;
     fCargaII.showModal;
     fCargaII.free;
     Exit;
  end;

   fCarga:=TfCarga.create(self);
   fCarga.EditId_Carga.Text:=ListaID_CARGA.text;
   fCarga.showModal;
   fCarga.free;
end;

procedure TfListaVenda.FinanceiroOkClick(Sender: TObject);
begin
   if Lista.IsEmpty then
      exit;
   Lista.Edit;
   if ListaFINANCEIRO.Text = 'A' then
   begin
      ListaFINANCEIRO.Text:='E';
      ExecutaSql('update CARGA set FINANCEIRO = ''E'' where ID_CARGA = '+ListaID_CARGA.Text);
   end
   else begin
      ListaFINANCEIRO.Text:='A';
      ExecutaSql('update CARGA set FINANCEIRO = ''A'' where ID_CARGA = '+ListaID_CARGA.Text);
   end;
   Lista.Post;
end;

procedure TfListaVenda.PesquisaCliente(Tipo: String);
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

procedure TfListaVenda.PesquisaFor(Tipo: String);
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

procedure TfListaVenda.PesquisaUsina(Tipo: String);
var vreg: integer;
begin
   if (Cod_Usina.Modified = false) and (Nome_Usina.Modified = false) then exit;
   if ((Cod_Usina.Text = '') and (Tipo = 'C')) or ((Nome_Usina.Text = '') and (Tipo = 'D')) then
   begin
      Cod_Usina.Clear;
      Nome_Usina.Clear;
      Cod_Usina.Modified:=false;
      Nome_Usina.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where Cod_For = '+Cod_Usina.Text)
   else
      ComandoQSql('select Cod_For, NOME from FORNECEDOR where NOME like  '''+Nome_Usina.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Cod_Usina.Text:=dm.Qsql.Fields[0].Text;
      Nome_Usina.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fFornecedor:=TfFornecedor.create(Self);
      fFornecedor.TipoCad.Text:='P';
      if Tipo = 'D' then
         fFornecedor.EditNome.Text:=Nome_Usina.Text;
      if fFornecedor.ShowModal = mrOk then
      begin
         Cod_Usina.Text:=dm.FornecedorCOD_FOR.Text;
         Nome_Usina.Text:=dm.FornecedorNOME.Text;
      end
      else begin
         Cod_Usina.Clear;
         Nome_Usina.Clear;
      end;
      dm.Fornecedor.close;
      fFornecedor.Free;
   end;
   dm.Qsql.close;
   Cod_Usina.Modified:=false;
   Nome_Usina.Modified:=false;
end;

procedure TfListaVenda.NomeCliExit(Sender: TObject);
begin
   PesquisaCliente('D');
end;

procedure TfListaVenda.NomeForExit(Sender: TObject);
begin
   PesquisaFor('D');
end;

procedure TfListaVenda.SpeedButton1Click(Sender: TObject);
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

procedure TfListaVenda.SpeedButton2Click(Sender: TObject);
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

procedure TfListaVenda.PesquisaContato(Tipo: String);
var vreg: integer;
begin
   if (Cod_Contato.Modified = false) and (NomeContato.Modified = false) then exit;
   if ((Cod_Contato.Text = '') and (Tipo = 'C')) or ((NomeContato.Text = '') and (Tipo = 'D')) then
   begin
      Cod_Contato.Clear;
      NomeContato.Clear;
      Cod_Contato.Modified:=false;
      NomeContato.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select COD_CLIENTE, NOME from CLIENTE where COD_CLIENTE = '+Cod_Contato.Text)
   else
      ComandoQSql('select COD_CLIENTE, NOME from CLIENTE where NOME like  '''+NomeContato.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Cod_Contato.Text:=dm.Qsql.Fields[0].Text;
      NomeContato.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fCliente:=TfCliente.create(Self);
      fCliente.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCliente.EditNome.Text:=NomeContato.Text;
      if fCliente.ShowModal = mrOk then
      begin
         Cod_Contato.Text:=dm.ClienteCOD_CLIENTE.Text;
         NomeContato.Text:=dm.ClienteNOME.Text;
      end
      else begin
         Cod_Contato.Clear;
         NomeContato.Clear;
      end;
      dm.Cliente.close;
      fCliente.Free;
   end;
   dm.Qsql.close;
   Cod_Contato.Modified:=false;
   NomeContato.Modified:=false;
end;

procedure TfListaVenda.NomeContatoExit(Sender: TObject);
begin
   PesquisaContato('D');
end;

procedure TfListaVenda.SpeedButton3Click(Sender: TObject);
begin
   fCliente:=TfCliente.create(Self);
   fCliente.TipoCad.Text:='P';
   if fCliente.ShowModal = mrOk then
   begin
      Cod_Contato.Text:=dm.ClienteCOD_CLIENTE.Text;
      NomeContato.Text:=dm.ClienteNOME.Text;
      Cod_Contato.Modified:=false;
      NomeContato.Modified:=false;
   end;
   dm.Cliente.close;
   fCliente.Free;
end;

procedure TfListaVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfListaVenda.Nome_MotoristaExit(Sender: TObject);
begin
   if Nome_Motorista.Modified then
   begin
      dmRegra.PesquisaMotorista(Nome_Motorista.Text);
      COD_MOTORISTA.Text:=dm.MotoristaCOD_MOTORISTA.Text;
      NOME_MOTORISTA.Text:=dm.MotoristaNOME.Text;
      dm.Motorista.Close;
      fMotorista.Free;
      Nome_Motorista.Modified:=false;
   end;
end;

procedure TfListaVenda.SpeedButton4Click(Sender: TObject);
begin
   if dmRegra.PesquisaMotorista('') = true then
   begin
      COD_MOTORISTA.Text:=dm.MotoristaCOD_MOTORISTA.text;
      NOME_MOTORISTA.Text:=dm.MotoristaNOME.Text;
   end;
   dm.Motorista.Close;
   fMotorista.Free;
end;

procedure TfListaVenda.Nome_AgenciaExit(Sender: TObject);
begin
   if Nome_Agencia.Modified then
   begin
      dmRegra.PesquisaAgenciador(Nome_Agencia.Text);
      COD_AGENCIA.Text:=dm.AgenciadorCOD_AGENCIA.Text;
      NOME_AGENCIA.Text:=dm.AgenciadorNOME.Text;
      dm.Agenciador.Close;
      fAgenciador.Free;
      Nome_Agencia.Modified:=false;
   end;
end;

procedure TfListaVenda.SpeedButton5Click(Sender: TObject);
begin
   if dmRegra.PesquisaAgenciador('') = true then
   begin
      COD_AGENCIA.Text:=dm.AgenciadorCOD_AGENCIA.text;
      NOME_AGENCIA.Text:=dm.AgenciadorNOME.Text;
   end;
   dm.Agenciador.Close;
   fAgenciador.Free;
end;

procedure TfListaVenda.ObsClick(Sender: TObject);
var vlpos: integer;
begin
  if ListaID_CARGA.AsInteger = 0 then
  begin
     ShowMessage('Não existe carga!');
     exit;
  end;
   vlPos:=Lista.RecNo;
   fListaObs:=TfListaObs.create(self);
   fListaObs.Id.Text:=ListaID_CARGA.Text;
   fListaObs.showModal;
   fListaObs.free;
   butOkClick(self);
   if vlPos > 0 then
      Lista.RecNo:=vlPos;
   Grade.SetFocus;
end;

procedure TfListaVenda.VerCondicoesClick(Sender: TObject);
begin
   fParcelas:=TfParcelas.create(Self);
   fParcelas.ValorPedido.Text:=formatfloat(',#0.00',ListaTOTAL_LIQUIDO.AsFloat);
   fParcelas.DataEmissao.Text:=ListaDATA.Text;
   fParcelas.Cod_Cliente.Text:=ListaCOD_CLIENTE.Text;
   fParcelas.editNumPedido.Text:=ListaNUM_PEDIDO.Text;
   fParcelas.editCarga.Text:='N';
   fParcelas.showModal;
   fParcelas.free;
end;

procedure TfListaVenda.ListaCalcFields(DataSet: TDataSet);
begin
   if Lista.State = dsinternalCalc then
   begin
      Qcontas.Close;
      Qcontas.Params[0].Text:=ListaID_CARGA.Text;
      Qcontas.Open;
      ListaC_VALORPAGO.AsFloat:=QcontasVALORPAGO.asfloat;
      ListaC_NUM_CONTA.Text:=QcontasNUM_CONTA.Text;
      Qcontas.close;
   end;
end;

procedure TfListaVenda.MostraDados;
var
  vnumped: integer;
  vqtde: double;
  vqtdeConversao: Double;
begin
   if ValidaDatas(DataIni.Text,Datafin.Text) = false then
      Exit;

   Lista.Close;
   QLista.SQL.Clear;
   QLista.SQL.Text := QListaAux.SQL.Text;

   if (Trim(Num_Pedido.Text) <> '') or ( Trim(NumCarga.Text) <> '') then
   begin
     if Trim(Num_Pedido.Text) <> '' then
        QLista.SQL.Add(' where CAR.NUM_PEDIDO = ' + Num_Pedido.Text);

     if Trim(NumCarga.Text) <> '' then
        QLista.SQL.Add(' where CAR.NUM_CARGA = ' + NumCarga.Text);
   end
   else begin
     QLista.SQL.Add(' where PED.DATA between' + UUtil.DataIngles2(DATAINI.Text) + ' and ' + DataIngles2(DATAFIN.Text));

     if Trim(Cod_For.Text) <> '' then
        QLista.SQL.Add(' and PED.COD_FOR = ' + Cod_For.Text);

     if Trim(Cod_Usina.Text) <> '' then
        QLista.SQL.Add(' and PED.COD_USINA = ' + Cod_Usina.Text);

     if Trim(Cod_Cliente.Text) <> '' then
        QLista.SQL.Add(' and PED.COD_CLIENTE = ' + Cod_Cliente.Text);

     if Trim(Cod_Contato.Text) <> '' then
        QLista.SQL.Add(' and CAR.COD_CONTATO = ' + Cod_Contato.Text);

     if Trim(Cod_Agencia.Text) <> '' then
        QLista.SQL.Add(' and CAR.COD_AGENCIA = ' + Cod_Agencia.Text);

     if Trim(Cod_Motorista.Text) <> '' then
        QLista.SQL.Add(' and CAR.COD_MOTORISTA = ' + Cod_Motorista.Text);

     if chkCancelados.Checked = False then
        QLista.SQL.Add(' and PED.SITUACAO <> ''C''');


      QLista.SQL.Add(' order by PED.NUM_PEDIDO desc');
   end;

   Lista.Open;
   vqtde:=0;
   Lista.DisableControls;
   vnumped:=0;
   vqtdeConversao := 0;

   while not Lista.Eof do
   begin
      if ListaNUM_PEDIDO.AsInteger <> vnumped then
      begin
        if ListaFATOR_CONVERSAO.AsFloat > 1 then
          vqtdeConversao := vqtdeConversao + ListaFATOR_CONVERSAO_QTDE.AsFloat
        else
         vqtde:=vqtde + ListaTOTAL_QTDE.AsFloat;

         vnumped:=ListaNUM_PEDIDO.AsInteger;
      end;
      Lista.Next;
   end;

   Lista.First;
   Lista.EnableControls;
   QtdePedidos.Text:=formatfloat(',##0.00',vqtde);
   edtQtdeKilos.Text:=formatfloat(',##0.00',vqtdeConversao);

end;

procedure TfListaVenda.FormCreate(Sender: TObject);
begin
   DataIni.Text:=Inicio_Mes(datetoStr(Date));
   Datafin.Text:=Fim_Mes(datetoStr(Date));
   MostraDados;
end;

procedure TfListaVenda.Nome_UsinaExit(Sender: TObject);
begin
  PesquisaUsina('D');
end;

procedure TfListaVenda.SpeedButton6Click(Sender: TObject);
begin
   fFornecedor:=TfFornecedor.create(Self);
   fFornecedor.TipoCad.Text:='P';
   if fFornecedor.ShowModal = mrOk then
   begin
      Cod_Usina.Text:=dm.FornecedorCOD_FOR.Text;
      Nome_Usina.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.close;
   fFornecedor.Free;
   dm.Qsql.close;
   Cod_Usina.Modified:=false;
   Nome_Usina.Modified:=false;
end;

end.
