unit uEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfEmpresa = class(TfBase)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmpresa: TfEmpresa;

implementation

uses uDM;

{$R *.dfm}

procedure TfEmpresa.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fEmpresa);
  inherited;
end;

end.
