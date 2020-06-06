unit uIPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TfIPedido = class(TForm)
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Cod_For: TMaskEdit;
    NomeFor: TEdit;
    DataIni: TMaskEdit;
    Datafin: TMaskEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Cod_Cliente: TMaskEdit;
    Nome: TEdit;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    Cod_Contato: TMaskEdit;
    Nome_Contato: TEdit;
    GroupBox1: TGroupBox;
    RCliente: TRadioButton;
    RFor: TRadioButton;
    RContato: TRadioButton;
    RPro_Cliente: TRadioButton;
    RPro_For: TRadioButton;
    RPro_Contato: TRadioButton;
    GroupBox2: TGroupBox;
    RAberto: TRadioButton;
    REntregue: TRadioButton;
    RCancelado: TRadioButton;
    RTodos: TRadioButton;
    Panel1: TPanel;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    GTipo: TGroupBox;
    RRelacao: TRadioButton;
    RResumo: TRadioButton;
    RComissao: TRadioButton;
    Label6: TLabel;
    Cod_Vendedor: TMaskEdit;
    Nome_Vendedor: TEdit;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Desc_Estado: TMaskEdit;
    SpeedButton5: TSpeedButton;
    REstado: TRadioButton;
    procedure Nome_ContatoExit(Sender: TObject);
    procedure NomeForExit(Sender: TObject);
    procedure NomeExit(Sender: TObject);
    procedure NomeForEnter(Sender: TObject);
    procedure NomeEnter(Sender: TObject);
    procedure Nome_ContatoEnter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Nome_VendedorExit(Sender: TObject);
    procedure Nome_VendedorEnter(Sender: TObject);
    procedure Desc_EstadoEnter(Sender: TObject);
    procedure Desc_EstadoExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaFornecedor(Tipo: String);
    procedure PesquisaCliente(Tipo: String);
    procedure PesquisaEstado(Tipo: string);
    procedure FiltroPedido;
  public
    { Public declarations }
  end;

var
  fIPedido: TfIPedido;

implementation

uses uDM, uFornecedor, UUtil, uCliente, uDMRegra, uRPedido1, uVendedor,
  uEstado;

{$R *.dfm}

{ TfIPedido }

procedure TfIPedido.PesquisaCliente(Tipo: String);
var vreg: integer;
begin
   if (Cod_Cliente.Modified = false) and (Nome.Modified = false) then exit;
   if ((Cod_Cliente.Text = '') and (Tipo = 'C')) or ((Nome.Text = '') and (Tipo = 'D')) then
   begin
      COD_CLIENTE.Clear;
      NOME.Clear;
      Cod_Cliente.Modified:=false;
      Nome.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select COD_CLIENTE, NOME from CLIENTE where COD_CLIENTE = '+Cod_Cliente.Text)
   else
      ComandoQSql('select COD_CLIENTE, NOME from CLIENTE where NOME like  '''+Nome.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Cod_Cliente.Text:=dm.Qsql.Fields[0].Text;
      Nome.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fCliente:=TfCliente.create(Self);
      fCliente.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCliente.EditNome.Text:=Nome.Text;
      if fCliente.ShowModal = mrOk then
      begin
         Cod_Cliente.Text:=dm.ClienteCOD_CLIENTE.Text;
         Nome.Text:=dm.ClienteNOME.Text;
      end
      else begin
         Cod_Cliente.Clear;
         Nome.Clear;
      end;
      dm.Cliente.close;
      fCliente.Free;
   end;
   dm.Qsql.close;
   Cod_Cliente.Modified:=false;
   Nome.Modified:=false;
end;

procedure TfIPedido.PesquisaFornecedor(Tipo: String);
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
         Cod_For.Text:=dm.FornecedorCod_For.Text;
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

procedure TfIPedido.Nome_ContatoExit(Sender: TObject);
begin
   if Nome_Contato.Modified then
   begin
      dmRegra.PesquisaCliente(Nome_Contato.Text);
      COD_CONTATO.Text:=dm.ClienteCOD_CLIENTE.Text;
      Nome_Contato.Text:=dm.ClienteNOME.Text;
      dm.Cliente.Close;
      fCliente.Free;
   end;
end;

procedure TfIPedido.NomeForExit(Sender: TObject);
begin
   if NomeFor.Modified then
      PesquisaFornecedor('D');
end;

procedure TfIPedido.NomeExit(Sender: TObject);
begin
   if Nome.Modified then
      PesquisaCliente('D');
end;

procedure TfIPedido.NomeForEnter(Sender: TObject);
begin
   NomeFor.Modified:=false;
end;

procedure TfIPedido.NomeEnter(Sender: TObject);
begin
   Nome.Modified:=false;
end;

procedure TfIPedido.Nome_ContatoEnter(Sender: TObject);
begin
   Nome_Contato.Modified:=false;
end;

procedure TfIPedido.SpeedButton2Click(Sender: TObject);
begin
   fFornecedor:=TfFornecedor.create(Self);
   fFornecedor.TipoCad.Text:='P';
   if fFornecedor.ShowModal = mrOk then
   begin
      Cod_For.Text:=dm.FornecedorCod_For.Text;
      NomeFor.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.close;
   fFornecedor.Free;
end;

procedure TfIPedido.SpeedButton1Click(Sender: TObject);
begin
   fCliente:=TfCliente.create(Self);
   fCliente.TipoCad.Text:='P';
   if fCliente.ShowModal = mrOk then
   begin
      Cod_Cliente.Text:=dm.ClienteCOD_CLIENTE.Text;
      Nome.Text:=dm.ClienteNOME.Text;
   end;
   dm.Cliente.close;
   fCliente.Free;
end;

procedure TfIPedido.SpeedButton3Click(Sender: TObject);
begin
   dmRegra.PesquisaCliente(' ');
   COD_CONTATO.Text:=dm.ClienteCOD_CLIENTE.Text;
   Nome_Contato.Text:=dm.ClienteNOME.Text;
   dm.Cliente.Close;
   fCliente.Free;
end;

procedure TfIPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfIPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfIPedido.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfIPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=caFree;
end;

procedure TfIPedido.FormCreate(Sender: TObject);
begin
   DataIni.Text:=Inicio_Mes(datetoStr(Date));
   Datafin.Text:=Fim_Mes(datetoStr(Date));
end;

procedure TfIPedido.butImprimirClick(Sender: TObject);
var vdata: string;
begin
   frPedido1:=TfrPedido1.create(self);
   with frPedido1 do
   begin
      vdata:='Período de: '+DataIni.Text+' Até: '+Datafin.Text;
      lblData.Caption:=vdata;
      lblData2.Caption:=vdata;
      lblData3.Caption:=vdata;
      lblData4.Caption:=vdata;
      lblData5.Caption:=vdata;
      lblData6.Caption:=vdata;
      lblData7.Caption:=vdata;
      lblData8.Caption:=vdata;
      lblData9.Caption:=vdata;
      lblData10.Caption:=vdata;
      lblData11.Caption:=vdata;
      lblData12.Caption:=vdata;
      lblData13.Caption:=vdata;
      lblData14.Caption:=vdata;
      lblData15.Caption:=vdata;
      lblData16.Caption:=vdata;
//------------------------------------------------------------------------------
      FiltroPedido;
//------------------------------------------------------------------------------
      if RRelacao.Checked then
      begin
         if rCliente.Checked then
            Rel1.Print;
         if RFor.Checked then
            Rel2.Print;
         if RContato.Checked then
            Rel3.Print;
         if RPro_Cliente.Checked then
            Rel4.Print;
         if RPro_For.Checked then
            Rel5.Print;
         if RPro_Contato.Checked then
            Rel6.Print;
         if RComissao.Checked then
            Rel13.Print;
         if REstado.Checked then
            rel15.Print;

      end
//------------------------------------------------------------------------------
      else begin
         if rCliente.Checked then
            Rel7.Print;
         if RFor.Checked then
            Rel8.Print;
         if RContato.Checked then
            Rel9.Print;
         if RPro_Cliente.Checked then
            Rel10.Print;
         if RPro_For.Checked then
            Rel11.Print;
         if RPro_Contato.Checked then
            Rel12.Print;
         if RComissao.Checked then
            Rel14.Print;
         if REstado.Checked then
            rel16.Print;

      end;
      Pedido.Close;
      free;
   end;
end;

procedure TfIPedido.FiltroPedido;
begin
   with frPedido1 do
   begin
      Pedido.Close;
//------------------------------------------------------------------------------
// Filtro
      if Cod_For.Text <> '' then
         QPedido.SQL.Add(' and PED.COD_FOR = '+Cod_For.Text);
      if Cod_Cliente.Text <> '' then
         QPedido.SQL.Add(' and PED.COD_CLIENTE = '+Cod_Cliente.Text);
      if Cod_Contato.Text <> '' then
         QPedido.SQL.Add(' and PED.COD_CONTATO = '+Cod_Contato.Text);
      if Cod_Vendedor.Text <> '' then
         Qpedido.SQL.Add(' and PED.COD_VENDEDOR = ' + Cod_Vendedor.Text);
      if RAberto.Checked then
         QPedido.SQL.Add(' and PED.SITUACAO = ''A''');
      if REntregue.Checked then
         QPedido.SQL.Add(' and PED.SITUACAO = ''E''');
      if RCancelado.Checked then
         QPedido.SQL.Add(' and PED.SITUACAO = ''C''');
      if Desc_Estado.text <> '' then
         QPedido.SQL.Add(' and EST.SIGLA = ''' + Desc_Estado.Text + '''');

//------------------------------------------------------------------------------
// ordem
      if rCliente.Checked then
         QPedido.SQL.Add(' order by 1,PED.NUM_PEDIDO');
      if RFor.Checked then
         QPedido.SQL.Add(' order by 2,PED.NUM_PEDIDO');
      if RContato.Checked then
         QPedido.SQL.Add(' order by 3,PED.NUM_PEDIDO');
      if RPro_Cliente.Checked then
         QPedido.SQL.Add(' order by 4,PED.NUM_PEDIDO');
      if RPro_For.Checked then
         QPedido.SQL.Add(' order by 4,PED.NUM_PEDIDO');
      if RPro_Contato.Checked then
         QPedido.SQL.Add(' order by 4,PED.NUM_PEDIDO');
      if RComissao.Checked then
         Qpedido.SQL.Add(' order by 5, PED.DATA'); // vendedor
      if REstado.Checked then
         Qpedido.SQL.Add(' order by 2, PED.DATA'); // vendedor



      QPedido.Params[0].Text:=vgCod_Empresa;
      QPedido.Params[1].AsDate:=strtodate(DataIni.Text);
      QPedido.Params[2].AsDate:=strtodate(Datafin.Text);
      Pedido.Open;
   end;
end;

procedure TfIPedido.SpeedButton4Click(Sender: TObject);
begin
   dmRegra.PesquisaVendedor(' ');
   Cod_Vendedor.Text:=dm.VendedorCOD_VENDEDOR.Text;
   Nome_Vendedor.Text:=dm.VendedorNOME.Text;
   dm.Vendedor.Close;
   fVendedor.Free;
end;

procedure TfIPedido.Nome_VendedorExit(Sender: TObject);
begin
   if Nome_Vendedor.Modified then
   begin
      dmRegra.PesquisaVendedor(Nome_Vendedor.Text);
      Cod_Vendedor.Text:=dm.VendedorCOD_VENDEDOR.Text;
      Nome_Vendedor.Text:=dm.VendedorNOME.Text;
      dm.Vendedor.Close;
      fVendedor.Free;
   end;
end;

procedure TfIPedido.Nome_VendedorEnter(Sender: TObject);
begin
   Nome_Vendedor.Modified:=false;
end;

procedure TfIPedido.PesquisaEstado(Tipo: string);
var vreg: integer;
begin
   if (Desc_Estado.Modified = false) then
      exit;
   if ((Desc_Estado.Text = '') and (Tipo = 'D')) then
   begin
      Desc_Estado.Clear;
      exit;
   end;
      ComandoQSql('select SIGLA from ESTADO where SIGLA like  '''+Desc_Estado.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Desc_Estado.Text:=dm.Qsql.Fields[0].Text;
   end
   else begin
      fEstado:=TfEstado.create(Self);
      fEstado.TipoCad.Text:='P';
      if Tipo = 'D' then
         fEstado.EditNome.Text:=Desc_Estado.Text;
      if fEstado.ShowModal = mrOk then
      begin
         Desc_Estado.Text:=dm.EstadoSIGLA.Text;
      end
      else begin
         Desc_Estado.clear;
      end;
      dm.Estado.Close;
      fEstado.Free;
   end;
   dm.Qsql.close;
   
end;

procedure TfIPedido.Desc_EstadoEnter(Sender: TObject);
begin
   Desc_Estado.Modified:=false;
end;

procedure TfIPedido.Desc_EstadoExit(Sender: TObject);
begin
   if Desc_Estado.Modified = False then
      exit;
   PesquisaEstado('D');
end;

procedure TfIPedido.SpeedButton5Click(Sender: TObject);
begin
   fEstado:=TfEstado.create(Self);
   fEstado.TipoCad.Text:='P';
   if fEstado.ShowModal = mrOk then
   begin
      Desc_Estado.Text:=dm.EstadoSIGLA.Text;
      Desc_Estado.Modified:=false;
   end;
   dm.Estado.Close;
   fEstado.Free;

end;

end.
