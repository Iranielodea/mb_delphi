unit uCargaModel;

interface

uses
  System.SysUtils, UUtil;

type
  TCargaModel = class
  private
    FNomeCliente: string;
    FCodigo: Integer;
    FId: Integer;
    FNumPedido: integer;
    FNomeContato: string;
    FNumCarga: Integer;
    FLetra: string;
    FData: TDate;
    FQtde: Currency;
    FVisto: string;
    FValorFrete: Currency;
    FValorCarrega: Currency;
    FValorPedido: Currency;
    FNomeFornecedor: string;
    FNomeAgencia: string;
    FNomeMotorista: string;
    FQtdePedido: Currency;
    FPlaca: string;
    FObs: string;
    FSituacao: string;
    FFinanceiro: string;
    FComplemento: string;
    FContatoIndicacao: string;
    FSaldo: Currency;
    FArmazen: string;
    FComplUnidade: string;
    FUnidade: string;
    FNumNF: string;
    FObs2: string;
    FDataNF: TDate;
    FNomeManifesto: string;
    FQtdeCada: Currency;
    FSiglaUnidade: string;
    FAgenciaBanco: string;
    FCNPJ_CPF: string;
    FCreditoNF: string;
    FNumNota2: string;
    FIR: Currency;
    FValorNota2: Currency;
    FNomeUsina: string;
    FCodCliente: Integer;
    FCodManifesto: Integer;
    FIdUnidade: Integer;
    FIdContaBanco: Integer;
    FCodContato: Integer;
    FCodMotorista: Integer;
    FCodUsina: Integer;
    FCodFor: Integer;
    function GetNomeFornecedor: string;
    function GetNomeMotorista: string;
    function GetNomeUsina: string;
    function GetArmazen: string;
    function GetObs2: string;
    function GetNomeCliente: string;
    function GetNomeContato: string;
    function GetNomeAgencia: string;
    function GetComplemento: string;
    function GetContatoIndicacao: string;
    function GetUnidade: string;
    function GetComplUnidade: string;
    function GetNomeManifesto: string;
    function GetSiglaUnidade: string;
    function GetAgenciaBanco: string;
    function GetObs: string;
    function GetPlaca: string;
    function GetNumNF: string;
    function GetCreditoNF: string;
    function GetNumNota2: string;
  public
    property Id: Integer read FId write FId;
    property Codigo: Integer read FCodigo write FCodigo;
    property NomeCliente: string read GetNomeCliente write FNomeCliente;
    property NomeContato: string read GetNomeContato write FNomeContato;
    property NumPedido: integer read FNumPedido write FNumPedido;
    property NumCarga: Integer read FNumCarga write FNumCarga;
    property Letra: string read FLetra write FLetra;
    property Data: TDate read FData write FData;
    property Visto: string read FVisto write FVisto;
    property Qtde: Currency read FQtde write FQtde;
    property ValorPedido: Currency read FValorPedido write FValorPedido;
    property ValorCarrega: Currency read FValorCarrega write FValorCarrega;
    property ValorFrete: Currency read FValorFrete write FValorFrete;
    property NomeFornecedor: string read GetNomeFornecedor write FNomeFornecedor;
    property NomeMotorista: string read GetNomeMotorista write FNomeMotorista;
    property NomeAgencia: string read GetNomeAgencia write FNomeAgencia;
    property QtdePedido: Currency read FQtdePedido write FQtdePedido;
    property Placa: string read GetPlaca write FPlaca;
    property Obs: string read GetObs write FObs;
    property Situacao: string read FSituacao write FSituacao;
    property Financeiro: string read FFinanceiro write FFinanceiro;
    property Complemento: string read GetComplemento write FComplemento;
    property ContatoIndicacao: string read GetContatoIndicacao write FContatoIndicacao;
    property Saldo: Currency read FSaldo write FSaldo;
    property Armazen: string read GetArmazen write FArmazen;
    property Unidade: string read GetUnidade write FUnidade;
    property ComplUnidade: string read GetComplUnidade write FComplUnidade;
    property Obs2: string read GetObs2 write FObs2;
    property NumNF: string read GetNumNF write FNumNF;
    property DataNF: TDate read FDataNF write FDataNF;
    property NomeManifesto: string read GetNomeManifesto write FNomeManifesto;
    property QtdeCada: Currency read FQtdeCada write FQtdeCada;
    property SiglaUnidade: string read GetSiglaUnidade write FSiglaUnidade;
    property AgenciaBanco: string read GetAgenciaBanco write FAgenciaBanco;
    property CNPJ_CPF: string read FCNPJ_CPF write FCNPJ_CPF;
    property CreditoNF: string read GetCreditoNF write FCreditoNF;
    property NumNota2: string read GetNumNota2 write FNumNota2;
    property IR: Currency read FIR write FIR;
    property ValorNota2: Currency read FValorNota2 write FValorNota2;
    property NomeUsina: string read GetNomeUsina write FNomeUsina;
    property CodCliente: Integer read FCodCliente write FCodCliente;
    property CodFor: Integer read FCodFor write FCodFor;
    property CodContato: Integer read FCodContato write FCodContato;
    property CodMotorista: Integer read FCodMotorista write FCodMotorista;
    property CodManifesto: Integer read FCodManifesto write FCodManifesto;
    property IdUnidade: Integer read FIdUnidade write FIdUnidade;
    property IdContaBanco: Integer read FIdContaBanco write FIdContaBanco;
    property CodUsina: Integer read FCodUsina write FCodUsina;
  end;

implementation

{ TCargaModel }

function TCargaModel.GetAgenciaBanco: string;
begin
  Result := TiraAcento(FAgenciaBanco);
end;

function TCargaModel.GetArmazen: string;
begin
  Result := TiraAcento(FArmazen);
end;

function TCargaModel.GetComplemento: string;
begin
  Result := TiraAcento(FComplemento);
end;

function TCargaModel.GetComplUnidade: string;
begin
  Result := TiraAcento(FComplUnidade);
end;

function TCargaModel.GetContatoIndicacao: string;
begin
  Result := TiraAcento(FContatoIndicacao);
end;

function TCargaModel.GetCreditoNF: string;
begin
  Result := TiraAcento(FCreditoNF);
end;

function TCargaModel.GetNomeAgencia: string;
begin
  Result := TiraAcento(FNomeAgencia);
end;

function TCargaModel.GetNomeCliente: string;
begin
  Result := TiraAcento(FNomeCliente);
end;

function TCargaModel.GetNomeContato: string;
begin
  Result := TiraAcento(FNomeContato);
end;

function TCargaModel.GetNomeFornecedor: string;
begin
  Result := TiraAcento(FNomeFornecedor);
end;

function TCargaModel.GetNomeManifesto: string;
begin
  Result := TiraAcento(FNomeManifesto);
end;

function TCargaModel.GetNomeMotorista: string;
begin
  Result := TiraAcento(FNomeMotorista);
end;

function TCargaModel.GetNomeUsina: string;
begin
  Result := TiraAcento(FNomeUsina);
end;

function TCargaModel.GetNumNF: string;
begin
  Result := TiraAcento(FNumNF);
end;

function TCargaModel.GetNumNota2: string;
begin
  Result := TiraAcento(FNumNota2);
end;

function TCargaModel.GetObs: string;
begin
  Result := TiraAcento(FObs);
end;

function TCargaModel.GetObs2: string;
begin
  Result := TiraAcento(FObs2);
end;

function TCargaModel.GetPlaca: string;
begin
  Result := TiraAcento(FPlaca);
end;

function TCargaModel.GetSiglaUnidade: string;
begin
  Result := TiraAcento(FSiglaUnidade);
end;

function TCargaModel.GetUnidade: string;
begin
  Result := TiraAcento(FUnidade);
end;

end.
