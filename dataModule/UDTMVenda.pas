unit UDTMVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient;

type
  TDTMVenda = class(TDataModule)
    QryCliente: TZQuery;
    QryClienteclienteId: TZIntegerField;
    QryClientenome: TZUnicodeStringField;
    QryProdutos: TZQuery;
    QryProdutosprodutoId: TZIntegerField;
    QryProdutosnome: TZUnicodeStringField;
    QryProdutosvalor: TZFMTBCDField;
    QryProdutosquantidade: TZFMTBCDField;
    CdsItensVendas: TClientDataSet;
    DtsCliente: TDataSource;
    DtsProdutos: TDataSource;
    DtsItensVendas: TDataSource;
    CdsItensVendasprodutoId: TIntegerField;
    CdsItensVendasNomeProduto: TStringField;
    CdsItensVendasquantidade: TFloatField;
    CdsItensVendasValorUnitário: TFloatField;
    CdsItensVendasValorTotalProduto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DTMVenda: TDTMVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDTMConexao;

{$R *.dfm}

procedure TDTMVenda.DataModuleCreate(Sender: TObject);
begin
  CdsItensVendas.CreateDataSet;
  QryCliente.Open;
  QryProdutos.Open;

end;

procedure TDTMVenda.DataModuleDestroy(Sender: TObject);
begin
  CdsItensVendas.Close;
  QryCliente.Close;
  QryProdutos.Close;
end;



end.
