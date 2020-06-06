unit uVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfVendedor = class(TfBase)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVendedor: TfVendedor;

implementation

uses uDM, UUtil;

{$R *.dfm}

procedure TfVendedor.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fVendedor);
  inherited;

end;

end.
