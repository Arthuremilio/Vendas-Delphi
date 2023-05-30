inherited frmCadClientes: TfrmCadClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 532
  ClientWidth = 1091
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1091
    Height = 438
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        Width = 1083
      end
      inherited grdListagem: TDBGrid
        Width = 1083
        Height = 345
        Columns = <
          item
            Expanded = False
            FieldName = 'clienteId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 352
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'celular'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bairro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estado'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object Label1: TLabel
        Left = 551
        Top = 232
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label2: TLabel
        Left = 551
        Top = 165
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label3: TLabel
        Left = 691
        Top = 165
        Width = 33
        Height = 13
        Caption = 'Celular'
      end
      object Label4: TLabel
        Left = 17
        Top = 117
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object Label5: TLabel
        Left = 165
        Top = 117
        Width = 14
        Height = 13
        Caption = 'RG'
      end
      object Label6: TLabel
        Left = 288
        Top = 117
        Width = 96
        Height = 13
        Caption = 'Data de Nascimento'
      end
      object Label7: TLabel
        Left = 691
        Top = 232
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object edtClienteId: TLabeledEdit
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
      object edtCEP: TMaskEdit
        Left = 551
        Top = 248
        Width = 82
        Height = 21
        EditMask = '99.999-999;1;_'
        MaxLength = 10
        TabOrder = 9
        Text = '  .   -   '
      end
      object edtEndereco: TLabeledEdit
        Tag = 2
        Left = 17
        Top = 248
        Width = 504
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 8
        Text = ''
      end
      object edtBairro: TLabeledEdit
        Tag = 2
        Left = 551
        Top = 304
        Width = 250
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 100
        TabOrder = 12
        Text = ''
      end
      object edtCidade: TLabeledEdit
        Tag = 2
        Left = 17
        Top = 304
        Width = 504
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 60
        TabOrder = 11
        Text = ''
      end
      object edtTelefone: TMaskEdit
        Left = 551
        Top = 181
        Width = 110
        Height = 21
        EditMask = '(99) 9999-9999;1;_'
        MaxLength = 14
        TabOrder = 6
        Text = '(  )     -    '
      end
      object edtCelular: TMaskEdit
        Left = 691
        Top = 181
        Width = 110
        Height = 21
        EditMask = '(99) 99999-9999;1;_'
        MaxLength = 15
        TabOrder = 7
        Text = '(  )      -    '
      end
      object edtEmail: TLabeledEdit
        Tag = 2
        Left = 17
        Top = 181
        Width = 504
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 5
        Text = ''
      end
      object edtCPF: TMaskEdit
        Left = 17
        Top = 133
        Width = 104
        Height = 21
        EditMask = '999.999.999-99;1;_'
        MaxLength = 14
        TabOrder = 2
        Text = '   .   .   -  '
      end
      object edtRG: TMaskEdit
        Left = 165
        Top = 133
        Width = 76
        Height = 21
        EditMask = '99.999.999-9;1;_'
        MaxLength = 12
        TabOrder = 3
        Text = '  .   .   - '
      end
      object edtDataNascimento: TDateEdit
        Left = 288
        Top = 133
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 4
      end
      object edtEstado: TLabeledEdit
        Tag = 2
        Left = 691
        Top = 248
        Width = 33
        Height = 21
        EditLabel.Width = 13
        EditLabel.Height = 13
        EditLabel.Caption = 'UF'
        ImeName = 'Portuguese (Brazilian ABNT)'
        MaxLength = 100
        TabOrder = 10
        Text = ''
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 438
    Width = 1091
    DesignSize = (
      1091
      94)
    inherited btnFechar: TBitBtn
      Left = 923
      Width = 108
    end
    inherited btnNavigator: TDBNavigator
      Left = 589
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'select clienteId,'
      #9'   nome,'
      #9'   cpf,'
      #9'   rg,'
      #9'   endereco,'
      #9'   cidade,'
      #9'   bairro,'
      #9'   estado,'
      #9'   cep,'
      #9'   telefone,'
      #9'   email,'
      #9'   dataNascimento,'
      #9'   celular'
      'from Clientes')
    object QryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemcpf: TWideStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      Size = 11
    end
    object QryListagemrg: TWideStringField
      DisplayLabel = 'RG'
      FieldName = 'rg'
      Size = 9
    end
    object QryListagemendereco: TWideStringField
      DisplayLabel = 'Endereco'
      FieldName = 'endereco'
      Size = 60
    end
    object QryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 60
    end
    object QryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 60
    end
    object QryListagemestado: TWideStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 60
    end
    object QryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 8
    end
    object QryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 11
    end
    object QryListagemcelular: TWideStringField
      DisplayLabel = 'Celular'
      FieldName = 'celular'
      Size = 11
    end
    object QryListagememail: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 100
    end
    object QryListagemdataNascimento: TDateTimeField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'dataNascimento'
    end
  end
end
