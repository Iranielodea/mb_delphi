unit uFRConfPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ppProd, ppClass, ppReport,
  ppEndUsr, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, jpeg, ppPrnabl, ppBands,
  ppCache, ppParameter, myChkBox, ppStrtch, ppMemo, ppRichTx, StdCtrls,
  ppDesignLayer;

type
  TFRConfPedido = class(TForm)
    QPedido: TSQLQuery;
    dspPedido: TDataSetProvider;
    cdsPedido: TClientDataSet;
    dsPedido: TDataSource;
    dbPedido: TppDBPipeline;
    DesPedido: TppDesigner;
    RelPedido: TppReport;
    ppParameterList1: TppParameterList;
    cdsPedidoEMP_NOME: TStringField;
    cdsPedidoEMP_ENDERECO: TStringField;
    cdsPedidoEMP_NUMERO: TStringField;
    cdsPedidoEMP_CEP: TStringField;
    cdsPedidoEMP_DESC_CIDADE: TStringField;
    cdsPedidoEMP_ESTADO: TStringField;
    cdsPedidoEMP_FONE: TStringField;
    cdsPedidoEMP_FAX: TStringField;
    cdsPedidoEMP_EMAIL: TStringField;
    cdsPedidoEMP_CNPJ: TStringField;
    cdsPedidoPED_NUM_PEDIDO: TIntegerField;
    cdsPedidoPED_DATA: TSQLTimeStampField;
    cdsPedidoPED_OBS: TStringField;
    cdsPedidoPED_TOTAL_LIQUIDO: TFloatField;
    cdsPedidoCLI_NOME: TStringField;
    cdsPedidoCLI_ENDERECO: TStringField;
    cdsPedidoCLI_BAIRRO: TStringField;
    cdsPedidoCLI_NUMERO: TStringField;
    cdsPedidoCLI_CEP: TStringField;
    cdsPedidoCLI_COMPLEMENTO: TStringField;
    cdsPedidoCLI_CNPJ: TStringField;
    cdsPedidoCLI_INSC_ESTADUAL: TStringField;
    cdsPedidoCLI_EMAIL: TStringField;
    cdsPedidoCLI_DESC_CIDADE: TStringField;
    cdsPedidoCLI_UF: TStringField;
    cdsPedidoITE_DESC_PRODUTO: TStringField;
    cdsPedidoITE_QTDE: TFloatField;
    cdsPedidoITE_VALOR: TFloatField;
    cdsPedidoITE_VALOR_TOTAL: TFloatField;
    cdsPedidoITE_UN: TStringField;
    cdsPedidoCONF_FRETE_PAGO_DESC: TStringField;
    cdsPedidoCONF_COM_MANIFESTO: TStringField;
    cdsPedidoCONF_COM_DESCARGA: TStringField;
    cdsPedidoCONF_TEXTO: TStringField;
    cdsPedidoCONF_VENCIMENTOS: TStringField;
    cdsPedidoCONF_PRAZO: TStringField;
    cdsPedidoITE_VALOR_UNIT: TFloatField;
    cdsPedidoITE_VALOR_TOTAL_UNIT: TFloatField;
    cdsPedidoFOR_CODIGO: TIntegerField;
    cdsPedidoFOR_NOME: TStringField;
    cdsPedidoFOR_CNPJ: TStringField;
    cdsPedidoFOR_ENDERECO: TStringField;
    cdsPedidoFOR_CIDADE_UF: TStringField;
    cdsPedidoFOR_CEP: TStringField;
    cdsPedidoFOR_FONE: TStringField;
    cdsPedidoFOR_EMAIL: TStringField;
    cdsPedidoFOR_BAIRRO: TStringField;
    cdsPedidoFOR_CIDADE: TStringField;
    cdsPedidoFOR_UF: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppImage2: TppImage;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine4: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    ppLine7: TppLine;
    ppLabel18: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    myDBCheckBox1: TmyDBCheckBox;
    ppLabel13: TppLabel;
    ppDBText2: TppDBText;
    ppLabel14: TppLabel;
    myDBCheckBox2: TmyDBCheckBox;
    myDBCheckBox3: TmyDBCheckBox;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText3: TppDBText;
    ppLine8: TppLine;
    ppLabel27: TppLabel;
    ppDBText18: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    cdsPedidoFOR_INSC_ESTADUAL: TStringField;
    ppLabel45: TppLabel;
    ppLine13: TppLine;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Impressao(NumPedido: Integer);
  end;

var
  FRConfPedido: TFRConfPedido;

implementation

uses uDM;

{$R *.dfm}

{ TFRConfPedido }

procedure TFRConfPedido.Impressao(NumPedido: Integer);
begin
  cdsPedido.Close;
  cdsPedido.Params[0].AsInteger := NumPedido;
  cdsPedido.Open;

  RelPedido.Template.FileName:='Confirmacao.rtm';
  RelPedido.Template.LoadFromFile;

  RelPedido.Print;
  cdsPedido.Close;
end;

end.
