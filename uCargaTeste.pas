unit uCargaTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  uDM, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  Vcl.ExtCtrls, Vcl.Buttons, uDMRegra;

type
  TfrmCargaTeste = class(TForm)
    dbgrd1: TDBGrid;
    btn1: TButton;
    btn2: TButton;
    QExe1: TSQLQuery;
    dspExemplo: TDataSetProvider;
    cdsExemplo: TClientDataSet;
    dsExemplo1: TDataSource;
    lbledtId: TLabeledEdit;
    Label1: TLabel;
    QExe2: TSQLQuery;
    QExe3: TSQLQuery;
    btn3: TBitBtn;
    QExe4: TSQLQuery;
    btn4: TBitBtn;
    QExe5: TSQLQuery;
    btn5: TBitBtn;
    QExe6: TSQLQuery;
    btn6: TBitBtn;
    lbledtNumPedido: TLabeledEdit;
    btn7: TBitBtn;
    Label2: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
  private
    { Private declarations }
    procedure Carregar(var Qry: TSQLQuery);
  public
    { Public declarations }
  end;

var
  frmCargaTeste: TfrmCargaTeste;

implementation

{$R *.dfm}

procedure TfrmCargaTeste.btn1Click(Sender: TObject);
begin
  Carregar(QExe1);
end;

procedure TfrmCargaTeste.btn2Click(Sender: TObject);
begin
  Carregar(QExe2);
end;

procedure TfrmCargaTeste.btn3Click(Sender: TObject);
begin
  Carregar(QExe3);
end;

procedure TfrmCargaTeste.btn4Click(Sender: TObject);
begin
  Carregar(QExe4);
end;

procedure TfrmCargaTeste.btn5Click(Sender: TObject);
begin
  Carregar(QExe5);
end;

procedure TfrmCargaTeste.btn6Click(Sender: TObject);
begin
  Carregar(QExe6);
end;

procedure TfrmCargaTeste.btn7Click(Sender: TObject);
begin
  dmRegra.Saldo_Carga(lbledtId.Text, lbledtNumPedido.Text);
  ShowMessage('saldo realizado com sucesso');
end;

procedure TfrmCargaTeste.Carregar(var Qry: TSQLQuery);
begin
  dspExemplo.DataSet := Qry;

  cdsExemplo.Close;
  Qry.Params[0].AsInteger := 1;
  Qry.Params[1].AsInteger := StrToInt(lbledtId.Text);
  cdsExemplo.Open;

end;

end.
