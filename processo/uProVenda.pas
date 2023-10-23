unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RxToolEdit, RxCurrEdit, uDtmVenda, uEnum, cProVenda, UDTMConexao;

type
  TfrmProVenda = class(TfrmTelaHeranca)
    edtVendaId: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    Label1: TLabel;
    edtDataVenda: TDateEdit;
    Label3: TLabel;
    Label2: TLabel;
    edtValorTotal: TCurrencyEdit;
    Panel2: TPanel;
    lkpProduto: TDBLookupComboBox;
    Label4: TLabel;
    edtQuantidade: TCurrencyEdit;
    Label5: TLabel;
    edtValorUnitario: TCurrencyEdit;
    Label6: TLabel;
    edtTotalProduto: TCurrencyEdit;
    Label7: TLabel;
    dbgridItensVenda: TDBGrid;
    QryListagemvendaId: TZIntegerField;
    QryListagemclienteId: TZIntegerField;
    QryListagemnome: TZUnicodeStringField;
    QryListagemdataVenda: TZDateTimeField;
    QryListagemtotalVenda: TZFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgridItensVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
   procedure btnAdicionarItemClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure dbgridItensVendaDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarItemClick(Sender: TObject);
  private
    { Private declarations }
     DTMVenda:TDTMVenda;
    oVenda:TVenda;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
    function TotalizarProduto(valorUnitario, Quantidade: Double): Double;
    procedure CarregarRegistroSelecionado;
    procedure LimparComponenteItem;
    procedure LimparCds;
    function TotalizarVenda: Double;

  public
    { Public declarations }
  end;

var
  frmProVenda: TfrmProVenda;

implementation

{$R *.dfm}

//uses uDtmPrincipal, uRelProVenda;

{$region 'Override'}
function TfrmProVenda.Apagar: Boolean;
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaId').AsInteger, dtmVenda.cdsItensVendas) then begin
     Result:=oVenda.Apagar;
  end;
end;

function TfrmProVenda.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  Result:=False;
  if edtVendaId.Text<>EmptyStr then
     oVenda.VendaId:=StrToInt(edtVendaId.Text)
  else
     oVenda.VendaId:=0;

  oVenda.ClienteId        :=lkpCliente.KeyValue;
  oVenda.DataVenda        :=edtDataVenda.Date;
  oVenda.TotalVenda       :=edtValorTotal.Value;

  if (EstadoDoCadastro=ecInserir) then begin
     oVenda.VendaId:=oVenda.Inserir(dtmVenda.cdsItensVendas);
  end
  else if (EstadoDoCadastro=ecAlterar) then
     oVenda.Atualizar(dtmVenda.cdsItensVendas);

//  frmRelProVenda:=TfrmRelProVenda.Create(self);
//  frmRelProVenda.QryVendas.Close;
//  frmRelProVenda.QryVendas.ParamByName('VendaId').AsInteger:= oVenda.VendaId;
//  frmRelProVenda.QryVendas.Open;
//
//  frmRelProVenda.QryVendaItens.Close;
//  frmRelProVenda.QryVendaItens.ParamByName('VendaId').AsInteger:= oVenda.VendaId;
//  frmRelProVenda.QryVendaItens.Open;
//
//
//  frmRelProVenda.Relatorio.PreviewModal;
//  frmRelProVenda.Release;

  Result:=true;
end;
procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue<>Null then begin
    edtValorUnitario.Value:=DTMVenda.QryProdutos.FieldByName('valor').AsFloat;
    edtQuantidade.Value:=1;
    edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
  end;
end;

{$endregion}

procedure TfrmProVenda.btnAdicionarItemClick(Sender: TObject);
begin
  inherited;

  if lkpProduto.KeyValue=Null then begin
    MessageDlg('Produto é um campo obrigatório' ,mtInformation,[mbOK],0);
    lkpProduto.SetFocus;
    abort;
  end;

  if edtValorUnitario.value<=0 then begin
    MessageDlg('Valor Unitário não pode ser Zero' ,mtInformation,[mbOK],0);
    edtValorUnitario.SetFocus;
    abort;
  end;

  if edtQuantidade.value<=0 then begin
    MessageDlg('Quantidade não pode ser Zero' ,mtInformation,[mbOK],0);
    edtQuantidade.SetFocus;
    abort;
  end;

  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  oVenda.InserirItens(dtmVenda.cdsItensVendas, oVenda.VendaId);
  edtValorTotal.Value:=TotalizarVenda;
  LimparComponenteItem;
  lkpProduto.SetFocus;
end;

procedure TfrmProVenda.btnAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaId').AsInteger, dtmVenda.cdsItensVendas) then begin
     edtVendaId.Text     :=IntToStr(oVenda.VendaId);
     lkpCliente.KeyValue :=oVenda.ClienteId;
     edtDataVenda.Date   :=oVenda.DataVenda;
     edtValorTotal.Value :=oVenda.TotalVenda;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TfrmProVenda.btnApagarItemClick(Sender: TObject);
begin
  inherited;

  if lkpProduto.KeyValue=Null then begin
     MessageDlg('Selecione o Produto a ser excluído' ,mtInformation,[mbOK],0);
     dbgridItensVenda.SetFocus;
     abort;
  end;

  if dtmVenda.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     dtmVenda.cdsItensVendas.Delete;
     LimparComponenteItem;
  end;

  edtValorTotal.Value:=TotalizarVenda;
end;

procedure TfrmProVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVenda.btnGravarClick(Sender: TObject);
begin
  inherited;

  LimparCds;
end;

procedure TfrmProVenda.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataVenda.Date:=Date;
  lkpCliente.SetFocus;
  LimparCds;
end;

procedure TfrmProVenda.dbgridItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

procedure TfrmProVenda.dbgridItensVendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid(key, shift);
end;

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if Assigned(dtmVenda) then
     FreeAndNil(dtmVenda);

  if Assigned(oVenda) then
     FreeAndNil(oVenda);
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda := TdtmVenda.Create(self);

  oVenda:=TVenda.Create(dtmPrincipal.ConexaoDB);

  IndiceAtual:='nome';

end;

function TfrmProVenda.TotalizarProduto(valorUnitario, Quantidade:Double):Double;
begin
  result :=valorUnitario * Quantidade;
end;

procedure TfrmProVenda.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue   := dtmVenda.cdsItensVendas.FieldByName('produtoId').AsString;
  edtQuantidade.Value   := dtmVenda.cdsItensVendas.FieldByName('quantidade').AsFloat;
  edtValorUnitario.Value:= dtmVenda.cdsItensVendas.FieldByName('valorUnitario').AsFloat;
  edtTotalProduto.Value := dtmVenda.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat;
end;

procedure TfrmProVenda.LimparComponenteItem;
begin
  lkpProduto.KeyValue   := null;
  edtQuantidade.Value   := 0;
  edtValorUnitario.Value:= 0;
  edtTotalProduto.Value := 0;
end;

procedure TfrmProVenda.LimparCds;
begin
  dtmVenda.cdsItensVendas.First;
  while not dtmVenda.cdsItensVendas.Eof do
    dtmVenda.cdsItensVendas.Delete;

end;

function TfrmProVenda.TotalizarVenda:Double;
begin
  result:=0;
  dtmVenda.cdsItensVendas.First;
  while not dtmVenda.cdsItensVendas.Eof do begin
    result := result + dtmVenda.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat;
    dtmVenda.cdsItensVendas.Next;
  end;
end;

end.
