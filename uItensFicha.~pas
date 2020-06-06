unit uItensFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, DBCtrls, Buttons, DB,
  DBClient;

type
  TfItensFicha = class(TForm)
    PageControl1: TPageControl;
    sheetDiretor: TTabSheet;
    sheetBanco: TTabSheet;
    sheetComercio: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NomeDiretor: TDBEdit;
    Cpf: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    NomeBanco: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    NomeFornecedor: TDBEdit;
    Cnpj: TDBEdit;
    DBEdit13: TDBEdit;
    butOk: TBitBtn;
    butCancelar: TBitBtn;
    dsDiretor: TDataSource;
    dsRefBanco: TDataSource;
    dsRefComercio: TDataSource;
    butNovo: TBitBtn;
    ClientDataSet1: TClientDataSet;
    EditTabela: TEdit;
    CodCliente: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butOkClick(Sender: TObject);
    procedure dsDiretorStateChange(Sender: TObject);
    procedure dsRefBancoStateChange(Sender: TObject);
    procedure dsRefComercioStateChange(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure CpfExit(Sender: TObject);
    procedure CnpjExit(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar(Tabela: TDataSource);
    procedure Cancelar(Tabela: TDataSource);
  public
    { Public declarations }
  end;

var
  fItensFicha: TfItensFicha;

implementation

uses uDM, UUtil, uDMRegra;

{$R *.dfm}

procedure TfItensFicha.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfItensFicha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
   if key = vk_F6 then
   begin
      if butOk.Enabled then
      begin
         butOk.SetFocus;
         butOkClick(self);
      end;
   end;
   if key = vk_F2 then
   begin
      if butNovo.Enabled then
      begin
         butNovo.SetFocus;
         butNovoClick(self);
      end;
   end;
end;

procedure TfItensFicha.Gravar(Tabela: TDataSource);
begin
   Tabela.DataSet.FieldByName('COD_EMPRESA').Text:=vgCod_Empresa;
   Tabela.DataSet.FieldByName('COD_CLIENTE').Text:=CodCliente.Text;
   (Tabela.DataSet as TClientDataSet).Post;
   dm.SalvaTab((Tabela.DataSet as TClientDataSet));
end;

procedure TfItensFicha.butOkClick(Sender: TObject);
begin
   if sheetDiretor.TabVisible    then Gravar(dsDiretor);
   if sheetBanco.TabVisible      then Gravar(dsRefBanco);
   if sheetComercio.TabVisible   then Gravar(dsRefComercio);
   butNovo.SetFocus;

end;

procedure TfItensFicha.dsDiretorStateChange(Sender: TObject);
begin
   butNovo.Enabled:=dsDiretor.DataSet.State = dsBrowse;
   butOk.Enabled:=dsDiretor.DataSet.State in [dsInsert,dsEdit];
end;

procedure TfItensFicha.dsRefBancoStateChange(Sender: TObject);
begin
   butNovo.Enabled:=dsRefBanco.DataSet.State = dsBrowse;
   butOk.Enabled:=dsRefBanco.DataSet.State in [dsInsert,dsEdit];
end;

procedure TfItensFicha.dsRefComercioStateChange(Sender: TObject);
begin
   butNovo.Enabled:=dsRefComercio.DataSet.State = dsBrowse;
   butOk.Enabled:=dsRefComercio.DataSet.State in [dsInsert,dsEdit];
end;

procedure TfItensFicha.butNovoClick(Sender: TObject);
begin
   if sheetDiretor.TabVisible  then
   begin
      dsDiretor.DataSet.Append;
      NomeDiretor.SetFocus;
   end;
   if sheetBanco.TabVisible    then
   begin
      dsRefBanco.DataSet.Append;
      NomeBanco.SetFocus;
   end;
   if sheetComercio.TabVisible then
   begin
      dsRefComercio.DataSet.Append;
      NomeFornecedor.SetFocus;
   end;
end;

procedure TfItensFicha.butCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TfItensFicha.Cancelar(Tabela: TDataSource);
begin
   if Tabela.DataSet.State in [dsEdit,dsInsert] then
      Tabela.DataSet.Cancel;
end;

procedure TfItensFicha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if sheetDiretor.TabVisible    then Cancelar(dsDiretor);
   if sheetBanco.TabVisible      then Cancelar(dsRefBanco);
   if sheetComercio.TabVisible   then Cancelar(dsRefComercio);
end;

procedure TfItensFicha.FormActivate(Sender: TObject);
begin
   if EditTabela.text = 'D' then
   begin
      sheetBanco.TabVisible:=false;
      sheetComercio.TabVisible:=false;
      NomeDiretor.SetFocus;
   end;
   if EditTabela.text = 'B' then
   begin
      sheetDiretor.TabVisible:=false;
      sheetComercio.TabVisible:=false;
      NomeBanco.SetFocus;
   end;
   if EditTabela.text = 'C' then
   begin
      sheetDiretor.TabVisible:=false;
      sheetBanco.TabVisible:=false;
      NomeFornecedor.SetFocus;
   end;

end;

procedure TfItensFicha.CpfExit(Sender: TObject);
begin
   if dmRegra.Valida_CPF(Cpf.Text) = false then
      cpf.SetFocus;
end;

procedure TfItensFicha.CnpjExit(Sender: TObject);
begin
   if dmRegra.Valida_CNPJ(cnpj.Text) = false then
      cnpj.SetFocus;
end;

end.
