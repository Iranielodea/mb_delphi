unit uFuncoesJSON;

interface

uses
  System.SysUtils, REST.Json;

type

  TMsgJson = class
  private
    FMensagem: string;
  public
    property Mensagem: string read FMensagem write FMensagem;
  end;

  TFuncoesJSON = class
  public
    class procedure MensagemJson(AJson: string);
  end;

implementation

{ TFuncoesJSON }

class procedure TFuncoesJSON.MensagemJson(AJson: string);
var
  Msg: TMsgJson;
begin
    Msg := TMsgJson.Create;
    try
      Msg := TJson.JsonToObject<TMsgJson>(AJson);
      if Msg.Mensagem <> 'OK' then
        raise Exception.Create('Erro: ' + Msg.Mensagem);
    finally
      FreeAndNil(Msg);
    end;
end;

end.
