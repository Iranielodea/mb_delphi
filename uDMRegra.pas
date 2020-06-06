unit uDMRegra;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Controls, DBClient, uContaBanco, uClassContaBanco;

type
  TdmRegra = class(TDataModule)
    QContasCarga: TSQLDataSet;
    QContasCargaVALOR_PAGAR: TFloatField;
    QContasCargaCOD_CLIENTE: TIntegerField;
    QCarga: TSQLQuery;
    QCargaNUM_PEDIDO: TIntegerField;
    Qpesq: TSQLQuery;
    Qpesq1: TSQLQuery;
    Qpesq1N_CARGA: TIntegerField;
    QpesqQTDE: TIntegerField;
    QSaldo: TSQLQuery;
    QSaldoQTDE_ENTREGUE: TFloatField;
    QPedido: TSQLQuery;
    QPedidoVALOR_LUCRO: TFloatField;
    QCargaID_CARGA: TIntegerField;
    QpesqNUM_CARGA: TIntegerField;
  private
    FCodigo: Integer;
    FNome: string;
    { Private declarations }
  public
    { Public declarations }
    procedure Troca_Cliente_Venda;
    function Excluir_Pedido(inCodigo: String): boolean;
    procedure Excluir_Carga(inCodigo: String);
    function VerificaData(inData: String): boolean;
    procedure ComandoSql(inComando: String);
    function Valida_Inscricao_Estadual(Inscricao, Estado: String): boolean;
    function Valida_CNPJ(Cnpj: String): Boolean;
    function Valida_CPF(cpf: String): boolean;

    function PesquisaCidade(Descricao: String): boolean;
    function PesquisaAgenciador(Descricao: String): boolean;
    function PesquisaTransportador(Descricao: String): boolean;
    function PesquisaCliente(Descricao: String): boolean;
    function PesquisaFornecedor(Descricao: String): boolean;
    function PesquisaMotorista(Descricao: String): boolean;
    function PesquisaEstado(Descricao: String): boolean;
    function PesquisaVendedor(Descricao: String): boolean;
    function PesquisaContaBanco(Descricao: String): boolean; overload;
    function PesquisaContaBanco(Descricao: String; APesquisa: boolean = false): boolean; overload;

    procedure Get_Codigo(Tabela: TSqlDataSet; Codigo: String);
    procedure Get_Descricao(Tabela: TClientDataSet; Descricao: String);
    procedure Get_Obs(Codigo,Tipo: string);


    function ContasCarga(inCarga, Tipo: String): boolean;
    procedure Altera_Visto(Cod_Cliente, Cod_Contato: String);
    procedure Pesquisa_Letra(Data, Cod_Motorista, Num_Pedido: String);
    procedure Saldo_Carga(Num_Carga, Num_Pedido: String);
    function Calcula_Lucro(Num_Pedido, Tipo: String): String;
    procedure Excluir_Obs_ContasPed(inCodigo, Tipo: String);
    procedure ExcluirParcela(inId_Conta: String);
    procedure GetFornecedor(Codigo, CodEmpresa: Integer);
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
  end;

var
  dmRegra: TdmRegra;

implementation

uses uDM, UUtil, uCidade, uAgenciador, uTransportador, uCliente,
  uFornecedor, uMotorista, uEstado, uVendedor;

{$R *.dfm}

{ TdmRegra }

procedure TdmRegra.Altera_Visto(Cod_Cliente, Cod_Contato: String);
begin
   if Cod_Contato <> Cod_Cliente then
      dm.CargaVISTO.Text:='NF'
   else
      dm.CargaVISTO.Clear;
end;

function TdmRegra.Calcula_Lucro(Num_Pedido, Tipo: String): String;
begin
// Tipo = T-Tudo

   Qpedido.close;
   Qpedido.params[0].Text:=Num_Pedido;
   Qpedido.open;
   if Tipo = 'T' then
   begin
      dm.CargaVALOR_CARREGA.AsFloat:=
      Casas2(
         (QPedidoVALOR_LUCRO.AsFloat * dm.CargaQTDE.AsFloat) -
         dm.CargaVALOR_FRETE.AsFloat
      );
   end;
   result:=formatfloat(',##0.00',QPedidoVALOR_LUCRO.AsFloat);
   Qpedido.close;
end;

procedure TdmRegra.ComandoSql(inComando: String);
begin
   dm.Qsql.Close;
   dm.Qsql.SQL.Text:=inComando;
   dm.Qsql.Open;
end;


function TdmRegra.ContasCarga(inCarga, Tipo: String): boolean;
var vlContas, vlCarga: String;
begin
   // Tipo = P-Pedido C-Cliente
   result:=true;
   if dm.CargaSITUACAO.Text = 'C' then // Cancelado
      Exit;
   QContasCarga.Close;
   QContasCarga.Params[0].Text:=vgCod_Empresa;
   QContasCarga.Params[1].Text:=inCarga;
   QContasCarga.Open;
   vlContas:=formatfloat(',##0.00',QContasCargaVALOR_PAGAR.AsFloat);
   vlCarga:=formatfloat(',##0.00',dm.CargaVALOR_CARREGA.AsFloat);
   if Tipo = 'P' then
   begin
      if vlContas <> vlCarga then
      begin
         mensagem('Valor da Carga diferente das parcelas, Verifique!');
         result:=true;
      end;
   end;

   if Tipo = 'C' then
   begin
      if dm.CargaCOD_CONTATO.Text <> '' then
      begin
         if dm.CargaCOD_CONTATO.Text <> QContasCargaCOD_CLIENTE.Text then
            Executa
            (
             ' update CONTAS'
            +' set COD_CLIENTE = '+dm.CargaCOD_CONTATO.Text
            +' where COD_EMPRESA = '+vgCod_Empresa
            +' and NUM_PEDIDO = '+dm.CargaID_CARGA.Text
            +' and TIPO_CONTA = 2'
            );
            result:=true;
      end;
   end;
   QContasCarga.close;
end;

procedure TdmRegra.Excluir_Carga(inCodigo: String);
begin
   Excluir_Obs_ContasPed(inCodigo,'2');
   Executa('delete from CONTAS where NUM_PEDIDO = '+inCodigo+' and TIPO_CONTA = 2');
   Executa('delete from CARGA where ID_CARGA = '+inCodigo);
   ExecutaSql('delete from CAD_OBS where CODIGO = '+inCodigo+' and TIPO = ''CAR''');

end;

procedure TdmRegra.Excluir_Obs_ContasPed(inCodigo, Tipo: String);
var
   vsql1: string;
   vQContas: TSQLQuery;
   vQObs: TSQLQuery;
begin
   vQObs:=TSQLQuery.Create(nil);
   vQObs.SQLConnection:=dm.BancoDados;
   vQObs.Close;
   vQObs.SQL.Add(' delete from OBS_CONTAS');
   vQObs.SQL.Add(' where COD_EMPRESA = :COD_EMPRESA');
   vQObs.SQL.Add(' and ID_CONTA = :ID_CONTA');
   vQObs.Params[0].DataType:=ftInteger;
   vQObs.Params[1].DataType:=ftInteger;

   vQContas:=TSQLQuery.Create(nil);
   vQContas.SQLConnection:=dm.BancoDados;
   vQContas.Close;
   vQContas.SQL.Add(' select ID_CONTA from CONTAS');
   vQContas.SQL.Add(' where COD_EMPRESA = ' + vgCod_Empresa);
   vQContas.SQL.Add(' and NUM_PEDIDO = ' + inCodigo);
   vQContas.SQL.Add(' and TIPO_CONTA  = ''' + Tipo + '''');
   vQContas.Open;
   if not (vQContas.FieldByName('ID_CONTA').IsNull) then
   begin
      while not vQContas.Eof do
      begin
         vQObs.Close;
         vQObs.Params[0].Text:=vgCod_Empresa;
         vQObs.Params[1].Text:=vQContas.FieldByName('ID_CONTA').Text;
         vQObs.ExecSQL();
         vQContas.Next;
      end;
   end;
   vQContas.close;
   FreeAndNil(vQContas);
   FreeAndNil(vQObs);
   {
   vsql1:='(select ID_CONTA from CONTAS where COD_EMPRESA = ' + vgCod_Empresa;
   vsql1:=vsql1 + ' and NUM_PEDIDO = ' + inCodigo + ' and TIPO_CONTA = ' + Tipo + ')';

   vsql2:='delete from OBS_CONTAS where COD_EMPRESA = '+vgCod_Empresa;
   vsql2:=vsql2 + ' and exists ' + vsql1;
   ExecutaSql(vsql2);
   }
end;

function TdmRegra.Excluir_Pedido(inCodigo: String): boolean;
begin
   result:=true;
   dm.Qsql.Close;
   dm.Qsql.SQL.Text:='select COD_CLIENTE from CARGA where NUM_PEDIDO = '+inCodigo;
   dm.Qsql.Open;
   if not dm.Qsql.Fields[0].IsNull then
   begin
      mensagem('Pedido possui Carga !!.'+#10+'Primeiro exclua as cargas, para depois excluir este pedido');
      dm.Qsql.Close;
      result:=false;
      exit;
   end;
   dm.Qsql.Close;
   Excluir_Obs_ContasPed(inCodigo,'1');
   Executa('delete from TABELA_PRAZO where NUM_PEDIDO = '+inCodigo);
   Executa('delete from CONTAS where NUM_PEDIDO = '+inCodigo+' and TIPO_CONTA = 1');
   Executa('delete from ITENS_PEDIDO where NUM_PEDIDO = '+inCodigo);
   Executa('delete from PEDIDO where NUM_PEDIDO = '+inCodigo);
end;

procedure TdmRegra.ExcluirParcela(inId_Conta: String);
begin
   ExecutaSql('delete from OBS_CONTAS where COD_EMPRESA = ' + vgCod_Empresa + ' and ID_CONTA = ' + inId_Conta);
   ExecutaSql('delete from CONTAS where COD_EMPRESA = ' + vgCod_Empresa + ' and ID_CONTA = ' + inId_Conta);
end;

procedure TdmRegra.GetFornecedor(Codigo, CodEmpresa: Integer);
begin
  dm.Qsql.Close;
  dm.Qsql.SQL.Clear;
  dm.Qsql.SQL.Add('select COD_FOR, NOME from FORNECEDOR');
  dm.Qsql.SQL.Add(' where COD_EMPRESA = ' + IntToStr(CodEmpresa));
  dm.Qsql.SQL.Add(' and COD_FOR = ' + IntToStr(Codigo));
  dm.Qsql.Open;

  FCodigo := dm.Qsql.FieldByName('COD_FOR').AsInteger;
  FNome := dm.Qsql.FieldByName('NOME').AsString;
  dm.Qsql.Close;
end;

procedure TdmRegra.Get_Codigo(Tabela: TSqlDataSet; Codigo: String);
begin
   Tabela.Close;
   Tabela.Params[0].Text:=vgCod_Empresa;
   Tabela.Params[1].Text:=Codigo;
   Tabela.Open;
end;

procedure TdmRegra.Get_Descricao(Tabela: TClientDataSet;
  Descricao: String);
begin
   Tabela.Close;
   Tabela.Params[0].Text:=vgCod_Empresa;
   Tabela.Params[1].Text:=Descricao+'%';
   Tabela.Open;
end;

procedure TdmRegra.Get_Obs(Codigo, Tipo: string);
begin
   dm.Cad_Obs.Close;
   dm.Cad_Obs.Params.ParamByName('CODIGO').Text:=Codigo;
   dm.Cad_Obs.Params.ParamByName('TIPO').Text:=Tipo;
   dm.Cad_Obs.Open;
end;

function TdmRegra.PesquisaAgenciador(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fAgenciador:=TfAgenciador.create(Self);
   Get_Descricao(dm.Agenciador,Descricao);
   if dm.Agenciador.RecordCount = 1 then vlRetorno:=true;
   if dm.Agenciador.RecordCount <> 1 then
   begin
      fAgenciador.TipoCad.Text:='P';
      fAgenciador.EditNome.Text:=Descricao;
      if fAgenciador.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.Agenciador,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

function TdmRegra.PesquisaCidade(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fCidade:=TfCidade.create(Self);
   Get_Descricao(dm.Cidade,Descricao);
   if dm.Cidade.RecordCount = 1 then vlRetorno:=true;
   if dm.Cidade.RecordCount <> 1 then
   begin
      fCidade.TipoCad.Text:='P';
      fCidade.EditNome.Text:=Descricao;
      if fCidade.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.Cidade,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

function TdmRegra.PesquisaCliente(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fCliente:=TfCliente.create(Self);
   Get_Descricao(dm.Cliente,Descricao);
   if dm.Cliente.RecordCount = 1 then vlRetorno:=true;
   if dm.Cliente.RecordCount <> 1 then
   begin
      fCliente.TipoCad.Text:='P';
      fCliente.EditNome.Text:=Descricao;
      if fCliente.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.Cliente,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

function TdmRegra.PesquisaContaBanco(Descricao: String;
  APesquisa: boolean): boolean;
var
  vlRetorno: boolean;
  obj: TContaBanco;
  sAtivo: string;
begin
   sAtivo := 'T';
   if APesquisa then
    sAtivo := 'S';
   vlRetorno:=true;
   fContaBanco:=TfContaBanco.create(APesquisa);

   obj := TContaBanco.Create;
   try
    obj.GetNumConta(Descricao, sAtivo, 1);

     if dm.ContaBanco.RecordCount = 1 then vlRetorno:=true;
     if dm.ContaBanco.RecordCount <> 1 then
     begin
        if dm.ContaBanco.RecordCount = 0 then
        begin
          obj.GetNumConta(Descricao, sAtivo, 1);
          vlRetorno := false;
        end
        else begin
          fContaBanco.TipoCad.Text:='P';
          fContaBanco.EditNome.Text:=Descricao;
          if fContaBanco.ShowModal = mrOk then vlRetorno:=true
          else begin
             obj.GetNumConta(Descricao, sAtivo, 1);
             vlRetorno:=false;
          end;
        end;
     end;
     Result:=vlRetorno;
   finally
     FreeAndNil(obj);
   end;
end;

function TdmRegra.PesquisaContaBanco(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fContaBanco:=TfContaBanco.create(Self);
   Get_Descricao(dm.ContaBanco,Descricao);
   if dm.ContaBanco.RecordCount = 1 then vlRetorno:=true;
   if dm.ContaBanco.RecordCount <> 1 then
   begin
      fContaBanco.TipoCad.Text:='P';
      fContaBanco.EditNome.Text:=Descricao;
      if fContaBanco.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.ContaBanco,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

function TdmRegra.PesquisaEstado(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fEstado:=TFEstado.create(Self);
   Get_Descricao(dm.Estado,Descricao);
   if dm.Estado.RecordCount = 1 then vlRetorno:=true;
   if dm.Estado.RecordCount <> 1 then
   begin
      fEstado.TipoCad.Text:='P';
      fEstado.EditNome.Text:=Descricao;
      if fEstado.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.Estado,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

function TdmRegra.PesquisaFornecedor(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fFornecedor:=TFFornecedor.create(Self);
   Get_Descricao(dm.Fornecedor,Descricao);
   if dm.Fornecedor.RecordCount = 1 then vlRetorno:=true;
   if dm.Fornecedor.RecordCount <> 1 then
   begin
      ffornecedor.TipoCad.Text:='P';
      ffornecedor.EditNome.Text:=Descricao;
      if ffornecedor.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.fornecedor,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

function TdmRegra.PesquisaMotorista(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fMotorista:=TfMotorista.create(Self);
   Get_Descricao(dm.Motorista,Descricao);
   if dm.Motorista.RecordCount = 1 then vlRetorno:=true;
   if dm.Motorista.RecordCount <> 1 then
   begin
      fMotorista.TipoCad.Text:='P';
      fMotorista.EditNome.Text:=Descricao;
      if fMotorista.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.Motorista,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

function TdmRegra.PesquisaTransportador(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fTransportador:=TfTransportador.create(Self);
   Get_Descricao(dm.Transportador,Descricao);
   if dm.Transportador.RecordCount = 1 then vlRetorno:=true;
   if dm.Transportador.RecordCount <> 1 then
   begin
      fTransportador.TipoCad.Text:='P';
      fTransportador.EditNome.Text:=Descricao;
      if fTransportador.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.Transportador,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

procedure TdmRegra.Pesquisa_Letra(Data, Cod_Motorista, Num_Pedido: String);
var vlQtde: Integer;
var vldia,vlmes,vlano: word;
var vlseq: String;
begin
   decodeDate(date,vlano,vlmes,vldia);
   if (trim(Data) <> '') and (Cod_Motorista <> '') and (Num_Pedido <> '') then
   begin
      QPesq.Close;
      QPesq.Params.ParamByName('COD_EMPRESA').Text:=vgCod_Empresa;
      QPesq.Params.ParamByName('DATA').AsDate:=strtodate(data);
      QPesq.Params.ParamByName('COD_MOTORISTA').Text:=Cod_Motorista;
      Qpesq.Open;
      if QpesqQTDE.AsFloat = 0 then
      begin
         Qpesq1.Close;
         Qpesq1.Params[0].Text:=vgcod_Empresa;
         Qpesq1.Params[1].AsDate:=dm.CargaDATA.AsDateTime;
         Qpesq1.Open;
         vlQtde:=Qpesq1N_CARGA.AsInteger + 1;
         vlSeq:=inttostr(vlDia)+inttostr(vlMes)+copy(inttostr(vlAno),3,2);
         if (Qpesq1N_CARGA.AsInteger = 0) or (Qpesq1N_CARGA.IsNull) then
            dm.CargaNUM_CARGA.Text:=vlSeq + intToStr(vlQtde)
         else
            dm.CargaNUM_CARGA.AsInteger:=vlQtde;
         dm.CargaLETRA.Clear;

         Qpesq1.Close;
         Qpesq.close;

         exit;
      end;
      vlQtde:=QpesqQTDE.AsInteger + 1;

      dm.CargaLETRA.Text:='';
      if vlQtde = 2 then
         dm.CargaLETRA.Text:='A';
      if vlQtde = 3 then
         dm.CargaLETRA.Text:='B';
      if vlQtde = 4 then
         dm.CargaLETRA.Text:='C';
      if vlQtde = 5 then
         dm.CargaLETRA.Text:='D';
      if vlQtde = 6 then
         dm.CargaLETRA.Text:='E';
      if vlQtde = 7 then
         dm.CargaLETRA.Text:='F';
      if vlQtde = 8 then
         dm.CargaLETRA.Text:='G';
      if vlQtde = 9 then
         dm.CargaLETRA.Text:='H';
      if vlQtde = 10 then
         dm.CargaLETRA.Text:='I';
      if vlQtde = 11 then
         dm.CargaLETRA.Text:='J';
      if vlQtde = 12 then
         dm.CargaLETRA.Text:='L';
      if vlQtde = 13 then
         dm.CargaLETRA.Text:='M';
      if vlQtde = 14 then
         dm.CargaLETRA.Text:='N';
      if vlQtde = 15 then
         dm.CargaLETRA.Text:='O';

      dm.CargaNUM_CARGA.AsInteger:=QpesqNUM_CARGA.AsInteger;
      Qpesq.Close;
   end;
end;

procedure TdmRegra.Saldo_Carga(Num_Carga, Num_Pedido: String);
begin
   if not (dm.Carga.State = dsInsert) then
      exit;
   Qsaldo.Close;
   Qsaldo.Params[0].text:=vgCod_Empresa;
   if dm.Carga.State = dsInsert then
      Qsaldo.Params[1].text:=Num_Carga
   else
      Qsaldo.Params[1].text:='0';
   Qsaldo.Params[2].text:=Num_Pedido;
   Qsaldo.Open;

   if dm.Carga.State = dsInsert then
   begin
      if dm.CargaQTDE.AsFloat = 0 then
         dm.CargaQTDE.AsFloat:=dm.CargaQTDE_PEDIDO.AsFloat - QSaldoQTDE_ENTREGUE.AsFloat;
   end;
   dm.cargaSALDO.asfloat:=dm.CargaQTDE_PEDIDO.AsFloat - QSaldoQTDE_ENTREGUE.AsFloat - dm.CargaQTDE.AsFloat;
   Qsaldo.Close;
end;

procedure TdmRegra.Troca_Cliente_Venda;
begin
   ComandoQsql('select COD_CLIENTE from CONTAS where NUM_PEDIDO = '+dm.PedidoNUM_PEDIDO.Text);
   if dm.PedidoCOD_CLIENTE.Text <> dm.Qsql.FieldByName('COD_CLIENTE').Text then
      Executa('update CONTAS set COD_CLIENTE = '+DM.PedidoCOD_CLIENTE.Text+' where NUM_PEDIDO = '+dm.PedidoNUM_PEDIDO.Text);
   dm.Qsql.Close;
end;

function TdmRegra.Valida_cnpj(Cnpj: String): Boolean;
begin
   result:=true;
   if (trim(cnpj) = '') or (trim(cnpj) = 'ISENTO') then
      exit;
   if cgc(cnpj) <> cnpj then
   begin
      mensagem('CNPJ inválido, preecha corretamente ou deixe em branco');
      result:=false;
   end;

end;

function TdmRegra.Valida_CPF(cpf: String): boolean;
begin
   result:=true;
   if copy(cpf,1,1) = ' ' then exit;
   if cic(cpf) <> cpf then
   begin
      mensagem('CPF inválido, Preencha corretamente ou deixe em branco');
      result:=false;
   end;
end;

function TdmRegra.Valida_Inscricao_Estadual(Inscricao,
  Estado: String): boolean;
var vaux: string;
begin
   Result:=true;
   if (trim(Inscricao) = '') or (trim(Estado) = '') then
      exit;
   vaux:=tiracar(Inscricao,'.');
   vaux:=tiracar(Inscricao,'-');
   if trim(Inscricao) = '' then exit;
   if InscEstadual(vaux,trim(Estado)) = 1 then
      result:=false;
end;

function TdmRegra.VerificaData(inData: String): boolean;
begin
   result:=true;
   if inData <> '' then
   begin
      if (strtodate(inData) < strtodate('01/01/2000')) or (strtodate(inData) > strtodate('31/12/2050')) then
      begin
         mensagem('Data incorreta!, Verifique o ano');
         result:=false;
      end;
   end;
end;

function TdmRegra.PesquisaVendedor(Descricao: String): boolean;
var vlRetorno: boolean;
begin
   vlRetorno:=true;
   fVendedor:=TfVendedor.create(Self);
   Get_Descricao(dm.Vendedor,Descricao);
   if dm.Vendedor.RecordCount = 1 then vlRetorno:=true;
   if dm.Vendedor.RecordCount <> 1 then
   begin
      fVendedor.TipoCad.Text:='P';
      fVendedor.EditNome.Text:=Descricao;
      if fVendedor.ShowModal = mrOk then vlRetorno:=true
      else begin
         Get_Descricao(dm.Vendedor,'abcd');
         vlRetorno:=false;
      end;
   end;
   Result:=vlRetorno;
end;

end.
