unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDtmConexao, uEnum,RxCtrls;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskEdit: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    QryListagem: TZQuery;
    DtsListagem: TDataSource;
    lblIndice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskEditChange(Sender: TObject);
    procedure mskEditClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Controlarbotoes(BtnNovo, BtnAlterar, Btncancelar,
              BtnGravar, BtnApagar:TBitBtn; Navegador:TDBNavigator;
              PGCPrincipal: TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab(PGCPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: String): String;
    procedure ExibirLabelIndice(Campo: string; aLabel: Tlabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
  public
    { Public declarations }
    IndiceAtual: string;
    EstadoDoCadastro:TEstadoDoCadastro;
    function Apagar :Boolean; virtual;
    function Gravar (EstadoDoCadastro:TEstadoDoCadastro):Boolean; virtual;
    procedure LimparEdits;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$region 'OBSERVAÇÕES'}
//TAG: 1 - Chave Primária - PK
//TAG: 2 - Campos Obrigatórios
{$endregion}

{$region 'FUNÇÕES E PROCEDURES'}
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(BtnNovo,BtnAlterar, BtnCancelar, BtnGravar,
                  BtnApagar, btnNavigator, pgcPrincipal,false);
  LimparEdits;
  EstadoDoCadastro:=ecInserir;
  QryListagem.Refresh;
end;

procedure TfrmTelaHeranca.Controlarbotoes(BtnNovo, BtnAlterar, BtnCancelar,
          BtnGravar, BtnApagar:TBitBtn; Navegador:TDBNavigator;
          PGCPrincipal: TPageControl; Flag:Boolean);
begin
  BtnNovo.Enabled       :=Flag;
  BtnApagar.Enabled     :=Flag;
  BtnAlterar.Enabled    :=Flag;
  Navegador.Enabled     :=Flag;
  PGCPrincipal.Pages[0].TabVisible := Flag;
  BtnCancelar.Enabled   :=not(Flag);
  BtnGravar.Enabled     :=not(Flag);
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(PGCPrincipal: TPageControl;  Indice: Integer);
begin
  if(PGCPrincipal.Pages[Indice].TabVisible) then
    PGCPrincipal.TabIndex:=Indice;
end;

function TfrmTelaHeranca.RetornarCampoTraduzido (Campo:String) : String;
var i: Integer;
begin
  for I := 0 to QryListagem.Fields.Count-1 do begin
    if lowercase(QryListagem.Fields[i].FieldName) =lowercase(Campo) then begin
        Result:= QryListagem.Fields[i].DisplayLabel;
        Break;
    end;

  end;

end;



procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:Tlabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
var i: Integer;
begin
    Result:=False;
    for I := 0 to ComponentCount -1 do begin
      if (Components[i] is TLabeledEdit) then  begin
        if (TLabeledEdit(Components [I]).Tag = 2) and
            (TLabeledEdit(Components [I]).Text = EmptyStr) then begin
            MessageDlg(TLabeledEdit(Components [I]).EditLabel.Caption + ' é um campo obrigatório',mtInformation,[mbOK],0);
            TLabeledEdit(Components[I]).SetFocus;
            Result := true;
            Break;
        end;
      end;
    end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
  var i: Integer;
begin
    for I := 0 to ComponentCount -1 do begin
      if (Components[I] is TLabeledEdit) then  begin
        if (TLabeledEdit(Components [I]).Tag = 1) then begin
            TlabeledEdit(Components [I]).Enabled:=false;
            break;
        end;
      end;
    end;
end;

procedure TfrmTelaHeranca.LimparEdits;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabeledEdit then
      TLabeledEdit(Components[i]).Text := ''
    else if Components[i] is TEdit then
      TEdit(Components[i]).Text := ''
    else if Components[i] is TMaskEdit then
      TMaskEdit(Components[i]).Text := ''
    else if Components[i] is TMemo then
      TMemo(Components[i]).Text := ''
  end;
end;
{$endregion}

{$region 'MÉTODOS VIRTUAIS'}
function TfrmTelaHeranca.Apagar: Boolean;
begin
 Showmessage ('DELETADO');
 Result := True;
end;

function  TfrmTelaHeranca.Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;
begin
  if (EstadoDoCadastro=ecInserir) then
      Showmessage('INSERIDO')
  else if (EstadoDoCadastro=ecAlterar) then
      Showmessage('Alterado');
  Result := True;
end;
{$endregion}

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(BtnNovo,BtnAlterar, BtnCancelar, BtnGravar,
                  BtnApagar, btnNavigator, pgcPrincipal,false);
  EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  Try
    if (Apagar) then begin
       ControlarBotoes(BtnNovo,BtnAlterar, BtnCancelar, BtnGravar,
                       BtnApagar, btnNavigator, pgcPrincipal,true);
       ControlarIndiceTab(PGCPrincipal, 0);
       LimparEdits;
       QryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na exclusão', MtError, [mbok] , 0)
    end;
  Finally
    EstadoDoCadastro:=ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(BtnNovo,BtnAlterar, BtnCancelar, BtnGravar,
                  BtnApagar, btnNavigator, pgcPrincipal,true);
  ControlarIndiceTab(PGCPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  if (ExisteCampoObrigatorio) then
    abort;

  Try
    if Gravar(EstadoDoCadastro) then begin
      ControlarBotoes(BtnNovo,BtnAlterar, btnCancelar, btnGravar,
                      BtnApagar, btnNavigator, pgcPrincipal,true);
      ControlarIndiceTab(PGCPrincipal, 0);
    EstadoDoCadastro:=ecNenhum;
    QryListagem.Refresh;
  end  else begin
      MessageDlg('Erro na gravação', mtError, [mbok], 0);
  end;
  Finally

  end;
end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
QryListagem.Connection:=dtmPrincipal.conexaoDB;
DtsListagem.DataSet:=QryListagem;
grdListagem.DataSource:=DtsListagem;
grdListagem.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,
                      dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,
                      dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (QryListagem.SQL.Text<>EmptyStr) then begin
      QryListagem.IndexFieldNames:= IndiceAtual;
      ExibirLabelIndice(IndiceAtual, lblIndice);
      QryListagem.Open;
  end;
  ControlarIndiceTab(PGCPrincipal, 0);
  DesabilitarEditPK;
  ControlarBotoes(BtnNovo,BtnAlterar, BtnCancelar, BtnGravar,
                  BtnApagar, btnNavigator, pgcPrincipal,true);
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BloqueiaCTRL_DEL_DBGrid(Key,Shift);
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryListagem.IndexFieldNames := IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskEditClick(Sender: TObject);
begin
 mskEdit.Clear;
end;


procedure TfrmTelaHeranca.mskEditChange(Sender: TObject);
begin

  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
  begin
      //Bloqueia o CTRL + DEL
      if (Shift = [ssCtrl]) and (Key = 46)
        then Key := 0;

  end;
end.
