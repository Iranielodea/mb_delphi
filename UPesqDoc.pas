unit UPesqDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, FMTBcd, DB,
  DBClient, Provider, SqlExpr;

type
  TfPesqDoc = class(TForm)
    Grade: TDBGrid;
    Panel1: TPanel;
    butOk: TBitBtn;
    butSair: TBitBtn;
    QPesq: TSQLQuery;
    dspPesq: TDataSetProvider;
    Pesq: TClientDataSet;
    dsPesq: TDataSource;
    NumDoc: TEdit;
    PesqDOCUMENTO: TStringField;
    PesqDATA_EMISSAO: TSQLTimeStampField;
    PesqID_CONTA: TIntegerField;
    PesqCOD_CLIENTE: TIntegerField;
    PesqNOME: TStringField;
    Tipo_Conta: TEdit;
    PesqNOME_FOR: TStringField;
    PesqCOD_FOR: TIntegerField;
    PesqDATA_VENCTO: TSQLTimeStampField;
    procedure butSairClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dsPesqStateChange(Sender: TObject);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GradeDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPesqDoc: TfPesqDoc;

implementation

uses uDM;

{$R *.dfm}

procedure TfPesqDoc.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfPesqDoc.butOkClick(Sender: TObject);
begin
   Close;
   ModalResult:=mrOk;
end;

procedure TfPesqDoc.FormActivate(Sender: TObject);
begin
   if Tipo_Conta.text = '3' then
   begin
      Grade.Columns[3].Title.Caption:='Fornecedor';
      Grade.Columns[3].FieldName:='NOME_FOR';
   end;
   Pesq.Close;
   Pesq.Params[0].Text:=Tipo_Conta.Text;
   Pesq.Params[1].Text:=NumDoc.Text;
   Pesq.Open;
end;

procedure TfPesqDoc.dsPesqStateChange(Sender: TObject);
begin
   butOk.Enabled:=not Pesq.IsEmpty;
end;

procedure TfPesqDoc.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Return then
   begin
      butOkClick(self);
      exit;
   end;
   if key = vk_Escape then
      close;
end;

procedure TfPesqDoc.GradeDblClick(Sender: TObject);
begin
   butOkClick(self);
end;

end.
