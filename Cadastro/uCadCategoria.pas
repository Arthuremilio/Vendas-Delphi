unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, cCadCategoria, UDTMConexao, uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    edtCategoriaId: TLabeledEdit;
    edtDescricaoId: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskEditClick(Sender: TObject);
    function Apagar :Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria:TCategoria;

  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

{$Region 'Override'}
function TfrmCadCategoria.Apagar: Boolean;
begin
  if ocategoria.Selecionar(QryListagem.fieldByName('categoriaId').AsInteger) then  begin
     Result :=oCategoria.Apagar;
  end;
end;
function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtCategoriaId.Text<>EmptyStr then
     oCategoria.codigo:=StrToInt(edtCategoriaId.Text)
  else
    oCategoria.codigo:=0;

  oCategoria.descricaoId:=edtDescricaoId.Text;

  if (EstadoDoCadastro=ecInserir) then
      Result:=oCategoria.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
    Result := oCategoria.Atualizar;
end;

{$endRegion}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if ocategoria.Selecionar(QryListagem.fieldByName('categoriaId').AsInteger) then  begin
    edtCategoriaId.Text:= IntToStr(oCategoria.codigo);
    edtDescricaoId.Text := oCategoria.descricaoId;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned (oCategoria) then
     FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria:=TCategoria.Create(dtmPrincipal.conexaoDB);

  IndiceAtual:='descricaoId';
end;

procedure TfrmCadCategoria.mskEditClick(Sender: TObject);
begin
  inherited;
mskEdit.Clear;
end;

end.
