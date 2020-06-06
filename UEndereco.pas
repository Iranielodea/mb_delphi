unit UEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDMEntrega;

type
  TfrmEndereco = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCad: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Cod_Cidade: TDBEdit;
    Desc_Cidade: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Panel1: TPanel;
    butOk: TBitBtn;
    butCancelar: TBitBtn;
    btnCidade: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure butCancelarClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
  private
    { Private declarations }
    FDados: TDMEndereco;
    FCodCliente: Integer;
    procedure PesquisaCidade(Tipo: String);
  public
    { Public declarations }
    constructor Create(CodCliente: integer);
  end;

var
  frmEndereco: TfrmEndereco;

implementation

{$R *.dfm}

uses uDM, UUtil, uDMRegra, uCidade;

procedure TfrmEndereco.btnCidadeClick(Sender: TObject);
begin
   fCidade:=TfCidade.create(Self);
   fCidade.TipoCad.Text:='P';
   if fCidade.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      FDados.cdsEndEntregaCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      FDados.cdsEndEntregaDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      FDados.cdsEndEntregaCEP.Text:=dm.CidadeCEP.Text;
      FDados.cdsEndEntregaSIGLA.Text:=dm.CidadeSIGLA.Text;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfrmEndereco.butCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEndereco.butOkClick(Sender: TObject);
begin
  FDados.Salvar(FCodCliente);
  Close;
end;

constructor TfrmEndereco.Create(CodCliente: integer);
begin
  inherited Create(nil);
  FDados := TDMEndereco.Create(Self);
  dsCad.DataSet := FDados.cdsEndEntrega;
  FCodCliente := CodCliente;
  FDados.LocalizarCliente(CodCliente);
end;

procedure TfrmEndereco.Desc_CidadeExit(Sender: TObject);
begin
  PesquisaCidade('D');
end;

procedure TfrmEndereco.dsCadStateChange(Sender: TObject);
begin
  butOk.Enabled := (dsCad.State in [dsInsert, dsEdit]);
end;

procedure TfrmEndereco.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDados);
end;

procedure TfrmEndereco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F6:
    begin
      if butOk.Enabled then
        butOkClick(Self);
    end;
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmEndereco.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfrmEndereco.PesquisaCidade(Tipo: String);
var vreg: integer;
begin
   if (Cod_Cidade.Modified = false) and (Desc_Cidade.Modified = false) then
      exit;
   dm.ModoEdicao(dsCad);
   if ((Cod_Cidade.Text = '') and (Tipo = 'C')) or ((Desc_Cidade.Text = '') and (Tipo = 'D')) then
   begin
      FDados.cdsEndEntregaCOD_CIDADE.Clear;
      FDados.cdsEndEntregaDESC_CIDADE.Clear;
      FDados.cdsEndEntregaSIGLA.Clear;
      FDados.cdsEndEntregaCEP.Clear;
      Cod_Cidade.Modified:=false;
      Desc_Cidade.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select'
      +' CID.COD_CIDADE,'
      +' CID.DESC_CIDADE,'
      +' CID.CEP,'
      +' EST.SIGLA'
      +' from CIDADE CID'
      +' left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      +' where CID.COD_CIDADE = '+Cod_Cidade.Text)
   else
      ComandoQSql('select'
      +' CID.COD_CIDADE,'
      +' CID.DESC_CIDADE,'
      +' CID.CEP,'
      +' EST.SIGLA'
      +' from CIDADE CID'
      +' left join ESTADO EST on CID.ID_ESTADO = EST.ID_ESTADO'
      +' where CID.DESC_CIDADE like '''+Desc_Cidade.Text+'%''');

   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      FDados.cdsEndEntregaCOD_CIDADE.Text:=dm.Qsql.Fields[0].Text;
      FDados.cdsEndEntregaDESC_CIDADE.Text:=dm.Qsql.Fields[1].Text;
      FDados.cdsEndEntregaCEP.Text:=dm.Qsql.Fields[2].Text;
      FDados.cdsEndEntregaSIGLA.Text:=dm.Qsql.Fields[3].Text;
   end
   else begin
      fCidade:=TfCidade.create(Self);
      fCidade.TipoCad.Text:='P';
      if Tipo = 'D' then
         fCidade.EditNome.Text:=Desc_Cidade.Text;
      if fCidade.ShowModal = mrOk then
      begin
         FDados.cdsEndEntregaCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
         FDados.cdsEndEntregaDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
         FDados.cdsEndEntregaCEP.Text:=dm.CidadeCEP.Text;
         FDados.cdsEndEntregaSIGLA.Text:=dm.CidadeSIGLA.Text;
      end
      else begin
         FDados.cdsEndEntregaCOD_CIDADE.Clear;
         FDados.cdsEndEntregaDESC_CIDADE.Clear;
         FDados.cdsEndEntregaSIGLA.Clear;
         FDados.cdsEndEntregaCEP.Clear;
      end;
      dm.Cidade.Close;
      fCidade.Free;
   end;
   dm.Qsql.close;
   Cod_Cidade.Modified:=false;
   Desc_Cidade.Modified:=false;
end;

end.
