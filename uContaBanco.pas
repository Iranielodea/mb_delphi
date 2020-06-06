unit uContaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, uClassContaBanco;

type
  TfContaBanco = class(TfBase)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
  private
    { Private declarations }
    FPesquisa: Boolean;
    procedure GetConta();
  public
    { Public declarations }
    constructor create(APesquisa: Boolean = False); overload;
  end;

var
  fContaBanco: TfContaBanco;

implementation

uses uDM;

{$R *.dfm}

procedure TfContaBanco.butPesqClick(Sender: TObject);
begin
  GetConta();
end;

constructor TfContaBanco.create(APesquisa: Boolean);
begin
  inherited create(nil);
  FPesquisa := APesquisa;
end;

procedure TfContaBanco.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fContaBanco);
   TabSheet1.TabVisible:=false;
   GetConta();
  //inherited;
end;

procedure TfContaBanco.GetConta;
var
  obj: TContaBanco;
  sPesquisa: string;
begin
//  inherited;
  sPesquisa := 'T';
  if FPesquisa then
    sPesquisa := 'S';

  obj := TContaBanco.Create;
  try
    obj.GetNumConta(EditNome.Text, sPesquisa, ROpcao.ItemIndex);
  finally
    FreeAndNil(obj);
  end;
end;

end.
