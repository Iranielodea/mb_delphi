unit uVersao;

interface

uses SysUtils, SqlExpr, Dialogs;

type
  TVersao = class
  private
  public
    procedure AtualizarVersao(Conexao: TSQLConnection; VersaoAtual: Integer);
  end;

implementation

{ TVersao }

procedure TVersao.AtualizarVersao(Conexao: TSQLConnection;
  VersaoAtual: Integer);
var
  Arq: Text;
  Reg: string;
  lista: TStringBuilder;
  VersaoBanco: Integer;
  MudouVersao: Boolean;
  sArquivo: string;
begin

  sArquivo := 'Versao.sql';
  if not FileExists(sArquivo) then
    Exit;

  VersaoBanco := VersaoAtual;
  MudouVersao := False;
  VersaoAtual := 0;

  AssignFile(Arq, sArquivo);
  Reset(Arq);

  lista := TStringBuilder.Create;
  while not Eof(Arq) do
  begin
    Readln(Arq, Reg);
    if Trim(Reg) = '' then
      Continue;

    if (Copy(Reg, 4, 6) = 'versao') then
      VersaoAtual := StrToIntDef(trim(Copy(Reg, 11,5)),0);

    if VersaoAtual > VersaoBanco then
    begin
      if Copy(Reg, 1, 4) = '--==' then
      begin
        Conexao.ExecuteDirect(lista.ToString);
        lista.Clear;
        MudouVersao := True;
      end
      else
        lista.AppendLine(Reg);
    end;
  end;
  FreeAndNil(lista);
  CloseFile(Arq);

  if MudouVersao then
    ShowMessage('Versão Atualizada.' + #10 + 'Versão Atual: ' + IntToStr(VersaoAtual));
end;

end.
