unit uForma_Pagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfForma_Pagto = class(TfBase)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fForma_Pagto: TfForma_Pagto;

implementation

uses uDM;

{$R *.dfm}

procedure TfForma_Pagto.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fForma_Pagto);
  inherited;
end;

end.
