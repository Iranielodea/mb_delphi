unit uUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfUnidade = class(TfBase)
    Label4: TLabel;
    Sigla: TDBEdit;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    btnTexto: TSpeedButton;
    procedure butOkClick(Sender: TObject);
    procedure btnTextoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUnidade: TfUnidade;

implementation

uses uDM, UUtil, uUnidadeTexto;

{$R *.dfm}

procedure TfUnidade.btnTextoClick(Sender: TObject);
var
  lForm: TFUnidadeTexto;
begin
  inherited;
  lForm := TFUnidadeTexto.Create(Self);
  try
    lForm.TipoCad.Text:='P';
    if lForm.ShowModal = mrOk then
    begin
      dm.ModoEdicao(dsCad);
      dm.UnidadeID_TEXTO.AsInteger := dm.UnidadeTextoID.AsInteger;
      dm.UnidadeOBSERVACAO.AsString := dm.UnidadeTextoOBSERVACAO.AsString;
    end;
  finally
    FreeAndNil(lForm);
  end;
end;

procedure TfUnidade.butOkClick(Sender: TObject);
begin
   if trim(Sigla.Text) = '' then
   begin
      Mensagem('Informe a Sigla');
      Sigla.SetFocus;
   end;
  inherited;
end;

end.
