unit uEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfEstado = class(TfBase)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstado: TfEstado;

implementation

uses uDM;

{$R *.dfm}

procedure TfEstado.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fEstado);
  inherited;
end;

end.
