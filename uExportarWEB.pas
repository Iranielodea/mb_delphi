unit uExportarWEB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, uDM, Data.FMTBcd, Data.DB, Data.SqlExpr, UUtil, uServicoCarga,
  uServicoConta, System.Generics.Collections, uCargaModel, uContaModel,
  uServicoContaBanco, uContaBancoModel;

type
  TfExportarWEB = class(TForm)
    Label1: TLabel;
    edtDataInicial: TMaskEdit;
    Label2: TLabel;
    edtDataFinal: TMaskEdit;
    pnl1: TPanel;
    btnExportar: TBitBtn;
    btnSair: TBitBtn;
    grp1: TGroupBox;
    rbCarga: TRadioButton;
    rbContas: TRadioButton;
    QryCargas: TSQLQuery;
    lblAguarde: TLabel;
    QryContas: TSQLQuery;
    rbBanco: TRadioButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExportarCargas;
    procedure ExportarContas;
    procedure ExportarBancos;
  public
    { Public declarations }
  end;

var
  fExportarWEB: TfExportarWEB;

implementation

{$R *.dfm}

procedure TfExportarWEB.btnExportarClick(Sender: TObject);
begin
  if ValidaDatas(edtDataInicial.Text,edtDataFinal.Text) = false then
    exit;

  if Confirma('Confirmar Gerar para WEB', 'N') = IDYES then
  begin
    lblAguarde.Visible := True;
    lblAguarde.Refresh;

    if rbCarga.Checked then
      ExportarCargas();

    if rbContas.Checked then
      ExportarContas();

    if rbBanco.Checked then
      ExportarBancos();

    lblAguarde.Visible := False;
    lblAguarde.Refresh;
    ShowMessage('Fim da Exportação!');
  end;
end;

procedure TfExportarWEB.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfExportarWEB.ExportarBancos;
var
  servico: TServicoContaBanco;
begin
  servico := TServicoContaBanco.Create;
  try
    try
      servico.ExportarNET();
    except ON E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FreeAndNil(servico);
  end;
end;

procedure TfExportarWEB.ExportarCargas;
var
  servico: TServicoCarga;
begin
  QryCargas.Close;
  QryCargas.ParamByName('DATAINI').AsDate := StrToDate(edtDataInicial.Text);
  QryCargas.ParamByName('DATAFIN').AsDate := StrToDate(edtDataFinal.Text);
  QryCargas.ExecSQL();

  servico := TServicoCarga.Create;
  try
    try
      servico.ExportarNET();
    except ON E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FreeAndNil(servico);
  end;
end;

procedure TfExportarWEB.ExportarContas;
var
  servico: TServicoConta;
begin
  QryContas.Close;
  QryContas.ParamByName('DATAINI').AsDate := StrToDate(edtDataInicial.Text);
  QryContas.ParamByName('DATAFIN').AsDate := StrToDate(edtDataFinal.Text);
  QryContas.ExecSQL();

  servico := TServicoConta.Create;
  try
    try
      servico.ExportarNET();
    except ON E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FreeAndNil(servico);
  end;
end;

procedure TfExportarWEB.FormCreate(Sender: TObject);
begin
  edtDataInicial.Text := DateToStr(date);
  edtDataFinal.Text := DateToStr(date);
end;

procedure TfExportarWEB.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

end.
