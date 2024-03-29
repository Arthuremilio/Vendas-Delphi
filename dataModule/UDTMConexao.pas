unit UDTMConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdtmPrincipal = class(TDataModule)
    conexaoDB: TZConnection;
    QryScriptCategorias: TZQuery;
    QryScriptClientes: TZQuery;
    QryScriptProdutos: TZQuery;
    QryScriptVendas: TZQuery;
    QryScriptItensVendas: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
end.
