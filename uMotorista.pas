unit uMotorista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, DBClient;

type
  TfMotorista = class(TfBase)
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Cod_Cidade: TDBEdit;
    Cod_Trans: TDBEdit;
    Desc_Cidade: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Desc_Trans: TDBEdit;
    editEstado: TDBEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label15: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    edtCPF: TMaskEdit;
    Label24: TLabel;
    dbedtCNH: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Desc_TransExit(Sender: TObject);
    procedure Desc_TransEnter(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
  private
    { Private declarations }
    procedure MostraSheet;
    procedure BuscarCPF;
  public
    { Public declarations }
  end;

var
  fMotorista: TfMotorista;

implementation

uses uDM, uDMRegra, uCidade, UUtil, uTransportador, udmMotorista;

{$R *.dfm}

procedure TfMotorista.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fMotorista);
  inherited;

end;


procedure TfMotorista.MostraSheet;
begin
   if not sheetCad.Showing then
      sheetCad.Show;
end;

procedure TfMotorista.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   if dmRegra.PesquisaCidade('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.MotoristaCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      dm.MotoristaDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.MotoristaCEP.Text:=dm.CidadeCEP.Text;
      dm.MotoristaSIGLA.Text:=dm.CidadeSIGLA.Text;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfMotorista.BuscarCPF;
var
  lMotorista: TdmMotorista;
begin
  if Trim(EdtCPF.Text) <> '' then
  begin
    lMotorista := TdmMotorista.Create(Self);
    try
      EditNome.Text := lMotorista.LocalizarCPF(StrToInt(vgCod_Empresa), EdtCPF.Text);
    finally
      FreeAndNil(lMotorista);
    end;
  end;
end;

procedure TfMotorista.butPesqClick(Sender: TObject);
var a: String;
begin

   BuscarCPF();

   a:=''+EditNome.Text+'%';
   if ROpcao.ItemIndex = 1 then
      a:='%'+EditNome.Text+'%';
   try
      dm.Get_Codigo((dsCad.DataSet as TClientDataSet),a);
   except
      (dsCad.DataSet as TClientDataSet).Close;
      (dsCad.DataSet as TClientDataSet).Params[0].Text:=vgCod_Empresa;
      (dsCad.DataSet as TClientDataSet).Open;
   end;
   MostraSheet;
   Grade.SetFocus;
end;

procedure TfMotorista.Desc_CidadeExit(Sender: TObject);
begin
  inherited;
   if Desc_Cidade.Modified then
   begin
      dmRegra.PesquisaCidade(Desc_Cidade.Text);
      dm.MotoristaCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.Text;
      dm.MotoristaDESC_CIDADE.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.MotoristaCEP.Text:=dm.CidadeCEP.Text;
      dm.MotoristaSIGLA.Text:=dm.CidadeSIGLA.Text;
      dm.Cidade.Close;
      fCidade.Free;
      Desc_Cidade.Modified:=false;
   end;
end;

procedure TfMotorista.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   if dmRegra.PesquisaTransportador('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.MotoristaCOD_TRANS.Text:=dm.TransportadorCOD_TRANS.text;
      dm.MotoristaNOME_TRANS.Text:=dm.TransportadorNOME.Text;
   end;
   dm.Transportador.Close;
   fTransportador.Free;
end;

procedure TfMotorista.Desc_TransExit(Sender: TObject);
begin
  inherited;
   if Desc_Trans.Modified then
   begin
      dmRegra.PesquisaTransportador(Desc_Trans.Text);
      dm.MotoristaCOD_TRANS.Text:=dm.TransportadorCOD_TRANS.Text;
      dm.MotoristaNOME_TRANS.Text:=dm.TransportadorNOME.Text;
      dm.Transportador.Close;
      fTransportador.Free;
      Desc_Trans.Modified:=false;
   end;
end;

procedure TfMotorista.Desc_TransEnter(Sender: TObject);
begin
  inherited;
   Desc_Trans.Modified:=false;
end;

end.
