object dtmPrincipal: TdtmPrincipal
  Height = 251
  Width = 900
  PixelsPerInch = 96
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'AutoEncodeStrings=ON'
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True'
      'RawStringEncoding=DB_CP')
    Connected = True
    HostName = ''
    Port = 0
    Database = 
      'Provider=SQLOLEDB.1;Password='#39'SenhaTstDesenv1'#39';Persist Security ' +
      'Info=True;User ID='#39'SA'#39';Initial Catalog='#39'Vendas'#39';Data Source='#39'emb' +
      'ratitst.ddns.net, 7210'#39';'
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 48
    Top = 16
  end
  object QryScriptCategorias: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'categorias'#39') IS NULL'#11
      ''
      'BEGIN'#11
      ''
      ''
      '    CREATE TABLE categorias ('#11
      ''
      ''
      '         categoriaId int IDENTITY(1,1) NOT NULL,'#11
      ''
      ''
      '         descricaoId varchar (30) NULL,'#11
      ''
      ''
      '         PRIMARY KEY (categoriaId)'#11
      ''
      ''
      ')'#11
      ''
      ''
      'END')
    Params = <>
    Left = 168
    Top = 16
  end
  object QryScriptClientes: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'clientes'#39') IS NULL '
      'BEGIN'
      #9'CREATE TABLE clientes('
      #9#9'clienteId int IDENTITY(1,1) NOT NULL,'
      #9#9'nome varchar(60) NULL,'
      #9#9'endereco varchar(60) null,'
      #9#9'cidade varchar(50) null,'
      #9#9'bairro varchar(40) null,'
      #9#9'estado varchar(2) null,'
      #9#9'cep varchar(10) null,'
      #9#9'telefone varchar(14) null,  '
      #9#9'email varchar(100) null,'
      #9#9'dataNascimento datetime null'
      #9#9'PRIMARY KEY (clienteId),'
      #9')'
      'END')
    Params = <>
    Left = 307
    Top = 16
  end
  object QryScriptProdutos: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'produtos'#39') IS NULL'
      'BEGIN'
      'create table produtos('
      'produtoId int IDENTITY(1,1) NOT NULL,'
      'nome varchar(60) NULL,'
      'descricao varchar(255) NULL,'
      'valor decimal (18,5) default 0.00000 null,'
      'quantidade decimal (18,5) default 0.00000 null,'
      'categoriaId int null,'
      'PRIMARY KEY (produtoId),'
      'CONSTRAINT FK_ProdutosCategorias'
      'FOREIGN KEY (categoriaId) references categorias(categoriaId)'
      ')'
      'END')
    Params = <>
    Left = 435
    Top = 16
  end
  object QryScriptVendas: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'Vendas'#39') IS NULL'
      'BEGIN'
      'Create table vendas ('
      #9'vendaId int identity (1,1) not null,'
      #9'clienteId int not null,'
      #9'dataVenda datetime default getdate(),'
      #9'totalVenda decimal(15,5) default 0.00000,'
      ''
      ''
      #9'Primary key (vendaId),'
      #9'Constraint FK_VendasClientes FOREIGN KEY (clienteId)'
      #9#9'References clientes(clienteId)'
      #9')'
      'END')
    Params = <>
    Left = 563
    Top = 16
  end
  object QryScriptItensVendas: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'IF OBJECT_ID ('#39'VendasItens'#39') IS NULL'
      'BEGIN'
      'Create table vendasItens ('
      #9'vendaId int not null,'
      #9'produtoId int not null,'
      #9'valorUnitario decimal (15,5) default 0.00000,'
      #9'quantidade decimal (15,5) default 0.00000,'
      #9'totalProduto decimal(15,5) default 0.00000,'
      #9'Primary key (vendaId, produtoId),'
      #9'Constraint FK_VendasitensProdutos FOREIGN KEY (produtoId)'
      #9#9'References produtos(produtoId),'
      #9'Constraint FK_VendasitensVendas FOREIGN KEY (vendaId)'
      '                                References vendas(vendaId)'
      #9')'
      'END')
    Params = <>
    Left = 691
    Top = 16
  end
end
