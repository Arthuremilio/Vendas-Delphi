unit cCadClientes;

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
       System.SysUtils;

type
  Tcliente = class
  private
    ConexaoDB:TZConnection;
    F_clienteId:Integer;
    F_nome:String;
    F_cpf:String;
    F_rg:String;
    F_endereco:String;
    F_cidade:String;
    F_bairro:String;
    F_estado:String;
    F_cep:String;
    F_telefone:String;
    F_celular:String;
    F_email:String;
    F_dataNascimento:TDateTime;
  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Apagar:Boolean;
    function Atualizar:Boolean;
    function Selecionar(id:Integer): Boolean;
  published
    property codigo        :Integer      read F_clienteId        write F_clienteId;
    property nome          :string       read F_nome             write F_nome;
    property cpf           :string       read F_cpf              write F_cpf;
    property rg            :string       read F_rg               write F_rg;
    property endereco      :string       read F_endereco         write F_endereco;
    property cidade        :string       read F_cidade           write F_cidade;
    property bairro        :string       read F_bairro           write F_bairro;
    property estado        :string       read F_estado           write F_estado;
    property cep           :string       read F_cep              write F_cep;
    property telefone      :string       read F_telefone         write F_telefone;
    property celular       :string       read F_celular          write F_celular;
    property email         :string       read F_email            write F_email;
    property dataNascimento:TDateTime    read F_dataNascimento   write F_dataNascimento;
end;

implementation

{$Region 'Constructor and Destructor'}

constructor TCliente.Create(aConexao:TZConnection);
begin
  ConexaoDB:= aConexao;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;

{$endREgion}

{$Region 'CRUD'}

function TCliente.Apagar: Boolean;
var Qry:TZQuery;
begin
  if MessageDlg ('Apagar o Registro: ' +#13+#13+
                 'C�digo: '+IntToStr(F_ClienteId)+#13+
                 'Nome: '+F_nome,mtConfirmation, [mbyes, mbNo],0)=mrNo then begin
    Result:=false;
    abort;
  end;

  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add('DELETE FROM clientes '+
                ' WHERE clienteId =:clienteId ');
    Qry.ParamByName('clienteId').Asinteger:=F_clienteId;
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


function TCliente.Atualizar: Boolean;
var Qry:TZQuery;
begin
  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add('UPDATE clientes '+
                '   SET nome                =:nome ' +
                '      ,cpf                 =:cpf ' +
                '      ,rg                  =:rg ' +
                '      ,endereco            =:endereco ' +
                '      ,cidade              =:cidade ' +
                '      ,bairro              =:bairro ' +
                '      ,estado              =:estado ' +
                '      ,cep                 =:cep ' +
                '      ,telefone            =:telefone ' +
                '      ,celular             =:celular ' +
                '      ,email               =:email ' +
                '      ,datanascimento      =:datanascimento ' +
                ' WHERE clienteId =:clienteId ');
    Qry.ParamByName('clienteId').Asinteger                  :=Self.F_clienteId;
    Qry.ParamByName('nome').AsString                        :=Self.F_nome;
    Qry.ParamByName('cpf').AsString                         :=Self.F_cpf;
    Qry.ParamByName('rg').AsString                          :=Self.F_rg;
    Qry.ParamByName('endereco').AsString                    :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString                      :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString                      :=Self.F_bairro;
    Qry.ParamByName('estado').AsString                      :=Self.F_estado;
    Qry.ParamByName('cep').AsString                         :=Self.F_cep;
    Qry.ParamByName('telefone').AsString                    :=Self.F_telefone;
    Qry.ParamByName('celular').AsString                     :=Self.F_celular;
    Qry.ParamByName('email').AsString                       :=Self.F_email;
    Qry.ParamByName('dataNascimento').AsDateTime            :=Self.F_dataNascimento;
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

function TCliente.Inserir: Boolean;
var Qry:TZQuery;
begin
  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add ('INSERT INTO clientes   (nome,'+
                '                        cpf, ' +
                '                        rg, ' +
                '                        endereco, ' +
                '                        cidade, ' +
                '                        bairro, ' +
                '                        estado, ' +
                '                        cep, ' +
                '                        telefone, ' +
                '                        celular, ' +
                '                        email, ' +
                '                        datanascimento) ' +
                ' VALUES                 (:nome, '+
                '                        :cpf, ' +
                '                        :rg, ' +
                '                        :endereco, ' +
                '                        :cidade, ' +
                '                        :bairro, ' +
                '                        :estado, ' +
                '                        :cep, ' +
                '                        :telefone, ' +
                '                        :celular, ' +
                '                        :email, ' +
                '                        :datanascimento)' );

    Qry.ParamByName('nome').AsString                        :=Self.F_nome;
    Qry.ParamByName('cpf').AsString                         :=Self.F_cpf;
    Qry.ParamByName('rg').AsString                          :=Self.F_rg;
    Qry.ParamByName('endereco').AsString                    :=Self.F_endereco;
    Qry.ParamByName('cidade').AsString                      :=Self.F_cidade;
    Qry.ParamByName('bairro').AsString                      :=Self.F_bairro;
    Qry.ParamByName('estado').AsString                      :=Self.F_estado;
    Qry.ParamByName('cep').AsString                         :=Self.F_cep;
    Qry.ParamByName('telefone').AsString                    :=Self.F_telefone;
    Qry.ParamByName('celular').AsString                     :=Self.F_celular;
    Qry.ParamByName('email').AsString                       :=Self.F_email;
    Qry.ParamByName('dataNascimento').AsDateTime            :=Self.F_dataNascimento;
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

function TCliente.Selecionar(id: Integer): Boolean;
var Qry:TZQuery;
begin
  Try
    Result := True;
    Qry:=TZQuery.create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.clear;
    Qry.SQL.Add('SELECT clienteId,'+
                '       nome, '+
                '       cpf, '+
                '       rg, '+
                '       endereco, '+
                '       cidade, '+
                '       bairro, '+
                '       estado, '+
                '       cep, '+
                '       telefone, '+
                '       celular, '+
                '       email, '+
                '       datanascimento '+
                '  FROM clientes '+
                ' WHERE clienteId=:clienteId');
    Qry.ParamByName('clienteId').AsInteger:=id;
    Try
      Qry.Open;

      Self.F_clienteId            := Qry.FieldByName('clienteId').AsInteger;
      Self.F_nome                 := Qry.FieldByName('nome').AsString;
      Self.F_cpf                  := Qry.FieldByName('cpf').AsString;
      Self.F_rg                   := Qry.FieldByName('rg').AsString;
      Self.F_endereco             := Qry.FieldByName('endereco').AsString;
      Self.F_cidade               := Qry.FieldByName('cidade').AsString;
      Self.F_bairro               := Qry.FieldByName('bairro').AsString;
      Self.F_estado               := Qry.FieldByName('estado').AsString;
      Self.F_cep                  := Qry.FieldByName('cep').AsString;
      Self.F_telefone             := Qry.FieldByName('telefone').AsString;
      Self.F_celular              := Qry.FieldByName('celular').AsString;
      Self.F_email                := Qry.FieldByName('email').AsString;
      Self.F_dataNascimento       := Qry.FieldByName('datanascimento').AsDateTime;
    Except
      Result:=false;
    End;
  Finally
    if Assigned (Qry) then
    FreeAndNil(Qry);
  End;
end;


{$endRegion}

end.
