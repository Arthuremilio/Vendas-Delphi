unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UDTMConexao, Enter,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

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
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategoria, uCadClientes, uCadProdutos;

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

  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.conexaoDB do begin
    SQLHourGlass:=True;
    Protocol := 'mssql';
    LibraryLocation :='C:\Users\USER\Desktop\Arthur\Projeto delphi\ntwdblib.dll';
    HostName := '.\SERVERCURSO';
    Port:=1433;
    User:='sa';
    Password:='123456';
    Database:='Vendas';
    Connected:=True;
  end;
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

end.
