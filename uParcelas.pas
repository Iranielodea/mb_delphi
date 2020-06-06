unit uParcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, DB,
  FMTBcd, Provider, SqlExpr, DBClient;

type
  TfParcelas = class(TForm)
    Grade: TDBGrid;
    Panel1: TPanel;
    butExcluir: TSpeedButton;
    butSair: TSpeedButton;
    dsCad: TDataSource;
    NumParc: TDBEdit;
    Contas: TClientDataSet;
    QContas: TSQLQuery;
    dspContas: TDataSetProvider;
    QContasDOCUMENTO: TStringField;
    QContasDATA_EMISSAO: TSQLTimeStampField;
    QContasDIAS: TIntegerField;
    QContasDATA_VENCTO: TSQLTimeStampField;
    QContasVALOR_PAGAR: TFloatField;
    QContasDATA_PAGO: TSQLTimeStampField;
    QContasID_CONTA: TIntegerField;
    ContasC_VALORTOTAL: TAggregateField;
    ContasC_NUMPARCELA: TAggregateField;
    QContasCOD_PAGTO: TIntegerField;
    ContasDOCUMENTO: TStringField;
    ContasDATA_EMISSAO: TSQLTimeStampField;
    ContasDIAS: TIntegerField;
    ContasDATA_VENCTO: TSQLTimeStampField;
    ContasVALOR_PAGAR: TFloatField;
    ContasDATA_PAGO: TSQLTimeStampField;
    ContasID_CONTA: TIntegerField;
    ContasCOD_PAGTO: TIntegerField;
    QContasVALOR_PAGO: TFloatField;
    QContasSITUACAO: TStringField;
    ContasVALOR_PAGO: TFloatField;
    ContasSITUACAO: TStringField;
    butAlterar: TBitBtn;
    QContasDESC_PAGTO: TStringField;
    ContasDESC_PAGTO: TStringField;
    P_Pedido: TPanel;
    Label1: TLabel;
    DataEmissao: TMaskEdit;
    Label7: TLabel;
    ValorPedido: TEdit;
    Label2: TLabel;
    EditDias: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    DataVenc: TMaskEdit;
    ValorPagar: TEdit;
    Cod_Pagto: TMaskEdit;
    Desc_Pagto: TEdit;
    butOk: TBitBtn;
    editCarga: TEdit;
    editNumPedido: TEdit;
    QPContas: TSQLQuery;
    QPContasID_CONTA: TIntegerField;
    QPContasNUM_PEDIDO: TIntegerField;
    QPContasCOD_CLIENTE: TIntegerField;
    QPContasCOD_FOR: TIntegerField;
    QPContasCOD_EMPRESA: TIntegerField;
    QPContasDATA_EMISSAO: TSQLTimeStampField;
    QPContasVALOR_PAGAR: TFloatField;
    QPContasDATA_VENCTO: TSQLTimeStampField;
    QPContasDIAS: TIntegerField;
    QPContasDATA_PAGO: TSQLTimeStampField;
    QPContasVALOR_PAGO: TFloatField;
    QPContasSEQ_CONTA: TIntegerField;
    QPContasVALOR_ORIGINAL: TFloatField;
    QPContasTIPO_CONTA: TIntegerField;
    QPContasSITUACAO: TStringField;
    QPContasDOCUMENTO: TStringField;
    QPContasUSU_INC: TStringField;
    QPContasUSU_ALT: TStringField;
    QPContasCOD_PAGTO: TIntegerField;
    QPContasCOD_CONDICAO: TIntegerField;
    EditNumCarga: TEdit;
    P_Total: TPanel;
    Label6: TLabel;
    EditTotal: TDBEdit;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    ContasC_VALORPAGO: TAggregateField;
    ContasC_SALDO: TAggregateField;
    Cod_Cliente: TEdit;
    procedure butSairClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Desc_PagtoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditDiasExit(Sender: TObject);
    procedure DataVencExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ValorPagarExit(Sender: TObject);
    procedure Cod_PagtoExit(Sender: TObject);
    procedure GradeCellClick(Column: TColumn);
    procedure GradeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaPagto(Tipo: String);
    procedure MostraContas;

    procedure Monta_Contas_Carga;
    procedure Saldo;

  public
    { Public declarations }
    procedure PesquisaContas;
  end;

var
  fParcelas: TfParcelas;

implementation

uses UUtil, uDM, uForma_Pagto, uBaixaConta, uDMRegra;

{$R *.dfm}

procedure TfParcelas.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfParcelas.butOkClick(Sender: TObject);
var vlparc: string;
begin
   if ValidaDatas(DataEmissao.Text,DataVenc.Text) = false then
      exit;
   if trim(editDias.Text) = '' then
   begin
      Mensagem('Informe os Dias');
      EditDias.SetFocus;
      exit;
   end;

   if trim(copy(DataVenc.Text,1,1)) = '' then
   begin
      Mensagem('Informe a Data do Vencimento');
      DataVenc.SetFocus;
      exit;
   end;

   if preparaextenso(ValorPagar.Text) = 0 then
   begin
      Mensagem('Informe o Valor');
      ValorPagar.SetFocus;
      exit;
   end;
   if Contas.Locate('DIAS',editdias.text,[]) then
   begin
      dm.Get_Contas(ContasID_CONTA.Text);
      dm.Contas.Edit;
   end
   else begin
      if NumParc.Text = '' then
         vlParc:='1'
      else
         vlParc:=inttostr(strtoint(NumParc.Text)+1);
      dm.Get_Contas('0');
      dm.Contas.Append;
      dm.ContasNUM_PEDIDO.Text:=dm.PedidoNUM_PEDIDO.Text;
      dm.ContasDOCUMENTO.Text:=dm.PedidoNUM_PEDIDO.Text+'-'+vlParc;
      dm.ContasSEQ_CONTA.AsInteger:=DM.Incrementa('CONTAS','0');
      dm.ContasSITUACAO.Text:='A';
   end;
   dm.ContasCOD_CLIENTE.Text:=dm.PedidoCOD_CLIENTE.Text;
   dm.ContasCOD_PAGTO.Text:=Cod_Pagto.Text;
   dm.ContasDATA_EMISSAO.Text:=DataEmissao.Text;
   dm.ContasDATA_VENCTO.Text:=DataVenc.Text;
   dm.ContasDIAS.Text:=EditDias.Text;
   dm.ContasTIPO_CONTA.AsInteger:=1;
   dm.ContasVALOR_ORIGINAL.AsFloat:=preparaextenso(ValorPagar.Text);
   dm.ContasVALOR_PAGAR.AsFloat:=preparaextenso(ValorPagar.Text);
   dm.ContasVALOR_PAGO.AsFloat:=0;
   dm.Contas.Post;
   dm.SalvaTab(dm.Contas);
   dm.SalvaTrans;

   PesquisaContas;
   Saldo;
   EditDias.SetFocus;
end;

procedure TfParcelas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfParcelas.FormShow(Sender: TObject);
begin
{
   editCarga = S-sim - N-Nao
}
   dm.Tamanho_Form(fParcelas);
   PesquisaContas;

   if editCarga.Text = 'N' then
      MostraContas;
   if editCarga.Text = 'S' then
   begin
      P_Pedido.Visible:=false;
      Monta_Contas_Carga;
   end
   else begin
      if Contas.IsEmpty then
      begin
         dmRegra.ComandoSql
         (
            'select CLI.COD_PAGTO, FO.DESC_PAGTO from CLIENTE CLI'
            +' left join FORMA_PAGTO FO on CLI.COD_PAGTO = FO.COD_PAGTO'
            +' where CLI.COD_CLIENTE = '+Cod_Cliente.text
         );
         Cod_Pagto.Text:=dm.Qsql.fieldbyname('COD_PAGTO').text;
         Desc_Pagto.Text:=dm.Qsql.fieldbyname('DESC_PAGTO').text;
         dm.Qsql.Close;
         ValorPagar.Text:=ValorPedido.Text;
      end;
   end;
   PesquisaContas;
end;

procedure TfParcelas.PesquisaPagto(Tipo: String);
var vreg: integer;
begin
   if (Cod_Pagto.Modified = false) and (Desc_Pagto.Modified = false) then
      exit;
   if ((Cod_Pagto.Text = '') and (Tipo = 'C')) or ((Desc_Pagto.Text = '') and (Tipo = 'D')) then
   begin
      COD_PAGTO.Clear;
      DESC_PAGTO.Clear;
      Cod_Pagto.Modified:=false;
      Desc_Pagto.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select COD_PAGTO, DESC_PAGTO from FORMA_PAGTO where COD_PAGTO = '+Cod_Pagto.Text)
   else
      ComandoQSql('select COD_PAGTO, DESC_PAGTO from FORMA_PAGTO where DESC_PAGTO like '''+Desc_Pagto.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      COD_PAGTO.Text:=dm.Qsql.Fields[0].Text;
      DESC_PAGTO.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fForma_Pagto:=TfForma_Pagto.create(Self);
      fForma_Pagto.TipoCad.Text:='P';
      if Tipo = 'D' then
         fForma_Pagto.EditNome.Text:=Desc_Pagto.Text;
      if fForma_Pagto.ShowModal = mrOk then
      begin
         COD_PAGTO.Text:=dm.Forma_PagtoCOD_PAGTO.text;
         DESC_PAGTO.Text:=dm.Forma_PagtoDESC_PAGTO.Text;
      end
      else begin
         COD_PAGTO.Clear;
         DESC_PAGTO.Clear;
      end;
      dm.Forma_Pagto.Close;
      fForma_Pagto.Free;
   end;
   dm.Qsql.close;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfParcelas.Desc_PagtoExit(Sender: TObject);
begin
   PesquisaPagto('D');
end;

procedure TfParcelas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if EditTotal.Text <> '' then
   begin
      if ValorPedido.Text <> EditTotal.Text then
      begin
         if confirma('Valor do Pedido diferente das Contas, deseja sair mesmo assim ?','N')=idno then
         begin
            action:=canone;
            exit;
         end;
      end;
   end;
   Contas.Close;
   dm.Contas.Close;
end;

procedure TfParcelas.EditDiasExit(Sender: TObject);
begin
   if trim(editdias.Text) <> '' then
      DataVenc.Text:=datetostr(strtodate(DataEmissao.Text)+strtoint(EditDias.Text));
end;

procedure TfParcelas.DataVencExit(Sender: TObject);
begin
   if DataErro(Datavenc.Text) = 'S' then
   begin
      Datavenc.SetFocus;
      exit;
   end;
   if copy(Datavenc.Text,1,1) <> ' ' then
      editDias.Text:=floattostr(diasAtrazo(DataVenc.Text,DataEmissao.Text));
end;

procedure TfParcelas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_F3: butAlterarClick(self);
      vk_F4: butExcluirClick(self);
      vk_Escape: close;
   end;
end;

procedure TfParcelas.ValorPagarExit(Sender: TObject);
begin
   ValorPagar.Text:=FormatarValor(ValorPagar.Text,'V');
end;

procedure TfParcelas.MostraContas;
begin
   if contas.IsEmpty then
      exit;
   EditDias.Text:=ContasDIAS.Text;
   DataVenc.Text:=ContasDATA_VENCTO.Text;
   ValorPagar.Text:=ContasVALOR_PAGAR.Text;
   Cod_Pagto.Text:=ContasCOD_PAGTO.Text;
   if Cod_Pagto.Text <> '' then
   begin
      Cod_Pagto.Modified:=true;
      Cod_PagtoExit(self);
   end;
end;

procedure TfParcelas.Cod_PagtoExit(Sender: TObject);
begin
   PesquisaPagto('C');
end;

procedure TfParcelas.GradeCellClick(Column: TColumn);
begin
   MostraContas;
end;

procedure TfParcelas.GradeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   MostraContas;
end;

procedure TfParcelas.SpeedButton2Click(Sender: TObject);
begin
   fForma_Pagto:=TfForma_Pagto.create(Self);
   fForma_Pagto.TipoCad.Text:='P';
   if fForma_Pagto.ShowModal = mrOk then
   begin
      COD_PAGTO.Text:=dm.Forma_PagtoCOD_PAGTO.text;
      DESC_PAGTO.Text:=dm.Forma_PagtoDESC_PAGTO.Text;
   end;
   dm.Forma_Pagto.Close;
   fForma_Pagto.Free;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfParcelas.butExcluirClick(Sender: TObject);
begin
   if contas.IsEmpty then exit;
   if confirma('Confirma Exclusão desta Parcela ?','N')=idno then
      exit;
   dm.IniTrans;
   dmRegra.ExcluirParcela(ContasID_CONTA.Text);
   Contas.Delete;
   dm.SalvaTrans;
   MostraContas;
   Saldo;
end;

procedure TfParcelas.FormActivate(Sender: TObject);
begin
{
   editCarga = S-sim - N-Nao
}
//   dm.Tamanho_Form(fParcelas);
//   PesquisaContas;
//
//   if editCarga.Text = 'N' then
//      MostraContas;
//   if editCarga.Text = 'S' then
//   begin
//      P_Pedido.Visible:=false;
//      Monta_Contas_Carga;
//   end
//   else begin
//      if Contas.IsEmpty then
//      begin
//         dmRegra.ComandoSql
//         (
//            'select CLI.COD_PAGTO, FO.DESC_PAGTO from CLIENTE CLI'
//            +' left join FORMA_PAGTO FO on CLI.COD_PAGTO = FO.COD_PAGTO'
//            +' where CLI.COD_CLIENTE = '+Cod_Cliente.text
//         );
//         Cod_Pagto.Text:=dm.Qsql.fieldbyname('COD_PAGTO').text;
//         Desc_Pagto.Text:=dm.Qsql.fieldbyname('DESC_PAGTO').text;
//         dm.Qsql.Close;
//         ValorPagar.Text:=ValorPedido.Text;
//      end;
//   end;
//   PesquisaContas;
end;

procedure TfParcelas.butAlterarClick(Sender: TObject);
var vlPos: integer;
begin
   if contas.IsEmpty then exit;
   vlPos:=Contas.RecNo;
   fBaixaConta:=TfBaixaConta.create(self);
   fBaixaConta.id_Conta.Text:=ContasID_CONTA.Text;

   fBaixaConta.showModal;
   fBaixaConta.free;
   PesquisaContas;
   Contas.RecNo:=vlPos;
   Grade.SetFocus;
end;

procedure TfParcelas.PesquisaContas;
var vlTipo: String[1];
var vlCodigo: String;
begin
   vlTipo:='1';
   vlCodigo:=editNumPedido.Text;
   if (editCarga.Text = 'S') then
   begin
      vlTipo:='2';
      vlCodigo:=EditNumCarga.Text;
   end;
   Contas.Close;
   Contas.Params[0].Text:=vlCodigo;
   Contas.Params[1].Text:=vlTipo;
   Contas.Open;
end;

procedure TfParcelas.GradeDblClick(Sender: TObject);
begin
   butAlterarClick(self);
end;

procedure TfParcelas.Monta_Contas_Carga;
var
   vlCodCondicao: String;
   vlCodPagto:    String;
   vlDataEmissao: String;
   vlDataVencto:  String;

begin
   if not Contas.IsEmpty then
      exit;
   QpContas.Close;
   QpContas.Params[0].Text:=editNumPedido.Text;
   QpContas.Open;

   vlCodCondicao:=QPContasCOD_CONDICAO.Text;
   vlCodPagto:=QPContasCOD_PAGTO.Text;
   vlDataEmissao:=QPContasDATA_EMISSAO.Text;
   vlDataVencto:=QPContasDATA_VENCTO.Text;

   if vlDataEmissao = '' then
      vlDataEmissao:=dateToStr(Date);
   if vlDataVencto = '' then
      vlDataVencto:=dateToStr(Date + 30);

   dm.Get_Contas('0');
   dm.Contas.Append;
   dm.ContasNUM_PEDIDO.Text:=EditNumCarga.Text;
   dm.ContasCOD_CLIENTE.Text:=dm.CargaCOD_CONTATO.Text;
   dm.ContasCOD_CONDICAO.Text:=vlCodCondicao;
   dm.ContasCOD_PAGTO.Text:=vlCodPagto;
   dm.ContasDATA_EMISSAO.Text:=vlDataEmissao;
   dm.ContasDATA_VENCTO.Text:=vlDataVencto;
   dm.ContasDIAS.AsFloat:=DiasAtrazo(dm.ContasDATA_VENCTO.Text, dm.ContasDATA_EMISSAO.Text);
   dm.ContasTIPO_CONTA.Text:='2';
   dm.ContasDOCUMENTO.Text:=dm.CargaNUM_CARGA.Text;
   dm.ContasSEQ_CONTA.AsInteger:=DM.Incrementa('CONTAS','0');
   dm.ContasSITUACAO.Text:='A';
   dm.ContasVALOR_PAGAR.AsFloat:=Casas2(dm.CargaVALOR_CARREGA.AsFloat);
   dm.ContasVALOR_ORIGINAL.asfloat:=Casas2(dm.CargaVALOR_CARREGA.AsFloat);
   dm.ContasVALOR_PAGO.AsFloat:=0;
   dm.ContasID_PEDIDO.Text:=dm.CargaNUM_PEDIDO.Text;
   dm.contas.post;
   dm.SalvaTab(dm.Contas);
   dm.SalvaTrans;
   QpContas.Close;
end;

procedure TfParcelas.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
      butAlterarClick(Self);
end;

procedure TfParcelas.Saldo;
begin
   Valorpagar.Text:=formatfloat(',##0.00',PreparaExtenso(ValorPedido.Text) - preparaextenso(EditTotal.Text));
end;

end.
