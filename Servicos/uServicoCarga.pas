unit uServicoCarga;

interface

uses
  System.SysUtils, uCargaModel,Data.DBXJSON, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IPPeerClient, REST.Types,
  udmParametros, uFuncoesJSON;

type
  TServicoCarga = class
  private
    FUrlBase: string;
    procedure Gravar(ATipo: Integer; AModel: TCargaModel);
  public
    procedure Incluir(AModel: TCargaModel);
    procedure Alterar(AModel: TCargaModel);
    constructor Create(); overload;
  end;


implementation

{ TServicoCarga }

procedure TServicoCarga.Alterar(AModel: TCargaModel);
begin
  Gravar(1, AModel);
end;

constructor TServicoCarga.Create;
var
  parametro: TdmParametros;
begin
  parametro := TdmParametros.Create(nil);
  try
    FUrlBase := parametro.URLBase();
  finally
    FreeAndNil(parametro);
  end;
end;

procedure TServicoCarga.Gravar(ATipo: Integer; AModel: TCargaModel);
begin

end;

procedure TServicoCarga.Incluir(AModel: TCargaModel);
begin
  Gravar(0, AModel);
end;

end.
