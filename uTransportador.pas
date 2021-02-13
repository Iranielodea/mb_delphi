unit uTransportador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, DBClient;

type
  TfTransportador = class(TfBase)
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    cnpj: TDBEdit;
    Cod_Agencia: TDBEdit;
    Cod_Cidade: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Desc_Cidade: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Insc_Estadual: TDBEdit;
    EditEstado: TDBEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Desc_Agencia: TDBEdit;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label20: TLabel;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Label21: TLabel;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    Label22: TLabel;
    DBEdit11: TDBEdit;
    Label23: TLabel;
    DBEdit15: TDBEdit;
    Label24: TLabel;
    DBEdit16: TDBEdit;
    Label25: TLabel;
    DBEdit17: TDBEdit;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    Label27: TLabel;
    edtCPF: TDBEdit;
    Label28: TLabel;
    edtCpfTransp: TMaskEdit;
    Label29: TLabel;
    edtCNPJ: TMaskEdit;
    Label30: TLabel;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    Label31: TLabel;
    DBEdit19: TDBEdit;
    Label32: TLabel;
    DBEdit20: TDBEdit;
    procedure butOkClick(Sender: TObject);
    procedure cnpjExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Desc_CidadeExit(Sender: TObject);
    procedure Desc_AgenciaExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCPFExit(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure BuscarCPF;
    procedure BuscarCNPJ;
    procedure MostraSheet;
  public
    { Public declarations }
  end;

var
  fTransportador: TfTransportador;

implementation

uses uDM, uDMRegra, uCidade, UUtil, uAgenciador, udmTransportadora;

{$R *.dfm}

procedure TfTransportador.BuscarCNPJ;
var
  lTransp: TdmTransportadora;
begin
  if Trim(edtCNPJ.Text) <> '' then
  begin
    lTransp := TdmTransportadora.Create(Self);
    try
      EditNome.Text := lTransp.LocalizarCNPJ(StrToInt(vgCod_Empresa), edtCNPJ.Text);
    finally
      FreeAndNil(lTransp);
    end;
  end;
end;

procedure TfTransportador.BuscarCPF;
var
  lTransp: TdmTransportadora;
begin
  if Trim(edtCpfTransp.Text) <> '' then
  begin
    lTransp := TdmTransportadora.Create(Self);
    try
      EditNome.Text := lTransp.LocalizarCPF(StrToInt(vgCod_Empresa), edtCpfTransp.Text);
    finally
      FreeAndNil(lTransp);
    end;
  end;
end;

procedure TfTransportador.butOkClick(Sender: TObject);
var
  lTransp: TdmTransportadora;
begin
  if dmRegra.Valida_Inscricao_Estadual(Insc_Estadual.text,EditEstado.text) = false then
     Insc_Estadual.SetFocus;

  inherited;

  lTransp := TdmTransportadora.Create(Self);
  try
    lTransp.ExportarNuvem(dm.TransportadorCOD_TRANS.AsInteger);
  finally
    FreeAndNil(lTransp);
  end;

end;

procedure TfTransportador.butPesqClick(Sender: TObject);
var a: String;
begin

   BuscarCPF();
   BuscarCNPJ();

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

procedure TfTransportador.cnpjExit(Sender: TObject);
begin
  inherited;
   if cnpj.Modified then
   begin
      if Trim(cnpj.Text) = '' then
        Exit;

      if dmRegra.Valida_CNPJ(Cnpj.Text) = false then
      begin
         cnpj.SetFocus;
         exit;
      end;

      if Trim(cnpj.Text) <> '' then
      begin
         dmRegra.ComandoSql('select NOME from TRANSPORTADOR'
         +' where COD_EMPRESA = '+vgCod_Empresa
         +' and CNPJ = '''+cnpj.Text+''''
         +' and NOME <> '''+Nome.Text+''''
         );
         if not dm.Qsql.IsEmpty then
            showmessage('CNPJ já Cadastrado, Empresa: '+dm.Qsql.Fields[0].text);
         dm.Qsql.Close;
      end;
   end;
   cnpj.Modified:=false;
end;

procedure TfTransportador.MostraSheet;
begin
   if not sheetCad.Showing then
      sheetCad.Show;
end;

procedure TfTransportador.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fTransportador);
  inherited;
end;


procedure TfTransportador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmRegra.ExportarTransportadorWEB();
end;

procedure TfTransportador.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   if dmRegra.PesquisaCidade('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.TransportadorCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.text;
      dm.TransportadorDESC_Cidade.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.TransportadorCEP.Text:=dm.CidadeCEP.Text;
      dm.TransportadorSIGLA.Text:=dm.CidadeSIGLA.Text;
   end;
   dm.Cidade.Close;
   fCidade.Free;
end;

procedure TfTransportador.Desc_CidadeExit(Sender: TObject);
begin
  inherited;
   if Desc_Cidade.Modified then
   begin
      dmRegra.PesquisaCidade(Desc_Cidade.Text);
      dm.TransportadorCOD_CIDADE.Text:=dm.CidadeCOD_CIDADE.Text;
      dm.TransportadorDESC_CIDADE.Text:=dm.CidadeDESC_CIDADE.Text;
      dm.TransportadorCEP.Text:=dm.CidadeCEP.Text;
      dm.TransportadorSIGLA.Text:=dm.CidadeSIGLA.Text;
      dm.Cidade.Close;
      fCidade.Free;
      Desc_Cidade.Modified:=false;
   end;
end;

procedure TfTransportador.edtCPFExit(Sender: TObject);
begin
  inherited;
  if edtCPF.Modified then
  begin
    if dmRegra.Valida_CPF(edtCPF.Text) = False then
      edtCPF.SetFocus;
  end;
end;

procedure TfTransportador.Desc_AgenciaExit(Sender: TObject);
begin
  inherited;
   if Desc_Agencia.Modified then
   begin
      dmRegra.PesquisaAgenciador(Desc_Agencia.Text);
      dm.TransportadorCOD_AGENCIA.Text:=dm.AgenciadorCOD_AGENCIA.Text;
      dm.TransportadorNOME_AGENCIADOR.Text:=dm.AgenciadorNOME.Text;
      dm.Agenciador.Close;
      fAgenciador.Free;
      Desc_Agencia.Modified:=false;
   end;
end;

procedure TfTransportador.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   if dmRegra.PesquisaAgenciador('') = true then
   begin
      DM.ModoEdicao(dsCad);
      dm.TransportadorCOD_AGENCIA.Text:=dm.AgenciadorCOD_AGENCIA.text;
      dm.TransportadorNOME_AGENCIADOR.Text:=dm.AgenciadorNOME.Text;
   end;
   dm.Agenciador.Close;
   fAgenciador.Free;
end;

procedure TfTransportador.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if key = 8 then
   begin
      dm.ModoEdicao(dsCad);
      dm.TransportadorDATANASC.Clear;
   end;
end;

end.
