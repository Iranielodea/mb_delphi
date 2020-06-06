unit uTipoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfTipoFornecedor = class(TfBase)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTipoFornecedor: TfTipoFornecedor;

implementation

uses uDM;

{$R *.dfm}

procedure TfTipoFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  dm.Tamanho_Form(fTipoFornecedor);
end;

end.
