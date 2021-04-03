unit uContaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBase, DB, DBCtrls, Mask, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, uClassContaBanco, uDMContaBanco, uContaBancoModel,
  uServicoContaBanco, System.Generics.Collections,
  uServicoConta, uContaModel, uCargaModel, uServicoCarga, UUtil,
  uRepositorioContaBanco;

type
  TfContaBanco = class(TfBase)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure butPesqClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FPesquisa: Boolean;
    procedure GetConta();
  public
    { Public declarations }
    constructor create(APesquisa: Boolean = False); overload;
  end;

var
  fContaBanco: TfContaBanco;

implementation

uses uDM, uDMRegra;

{$R *.dfm}

procedure TfContaBanco.butOkClick(Sender: TObject);
var
  bIncluindo: Boolean;
  lContaBanco: TdmContaBanco;
  servico: TServicoContaBanco;
  lista: TObjectList<TContaBancoModel>;
begin
  bIncluindo := (dm.ContaBanco.State = dsInsert);
  inherited;

  lista := TObjectList<TContaBancoModel>.Create();
  servico := TServicoContaBanco.Create;
  try
    lista.Add(servico.ObterPorCodigo(dm.ContaBancoID_CONTABANCO.AsInteger));

    if bIncluindo then
      servico.Incluir(lista)
    else
      servico.Alterar(lista);
  finally
    FreeAndNil(servico);
    FreeAndNil(lista);
  end;

//  if bIncluindo then
//  begin
//    lContaBanco := TdmContaBanco.Create(Self);
//    try
//      lContaBanco.ExportarNuvem(dm.ContaBancoID_CONTABANCO.AsInteger);
//    finally
//      FreeAndNil(lContaBanco);
//    end;
//  end;
end;

procedure TfContaBanco.butPesqClick(Sender: TObject);
begin
  GetConta();
end;

constructor TfContaBanco.create(APesquisa: Boolean);
begin
  inherited create(nil);
  FPesquisa := APesquisa;
end;

procedure TfContaBanco.FormActivate(Sender: TObject);
begin
   dm.Tamanho_Form(fContaBanco);
   TabSheet1.TabVisible:=false;
   GetConta();
  //inherited;
end;

procedure TfContaBanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (vgUsuario <> 'SUPERVISOR') then
    dmRegra.ExportarContaBancoWEB();
end;

procedure TfContaBanco.GetConta;
var
  obj: TContaBanco;
  sPesquisa: string;
begin
//  inherited;
  sPesquisa := 'T';
  if FPesquisa then
    sPesquisa := 'S';

  obj := TContaBanco.Create;
  try
    obj.GetNumConta(EditNome.Text, sPesquisa, ROpcao.ItemIndex);
  finally
    FreeAndNil(obj);
  end;
end;

end.
