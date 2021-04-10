unit uFornecedorModel;

interface

uses
  System.SysUtils, UUtil;

type
  TFornecedorModel = class
  private
    FFone: string;
    FObs: string;
    FCNPJ: string;
    FFantasia: string;
    FEmail: string;
    FBairro: string;
    FFax: string;
    FUF: string;
    FCodigo: Integer;
    FInscEstadual: string;
    FCep: string;
    FId: Integer;
    FNumero: string;
    FComplemento: string;
    FNomeCidade: string;
    FNome: string;
    FEndereco: string;
    procedure SetBairro(const Value: string);
    procedure SetCep(const Value: string);
    procedure SetCNPJ(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetComplemento(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetFantasia(const Value: string);
    procedure SetFax(const Value: string);
    procedure SetFone(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetInscEstadual(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomeCidade(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetObs(const Value: string);
    procedure SetUF(const Value: string);
    function GetNome: string;
    function GetFantasia: string;
    function GetEndereco: string;
    function GetNumero: string;
    function GetComplemento: string;
    function GetBairro: string;
    function GetNomeCidade: string;
    function GetObs: string;
  public
    property Id: Integer read FId write SetId;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property Fantasia: string read GetFantasia write SetFantasia;
    property Endereco: string read GetEndereco write SetEndereco;
    property Numero: string read GetNumero write SetNumero;
    property Complemento: string read GetComplemento write SetComplemento;
    property Bairro: string read GetBairro write SetBairro;
    property NomeCidade: string read GetNomeCidade write SetNomeCidade;
    property Cep: string read FCep write SetCep;
    property UF: string read FUF write SetUF;
    property CNPJ: string read FCNPJ write SetCNPJ;
    property InscEstadual: string read FInscEstadual write SetInscEstadual;
    property Email: string read FEmail write SetEmail;
    property Fone: string read FFone write SetFone;
    property Fax: string read FFax write SetFax;
    property Obs: string read GetObs write SetObs;
  end;

implementation

{ TFornecedorModel }

function TFornecedorModel.GetBairro: string;
begin
  Result := TiraAcento(FBairro);
end;

function TFornecedorModel.GetComplemento: string;
begin
  Result := TiraAcento(FComplemento);
end;

function TFornecedorModel.GetEndereco: string;
begin
  Result := TiraAcento(FEndereco);
end;

function TFornecedorModel.GetFantasia: string;
begin
  Result := TiraAcento(FFantasia)
end;

function TFornecedorModel.GetNome: string;
begin
    Result := TiraAcento(FNome);
end;

function TFornecedorModel.GetNomeCidade: string;
begin
  Result := TiraAcento(FNomeCidade);
end;

function TFornecedorModel.GetNumero: string;
begin
  Result := TiraAcento(FNumero);
end;

function TFornecedorModel.GetObs: string;
begin
  Result := TiraAcento(FObs);
end;

procedure TFornecedorModel.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TFornecedorModel.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TFornecedorModel.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TFornecedorModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TFornecedorModel.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TFornecedorModel.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TFornecedorModel.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TFornecedorModel.SetFantasia(const Value: string);
begin
  FFantasia := Value;
end;

procedure TFornecedorModel.SetFax(const Value: string);
begin
  FFax := Value;
end;

procedure TFornecedorModel.SetFone(const Value: string);
begin
  FFone := Value;
end;

procedure TFornecedorModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TFornecedorModel.SetInscEstadual(const Value: string);
begin
  FInscEstadual := Value;
end;

procedure TFornecedorModel.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFornecedorModel.SetNomeCidade(const Value: string);
begin
  FNomeCidade := Value;
end;

procedure TFornecedorModel.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TFornecedorModel.SetObs(const Value: string);
begin
  FObs := Value;
end;

procedure TFornecedorModel.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
