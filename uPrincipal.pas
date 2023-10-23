unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UDTMConexao, Enter,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls,UFrmAtualizaDB;

type
  TfrmPrincipal = class(TForm)
    MainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    Relatrios1: TMenuItem;
    Cliente1: TMenuItem;
    N1: TMenuItem;
    PRODUTO1: TMenuItem;
    Categoria1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    menuFechar: TMenuItem;
    Vendas1: TMenuItem;
    clientes1: TMenuItem;
    N4: TMenuItem;
    Produto2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    BgSistema: TImage;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cliente1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TFrmAtualizaDB);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uCadClientes, uCadProdutos, uProVenda;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
frmCadCategoria:=TfrmCadCategoria.Create(Self);
frmCadCategoria.ShowModal;
frmCadCategoria.Release;

end;

procedure TfrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmCadClientes:=TfrmCadClientes.Create(Self);
  frmCadClientes.ShowModal;
  frmCadClientes.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(TeclaEnter);
FreeAndNil(dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FrmAtualizaDB:=TFrmAtualizaDB.Create(Self);
  FrmAtualizaDB.Show;
  FrmAtualizaDB.Refresh;
  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.conexaoDB do begin
//    SQLHourGlass:=True;
//    Protocol := 'mssql';
//    LibraryLocation :='C:\Vendas\ntwdblib.dll';
//    HostName := 'embratitst.ddns.net';
//    Port:=7210;
//    User:='sa';
//    Password:='SenhaTstDesenv1';
//    Database:='Vendas';
//    Connected:=True;
  end;
  AtualizacaoBancoDados(FrmAtualizaDB);
  FrmAtualizaDB.Free;

  TeclaEnter:= TMREnter.Create(Self);
  TeclaEnter.FocusEnabled:=true;
  TeclaEnter.FocusColor:=clInfobk;
end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin;
  //Close;
  Application.Terminate;
end;

 procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin;
  frmCadProduto:=TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Release;
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
begin
  frmProVenda:=TfrmProVenda.Create(Self);
  frmProVenda.ShowModal;
  frmProVenda.Release;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TFrmAtualizaDB);
begin
  aForm.ChkConexao.Checked := true;
  aForm.ChkConexao.Font.Color := clGreen;
  aForm.Refresh;

  dtmPrincipal.QryScriptCategorias.Connection := dtmPrincipal.ConexaoDB;
  dtmPrincipal.QryScriptCategorias.ExecSQL;
  aForm.ChkCategoria.Checked := True;
  aForm.ChkCategoria.Font.Color := clGreen;
  aForm.Refresh;
  Sleep(100);

  dtmPrincipal.QryScriptProdutos.Connection := dtmPrincipal.ConexaoDB;
  dtmPrincipal.QryScriptProdutos.ExecSQL;
  aForm.ChkProduto.Checked := True;
  aForm.ChkProduto.Font.Color := clGreen;
  aForm.Refresh;
  Sleep(100);

  dtmPrincipal.QryScriptClientes.Connection := dtmPrincipal.ConexaoDB;
  dtmPrincipal.QryScriptClientes.ExecSQL;
  aForm.ChkCliente.Checked := True;
  aForm.ChkCliente.Font.Color := clGreen;
  aForm.Refresh;
  Sleep(100);

  dtmPrincipal.QryScriptVendas.Connection := dtmPrincipal.ConexaoDB;
  dtmPrincipal.QryScriptVendas.ExecSQL;
  aForm.ChkVendas.Checked := True;
  aForm.ChkVendas.Font.Color := clGreen;
  aForm.Refresh;
  Sleep(100);

  dtmPrincipal.QryScriptItensVendas.Connection := dtmPrincipal.ConexaoDB;
  dtmPrincipal.QryScriptItensVendas.ExecSQL;
  aForm.ChkItensVendas.Checked := True;
  aForm.ChkItensVendas.Font.Color := clGreen;
  aForm.Refresh;
  Sleep(100);

end;


end.
