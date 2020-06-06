unit uItensLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TfItensLista = class(TForm)
    DBRadioGroup1: TDBRadioGroup;
    dsCad: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fItensLista: TfItensLista;

implementation

uses uDM;

{$R *.dfm}

end.
