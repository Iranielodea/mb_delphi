unit UUtil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ToolWin, ComCtrls, DB,
  IBCustomDataSet, IBQuery, ExtCtrls, Buttons, Mask, DBCtrls, IBDatabase, ppReport,
  Math, DBClient, SqlExpr, DateUtils, ShellApi;

type
   TConsisteInscricaoEstadual  = function (const Insc, UF: AnsiString): Integer; stdcall;

procedure TamanhoCampo(Formulario: TForm);
function Confirma(Texto: pchar; botao: string): Integer;
function Confirma3(Texto: pchar; botao: string): Integer;
procedure Erro(Mensagem: pchar);
procedure Mensagem(Texto: Pchar);
function DataErro(Data: string): string;
function FormatarValor(Valor,Tipo: string): string;
function FormatarValor2(Valor: double): string;
function DiasAtrazo(Data1,Data2: String): double;
function Zeros(vtaman: integer; vcampo: string): string;
function Espacos(vtaman: integer; vcampo: string): string;
function cic(Cpf: string): string;
function CGC(CGC: string): string;
//function CVal(Campo: string): double;
function CVal(Campo: string): string;
procedure Command(Tabela: TIBQuery; Comando: string);
procedure ComandoQuery(Tabela: TSQLQuery; Comando: string);
procedure ComandoExec(Tabela: TIBQuery; Comando: string);
function Conta_Registros (Tabela : TIBDataSet) : integer;
function Conta_Registros2 (Tabela : TIBQuery) : integer;
function Conta_Registros3(Tabela : TSQLQuery) : integer;
procedure ComprimentoCampo(Tabela: TIBDataSet; NomeTabela: string; Formulario: TForm);
procedure GravaZero(Tabela:TIBDataSet);
procedure GravaZeroDataSet(Tabela: TClientDataSet);
Procedure OpenTrans(Transacao: TIBTransaction);
Procedure PostTrans(Transacao: TIBTransaction);
Procedure CancTrans(Transacao: TIBTransaction);
Procedure FechaTrans(Transacao: TIBTransaction);
procedure TamanhoPagina(Relatorio: TppReport);
//procedure TamanhoPaginaQuick(Relatorio: TQuickRep);
//function Arredonda(valor: double): double;
//function Arredonda(valor: double; Decimal: string): double;
function Arredonda(Valor : Real ; Decimais : Byte) : Extended;
function DataIngles(Data: string): string;
function DataIngles2(Data: string): string;
function Manut(IAEC,TM: string): string;
function Acento(Campo: string): string;
procedure LimpaTela(Formulario: Tform);
procedure ImprimeDos(Impressora,tipo: string);
function SalvarInclusao(Texto: string): string;
function MensCod(Numero: integer): string;
function TiraCar(Campo,Caracter: string): string;
function TiraAcento(Campo: string): string;
procedure GravaTab(Tabela: TClientDataSet);
procedure procuraPadrao1(Tabela: TClientDataSet; Campo: string);

procedure IniciaTransacao(NomeTransacao: TIbTransaction);
procedure GravaTransacao(NomeTransacao: TIbTransaction; Tipo: string);
procedure CancelaTransacao(NomeTransacao: TIbTransaction; Tipo: string);

//procedure MostraCampos(Tabela: TIBQuery; NomeTabela: string; Formulario: Tform);
//procedure GravaDados(Tabela: TIBQuery; NomeTabela: string; Formulario: Tform);

function PreparaExtenso(Campo: string): double;
function Ext999(intValor: integer): string;
function Extenso(intValor: integer): string;
function MoedaExtenso(dblValor: double; stMoeda, stMoedas: string): string;
procedure ExtSinPlur(intValor: integer; stSing, stPlural: string; var stValor: string);

function InscEstadual(Inscricao,Estado: string): integer;
function InscEstadualNota(Inscricao,Estado: string): integer;
Function Arred (Num :Double; Decimal :Integer) : Double;
function Conta_Reg(Tabela: TClientDataSet): Integer;
function EspacoE(vtaman: integer; vcampo: string): string;
function Modulo10(vnumero: string): integer;
function Modulo11(vnumero,vtipo: string;vini,vfim:integer): integer;
function MensagemCad: string;

procedure VerificaAno(Data: string);
procedure Edicao(Tabela: TClientDataSet);
procedure Executa(Comando: string);
procedure TestaChave(erro: string);
procedure Comando(Tabela: TIBDataSet; Linha: string);
function TrocaCar(Campo, Antigo, Novo: string): string;
function ValidaDatas(Data_Inicial,Data_Final: string): boolean;
procedure Altera_Tab(comando: string);
function Qtde_Reg(Query: TSqlQuery): integer;
procedure ComandoQsql(Linha: string);
procedure PesquisaNome(Tabela: TClientDataSet; Nome: string);
procedure ExecutaSql(inSql: String);
function Casas2(Valor: double): double;
function Inicio_Mes(Data: String): string;
function Fim_Mes(Data: string): string;
function ExecutaArquivo(campo: string): string;
function FormataValor2(Valor: String): string;
function FormataInteiro(Valor: String): string;
function DataValida(Data: String): boolean;
function Rateio(ValorItem, ValorRatear, ValorBruto: Real): Real;
function ValidaCPF(CPF: String): boolean;
function ValorAmericano(Valor: string): string;

implementation

uses UDM;

function ValorAmericano(Valor: string): string;
var
   v1: string;
begin
   v1 := TiraCar(Valor,'.');
   v1 := TrocaCar(v1, ',', '.');
   result := v1;
end;

function ValidaCPF(CPF: String): boolean;
begin
   Result := True;
   if copy(CPF,1,1) = ' ' then
      Exit;

   if CIC(CPF) <> CPF then
   begin
      ShowMessage('CPF inválido!');
      Result := False;
   end;
end;

function Rateio(ValorItem, ValorRatear, ValorBruto: Real): Real;
var
   vlPerc, vlValor: real;
begin
   vlValor:=0;
   if ValorBruto > 0 then
   begin
      vlPerc:=(ValorRatear / ValorBruto) * 100;
      vlValor:=(ValorItem * vlPerc) / 100;
   end;
   result:=vlValor;
end;

function ExecutaArquivo(campo: string): string;
begin
   case ShellExecute(0,'open',PCHAR(campo),NIL,NIL,SW_MAXIMIZE) of
      0:	                     ExecutaArquivo:='Falta de memória para completar a operação...';
      ERROR_FILE_NOT_FOUND:   ExecutaArquivo:='Arquivo não econtrado !';
      ERROR_PATH_NOT_FOUND:   ExecutaArquivo:='Pasta não encontrada !';
      ERROR_BAD_FORMAT:	      ExecutaArquivo:='O arquivo .EXE não é valido, ele pode ser uma imagem, ou não é um aplicativo Win-32 !';
      SE_ERR_ACCESSDENIED:	   ExecutaArquivo:='Você não tem acesso ao arquivo especificado !';
      SE_ERR_ASSOCINCOMPLETE:	ExecutaArquivo:='O arquivo não é válido, seu nome pode estar incorreto !';
      SE_ERR_DDEBUSY:         ExecutaArquivo:='A transação do DDE não poderirá ser terminada, porque outras transações do DDE estão sendo processadas.';
      SE_ERR_DDEFAIL:	      ExecutaArquivo:='Falha na transação com DDE !';
      SE_ERR_DDETIMEOUT:	   ExecutaArquivo:='Falha na transação com DDE - Tempo esgotado !!!';
      SE_ERR_DLLNOTFOUND:	   ExecutaArquivo:='Seu link dinamico está incorreto ou não foi encontrado !';
      //SE_ERR_FNF:	         ExecutaArquivo:='The specified file was not found.';
      //SE_ERR_PNF:	         ExecutaArquivo:='The specified path was not found.';
      SE_ERR_NOASSOC:	      ExecutaArquivo:='Você não tem um programa para abrir esse tipo de arquivo !';
      SE_ERR_OOM:	            ExecutaArquivo:='Falta de memória para completar a operação...';
      SE_ERR_SHARE:	         ExecutaArquivo:='Violação ocorrída !';
   else
      ExecutaArquivo:='OK';
   end;
end;

function DataValida(Data: String): boolean;
begin
   result:=true;
   if trim(Data) = '' then
      exit;
   if copy(Data,1,1) = ' ' then
      exit;

   try
     strToDate(Data);
     if (StrToDate(Data) < StrToDate('01/01/1950')) or (StrToDate(Data) > (strToDate('31/12/2050'))) then
     begin
         mensagem('Data Inválida, verifique o Ano');
         result:=false;
     end;
   except
      Mensagem('Data Inválida');
      result:=false;
   end;
end;

function Fim_Mes(Data: string): string;
var vlano, vlMes, vlDia: word;
var vlD, vlM, vlA: String;
begin
   vlano:=YearOf(strtodate(Data));
   vlMes:=MonthOf(strtodate(Data));
   vlDia:=DaysInAMonth(vlano, vlMes);

   vlD:=formatfloat('00',vldia);
   vlM:=formatfloat('00',vlMes);
   vlA:=formatfloat('00',vlAno);

   result:=concat(vlD,'/',vlM,'/',vlA);
end;

function Inicio_Mes(Data: String): string;
var vdia,vmes,vano: word;
var vd,vm,va: String;
begin
   decodedate(Date,vano,vmes,vdia);
   vd:='01';
   vm:=formatfloat('00', vmes);
   va:=formatfloat('00', vano);
   result:=concat(vd,'/',vm,'/',va);
end;

function Conta_Registros3(Tabela : TSQLQuery) : integer;
begin
   Result := 0;
   Tabela.First;
   while not Tabela.Eof do
   begin
      Inc(Result);
      Tabela.Next;
   end;
   Tabela.First;
end;

function Casas2(Valor: double): double;
begin
   result:=arredonda(valor,2);
end;

procedure ExecutaSql(inSql: String);
begin
   dm.BancoDados.ExecuteDirect(inSql);
end;

procedure PesquisaNome(Tabela: TClientDataSet; Nome: string);
begin
   Tabela.Close;
   Tabela.Params[0].Text:=Nome+'%';
   Tabela.Open;
end;

procedure ComandoQsql(Linha: string);
begin
   dm.Qsql.Close;
   dm.Qsql.SQL.Text:=Linha;
   dm.Qsql.Open;
end;


function Qtde_Reg(Query: TSqlQuery): integer;
var i: integer;
begin
   i:=0;
   while not Query.Eof do
   begin
      inc(i);
      Query.Next;
   end;
   Query.First;
   result:=i;
end;

procedure Altera_Tab(comando: string);
begin
   dm.BancoDados.ExecuteDirect(Comando);
end;

function ValidaDatas(Data_Inicial,Data_Final: string): boolean;
begin
   result:=true;
   if (copy(Data_Inicial,1,1) = ' ') and (copy(Data_Final,1,1) = ' ') then
   begin
      mensagem('Informe as Datas');
      result:=false;
      exit;
   end;
   if copy(Data_Inicial,1,1) <> ' ' then
   begin
      try
        strtodate(Data_Inicial);
      except
         mensagem('Data Inválida');
         result:=false;
         exit;
      end;
   end;
   if copy(Data_Final,1,1) <> ' ' then
   begin
      try
        strtodate(Data_Final);
      except
         mensagem('Data Inválida');
         result:=false;
         exit;
      end;
   end;
   if (copy(Data_Inicial,1,1) <> ' ') and (copy(Data_Final,1,1) <> ' ') then
   begin
      if strtodate(Data_Inicial) > strtodate(Data_Final) then
      begin
         mensagem('Data Inicial Maior que Data Final');
         result:=false;
      end;
   end;
end;

function TrocaCar(Campo, Antigo, Novo: string): string;
var i: integer;
   b: string;
begin
   b:='';
   for i:=1 to length(campo) do
   begin
      if copy(campo,i,1) = Antigo then
         b:=b + Novo
      else
         b:=b + copy(campo,i,1);
   end;
   result:=b;
end;

procedure TestaChave(erro: string);
begin
   if pos('duplicate',erro) > 0 then
      showmessage('Registro já Cadastrado');
   if pos('FOREIGN',erro) > 0 then
      showmessage('Violação da Chave Estrangeira');
   showmessage(erro);
end;

procedure Executa(Comando: string);
begin
   dm.BancoDados.ExecuteDirect(Comando);
end;

procedure Edicao(Tabela: TClientDataSet);
begin
   if Tabela.Active = false then exit;
   if not (Tabela.State in [dsedit,dsinsert]) then
      Tabela.Edit;
end;

function MensagemCad: string;
begin
   result:='F2-Pesquisa F3-Cadastro';
end;


procedure procuraPadrao1(Tabela: TClientDataSet; Campo: string);
begin
   Tabela.close;
   Tabela.params[0].text:=Campo;
   Tabela.open;
end;

procedure GravaTab(Tabela: TClientDataSet);
var verro: integer;
begin
   verro:=Tabela.ApplyUpdates(0);
   if verro <> 0 then
      Mensagem('Erro ao Gravar dados');
end;

function TiraAcento(Campo: string): string;
var i: integer;
   vv,aux: string[1];
   vcampo,vnome: string[60];
begin
   vcampo:=Campo;
   vnome:='';
   for i:=1 to length(vcampo) do
   begin
      vv:=copy(vcampo,i,1);
      aux:=copy(vcampo,i,1);
      if (uppercase(vv) = 'Á') or (uppercase(vv) = 'Ã') or (uppercase(vv) = 'À') or (uppercase(vv) = 'Â')then
         aux:='A';
      if (uppercase(vv) = 'É') or (uppercase(vv) = 'Ê')then
         aux:='E';
      if (uppercase(vv) = 'Í') then
         aux:='I';
      if (uppercase(vv) = 'Ó') or (uppercase(vv) = 'Õ') or (uppercase(vv) = 'Ô')then
         aux:='O';
      if (uppercase(vv) = 'Ú') or (uppercase(vv) = 'Ü')then
         aux:='U';
      if (uppercase(vv) = 'Ç') then
         aux:='C';
      vnome:=vnome + aux;
   end;
   result:=vnome;
end;

procedure ComandoExec(Tabela: TIBQuery; Comando: string);
begin
   Tabela.Close;
   Tabela.SQL.Text:=Comando;
   Tabela.ExecSQL;
end;
procedure ComandoQuery(Tabela:TSQLQuery; Comando: string);
begin
   Tabela.Close;
   Tabela.SQL.Text:=Comando;
   Tabela.Open;
end;

function Modulo10(vnumero:string): integer;
var vtam,vmult,vnum,vtotal:integer;
begin
   vtam:=length(vnumero);
   vmult:=2;
   vtotal:=0;
   while vtam >= 1 do
   begin
      vnum:=strtoint(copy(vnumero,vtam,1));
      vnum:=vnum * vmult;
      if vnum >=10 then
         vnum:=(vnum-10)+1;
      if vmult = 2 then
         vmult:=1
      else
         vmult:=2;
      vtotal:=vtotal+vnum;
      vtam:=vtam-1;
   end;
//   vtotal:=vtotal mod 10;
   result:=vtotal;
end;

function Modulo11(vnumero,vtipo:string;vini,vfim:integer): integer;
var vtam,vmult,vnum,vtotal:integer;
begin
   vtam:=length(vnumero);
   vmult:=vini;
   vtotal:=0;
   while vtam >= 1 do
   begin
      vnum:=strtoint(copy(vnumero,vtam,1));
      vnum:=vnum * vmult;
      if vmult = vfim then
         vmult:=vini
      else begin
         if vtipo = 'cresce' then
            vmult:=vmult+1
         else
            vmult:=vmult-1;
      end;
      vtotal:=vtotal+vnum;
      vtam:=vtam-1;
   end;
   if vtotal >= 11 then
      vtotal:=vtotal mod 11;
   result:=vtotal;
end;

function EspacoE(vtaman: integer; vcampo: string): string;
var
   vcomp: integer;
   vzeros: string;
begin
     {* Acrescenta espacos na frente de um número *}
     vcomp:=length(vcampo);
     vzeros:=copy(stringofchar(' ',50),1,vtaman-vcomp);
     result:=vzeros+vcampo;
end;

function Conta_Reg(Tabela: TClientDataSet): Integer;
var vconta,vreg: integer;
begin
   if Tabela.IsEmpty then
      result:=0
   else begin
      vconta:=0;
      vreg:=Tabela.RecNo;
      while not Tabela.Eof do
      begin
         if vconta > 2 then
            break;
         inc(vconta);
         Tabela.Next;
      end;
      Tabela.RecNo:=vreg;
      result:=vconta;
   end;
end;

Function Arred (Num :Double; Decimal :Integer) : Double;
begin
   if (Frac(Frac(Num)*Power(10 ,decimal))*10) > 5 then
      Arred := trunc(Num)+ceil(Frac(Num)*Power(10 ,decimal))/100
   else
      Arred := trunc(Num)+trunc(Frac(Num)*Power(10 ,decimal))/100;
end;

procedure VerificaAno(Data: string);
var
   vdia1,vmes1,vano1: word;
   vdia2,vmes2,vano2: word;
begin
   if copy(Data,1,1) = ' ' then
      exit;
   decodedate(strtodate(data),vano1,vmes1,vdia1);
   decodedate(date,vano2,vmes2,vdia2);
   if vano1 <> vano2 then
      erro('Ano da Data não é o Ano Atual');
end;

function TiraCar(Campo,Caracter: string): string;
var vaux: string;
   I: integer;
begin
   vaux:='';
   for i:=1 to length(Campo) do
   begin
      if copy(campo,i,1) = caracter then
         continue;
      vaux:=vaux + copy(campo,i,1);
   end;
   result:=vaux;
end;

function InscEstadual(Inscricao,Estado: string): integer;
var
  IRet: Integer;
  IOk, IErro, IPar    : Integer;
  LibHandle                 : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
  vinsc: string;
  //CInsc:TInscEstadual;
begin
   vinsc:='';
   for iret:=1 to length(Inscricao) do
   begin
      if copy(inscricao,Iret,1) = '/' then
         continue;
      vinsc:=vinsc+copy(inscricao,Iret,1);
   end;
//------------------------------------------------------------------------------
// inscricao Estadual pernambuco
   if trim(Estado) = 'PE' then
   begin
      {
      if length(trim(Inscricao)) = 9 then
       begin
         CInsc:=TInscEstadual.Create;
         if CInsc.Insc_Estadual_PE(Inscricao) = false then
         begin
            MessageDlg ('Inscrição inválida para '+Estado+', Deixe em branco para sair',mtError,[mbOk],0);
            FreeAndNil(CInsc);
            exit;
         end;
         FreeAndNil(CInsc);
         exit;
       end;
       }
   end;
//------------------------------------------------------------------------------

  try
    LibHandle :=  LoadLibrary (PWideChar (Trim ('DllInscE32.Dll')));
    if  LibHandle <=  HINSTANCE_ERROR then
      raise Exception.Create ('Dll não carregada');

    @ConsisteInscricaoEstadual  :=  GetProcAddress (LibHandle,
                                                    'ConsisteInscricaoEstadual');
    if  @ConsisteInscricaoEstadual  = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');

    IRet := ConsisteInscricaoEstadual (pAnsiChar(Ansistring(vinsc)),pAnsiChar(Ansistring(Estado)));
    if      Iret = 0 then
//       MessageDlg ('Inscrição válida para '+Estado,mtInformation,[mbOk],0)
    else if Iret = 1 then
       MessageDlg ('Inscrição inválida para '+Estado+', Deixe em branco para sair',mtError,[mbOk],0)
    else
       MessageDlg ('Parâmetros inválidos',mtError,[mbOk],0);

  finally
    FreeLibrary (LibHandle);
  end;
  result:=IRet;
end;

function InscEstadualNota(Inscricao,Estado: string): integer;
var
  IRet: Integer;
  IOk, IErro, IPar    : Integer;

  LibHandle                 : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
  var vinsc: string;
begin
   vinsc:='';
   for iret:=1 to length(Inscricao) do
   begin
      if copy(inscricao,Iret,1) = '/' then
         continue;
      vinsc:=vinsc+copy(inscricao,Iret,1);
   end;

  try
    //LibHandle :=  LoadLibrary (PChar (Trim ('DllInscE32.Dll')));
    LibHandle :=  LoadLibrary (PWideChar (Trim ('DllInscE32.Dll')));
    if  LibHandle <=  HINSTANCE_ERROR then
      raise Exception.Create ('Dll não carregada');

    @ConsisteInscricaoEstadual  :=  GetProcAddress (LibHandle,
                                                    'ConsisteInscricaoEstadual');
    if  @ConsisteInscricaoEstadual  = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');

    //IRet := ConsisteInscricaoEstadual (vinsc,Estado);
    IRet := ConsisteInscricaoEstadual (pAnsiChar(Ansistring(vinsc)),pAnsiChar(Ansistring(Estado)));
    if      Iret = 0 then
//       MessageDlg ('Inscrição válida para '+Estado,mtInformation,[mbOk],0)
    else if Iret = 1 then
       MessageDlg ('Inscrição inválida para '+Estado,mtError,[mbOk],0)
    else
       MessageDlg ('Parâmetros inválidos',mtError,[mbOk],0);

  finally
    FreeLibrary (LibHandle);
  end;
  result:=IRet;
end;

function MensCod(Numero: integer): string;
begin
   if Numero = 1 then
      result:='Digite 0 (Zero) para Mostrar Todo(a)s';
   if Numero = 2 then
      result:='Digite as Iniciais para Pesquisa';
end;

function SalvarInclusao(Texto: string): string;
begin
   if Texto = 'F1-&Incluir' then
   begin
      if confirma('Deseja Salvar a Inclusão?','S') = IdNo then
         result:='N'
      else
         result:='S';
   end;
end;

procedure ImprimeDos(Impressora,tipo: string);
var
   Arq,Arq1: Textfile;
   vreg: string;
begin
//P6 - 1/6 Pequena
//G6 - 1/6 Grande
//P8 - 1/8 Pequena
//G8 - 1/8 Grande

   Assignfile(Arq1,Impressora);
   Assignfile(Arq,'Relatori.txt');
   Reset(Arq);
   rewrite(Arq1);
   if Tipo = 'P6' then
      write(Arq1,chr(15));
   if Tipo = 'G6' then
      write(Arq1,chr(18));
   if Tipo = 'P8' then
      write(Arq1,chr(15)+chr(27)+chr(48));
   if Tipo = 'G8' then
      write(Arq1,chr(18)+chr(27)+chr(48));
   while not Eof(Arq) do
   begin
      readln(Arq,vreg);
      writeln(Arq1,vreg);
   end;
   writeln(Arq1,' ');
   if (Tipo = 'P6') then
      write(Arq1,chr(18));
   if (Tipo = 'P8') or (Tipo = 'G8') then
      write(Arq1,chr(27)+chr(64));
   closeFile(Arq1);
   closeFile(Arq);
end;

function Acento(Campo: string): string;
var vret:string[1];
   vpalavra: string;
   I: integer;
begin
   vpalavra:='';
   for I:=1 to length(campo) do
   begin
      vret:=copy(campo,I,1);
      if copy(campo,I,1) = 'Á' then vret:='A';
      if copy(campo,I,1) = 'É' then vret:='E';
      if copy(campo,I,1) = 'Í' then vret:='I';
      if copy(campo,I,1) = 'Ó' then vret:='O';
      if copy(campo,I,1) = 'Ú' then vret:='U';
      if copy(campo,I,1) = 'À' then vret:='A';
      if copy(campo,I,1) = 'Â' then vret:='A';
      if copy(campo,I,1) = 'Ê' then vret:='E';
      if copy(campo,I,1) = 'Ô' then vret:='O';
      if copy(campo,I,1) = 'Ç' then vret:='C';
      if copy(campo,I,1) = 'Ü' then vret:='U';
      if copy(campo,I,1) = 'Ã' then vret:='A';
      if copy(campo,I,1) = 'Õ' then vret:='O';

      if copy(campo,I,1) = 'á' then vret:='a';
      if copy(campo,I,1) = 'é' then vret:='e';
      if copy(campo,I,1) = 'í' then vret:='i';
      if copy(campo,I,1) = 'ó' then vret:='o';
      if copy(campo,I,1) = 'ú' then vret:='u';
      if copy(campo,I,1) = 'à' then vret:='a';
      if copy(campo,I,1) = 'â' then vret:='a';
      if copy(campo,I,1) = 'ê' then vret:='e';
      if copy(campo,I,1) = 'ô' then vret:='o';
      if copy(campo,I,1) = 'ç' then vret:='c';
      if copy(campo,I,1) = 'ü' then vret:='u';
      if copy(campo,I,1) = 'ã' then vret:='a';
      if copy(campo,I,1) = 'õ' then vret:='o';
      if copy(campo,I,1) = 'º' then vret:='o';
      if copy(campo,I,1) = 'ª' then vret:='a';
      vpalavra:=vpalavra + vret;
   end;
   result:=vpalavra;
end;

function Manut(IAEC,TM: string): string;
var vretorno: string[1];
begin
   vretorno:='S';
   if (IAEC = 'I') and (TM = 'N') then
   begin
      erro('Usuário sem Permissão');
      vretorno:='N';
   end;
   if (IAEC = 'A') and (TM = 'N') then
   begin
      erro('Usuário sem Permissão');
      vretorno:='N';
   end;
   if (IAEC = 'E') and (TM = 'N') then
   begin
      erro('Usuário sem Permissão');
      vretorno:='N';
   end;
   if (IAEC = 'C') and (TM = 'N') then
   begin
      erro('Usuário sem Permissão');
      vretorno:='N';
   end;
   result:=vretorno;
end;
{
procedure TamanhoPaginaQuick(Relatorio: TQuickRep);
begin
   {with dm do
   begin
      comando(TabControle,'Select * from TabControle where Padrao = "S"');
//      Relatorio.Page.PaperSize:=Custom;
      Relatorio.Page.Length:=TabControleALTURAREL.Value;
      Relatorio.Page.Width:=TabControleLARGURAREL.Value;
      Relatorio.Page.TopMargin:=TabControleTOPOREL.Value;
      Relatorio.Page.BottomMargin:=TabControleINFERIORREL.Value;
      Relatorio.Page.LeftMargin:=TabControleESTQUERDOREL.Value;
      Relatorio.Page.RightMargin:=TabControleDIREITOREL.Value;
      TabControle.Close;
   end;
end;
}

function DataIngles(Data: string): string;
var vdia,vmes,vano: word;
   vdata: string[10];
begin
   decodedate(strtodate(data),vano,vmes,vdia);
   vdata:=inttostr(vmes)+'/'+inttostr(vdia)+'/'+inttostr(vano);
   result:=vdata;
end;

function DataIngles2(Data: string): string;
var vdia,vmes,vano: word;
   vdata: string[10];
begin
   decodedate(strtodate(data),vano,vmes,vdia);
   vdata:=inttostr(vmes)+'/'+inttostr(vdia)+'/'+inttostr(vano);
   result:=''''+vdata+'''';
end;

function Arredonda(Valor : Real ; Decimais : Byte) : Extended;
var
   i : Byte;
   ML : string;
   RR: string;
begin
   ML := '0.';
   for i := 1 To Decimais do
   begin
      ML := ML + '0';
   end;
   RR := FormatFloat(ML,Valor);
   Result := StrToFloat (RR);
end;



procedure TamanhoPagina(Relatorio: TppReport);
begin
{
   procuraparametro;
   if dm.TabControleALTURA_REL.AsFloat = 0 then
      exit;
   Relatorio.PrinterSetup.PaperHeight:=dm.TabControleALTURA_REL.AsFloat;
   Relatorio.PrinterSetup.PaperWidth:=dm.TabControleLARGURA_REL.AsFloat;
   Relatorio.PrinterSetup.MarginTop:=dm.TabControleTOPO_REL.AsFloat;
   Relatorio.PrinterSetup.MarginLeft:=dm.TabControleESQUERDA_REL.AsFloat;
   Relatorio.PrinterSetup.MarginRight:=dm.TabControleDIREITA_REL.AsFloat;
   Relatorio.PrinterSetup.MarginBottom:=dm.TabControleBOTTOM_REL.AsFloat;
   dm.TabControle.Close;
}
end;

procedure IniciaTransacao(NomeTransacao: TIbTransaction);
begin
   if not NomeTransacao.InTransaction then
      NomeTransacao.StartTransaction;
end;

procedure GravaTransacao(NomeTransacao: TIbTransaction; Tipo: string);
begin
   if NomeTransacao.InTransaction then
   begin
      if Tipo = 'R' then
         NomeTransacao.CommitRetaining
      else begin
         NomeTransacao.Commit;
         NomeTransacao.Active:=false;
      end;
   end;
end;

procedure CancelaTransacao(NomeTransacao: TIbTransaction; Tipo: string);
begin
   if NomeTransacao.InTransaction then
   begin
      if Tipo = 'R' then
         NomeTransacao.RollbackRetaining
      else
         NomeTransacao.Rollback;
   end;
end;


procedure OpenTrans(Transacao: TIBTransaction);
begin
   if not (Transacao.InTransaction) then
      Transacao.StartTransaction;
end;

procedure PostTrans(Transacao: TIBTransaction);
begin
   if Transacao.InTransaction then
      Transacao.CommitRetaining;
end;

procedure CancTrans(Transacao: TIBTransaction);
begin
   if Transacao.InTransaction then
      Transacao.RollbackRetaining;
end;

procedure FechaTrans(Transacao: TIBTransaction);
begin
   if Transacao.Active = true then
      Transacao.Active:=false;
end;

procedure GravaZero(Tabela: TIBDataSet);
var I: integer;
begin
   for I:=0 to Tabela.FieldCount-1 do
   begin
      if Tabela.Fields[I].DefaultExpression <> '' then
      begin
         if Tabela.Fields[I].IsNull then
            Tabela.Fields[I].Value:=0
         //else begin
         //   try
         //   Tabela.Fields[I].Value:=Arredonda(Tabela.Fields[I].value,Tabela.Fields[I].DefaultExpression);
         //   except
         //      showMessage(Tabela.Fields[I].Name);
         //   end;
         //end;
      end;
   end;
end;

procedure GravaZeroDataSet(Tabela: TClientDataSet);
var I: integer;
begin
   for I:=0 to Tabela.FieldCount-1 do
   begin
      if Tabela.Fields[I].DefaultExpression <> '' then
      begin
         if Tabela.Fields[I].IsNull then
            Tabela.Fields[I].Value:=0;
         {else begin
            try
            Tabela.Fields[I].Value:=Arredonda(Tabela.Fields[I].value,Tabela.Fields[I].DefaultExpression);
            except
               showMessage(Tabela.Fields[I].Name);
            end;
         end;}
      end;
   end;
end;

{procedure GravaDados(Tabela: TIBQuery; NomeTabela: string; Formulario: Tform);
var I,A: integer;
begin
   for A:=0 to Tabela.FieldCount -1 do
   begin
      for I:=0 to formulario.ComponentCount -1 do
      begin
         if formulario.Components[I] is Tedit then
         begin
            if (NomeTabela+Tedit(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               if (Tedit(formulario.Components[I]).Width = 90) then
                  Tabela.Fields[A].AsString:=floatTostr(CVal(Tedit(formulario.Components[I]).Text))
               else
                  Tabela.Fields[A].AsString:=Tedit(formulario.Components[I]).Text;
               break;
            end;
         end;
         if formulario.Components[I] is TMaskedit then
         begin
            if (NomeTabela+TMaskEdit(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               if copy(TMaskEdit(formulario.Components[I]).Text,1,1) = ' ' then
                  TMaskEdit(formulario.Components[I]).EditMask:='';
               Tabela.Fields[A].AsString:=TMaskEdit(formulario.Components[I]).Text;
               break;
            end;
         end;
         if formulario.Components[I] is TComboBox then
         begin
            if (NomeTabela+TComboBox(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               Tabela.Fields[A].AsString:=TComboBox(formulario.Components[I]).Text;
               break;
            end;
         end;
      end;
   end;
end;}

procedure ComprimentoCampo(Tabela: TIBDataSet; NomeTabela: string; Formulario: TForm);
var I,A: integer;
begin
   for A:=0 to Tabela.FieldCount -1 do
   begin
      for I:=0 to formulario.ComponentCount -1 do
      begin
         if formulario.Components[I] is Tedit then
         begin
            if (NomeTabela+Tedit(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               Tedit(formulario.Components[I]).MaxLength:=Tabela.Fields[A].Size;
               break;
            end;
         end;
         if formulario.Components[I] is TDBEdit then
         begin
            if (NomeTabela+TDBEdit(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               TDBEdit(formulario.Components[I]).MaxLength:=Tabela.Fields[A].Size;
               break;
            end;
         end;
      end;
   end;
end;

{procedure MostraCampos(Tabela: TIBQuery; NomeTabela: string; Formulario: TForm);
var I,A: integer;
begin
   for A:=0 to Tabela.FieldCount -1 do
   begin
      for I:=0 to formulario.ComponentCount -1 do
      begin
         if formulario.Components[I] is Tedit then
         begin
            if (NomeTabela+Tedit(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               Tedit(formulario.Components[I]).Text:=Tabela.Fields[A].DisplayText;
               if (Tedit(formulario.Components[I]).Text = '') and (Tedit(formulario.Components[I]).Width = 90) then
                  Tedit(formulario.Components[I]).Text:='0,00';
               break;
            end;
         end;
         if formulario.Components[I] is TMaskedit then
         begin
            if (NomeTabela+TMaskEdit(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               TMaskEdit(formulario.Components[I]).Text:=Tabela.Fields[A].DisplayText ;
               break;
            end;
         end;
         if formulario.Components[I] is TComboBox then
         begin
            if (NomeTabela+TComboBox(formulario.Components[I]).Name) = Tabela.Fields[A].Name then
            begin
               TComboBox(formulario.Components[I]).Text:=Tabela.Fields[A].DisplayText ;
               break;
            end;
         end;
      end;
   end;
end;}

procedure LimpaTela(Formulario: TForm);
var I: integer;
begin
   for I:=0 to (Formulario.ComponentCount-1) do
   begin
      if (Formulario.Components[I] is TEdit) then
         TEdit(Formulario.Components[I]).Clear;
      if (Formulario.Components[I] is TComboBox) then
         TComboBox(Formulario.Components[I]).Text:='';
      if (Formulario.Components[I] is TMaskEdit) then
         TMaskEdit(Formulario.Components[I]).Clear;
   end;
end;


procedure Command(Tabela : TIBQuery; Comando: string);
begin
   Tabela.Close;
   Tabela.SQL.Text := Comando;
   Tabela.Open;
end;

function Conta_Registros (Tabela : TIBDataSet) : integer;
begin
   Result := 0;
   Tabela.First;
   while not Tabela.Eof do
   begin
      Inc(Result);
      Tabela.Next;
   end;
   Tabela.First;
end;

function Conta_Registros2 (Tabela : TIBQuery) : integer;
begin
   Result := 0;
   Tabela.First;
   while not Tabela.Eof do
   begin
      Inc(Result);
      Tabela.Next;
   end;
   Tabela.First;
end;


function CVal(Campo: string): string;
var vvalor: string[20];
begin
   if Campo = '' then
      result:='0'
   else begin
      vvalor:=TiraCar(Campo,'.');
      result:=trocaCar(vvalor,',','.');
   end;
end;

{function CVal(Campo: string): double;
var I: integer;
vNumero: string;
begin
     {* funcao usada antes da funcao extenso
       é usada para tirar todos os pontos do número *}
{     if Campo = '' then Campo:='0,00';
     for I:=1 to length(Campo) do
     begin
          if copy(Campo,I,1)='.' then
             continue;
          vNumero:=vNumero+copy(Campo,I,1);
     end;
     try
      result:=strToFloat(vNumero);
      except
         result:=0;
     end;
end;
}

procedure Comando(Tabela: TIBDataSet; Linha: string);
begin
   Tabela.Close;
   Tabela.SelectSQL.Text:=Linha;
   Tabela.Open;
end;

//***********************************************
// Calcula CGC
//***********************************************
function CGC(CGC: string): string;
var vSoma: integer;
    vd,vd1,vd2,vd3,vd5,vd6,vd7,vd8: real;
    vd4: string[10];
Begin
//***************************
// primeiro digito
//***************************
     vSoma:=strtoint(copy(cgc,1,1))*5  + strtoint(copy(cgc,2,1))*4 +
            strtoint(copy(cgc,3,1))*3  + strtoint(copy(cgc,4,1))*2 +
            strtoint(copy(cgc,5,1))*9  + strtoint(copy(cgc,6,1))*8 +
            strtoint(copy(cgc,7,1))*7  + strtoint(copy(cgc,8,1))*6 +
            strtoint(copy(cgc,9,1))*5  + strtoint(copy(cgc,10,1))*4+
            strtoint(copy(cgc,11,1))*3 + strtoint(copy(cgc,12,1))*2;
     vd:=vsoma div 11;
     vd1:=vd*11;
     vd2:=vsoma - vd1;
     vd3:=11 - vd2;
     if (vd3 = 10) or (vd3 = 11) then
       vd3:=0;
     vd4:=floattostr(vd3);
//***************************
//segundo digito
//***************************
     vSoma:=strtoint(copy(cgc,1,1))*6  + strtoint(copy(cgc,2,1))*5  +
            strtoint(copy(cgc,3,1))*4  + strtoint(copy(cgc,4,1))*3  +
            strtoint(copy(cgc,5,1))*2  + strtoint(copy(cgc,6,1))*9  +
            strtoint(copy(cgc,7,1))*8  + strtoint(copy(cgc,8,1))*7  +
            strtoint(copy(cgc,9,1))*6  + strtoint(copy(cgc,10,1))*5 +
            strtoint(copy(cgc,11,1))*4 + strtoint(copy(cgc,12,1))*3 +
            strtoint(vd4)*2;
     vd5:=vsoma div 11;
     vd6:=vd5*11;
     vd7:=vsoma - vd6;
     vd8:=11 - vd7;
     if (vd8 = 10) or (vd8 = 11) then
        vd8:=0;
     result:=concat(copy(cgc,1,12),vd4,floattostr(vd8));
end;

//***********************************************
// Calcula CPF
//***********************************************

function cic(Cpf: string): string;
var vSoma: integer;
    vd,vd1,vd2,vd3,vd5,vd6,vd7,vd8: real;
    vd4: string[10];
begin
     if length(Cpf) <> 11 then
     begin
        result:='1111';
        exit;
     end;
//primeiro digito************
     vSoma:=strtoint(copy(cpf,1,1))*10 + strtoint(copy(cpf,2,1))*9 +
            strtoint(copy(cpf,3,1))*8  + strtoint(copy(cpf,4,1))*7 +
            strtoint(copy(cpf,5,1))*6  + strtoint(copy(cpf,6,1))*5 +
            strtoint(copy(cpf,7,1))*4  + strtoint(copy(cpf,8,1))*3 +
            strtoint(copy(cpf,9,1))*2;
     vd:=vsoma div 11;
     vd1:=vd*11;
     vd2:=vsoma - vd1;
     vd3:=11 - vd2;
     if (vd3 = 10) or (vd3 = 11) then
       vd3:=0;
     vd4:=floattostr(vd3);
//segundo digito*************
     vSoma:=strtoint(copy(cpf,1,1))*11 + strtoint(copy(cpf,2,1))*10 +
            strtoint(copy(cpf,3,1))*9  + strtoint(copy(cpf,4,1))*8  +
            strtoint(copy(cpf,7,1))*5  + strtoint(copy(cpf,8,1))*4  +
            strtoint(copy(cpf,5,1))*7  + strtoint(copy(cpf,6,1))*6  +
            strtoint(copy(cpf,9,1))*3  + strtoint(vd4)*2;
     vd5:=vsoma div 11;
     vd6:=vd5*11;
     vd7:=vsoma - vd6;
     vd8:=11 - vd7;
     if (vd8 = 10) or (vd8 = 11) then
        vd8:=0;
     result:=concat(copy(cpf,1,9),vd4,floattostr(vd8));
end;

//***********************************************
// Valor extenso
//***********************************************
procedure ExtSinPlur(intValor: integer; stSing, stPlural: string; var stValor: string);
begin
  if (Copy(stValor, Length(stValor) - 2, 3) = 'OES') or
       (Copy(stValor, Length(stValor) - 1, 2) = 'AO') then
     stValor := stValor + ' DE';
  if intValor = 1 then
     stValor := stValor + ' ' + stSing
  else
     stValor := stValor + ' ' + stPlural;
end;

{
    Função que retorna uma string com um valor monetário por extenso.
    Parâmetro: o valor e o nome da moeda singular e plural.
    Retorno  : o valor por extenso.
}
function MoedaExtenso(dblValor: double; stMoeda, stMoedas: string): string;
var stMoedaExtenso, stCentavos : string;
    intCentavos, intMoeda : integer;
begin
  intMoeda := Trunc(dblValor);
  intCentavos := Round(100*(dblValor - intMoeda));
  if intCentavos > 0 then
     begin
       stCentavos := Ext999(intCentavos) + ' CENTAVO';
       if intCentavos <> 1 then stCentavos := stCentavos + 'S';
     end
  else stCentavos := '';
  if intMoeda > 0 then
     begin
       stMoedaExtenso := Extenso(intMoeda);
       ExtSinPlur(intMoeda, stMoeda, stMoedas, stMoedaExtenso);
     end
  else stMoedaExtenso := '';
  if (intCentavos <> 0) and (intMoeda <> 0) then
     stMoedaExtenso := stMoedaExtenso + ' E ' + stCentavos
  else
     stMoedaExtenso := stMoedaExtenso + stCentavos;
  Result := '('+stMoedaExtenso+')';
end;

{
    Funçãoo que retorna uma string com um valor por extenso.
    Parâmetro: o valor.
    Retorno  : o valor por extenso.
}
function Extenso(intValor: integer): string;
var stValExtenso, stValor : string;
    intValor1, intValor2, intValor3, intValor4 : integer;
begin
  stValor :=Zeros(12,InttoStr(IntValor));
  intValor1 := StrToInt(Copy(stValor, 1, 3));
  intValor2 := StrToInt(Copy(stValor, 4, 3));
  intValor3 := StrToInt(Copy(stValor, 7, 3));
  intValor4 := StrToInt(Copy(stValor, 10, 3));
  stValExtenso := '';
  if intValor1 > 0 then
     begin
       stValExtenso := Ext999(intValor1);
       ExtSinPlur(intValor1, 'BILHAO, ', 'BILHOES, ', stValExtenso);
     end;
  if intValor2 > 0 then
     begin
       stValExtenso := stValExtenso + Ext999(intValor2);
       ExtSinPlur(intValor2, 'MILHAO, ', 'MILHOES, ', stValExtenso);
     end;
  if intValor3 > 0 then
     stValExtenso := stValExtenso + Ext999(intValor3) + ' MIL, ';
  if intValor4 > 0 then
     stValExtenso := stValExtenso + Ext999(intValor4);
  if Copy(stValExtenso, Length(stValExtenso) - 1, 2) = ', ' then
     Delete(stValExtenso, Length(stValExtenso) - 1, 2);
  Result := stValExtenso;
end;

{*
    Função que retorna uma string de um valor de 0 a 999 por extenso.
    Parametro: o valor.
    Retorno : o valor por extenso.
*}
function Ext999(intValor: integer): string;
var stValExtenso, stUnidade, stDezena, stCentena : string;
    intUnidade, intDezena, intCentena : integer;
    stUnidades, stTeens, stDezenas, stCentenas : Variant;
begin
  stUnidades := VarArrayOf(['UM', 'DOIS', 'TRES', 'QUATRO', 'CINCO',
                            'SEIS', 'SETE', 'OITO', 'NOVE' ]);
  stTeens := VarArrayOf(['ONZE', 'DOZE', 'TREZE', 'CATORZE', 'QUINZE',
                         'DEZESSEIS', 'DEZESSETE', 'DEZOITO', 'DEZENOVE']);
  stDezenas := VarArrayOf(['DEZ', 'VINTE', 'TRINTA', 'QUARENTA', 'CINQUENTA',
                           'SESSENTA', 'SETENTA', 'OITENTA', 'NOVENTA']);
  stCentenas := VarArrayOf(['CENTO', 'DUZENTOS', 'TREZENTOS', 'QUATROCENTOS',
                            'QUINHENTOS', 'SEISCENTOS', 'SETECENTOS',
                            'OITOCENTOS', 'NOVECENTOS']);

  if intValor = 0 then
     stValExtenso := 'ZERO'
  else if intValor = 100 then
     stValExtenso := 'CEM'
  else if intValor <= 999 then
     begin
       stCentena := '';
       stDezena := '';
       stUnidade := '';
       intCentena := Trunc(intValor/100);
       intDezena  := Trunc((intValor - intCentena*100)/10);
       intUnidade := Trunc(intValor - intCentena*100 - intDezena*10);
       if intCentena <> 0 then
          stCentena := stCentenas[intCentena - 1] + ' E ';
       if intDezena = 1 then
          if intUnidade = 0 then
             stDezena := 'DEZ'
          else
             stDezena := stTeens[intUnidade - 1];
       if intDezena > 1 then
          stDezena := stDezenas[intDezena - 1] + ' E ';
       if (intUnidade <> 0) and (intDezena <> 1) then
          stUnidade := stUnidades[intUnidade - 1];
       stValExtenso := stCentena + stDezena + stUnidade;
       if Copy(stValExtenso, Length(stValExtenso) - 2, 3) = ' E ' then
          Delete(stValExtenso, Length(stValExtenso) - 2, 3);
     end;
  Result := stValExtenso;
end;

//***********************************************
// Insere zeros a esquerda do numero
//***********************************************
function Zeros(vtaman: integer; vcampo: string): string;
var
   vcomp: integer;
   vzeros: string;
begin
     {* Acrescenta zeros na frente de um número *}
     vcomp:=length(vcampo);
     vzeros:=copy('000000000000000000',1,vtaman-vcomp);
     zeros:=vzeros+vcampo;
end;

//***********************************************
// Insere espaços a esquerda do numero
//***********************************************
function Espacos(vtaman: integer; vcampo: string): string;
var
   vcomp: integer;
   vzeros: string;
begin
     {* Acrescenta zeros na frente de um número *}
     vcomp:=length(vcampo);
     vzeros:=copy('                  ',1,vtaman-vcomp);
     espacos:=vzeros+vcampo;
end;

//***********************************************
// Calcula dias de atrazo
//***********************************************
function DiasAtrazo(Data1,Data2: String): double;
begin
   try
     result:=strtodate(data1) - strtodate(data2);
   except
      result:=0;
   end;
end;
//***********************************************
// formata valor
//***********************************************
function FormatarValor(Valor,Tipo: string): string;
var vValor: double;
begin
     if valor = '0' then
     begin
        result:='0';
        exit;
     end;
     try begin
         vValor:=preparaExtenso(Valor);
         if Tipo = 'V' then
            result:=formatfloat('###,###,###,##0.00',vValor)
         else
            result:=formatfloat('###,###,###,###',vValor);
     end
        except
        begin
           if Tipo = 'V' then
              result:='0,00'
           else
              result:='0';
        end;
     end;
end;

function FormatarValor2(Valor: double): string;
var vValor: string;
begin
     if valor = 0 then
     begin
        result:='00000000000.00';
        exit;
     end;
     try begin
      vvalor:=formatfloat('##########0.00',valor);
      vvalor:=zeros(11,vvalor);
      if (copy(vvalor,9,1) = ',') then
         vvalor:='000'+copy(vvalor,1,8)+'.'+copy(vvalor,10,2)
      else
         vvalor:='000'+copy(vvalor,4,8)+'.00';
         result:=vValor
     end
        except
           result:='0.00'
     end;
end;

//***********************************************
// Tira os pontos de um valor
//***********************************************
function PreparaExtenso(Campo: string): double;
var I: integer;
vNumero: string;
begin
     {* funcao usada antes da funcao extenso
       é usada para tirar todos os pontos do número *}
     if trim(Campo) = '' then
      result:=0
     else begin
        for I:=1 to length(Campo) do
        begin
             if copy(Campo,I,1)='.' then
                continue;
             vNumero:=vNumero+copy(Campo,I,1);
        end;
        result:=strToFloat(vNumero);
     end;
end;
//***********************************************
// Verifica se a data esta correta
//***********************************************
function DataErro(Data: string): string;
var vDataErro: string[1];
begin
     {* Testa se a data for válida *}
     if Data = '  /  /    ' then
     begin
        vDataErro:='N';
        exit;
     end;
     vDataErro:='N';
     try
     strToDate(Data)
         Except begin
                Erro('Data Inválida');
                vdataErro:='S';
         end;
     end;
     result:=vDataErro;
end;

//***********************************************
// Mensagem
//***********************************************
procedure Mensagem(Texto: Pchar);
begin
     Application.MessageBox(Texto,'Informação',mb_Ok+mb_iconInformation);
end;

//***********************************************
// Mensagem de erro
//***********************************************
procedure Erro(Mensagem: Pchar);
begin
     beep;
     Application.MessageBox(Mensagem,'Atenção',mb_Ok+mb_iconError);
end;

//***********************************************
// abre caixa de dialogo para confirmacao sim/nao/Cancelar
// Retorna idyes idno idcancel
//***********************************************
function Confirma3(Texto: pchar; botao: string): Integer;
begin
   if botao = 'S' then
      result:=application.MessageBox(Texto,'Confirmação',mb_YesNoCancel + mb_IconQuestion + mb_DefButton1)
   else
      result:=application.MessageBox(Texto,'Confirmação',mb_YesNoCancel + mb_IconQuestion + mb_DefButton2);
end;

//***********************************************
// abre caixa de dialogo para confirmacao sim/nao
//***********************************************
function Confirma(Texto: pchar; botao: string): Integer;
begin
   if botao = 'S' then
      result:=application.MessageBox(Texto,'Confirmação',mb_YesNo + mb_IconQuestion + mb_DefButton1)
   else
      result:=application.MessageBox(Texto,'Confirmação',mb_YesNo + mb_IconQuestion + mb_DefButton2);
end;

//***********************************************
// maxlength de cada campo no form
//***********************************************
procedure TamanhoCampo(Formulario: TForm);
var I: integer;
begin
   for I:= 0 to (Formulario.ComponentCount - 1) do
   begin
      if (Formulario.Components[I] is TEdit) then
         TEdit(Formulario.Components[I]).MaxLength:=(TEdit(Formulario.Components[I]).Width-10) div 8;
      if (Formulario.Components[I] is TdbEdit) then
         TdbEdit(Formulario.Components[I]).MaxLength:=(TdbEdit(Formulario.Components[I]).Width-10) div 8;
   end;
end;

function FormataValor2(Valor: String): string;
var vvalor: double;
var vlResult: String;
begin
   try
      vvalor:=PreparaExtenso(valor);
      vlResult:=formatfloat(',##0.00',vvalor);
   except
      vlResult:='0,00';
   end;
   result:=vlResult;
end;

function FormataInteiro(Valor: String): string;
var vvalor: double;
var vlResult: String;
begin
   try
      vvalor:=PreparaExtenso(valor);
      vlResult:=formatfloat(',##',vvalor);
   except
      vlResult:='0';
   end;
   result:=vlResult;
end;

end.
