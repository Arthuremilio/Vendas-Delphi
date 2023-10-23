unit cCadCategoria;

interface

uses System.Classes,
      Vcl.Controls,
      Vcl.ExtCtrls,
      Vcl.Dialogs,
      ZAbstractConnection,
      ZConnection,
      ZAbstractRODataset,
       ZAbstractDataset,
       ZDataset,
       System.SysUtils; // lista de Units

type
  TCategoria = class // Declaração do tipo da classe
  private
    ConexaoDB: TZConnection;
    F_categoriaId: Integer;
    F_descricaoId: String;
    function GetCategoriaId: Integer;
    function GetDescricaoId: string;
    procedure SetCategoriaId(const Value: Integer);
    procedure SetDescricaoId(const Value: string); //Destroi a Classe usar o Override por causa
                                    //de Sobrescrever
          //Variaveis Privadas que pode ser trabalhada dentro da classe
    published
    function Inserir:Boolean;
    function Apagar:Boolean;
    function Atualizar:Boolean;
    function Selecionar(id:Integer): Boolean;
    property codigo: Integer read GetCategoriaId write SetCategoriaId;
    property descricaoId: string read GetDescricaoId write SetDescricaoId;
        //Variaveis Publicas Utilizadas para propriedades da classe
        //para fornecer informações em runtime
  public
    constructor Create(aConexao:TZConnection); //Contrutor da Classe
    destructor Destroy; override;
  end;
implementation


{$Region 'Constructor and Destructor'}

constructor TCategoria.Create(aConexao:TZConnection);
begin
  ConexaoDB:= aConexao;
end;

destructor TCategoria.Destroy;
begin
  inherited;
end;
{$endREgion}

{$Region 'CRUD'}

function TCategoria.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg ('Apagar o Registro: ' +#13+#13+
                 'Código: '+IntToStr(F_CategoriaId)+#13+
                 'Descrição: '+F_descricaoId,mtConfirmation, [mbyes, mbNo],0)=mrNo then begin
    Result:=false;
    abort;
  end;

  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add('DELETE categorias '+
                ' WHERE categoriaId =:categoriaId ');
    Qry.ParamByName('categoriaId').Asinteger:=F_categoriaId;
    Try
      Qry.ExecSQL;
    Except
      Result:=false;
    End;
  Finally
    if Assigned (Qry) then
    FreeAndNil(Qry);
  End;
end;


function TCategoria.Atualizar: Boolean;
var Qry:TZQuery;
begin
  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add('UPDATE categorias '+
                '   SET descricaoId =:descricaoId ' +
                ' WHERE categoriaId =:categoriaId ');
    Qry.ParamByName('categoriaId').Asinteger:=Self.F_categoriaId;
    Qry.ParamByName('descricaoId').AsString:=Self.F_descricaoId;
    Try
      Qry.ExecSQL;
    Except
      Result:=false;
    End;
  Finally
    if Assigned (Qry) then
    FreeAndNil(Qry);
  End;
end;

function TCategoria.Inserir: Boolean;
var Qry:TZQuery;
begin
  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add('INSERT INTO categorias (descricaoId) values (:descricaoId)');
    Qry.ParamByName('descricaoId').AsString:=Self.F_descricaoId;
    Try
      Qry.ExecSQL;
    Except
      Result:=false;
    End;
  Finally
    if Assigned (Qry) then
    FreeAndNil(Qry);

  End;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add('SELECT categoriaId,'+
                '       descricaoId' +
                ' FROM categorias  ' +
                ' WHERE categoriaId=:categoriaId');
    Qry.ParamByName('categoriaId').Asinteger:=id;
    Try
      Qry.Open;
      Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
      Self.F_descricaoId := Qry.FieldByName('descricaoId').AsString;
    Except
      Result:=false;
    End;
  Finally
    if Assigned (Qry) then
    FreeAndNil(Qry);
  End;
end;


{$endRegion}

{$region 'Gets'}
function TCategoria.GetCategoriaId: Integer;
begin
  Result := Self.F_categoriaId
end;

function TCategoria.GetDescricaoId: string;
begin
  Result := Self.F_descricaoId
end;
{$endRegion}

{$Region 'Sets'}
procedure TCategoria.SetCategoriaId(const Value: Integer);
begin
  Self.F_categoriaId :=  Value;
end;

procedure TCategoria.SetDescricaoId(const Value: string);
begin
  Self.F_descricaoId := Value;
end;
{$endREgion}


end.

