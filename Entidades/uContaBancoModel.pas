unit uContaBancoModel;

interface

uses
  System.Classes, UUtil;

type
  TContaBancoModel = class
  private
    FId: Integer;
    FCodigo: Integer;
    FNumConta: string;
    FAgencia: string;
    FNomeBanco: string;
    FAtivo: string;
    FCnpjCpf: string;
    function GetNomeBanco: string;
    function GetNumConta: string;
    function GetAgencia: string;
  public
    property Id: Integer read Fid write fid;
    property Codigo: Integer read FCodigo write FCodigo;
    property NumConta: string read GetNumConta write FNumConta;
    property Agencia: string read GetAgencia write FAgencia;
    property NomeBanco: string  read GetNomeBanco write FNomeBanco;
    property Ativo: string  read FAtivo write FAtivo;
    property CnpjCpf: string  read FCnpjCpf write FCnpjCpf;
  end;

implementation

{ TContaBancoModel }

function TContaBancoModel.GetAgencia: string;
begin
  Result := TiraAcento(FAgencia);
end;

function TContaBancoModel.GetNomeBanco: string;
begin
  Result := TiraAcento(FNomeBanco);
end;

function TContaBancoModel.GetNumConta: string;
begin
  Result := TiraAcento(FNumConta);
end;

end.
