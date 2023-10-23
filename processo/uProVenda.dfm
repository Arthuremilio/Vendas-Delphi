inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas'
  ClientWidth = 929
  ExplicitWidth = 945
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 929
    ActivePage = tabManutencao
    ExplicitWidth = 929
    inherited tabListagem: TTabSheet
      ExplicitWidth = 921
      inherited pnlListagemTopo: TPanel
        Width = 921
        ExplicitWidth = 921
      end
      inherited grdListagem: TDBGrid
        Width = 921
        Columns = <
          item
            Expanded = False
            FieldName = 'vendaId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Width = 273
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 921
      object Label4: TLabel
        Left = 198
        Top = 13
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object Label6: TLabel
        Left = 749
        Top = 16
        Width = 71
        Height = 13
        Caption = 'Data da Venda'
      end
      object edtvendaId: TLabeledEdit
        Tag = 1
        Left = 17
        Top = 32
        Width = 160
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Nro. Venda'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object lkpCliente: TDBLookupComboBox
        Left = 198
        Top = 32
        Width = 523
        Height = 21
        ImeName = 'Portuguese (Brazilian ABNT)'
        KeyField = 'clienteId'
        ListField = 'nome'
        ListSource = DTMVenda.DtsCliente
        TabOrder = 1
      end
      object edtDataVenda: TDateEdit
        Left = 749
        Top = 32
        Width = 108
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 0
        Top = 72
        Width = 921
        Height = 274
        Align = alBottom
        TabOrder = 3
        object Panel2: TPanel
          Left = 1
          Top = 232
          Width = 919
          Height = 41
          Align = alBottom
          TabOrder = 0
          object Label2: TLabel
            Left = 692
            Top = 14
            Width = 84
            Height = 13
            Caption = 'Valor da Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorTotal: TCurrencyEdit
            Left = 786
            Top = 9
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            MaxLength = 15
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 919
          Height = 51
          Align = alTop
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 1
            Width = 38
            Height = 13
            Caption = 'Produto'
          end
          object Label3: TLabel
            Left = 474
            Top = 1
            Width = 56
            Height = 13
            Caption = 'Quantidade'
          end
          object Label5: TLabel
            Left = 337
            Top = 0
            Width = 64
            Height = 13
            Caption = 'Valor Unit'#225'rio'
          end
          object Label7: TLabel
            Left = 611
            Top = 0
            Width = 80
            Height = 13
            Caption = 'Total do Produto'
          end
          object lkpProduto: TDBLookupComboBox
            Left = 16
            Top = 19
            Width = 305
            Height = 21
            ImeName = 'Portuguese (Brazilian ABNT)'
            KeyField = 'produtoId'
            ListField = 'nome'
            ListSource = DTMVenda.DtsProdutos
            TabOrder = 0
            OnExit = lkpProdutoExit
          end
          object edtQuantidade: TCurrencyEdit
            Left = 474
            Top = 19
            Width = 121
            Height = 21
            DisplayFormat = ' ,0.00;- ,0.00'
            MaxLength = 15
            TabOrder = 2
            OnExit = edtQuantidadeExit
          end
          object edtValorUnitario: TCurrencyEdit
            Left = 337
            Top = 19
            Width = 121
            Height = 21
            MaxLength = 15
            TabOrder = 1
          end
          object edtTotalProduto: TCurrencyEdit
            Left = 611
            Top = 19
            Width = 121
            Height = 21
            TabStop = False
            MaxLength = 15
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object btnAdicionar: TBitBtn
            Left = 748
            Top = 19
            Width = 80
            Height = 21
            Cursor = crArrow
            Caption = 'A&dicionar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF006600006600B59A9BB59A9BB59A9BB5
              9A9BB59A9BB59A9BB59A9B006600006600FF00FFFF00FFFF00FFFF00FF006600
              009900009900E5DEDF006600006600E4E7E7E0E3E6D9DFE0CCC9CC006600037D
              03006600FF00FFFF00FFFF00FF006600009900009900E9E2E2006600006600E2
              E1E3E2E6E8DDE2E4CFCCCF006600037D03006600FF00FFFF00FFFF00FF006600
              009900009900ECE4E4006600006600DFDDDFE1E6E8E0E5E7D3D0D2006600037D
              03006600FF00FFFF00FFFF00FF006600009900009900EFE6E6EDE5E5E5DEDFE0
              DDDFDFE0E2E0E1E3D6D0D2006600037D03006600FF00FFFF00FFFF00FF006600
              0099000099000099000099000099000099000099000099000099000099000099
              00006600FF00FFFF00FFFF00FF006600009900B1D0B1B1D0B1B1D0B1B1D0B1B1
              D0B1B1D0B1B1D0B1B1D0B1B1D0B1009900006600FF00FFFF00FFFF00FF006600
              009900F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F90099
              00006600FF00FFFF00FFFF00FF006600009900F9F9F9F9F9F9F9F9F9F9F9F9F9
              F9F9F9F9F9F9F9F9F9F9F9F9F9F9009900006600FF00FFFF00FFFF00FF006600
              009900F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F90099
              00006600FF00FFFF00FFFF00FF006600009900F9F9F9F9F9F9F9F9F9F9F9F9F9
              F9F9F9F9F9F9F9F9F9F9F9F9F9F9009900006600FF00FFFF00FFFF00FF006600
              009900F9F9F9CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDF9F9F90099
              00006600FF00FFFF00FFFF00FF006600009900F9F9F9F9F9F9F9F9F9F9F9F9F9
              F9F9F9F9F9F9F9F9F9F9F9F9F9F9009900006600FF00FFFF00FFFF00FFFF00FF
              006600F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F90066
              00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
            TabOrder = 4
          end
          object btnRemover: TBitBtn
            Left = 835
            Top = 19
            Width = 80
            Height = 21
            Caption = '&Remover'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FF000288010893010B99010C99010893000389FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000186010D9D021CAF021FB402
              1FB5021FB5021FB2021CB0010F9F000287FF00FFFF00FFFF00FFFF00FFFF00FF
              00038A0118B2021FB7021EB1021DB1021DB1021DB1021DB1021EB2021FB40219
              AC00048EFF00FFFF00FFFF00FF0001830118BB0220CC011CBF0015B4011AB002
              1DB1021DB1011CB00015AD011BB0021FB4021AAC000287FF00FFFF00FF010CA7
              0121E0011CD30726CC4966D70B28BC0018B00019AF0622B44A66CE0D2BB7011B
              B0021FB5010F9FFF00FF000187011CDC0120ED0017DC3655E2FFFFFFA4B4ED05
              20BB0119B28B9EE1FFFFFF4E6ACF0014AC021EB2021CB000038900069A0120F8
              011FF6001DE9031FE1738BEEFFFFFFA0B1ED93A5E7FFFFFF91A4E20823B4011B
              B0021DB1021FB4010895020CAA0A2EFE0323FB011FF6001CEB0018E1788FF0FF
              FFFFFFFFFF96A7EA021BB50019AF021DB1021DB10220B5010C99040EAC294DFE
              0D30FB011FFA001CF7011CEE8EA1F4FFFFFFFFFFFFA6B6EE0520C20018B6021D
              B1021DB10220B5010B980208A04162FB2F51FC001EFA0725FA8AA0FEFFFFFF8E
              A3F67991F2FFFFFFA3B4EE0C29C6011BB8021DB4021FB2000793000189314FEF
              7690FF0F2DFA3354FBFFFFFF91A5FE021EF30017E7738BF3FFFFFF4765E00016
              C2021FBD021CB2000288FF00FF0C1BBC819AFF728BFE1134FA3456FB0526FA00
              1CFA001CF40220ED3353ED0625DA011DD00220CB010DA1FF00FFFF00FF000189
              2943E6A5B7FF849AFC2341FB0323FA011FFA011FFA001EF7011BEE021FE50121
              E20118BF000184FF00FFFF00FFFF00FF01038F2A45E693A9FFABBBFF758FFE49
              69FC3658FB3153FC2346FC092CF70118CB00038BFF00FFFF00FFFF00FFFF00FF
              FF00FF0001890F1DBF3E5BF36B87FE728CFF5E7BFE395BFB1231EB010FB50001
              84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000189030AA306
              11B2050FB10107A0000188FF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
            TabOrder = 5
            TabStop = False
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 52
          Width = 919
          Height = 180
          Align = alClient
          TabOrder = 2
          object DBGridItensVenda: TDBGrid
            Left = 1
            Top = 1
            Width = 917
            Height = 178
            Align = alClient
            Color = clBtnFace
            DataSource = DTMVenda.DtsItensVendas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = DBGridItensVendaDblClick
            OnKeyDown = DBGridItensVendaKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'produtoId'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorUnitario'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorTotalProduto'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 929
    ExplicitWidth = 929
    inherited btnAlterar: TBitBtn
      Left = 93
      ExplicitLeft = 93
    end
    inherited btnFechar: TBitBtn
      Left = 827
      TabOrder = 6
      ExplicitLeft = 827
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
      TabOrder = 5
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'Select Vendas.vendaId'
      #9'  ,Vendas.clienteId'
      #9'  ,clientes.nome'
      #9'  ,vendas.dataVenda'
      #9'  ,Vendas.totalVenda'
      ' FROM vendas'
      ' INNER JOIN clientes ON clientes.clienteId = vendas.clienteId')
    Left = 388
    Top = 8
    object QryListagemvendaId: TZIntegerField
      DisplayLabel = 'Nro. Venda'
      FieldName = 'vendaId'
      ReadOnly = True
    end
    object QryListagemclienteId: TZIntegerField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'clienteId'
      Required = True
    end
    object QryListagemnome: TZUnicodeStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemdataVenda: TZDateTimeField
      DisplayLabel = 'Data Venda'
      FieldName = 'dataVenda'
    end
    object QryListagemtotalVenda: TZFMTBCDField
      DisplayLabel = 'Total da Venda'
      FieldName = 'totalVenda'
      Precision = 15
      Size = 5
    end
  end
  inherited DtsListagem: TDataSource
    Left = 332
    Top = 8
  end
end
