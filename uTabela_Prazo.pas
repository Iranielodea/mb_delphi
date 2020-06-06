unit uTabela_Prazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls;

type
  TfTabela_Prazo = class(TForm)
    Grade: TDBGrid;
    dsCad: TDataSource;
    Label1: TLabel;
    Desc_Condicao: TEdit;
    but1: TSpeedButton;
    butPesq: TBitBtn;
    P_Gerar: TPanel;
    Cod_Condicao: TMaskEdit;
    butSair: TBitBtn;
    P_Altera: TPanel;
    Label2: TLabel;
    Cod_Pagto: TDBEdit;
    SpeedButton2: TSpeedButton;
    butOk: TBitBtn;
    butCancelar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Desc_Pagto: TDBEdit;
    butExcItem: TBitBtn;
    butAlterar: TSpeedButton;
    procedure Cod_CondicaoExit(Sender: TObject);
    procedure Desc_CondicaoExit(Sender: TObject);
    procedure but1Click(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butSairClick(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure Cod_PagtoExit(Sender: TObject);
    procedure Desc_PagtoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaCondicao(Tipo: String);
    procedure PesquisaForma_Pagto(Tipo: String);
    procedure Desabilita;
  public
    { Public declarations }
  end;

var
  fTabela_Prazo: TfTabela_Prazo;

implementation

uses uDM, uCondicao, UUtil, uForma_Pagto;
var vu_cod_pagto, vu_desc_pagto: string;

{$R *.dfm}

{ TfTabela_Prazo }

procedure TfTabela_Prazo.PesquisaCondicao(Tipo: String);
var vreg: integer;
begin
   if (Cod_Condicao.Modified = false) and (Desc_Condicao.Modified = false) then exit;
   if ((Cod_Condicao.Text = '') and (Tipo = 'C')) or ((Desc_Condicao.Text = '') and (Tipo = 'D')) then
   begin
      Cod_Condicao.Clear;
      Desc_Condicao.Clear;
      Cod_Condicao.Modified:=false;
      Desc_Condicao.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_Condicao, Desc_Condicao from CONDICAO where Cod_Condicao = '+Cod_Condicao.Text)
   else
      ComandoQSql('select Cod_Condicao, Desc_Condicao from CONDICAO where DESC_CONDICAO like  '''+Desc_Condicao.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      Cod_Condicao.Text:=dm.Qsql.Fields[0].Text;
      Desc_Condicao.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fCondicao:=TfCondicao.create(Self);
      fCondicao.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCondicao.EditNome.Text:=Desc_Condicao.Text;
      if fCondicao.ShowModal = mrOk then
      begin
         Cod_Condicao.Text:=dm.CondicaoCOD_CONDICAO.Text;
         Desc_Condicao.Text:=dm.CondicaoDESC_CONDICAO.Text;
      end
      else begin
         Cod_Condicao.Clear;
         Desc_Condicao.Clear;
      end;
      dm.Condicao.close;
      fCondicao.Free;
   end;
   dm.Qsql.close;
   Cod_Condicao.Modified:=false;
   Desc_Condicao.Modified:=false;
end;

procedure TfTabela_Prazo.Cod_CondicaoExit(Sender: TObject);
begin
   PesquisaCondicao('C');
end;

procedure TfTabela_Prazo.Desc_CondicaoExit(Sender: TObject);
begin
   PesquisaCondicao('D');
end;

procedure TfTabela_Prazo.but1Click(Sender: TObject);
begin
   fCondicao:=TfCondicao.create(Self);
   fCondicao.TipoCad.Text:='P';
   if fCondicao.ShowModal = mrOk then
   begin
      Cod_Condicao.Text:=dm.CondicaoCOD_CONDICAO.Text;
      Desc_Condicao.Text:=dm.CondicaoDESC_CONDICAO.Text;
   end;
   dm.Condicao.close;
   fCondicao.Free;
   Cod_Condicao.Modified:=false;
   Desc_Condicao.Modified:=false;
end;

procedure TfTabela_Prazo.butPesqClick(Sender: TObject);
begin
   if Cod_Condicao.Text <> '' then
   begin
      dm.Itens_Condicao.close;
      dm.Itens_Condicao.Params[0].Text:=Cod_Condicao.Text;
      dm.Itens_Condicao.Open;
      if not dm.Tabela_Prazo.IsEmpty then
      begin
         dm.Tabela_Prazo.First;
         while not dm.Tabela_Prazo.Eof do
            dm.Tabela_Prazo.Delete;
      end;
      while not dm.Itens_Condicao.Eof do
      begin
         dm.Tabela_Prazo.Append;
         dm.Tabela_PrazoNUM_PEDIDO.Text:=dm.PedidoNUM_PEDIDO.Text;
         dm.Tabela_PrazoSEQ.AsInteger:=dm.Itens_CondicaoSEQ.AsInteger;
         dm.Tabela_PrazoCOD_CONDICAO.Text:=Cod_Condicao.Text;
         dm.Tabela_PrazoSEQUENCIA.Text:=dm.Itens_CondicaoSEQUENCIA.Text;
         dm.Tabela_PrazoDIAS.AsInteger:=dm.Itens_CondicaoDIAS.AsInteger;
         if vu_cod_pagto <> '' then
            dm.Tabela_PrazoCOD_PAGTO.Text:=vu_cod_pagto;
         if vu_desc_pagto <> '' then
            dm.Tabela_PrazoDESC_PAGTO.Text:=vu_desc_pagto;
         dm.Tabela_Prazo.Post;
         DM.Itens_Condicao.Next;
      end;
      dm.Itens_Condicao.Close;
      dm.SalvaTab(dm.Tabela_Prazo);
      dm.SalvaTrans;
   end;
end;

procedure TfTabela_Prazo.FormCreate(Sender: TObject);
var vsql: string;
begin
   dm.Tabela_Prazo.Close;
   dm.Tabela_Prazo.Params[0].Text:=dm.PedidoNUM_PEDIDO.Text;
   dm.Tabela_Prazo.Open;
   if dm.Tabela_Prazo.IsEmpty then
   begin
      if dm.PedidoCOD_CLIENTE.Text <> '' then
      begin
         vsql:='select'
         +' CLI.COD_CONDICAO,'
         +' CLI.COD_PAGTO,'
         +' CON.DESC_CONDICAO,'
         +' FO.DESC_PAGTO'
         +' from CLIENTE CLI'
         +' left join CONDICAO CON on CLI.COD_CONDICAO = CON.COD_CONDICAO'
         +' left join FORMA_PAGTO FO on CLI.COD_PAGTO = FO.COD_PAGTO'
         +' where CLI.COD_CLIENTE = '+dm.PedidoCOD_CLIENTE.Text;
         ComandoQsql(vsql);
         Cod_Condicao.Text:=dm.Qsql.fieldbyname('COD_CONDICAO').text;
         Desc_Condicao.Text:=dm.Qsql.fieldbyname('DESC_CONDICAO').text;
         vu_cod_pagto:=dm.Qsql.fieldbyname('COD_PAGTO').text;
         vu_desc_pagto:=dm.Qsql.fieldbyname('DESC_PAGTO').text;
         dm.Qsql.Close;
      end;
      exit;
   end;

   if dm.Tabela_PrazoCOD_CONDICAO.Text <> '' then
   begin
      Cod_Condicao.Text:=dm.Tabela_PrazoCOD_CONDICAO.Text;
      Cod_Condicao.Modified:=true;
      Cod_CondicaoExit(self);
   end;
end;

procedure TfTabela_Prazo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dm.Tabela_Prazo.close;
end;

procedure TfTabela_Prazo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfTabela_Prazo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfTabela_Prazo.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfTabela_Prazo.butCancelarClick(Sender: TObject);
begin
   if dsCad.DataSet.State in [dsedit] then
      dsCad.DataSet.Cancel;
   P_Altera.Visible:=false;
   Desabilita;
end;

procedure TfTabela_Prazo.butOkClick(Sender: TObject);
begin
   if dsCad.DataSet.State in [dsedit] then
      dsCad.DataSet.Post;
   dm.SalvaTab(dm.Tabela_Prazo);
   dm.SalvaTrans;
   P_Altera.Visible:=false;
   Desabilita;
end;

procedure TfTabela_Prazo.Desabilita;
begin
   Cod_Condicao.Enabled:= not P_Altera.Visible;
   Desc_Condicao.Enabled:= not P_Altera.Visible;
   butPesq.Enabled:= not P_Altera.Visible;
   P_Gerar.Enabled:= not P_Altera.Visible;
   Grade.Enabled:=not P_Altera.Visible;
   but1.Enabled:= not P_Altera.Visible;
end;

procedure TfTabela_Prazo.PesquisaForma_Pagto(Tipo: String);
var vreg: integer;
begin
   if (Cod_Pagto.Modified = false) and (Desc_Pagto.Modified = false) then exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Pagto.Text = '') and (Tipo = 'C')) or ((Desc_Pagto.Text = '') and (Tipo = 'D')) then
   begin
      dm.Tabela_PrazoCOD_PAGTO.Clear;
      dm.Tabela_PrazoDesc_Pagto.Clear;
      Cod_Pagto.Modified:=false;
      Desc_Pagto.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select Cod_Pagto, Desc_Pagto from Forma_Pagto where Cod_Pagto = '+Cod_Pagto.Text)
   else
      ComandoQSql('select Cod_Pagto, Desc_Pagto from Forma_Pagto where Desc_Pagto like  '''+Desc_Pagto.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.Tabela_PrazoCod_Pagto.Text:=dm.Qsql.Fields[0].Text;
      dm.Tabela_PrazoDesc_Pagto.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fForma_Pagto:=TfForma_Pagto.create(Self);
      fForma_Pagto.TipoCad.Text:='P';
      if Tipo = 'D' then
         fForma_Pagto.EditNome.Text:=Desc_Pagto.Text;
      if fForma_Pagto.ShowModal = mrOk then
      begin
         dm.Tabela_PrazoCod_Pagto.Text:=dm.Forma_PagtoCod_Pagto.Text;
         dm.Tabela_PrazoDesc_Pagto.Text:=dm.Forma_PagtoDesc_Pagto.Text;
      end
      else begin
         dm.Tabela_PrazoCod_Pagto.Clear;
         dm.Tabela_PrazoDesc_Pagto.Clear;
      end;
      dm.Forma_Pagto.close;
      fForma_Pagto.Free;
   end;
   dm.Qsql.close;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfTabela_Prazo.Cod_PagtoExit(Sender: TObject);
begin
   PesquisaForma_Pagto('C');
end;

procedure TfTabela_Prazo.Desc_PagtoExit(Sender: TObject);
begin
   PesquisaForma_Pagto('D');
end;

procedure TfTabela_Prazo.SpeedButton2Click(Sender: TObject);
begin
   fForma_Pagto:=TfForma_Pagto.create(Self);
   fForma_Pagto.TipoCad.Text:='P';
   if fForma_Pagto.ShowModal = mrOk then
   begin
      dm.Tabela_Prazo.Edit;
      dm.Tabela_PrazoCod_Pagto.Text:=dm.Forma_PagtoCod_Pagto.Text;
      dm.Tabela_PrazoDesc_Pagto.Text:=dm.Forma_PagtoDesc_Pagto.Text;
   end;
   dm.Forma_Pagto.close;
   fForma_Pagto.Free;
   Cod_Pagto.Modified:=false;
   Desc_Pagto.Modified:=false;
end;

procedure TfTabela_Prazo.butAlterarClick(Sender: TObject);
begin
   if not dscad.DataSet.IsEmpty then
   begin
      P_Altera.Visible:=true;
      Cod_Pagto.SetFocus;
      Desabilita;
   end;
end;

procedure TfTabela_Prazo.GradeDblClick(Sender: TObject);
begin
   butAlterarClick(self);
end;

procedure TfTabela_Prazo.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fTabela_Prazo);
   dm.Tamanho_Painel(P_Altera);
end;

end.
