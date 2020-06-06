unit uIComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, uDMUnidade;

type
  TfIComissao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label3: TLabel;
    Cod_For: TEdit;
    Nome_For: TEdit;
    btnFornecedor: TSpeedButton;
    Panel1: TPanel;
    butSair: TSpeedButton;
    butImprimir: TSpeedButton;
    rgRelatorios: TRadioGroup;
    Cod_Vendedor: TEdit;
    Nome_Vendedor: TEdit;
    btnVendedor: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    cbbUnidade: TComboBox;
    procedure butImprimirClick(Sender: TObject);
    procedure butSairClick(Sender: TObject);
    procedure Cod_ForExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Nome_ForExit(Sender: TObject);
    procedure Nome_VendedorExit(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure rgRelatoriosExit(Sender: TObject);
  private
    procedure BuscarFornecedor(inCodigo: Integer);
    procedure PreencherUnidades();
  public
    { Public declarations }
  end;

var
  fIComissao: TfIComissao;

implementation

uses UUtil, uDM, uTipoFornecedor, uRComissao, uDMRegra, uFornecedor, uVendedor;

{$R *.dfm}

procedure TfIComissao.BuscarFornecedor(inCodigo: Integer);
begin
  dmRegra.GetFornecedor(inCodigo, StrToInt(vgCod_Empresa));
  if dmRegra.Codigo = 0 then
  begin
    Cod_For.Clear;
    Nome_For.Clear;
    ShowMessage('Código não encontrado!');
  end
  else begin
    Cod_For.Text := IntToStr(dmRegra.Codigo);
    Nome_For.Text := dmRegra.Nome;
  end;
  Cod_For.Modified := False;
  Nome_For.Modified := False;
end;

procedure TfIComissao.butImprimirClick(Sender: TObject);
begin
  if ValidaDatas(edtDataInicial.Text, edtDataFinal.Text) = False then
  begin
    edtDataInicial.SetFocus;
    Exit;
  end;

  frComissao := TfrComissao.Create(Self);

  if rgRelatorios.ItemIndex = 0 then
    frComissao.ImpressaoComissao(edtDataInicial.Text, edtDataFinal.Text, StrToIntDef(Cod_For.Text,0))
  else
    frComissao.ImpressaoComissaoVendedor(edtDataInicial.Text, edtDataFinal.Text, StrToIntDef(Cod_Vendedor.Text,0), cbbUnidade.Text);

  FreeAndNil(frComissao);
end;

procedure TfIComissao.butSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfIComissao.Cod_ForExit(Sender: TObject);
begin
  if Cod_For.Modified then
    BuscarFornecedor(StrToInt(Cod_For.Text));

end;

procedure TfIComissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfIComissao.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_F5 then
    butImprimirClick(Self);
end;

procedure TfIComissao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfIComissao.FormShow(Sender: TObject);
begin
  edtDataInicial.Text := DateToStr(Date);
  edtDataFinal.Text := DateToStr(Date);
  PreencherUnidades();
end;

procedure TfIComissao.Nome_ForExit(Sender: TObject);
begin
   if Nome_For.Modified then
   begin
      dmRegra.PesquisaFornecedor(Nome_For.Text);
      COD_FOR.Text:=dm.FornecedorCOD_FOR.Text;
      Nome_For.Text:=dm.FornecedorNOME.Text;
      dm.Fornecedor.Close;
      ffornecedor.Free;
      Nome_For.Modified:=false;
   end;

end;

procedure TfIComissao.Nome_VendedorExit(Sender: TObject);
begin
  if Nome_Vendedor.Modified then
   begin
      dmRegra.PesquisaVendedor(Nome_Vendedor.Text);
      COD_VENDEDOR.Text:=dm.VendedorCOD_VENDEDOR.Text;
      NOME_VENDEDOR.Text:=dm.VendedorNOME.Text;
      dm.Vendedor.Close;
      fVendedor.Free;
      Nome_Vendedor.Modified := False;
   end;
end;

procedure TfIComissao.PreencherUnidades;
var
  Unidade: TdmUnidade;
begin
  cbbUnidade.Items.Add('');
  Unidade := TdmUnidade.Create(Self);
  try
    Unidade.ListarTodos(StrToInt(vgCod_Empresa));
    while not Unidade.QUnidade.Eof do
    begin
      cbbUnidade.Items.Add(Unidade.QUnidadeDESC_UNIDADE.AsString);
      Unidade.QUnidade.Next;
    end;
  finally
    FreeAndNil(Unidade);
  end;
end;

procedure TfIComissao.btnVendedorClick(Sender: TObject);
begin
   if dmRegra.PesquisaVendedor('') = true then
   begin
      COD_VENDEDOR.Text:=dm.VendedorCOD_VENDEDOR.text;
      NOME_VENDEDOR.Text:=dm.VendedorNOME.Text;
   end;
   dm.Vendedor.Close;
   fVendedor.Free;
end;

procedure TfIComissao.btnFornecedorClick(Sender: TObject);
begin
   if dmRegra.PesquisaFornecedor('') = true then
   begin
      COD_FOR.Text:=dm.FornecedorCOD_FOR.text;
      Nome_For.Text:=dm.FornecedorNOME.Text;
   end;
   dm.Fornecedor.Close;
   fFornecedor.Free;
end;

procedure TfIComissao.rgRelatoriosExit(Sender: TObject);
begin
  if rgRelatorios.ItemIndex = 0 then
  begin
    Nome_For.Enabled := True;
    btnFornecedor.Enabled := True;
    Nome_Vendedor.Enabled := False;
    btnVendedor.Enabled := False;

    Cod_Vendedor.Clear;
    Nome_Vendedor.Clear;
  end
  else begin
    Nome_For.Enabled := False;
    btnFornecedor.Enabled := False;
    Nome_Vendedor.Enabled := True;
    btnVendedor.Enabled := True;

    Cod_For.Clear;
    Nome_For.Clear;
  end;
end;

end.
