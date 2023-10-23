object DTMVenda: TDTMVenda
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 155
  Width = 292
  PixelsPerInch = 96
  object QryCliente: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      'SELECT clienteId,'#11
      ''
      '             nome'#11
      ''
      'FROM clientes')
    Params = <>
    Left = 16
    Top = 8
    object QryClienteclienteId: TZIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryClientenome: TZUnicodeStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
  end
  object QryProdutos: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      'SELECT produtoId,'#11
      '             nome,'#11
      '             valor,'#11
      '             quantidade'#11
      'FROM produtos')
    Params = <>
    Left = 96
    Top = 8
    object QryProdutosprodutoId: TZIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryProdutosnome: TZUnicodeStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryProdutosvalor: TZFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Precision = 15
      Size = 5
    end
    object QryProdutosquantidade: TZFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Precision = 15
      Size = 5
    end
  end
  object CdsItensVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 8
    object CdsItensVendasprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo '
      FieldName = 'produtoId'
    end
    object CdsItensVendasNomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NomeProduto'
      Size = 60
    end
    object CdsItensVendasquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object CdsItensVendasValorUnitário: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'ValorUnitario'
    end
    object CdsItensVendasValorTotalProduto: TFloatField
      DisplayLabel = 'Valor Total do Produto'
      FieldName = 'ValorTotalProduto'
    end
  end
  object DtsCliente: TDataSource
    DataSet = QryCliente
    Left = 17
    Top = 65
  end
  object DtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 97
    Top = 65
  end
  object DtsItensVendas: TDataSource
    DataSet = CdsItensVendas
    Left = 192
    Top = 64
  end
end
