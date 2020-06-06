unit uICliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfICliente = class(TForm)
    Label1: TLabel;
    Cod_Cidade: TMaskEdit;
    Desc_Cidade: TEdit;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    butImprimir: TBitBtn;
    butSair: TBitBtn;
    GroupBox1: TGroupBox;
    RAlfa: TRadioButton;
    RCidade: TRadioButton;
    REstado: TRadioButton;
    Label2: TLabel;
    Sigla: TEdit;
    Label3: TLabel;
    RAlfa1: TRadioButton;
    RAniver: TRadioButton;
    Label4: TLabel;
    MesInicial: TMaskEdit;
    Label5: TLabel;
    MesFinal: TMaskEdit;
    procedure butSairClick(Sender: TObject);
    procedure Desc_CidadeEnter(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fICliente: TfICliente;

implementation

uses uDMRegra, uDM, uCidade, uRCliente;

{$R *.dfm}

procedure TfICliente.butSairClick(Sender: TObject);
begin
   close;
end;

procedure TfICliente.Desc_CidadeEnter(Sender: TObject);
begin
   Desc_Cidade.Modified:=false;
end;

procedure TfICliente.Desc_CidadeExit(Sender: TObject);
begin
   if Desc_Cidade.Modified then
   begin
      dmRegra.PesquisaCidade(Desc_Cidade.Text);
      fCidade.free;
      Cod_Cidade.Text:=dm.CidadeCOD_CIDADE.Text;
      Desc_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.Cidade.Close;
   end;
end;

procedure TfICliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      key:=#0;
      perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfICliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      close;
end;

procedure TfICliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure TfICliente.SpeedButton1Click(Sender: TObject);
begin
   if dmRegra.PesquisaCidade(' ') = true then
   begin
      Cod_Cidade.Text:=dm.CidadeCOD_CIDADE.Text;
      Desc_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.Cidade.Close;
   end;
   fCidade.free;
end;

procedure TfICliente.butImprimirClick(Sender: TObject);
var
   vlMesIni,
   vlMesFin: TDate;

begin
   if RAniver.Checked then
   begin
      try
         vlMesIni := strtoDate('01/' + MesInicial.Text +'/1900');
         vlMesFin := strtoDate('01/' + MesFinal.Text +'/1900');
      except
         showmessage('Mês Inválido');
         MesInicial.SetFocus;
         exit;
      end;
   end;

   frCliente:=TfrCliente.create(self);
   with frCliente do
   begin

      if RAniver.Checked then
      begin
         Aniver.Close;
         QAniver.SQL.Add(' where EXTRACT(MONTH FROM CON.DATANASC) >= ' + MesInicial.Text);
         QAniver.SQL.Add(' and EXTRACT(MONTH FROM CON.DATANASC) <= ' + MesFinal.Text);
         QAniver.SQL.Add(' and CON.DATANASC is not null');
         QAniver.SQL.Add(' and CON.COD_EMPRESA = ' + vgCod_Empresa);
         QAniver.SQL.Add(' order by 1, CON.CONTATO');
         Aniver.Open;

         lblData05.Caption := 'Mês de: ' + MesInicial.Text + ' Até: ' + MesFinal.Text;
         Rel5.Print;
         Aniver.Close;

         free;
         exit;
      end;

      Cliente.Close;
      QCliente.SQL.add(' where CLI.COD_CLIENTE > 0');
      if Cod_Cidade.Text <> '' then
         QCliente.SQL.add(' and CLI.COD_CIDADE = '+Cod_Cidade.Text);
      if Sigla.Text <> '' then
         QCliente.SQL.add(' and UF.SIGLA = '''+Sigla.Text+'''');

      if (RAlfa.Checked) or (RAlfa1.Checked) then
         QCliente.SQL.add(' order by CLI.NOME');
      if RCidade.Checked then
         QCliente.SQL.add(' order by CID.DESC_CIDADE, CLI.NOME');
      if REstado.Checked then
         QCliente.SQL.add(' order by UF.SIGLA, CLI.NOME');
      Cliente.Open;

      if RAlfa.Checked then
         Rel1.Print;
      if RCidade.Checked then
         Rel2.Print;
      if REstado.Checked then
         Rel3.Print;
      if RAlfa1.Checked then
         Rel4.Print;
      Cliente.Close;
      free;
   end;
end;

procedure TfICliente.FormCreate(Sender: TObject);
begin
   MesInicial.Text := formatDateTime('mm',Date);
   MesFinal.Text := formatDateTime('mm',Date);
end;

end.
