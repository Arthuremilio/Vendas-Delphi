inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produtos'
  ClientHeight = 432
  ClientWidth = 1059
  ExplicitWidth = 1075
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1059
    Height = 338
    ExplicitWidth = 1059
    ExplicitHeight = 338
    inherited tabListagem: TTabSheet
      ExplicitWidth = 1051
      ExplicitHeight = 310
      inherited pnlListagemTopo: TPanel
        Width = 1051
        ExplicitWidth = 1051
      end
      inherited grdListagem: TDBGrid
        Width = 1051
        Height = 245
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 399
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoidCategoria'
            Width = 351
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 1051
      ExplicitHeight = 310
      object Label1: TLabel
        Left = 17
        Top = 120
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 17
        Top = 256
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 191
        Top = 256
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label4: TLabel
        Left = 592
        Top = 64
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtProdutoId: TLabeledEdit
        Tag = 1
        Left = 17
        Top = 32
        Width = 160
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 17
        Top = 80
        Width = 504
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
        Text = ''
      end
      object edtDescricao: TMemo
        Left = 17
        Top = 136
        Width = 984
        Height = 89
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Left = 17
        Top = 272
        Width = 121
        Height = 21
        MaxLength = 15
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 191
        Top = 272
        Width = 121
        Height = 21
        DisplayFormat = ' ,0.00;- ,0.00'
        MaxLength = 15
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 592
        Top = 83
        Width = 409
        Height = 21
        ImeName = 'Portuguese (Brazilian ABNT)'
        KeyField = 'categoriaId'
        ListField = 'descricaoId'
        ListSource = dtsCategoria
        TabOrder = 2
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 338
    Width = 1059
    ExplicitTop = 338
    ExplicitWidth = 1059
    DesignSize = (
      1059
      94)
    inherited btnFechar: TBitBtn
      Left = 918
      ExplicitLeft = 918
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT p.produtoId,'
      '            p.nome,'
      '            p.descricao,'
      '            p.valor,'
      '            p.quantidade,'
      '           p.categoriaId,'
      '           c.descricaoId As DescricaoidCategoria'
      '    FROM produtos As p'
      '    LEFT JOIN categorias As c on c.categoriaId = p.categoriaId')
    Left = 844
    object QryListagemprodutoId: TZIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryListagemnome: TZUnicodeStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdescricao: TZUnicodeStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 255
    end
    object QryListagemvalor: TZFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Precision = 15
      Size = 5
    end
    object QryListagemquantidade: TZFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Precision = 15
      Size = 5
    end
    object QryListagemcategoriaId: TZIntegerField
      DisplayLabel = 'Cod. Categoria'
      FieldName = 'categoriaId'
    end
    object QryListagemDescricaoidCategoria: TZUnicodeStringField
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      FieldName = 'DescricaoidCategoria'
      Size = 30
    end
  end
  object QryCategoria: TZQuery
    Connection = dtmPrincipal.conexaoDB
    Active = True
    SQL.Strings = (
      'select categoriaId, descricaoId from Categorias')
    Params = <>
    Left = 932
    Top = 104
    object QryCategoriacategoriaId: TZIntegerField
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryCategoriadescricaoId: TZUnicodeStringField
      FieldName = 'descricaoId'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 880
    Top = 104
  end
end
