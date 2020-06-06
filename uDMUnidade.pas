unit uDMUnidade;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TdmUnidade = class(TDataModule)
    QUnidade: TSQLQuery;
    QUnidadeDESC_UNIDADE: TStringField;
    QUnidadeDesc: TSQLQuery;
    QUnidadeDescID_UNIDADE: TIntegerField;
    QUnidadeDescCOMPL_UNIDADE: TStringField;
    QUnidadeSIGLA: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    FId: integer;
    FComplemento: string;
    FDescricao: string;
    FSigla: string;
    { Private declarations }
  public
    { Public declarations }
    procedure ListarTodos(CodEmpresa: integer);
    procedure LocalizarDescricao(CodEmpresa: Integer; Descricao: string);

    property Id: integer read FId write FId;
    property Complemento: string read FComplemento write FComplemento;
    property Descricao: string read FDescricao write FDescricao;
    property Sigla: string read FSigla write FSigla;
  end;

var
  dmUnidade: TdmUnidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUnidade }

procedure TdmUnidade.DataModuleDestroy(Sender: TObject);
begin
  QUnidade.Close;
end;

procedure TdmUnidade.ListarTodos(CodEmpresa: integer);
begin
  QUnidade.Close;
  QUnidade.ParamByName('CODEMPRESA').AsInteger := CodEmpresa;
  QUnidade.Open;

  FDescricao := QUnidadeDESC_UNIDADE.AsString;
end;

procedure TdmUnidade.LocalizarDescricao(CodEmpresa: Integer; Descricao: string);
begin
  QUnidadeDesc.Close;
  QUnidadeDesc.Params[0].AsInteger := CodEmpresa;
  QUnidadeDesc.Params[1].AsString := Descricao;
  QUnidadeDesc.Open;

  FId := QUnidadeDescID_UNIDADE.AsInteger;
  FComplemento := QUnidadeDescCOMPL_UNIDADE.AsString;

end;

end.
