unit uCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons;

type
  TfCidade = class(TfBase)
    Label4: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    ID_Estado: TDBEdit;
    Desc_Estado: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure butPesqClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ID_EstadoExit(Sender: TObject);
    procedure Desc_EstadoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisaEstado(Tipo: string);
  end;

var
  fCidade: TfCidade;

implementation

uses uDM, uEstado, UUtil;

{$R *.dfm}

procedure TfCidade.butPesqClick(Sender: TObject);
begin
  inherited;
end;

{ TfCidade }

procedure TfCidade.PesquisaEstado(Tipo: string);
var vreg: integer;
begin
   dm.ModoEdicao(dsCad);
   if (ID_Estado.Modified = false) and (Desc_Estado.Modified = false) then
      exit;
   if ((ID_Estado.Text = '') and (Tipo = 'C')) or ((Desc_Estado.Text = '') and (Tipo = 'D')) then
   begin
      dm.CidadeID_ESTADO.Clear;
      dm.CidadeSIGLA.Clear;
      ID_Estado.Modified:=false;
      Desc_Estado.Modified:=false;
      exit;
   end;
   if Tipo = 'C' then
      ComandoQSql('select ID_ESTADO, SIGLA from ESTADO where ID_ESTADO = '+ID_Estado.Text)
   else
      ComandoQSql('select ID_ESTADO, SIGLA from ESTADO where SIGLA like  '''+Desc_Estado.Text+'%''');
   vreg:=dm.Conta_Reg(dm.Qsql);
   if vreg = 1 then
   begin
      dm.CidadeID_ESTADO.Text:=dm.Qsql.Fields[0].Text;
      dm.CidadeSIGLA.Text:=dm.Qsql.Fields[1].Text;
   end
   else begin
      fEstado:=TfEstado.create(Self);
      fEstado.TipoCad.Text:='P';
      if Tipo = 'D' then
         fEstado.EditNome.Text:=Desc_Estado.Text;
      if fEstado.ShowModal = mrOk then
      begin
         dm.CidadeID_ESTADO.Text:=dm.EstadoID_ESTADO.text;
         dm.CidadeSIGLA.Text:=dm.EstadoSIGLA.Text;
      end
      else begin
         dm.CidadeID_ESTADO.Clear;
         dm.CidadeSIGLA.Clear;
      end;
      dm.Estado.Close;
      fEstado.Free;
   end;
   dm.Qsql.close;
   ID_Estado.Modified:=false;
   Desc_Estado.Modified:=false;
end;

procedure TfCidade.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   fEstado:=TfEstado.create(Self);
   fEstado.TipoCad.Text:='P';
   if fEstado.ShowModal = mrOk then
   begin
      DM.ModoEdicao(dsCad);
      dm.CidadeID_ESTADO.Text:=dm.EstadoID_ESTADO.text;
      dm.CidadeSIGLA.Text:=dm.EstadoSIGLA.Text;
      ID_Estado.Modified:=false;
      Desc_Estado.Modified:=false;
   end;
   dm.Estado.Close;
   fEstado.Free;
end;

procedure TfCidade.ID_EstadoExit(Sender: TObject);
begin
  inherited;
   PesquisaEstado('C');
end;

procedure TfCidade.Desc_EstadoExit(Sender: TObject);
begin
  inherited;
   PesquisaEstado('D');
end;

procedure TfCidade.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fCidade);
  inherited;

end;

end.
