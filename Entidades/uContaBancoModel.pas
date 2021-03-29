unit uContaBancoModel;

interface

uses
  System.Classes;

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
  public
    property Id: Integer read Fid write fid;
    property Codigo: Integer read FCodigo write FCodigo;
    property NumConta: string read FNumConta write FNumConta;
    property Agencia: string read FAgencia write FAgencia;
    property NomeBanco: string  read FNomeBanco write FNomeBanco;
    property Ativo: string  read FAtivo write FAtivo;
    property CnpjCpf: string  read FCnpjCpf write FCnpjCpf;
  end;

implementation

end.
