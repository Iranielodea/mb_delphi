unit ufrmExecutarComando;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TfrmExecutarComando = class(TForm)
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnExecutar: TBitBtn;
    btnSair: TBitBtn;
    QSql: TSQLQuery;
    dspSql: TDataSetProvider;
    cdsSql: TClientDataSet;
    dsSql: TDataSource;
    procedure btnExecutarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecutarComando: TfrmExecutarComando;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmExecutarComando.btnExecutarClick(Sender: TObject);
begin
  if UpperCase(copy(Memo1.Text, 1,6)) = 'SELECT' then
  begin
     cdsSql.Close;
     QSql.SQL.Text := Memo1.Text;
     cdsSql.Open;
  end
  else
    dm.BancoDados.ExecuteDirect(Memo1.Text);
end;

procedure TfrmExecutarComando.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
