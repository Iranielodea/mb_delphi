unit uIMotorista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfIMotorista = class(TForm)
    GrRelatorio: TGroupBox;
    RRelacao: TRadioButton;
    RAniver: TRadioButton;
    SpeedButton1: TSpeedButton;
    Cod_Cidade: TMaskEdit;
    Desc_Cidade: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    MesInicial: TMaskEdit;
    MesFinal: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    Cod_Trans: TMaskEdit;
    Nome_Trans: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    TonIni: TEdit;
    TonFim: TEdit;
    procedure butSairClick(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure Desc_CidadeEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Nome_TransExit(Sender: TObject);
    procedure Nome_TransEnter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TonIniExit(Sender: TObject);
    procedure TonFimExit(Sender: TObject);
  private
    { Private declarations }
    function ValidaTonelagem(Campo: string): string;
  public
    { Public declarations }
  end;

var
  fIMotorista: TfIMotorista;

implementation

uses uDMRegra, uDM, uCidade, uRMotorista, uTransportador, UUtil;

{$R *.dfm}

procedure TfIMotorista.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfIMotorista.Desc_CidadeExit(Sender: TObject);
begin
   if Desc_Cidade.Modified then
   begin
      dmRegra.PesquisaCidade(Desc_Cidade.Text);
      Cod_Cidade.Text:=dm.CidadeCOD_CIDADE.Text;
      Desc_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.Cidade.Close;
      fCidade.Free;
      Desc_Cidade.Modified:=false;
   end;
end;

procedure TfIMotorista.Desc_CidadeEnter(Sender: TObject);
begin
   Desc_Cidade.Modified := false;
end;

procedure TfIMotorista.SpeedButton1Click(Sender: TObject);
begin
   if dmRegra.PesquisaCidade('') = true then
   begin
      COD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      DESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfIMotorista.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;

end;

procedure TfIMotorista.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      vk_Escape: close;
   end;
end;

procedure TfIMotorista.butImprimirClick(Sender: TObject);
var
   vlMesIni,
   vlMesFin: Tdate;

begin
   if RAniver.Checked then
   begin
      try
         vlMesIni := strtoDate('01/' + MesInicial.Text + '/1900');
         vlMesFin := strtoDate('01/' + MesFinal.Text + '/1900');
      except
         showMessage('Data Inválida');
         MesInicial.SetFocus;
         exit;
      end;
   end;

   frMotorista := TfRMotorista.Create(self);
   with fRMotorista do
   begin
      if RRelacao.Checked then
      begin
         if PreparaExtenso(TonIni.Text) > 0 then
         begin
            if preparaExtenso(TonIni.Text) > PreparaExtenso(TonFim.text) then
            begin
               Mensagem('Tonelada inicial maior que tonelada Final');
               fRMotorista.free;
               exit;
            end;
         end;

         Mot.Close;
         Qmot.SQL.Add(' where MOT.COD_EMPRESA > 0 ');
         if Cod_Cidade.text <> '' then
            Qmot.SQL.Add(' and MOT.COD_CIDADE = ' + Cod_Cidade.Text);

         if (PreparaExtenso(TonIni.Text) + PreparaExtenso(TonFim.Text)) > 0 then
            Qmot.SQL.Add(' and MOT.TONELAGEM between ' + ValorAmericano(TonIni.text) + ' and ' + ValorAmericano(TonFim.text));

         Qmot.SQL.Add(' order by CID.DESC_CIDADE, MOT.COD_CIDADE, MOT.NOME');
         Mot.Open;
         Rel01.Print;
         Mot.Close;
      end;

      if RAniver.Checked then
      begin
         Aniver.Close;
         QAniver.SQL.Add(' where EXTRACT(MONTH FROM MOT.DATANASC) >= ' + MesInicial.text);
         QAniver.SQL.Add(' and EXTRACT(MONTH FROM MOT.DATANASC) <= ' + MesFinal.Text);
         if Cod_Cidade.text <> '' then
            Qaniver.SQL.Add(' and MOT.COD_CIDADE = ' + Cod_Cidade.Text);
         if Cod_Trans.Text <> '' then
            Qaniver.SQL.Add(' and MOT.COD_TRANS = ' + Cod_Trans.Text);
         Qaniver.SQL.Add(' and MOT.DATANASC IS NOT NULL');
         Qaniver.SQL.Add(' order by 2, MOT.DATANASC');
         Aniver.Open;

         Rel02.Print;

         Aniver.Close;
      end
   end;
   fRMotorista.Free;
end;

procedure TfIMotorista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action := cafree;
end;

procedure TfIMotorista.Nome_TransExit(Sender: TObject);
begin
   if Nome_Trans.Modified then
   begin
      dmRegra.PesquisaTransportador(Nome_Trans.Text);
      COD_TRANS.Text:=dm.TransportadorCOD_TRANS.Text;
      NOME_TRANS.Text:=dm.TransportadorNOME.Text;
      dm.Transportador.Close;
      fTransportador.Free;
      
   end;

end;

procedure TfIMotorista.Nome_TransEnter(Sender: TObject);
begin
   Nome_Trans.Modified:=false;
end;

procedure TfIMotorista.SpeedButton2Click(Sender: TObject);
begin
   if dmRegra.PesquisaTransportador('') = true then
   begin
      COD_TRANS.Text:=dm.TransportadorCOD_TRANS.text;
      NOME_TRANS.Text:=dm.TransportadorNOME.Text;
   end;
   dm.Transportador.Close;
   fTransportador.Free;
end;

procedure TfIMotorista.FormCreate(Sender: TObject);
begin
   MesInicial.Text := formatDateTime('mm',Date);
   MesFinal.Text := formatDateTime('mm',Date);
end;

function TfIMotorista.ValidaTonelagem(Campo: string): string;
begin
   try
      result := formatfloat(',##0.000', PreparaExtenso(Campo));
   Except
      result := '0,000';
   end;
end;

procedure TfIMotorista.TonIniExit(Sender: TObject);
begin
   TonIni.Text := ValidaTonelagem(TonIni.Text);
end;

procedure TfIMotorista.TonFimExit(Sender: TObject);
begin
   TonFim.Text := ValidaTonelagem(TonFim.Text);
end;

end.
