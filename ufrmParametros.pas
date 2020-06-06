unit ufrmParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, udmParametros;

type
  TfrmParametros = class(TfBase)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butPesqClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FCadastro: TdmParametros;
  public
    { Public declarations }
  end;

var
  frmParametros: TfrmParametros;

implementation

{$R *.dfm}


procedure TfrmParametros.butPesqClick(Sender: TObject);
begin
//  inherited;
    FCadastro.LocalizarNome(EditNome.Text, ROpcao.ItemIndex);
end;

procedure TfrmParametros.FormActivate(Sender: TObject);
begin
  inherited;
  FCadastro.LocalizarNome(EditNome.Text, ROpcao.ItemIndex);
end;

procedure TfrmParametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FCadastro.cdsParametro.Close;
  FreeAndNil(FCadastro);
end;

procedure TfrmParametros.FormShow(Sender: TObject);
begin
//  inherited;

  FCadastro := TdmParametros.Create(Self);
  dsCad.DataSet := FCadastro.cdsParametro;

  FCadastro.LocalizarNome(EditNome.Text, ROpcao.ItemIndex);

end;

end.
