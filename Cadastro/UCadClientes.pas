unit UCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, cCadClientes, uEnum ;

type
  TfrmCadClientes = class(TfrmTelaHeranca)
    QryListagemclienteId: TZIntegerField;
    QryListagemnome: TZUnicodeStringField;
    QryListagemcpf: TZUnicodeStringField;
    QryListagemrg: TZUnicodeStringField;
    QryListagemendereco: TZUnicodeStringField;
    QryListagemcidade: TZUnicodeStringField;
    QryListagembairro: TZUnicodeStringField;
    QryListagemestado: TZUnicodeStringField;
    QryListagemcep: TZUnicodeStringField;
    QryListagemtelefone: TZUnicodeStringField;
    QryListagemcelular: TZUnicodeStringField;
    QryListagememail: TZUnicodeStringField;
    QryListagemdataNascimento: TZDateTimeField;
    edtClienteId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCEP: TMaskEdit;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    edtEmail: TLabeledEdit;
    edtCPF: TMaskEdit;
    edtRG: TMaskEdit;
    edtEstado: TLabeledEdit;
    edtDataNascimento: TDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    ocliente:TCliente;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;

  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

uses
  UDTMConexao;

{$R *.dfm}

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin

  if ocliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger)  then begin
     edtClienteId.Text:=IntToStr(oCliente.codigo);
     edtNome.Text               :=oCliente.nome;
     edtCpf.Text                :=oCliente.cpf;
     edtRg.Text                 :=oCliente.rg;
     edtCep.Text                :=oCliente.cep;
     edtEndereco.Text           :=oCliente.endereco;
     edtBairro.Text             :=oCliente.bairro;
     edtEstado.Text             :=oCliente.estado;
     edtCidade.Text             :=oCliente.cidade;
     edtTelefone.Text           :=oCliente.telefone;
     edtCelular.Text            :=oCliente.celular;
     edtEmail.Text              :=oCliente.email;
     edtDataNascimento.Date     :=oCliente.dataNascimento;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;


procedure TfrmCadClientes.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date:=Date;
  edtNome.SetFocus;
end;



procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
     FreeAndnil(oCliente);
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente:=TCliente.Create(dtmPrincipal.conexaoDB);

  IndiceAtual :='nome';
end;

{$Region 'Override'}
function TfrmCadClientes.Apagar: Boolean;
begin
  if oCliente.Selecionar(QryListagem.fieldByName('clienteId').AsInteger) then  begin
     Result :=oCliente.Apagar;
  end;
end;

function TfrmCadClientes.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
     oCliente.codigo:=StrToInt(edtClienteId.Text)
  else
    oCliente.codigo:=0;

  oCliente.nome                 :=edtNome.Text;
  oCliente.cpf                  :=edtCpf.Text;
  oCliente.rg                   :=edtRg.Text;
  ocliente.cep                  :=edtCep.Text;
  oCliente.endereco             :=edtEndereco.Text;
  oCliente.bairro               :=edtBairro.Text;
  ocliente.estado               :=edtEstado.Text;
  oCliente.cidade               :=edtCidade.Text;
  oCliente.telefone             :=edtTelefone.Text;
  oCliente.celular              :=edtCelular.Text;
  oCliente.email                :=edtEmail.Text;
  oCliente.datanascimento       :=edtdatanascimento.Date;

  if (EstadoDoCadastro=ecInserir) then
      Result:=oCliente.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
    Result := oCliente.Atualizar;
end;


{$endRegion}

end.
