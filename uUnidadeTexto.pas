unit uUnidadeTexto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFUnidadeTexto = class(TfBase)
    Label4: TLabel;
    DBMemo1: TDBMemo;
    procedure butPesqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  FUnidadeTexto: TFUnidadeTexto;

implementation

{$R *.dfm}

uses uDM;

procedure TFUnidadeTexto.butPesqClick(Sender: TObject);
begin
//  inherited;
  Pesquisar;
end;

procedure TFUnidadeTexto.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TFUnidadeTexto.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TFUnidadeTexto.FormShow(Sender: TObject);
begin
//  inherited;
  Pesquisar;
end;

procedure TFUnidadeTexto.Pesquisar;
begin
  dm.ListarUnidadeTexto(EditNome.Text);
end;

end.
