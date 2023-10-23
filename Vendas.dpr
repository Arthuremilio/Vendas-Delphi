program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  UDTMConexao in 'dataModule\UDTMConexao.pas' {dtmPrincipal: TDataModule},
  uTelaHeranca in 'uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in 'Cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'heranca\uEnum.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  UCadClientes in 'Cadastro\UCadClientes.pas' {frmCadClientes},
  cCadClientes in 'Classes\cCadClientes.pas',
  uCadProdutos in 'Cadastro\uCadProdutos.pas' {frmCadProduto},
  cCadProdutos in 'Classes\cCadProdutos.pas',
  UFrmAtualizaDB in 'dataModule\UFrmAtualizaDB.pas' {FrmAtualizaDB},
  UDTMVenda in 'dataModule\UDTMVenda.pas' {DTMVenda: TDataModule},
  uProVenda in 'processo\uProVenda.pas' {frmProVenda},
  cProVenda in 'Classes\cProVenda.pas',
  URelCategoria in 'Relatorio\URelCategoria.pas' {frmRelCategoria};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelCategoria, frmRelCategoria);
  Application.Run;
end.
