inherited frmCadClientes: TfrmCadClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 532
  ClientWidth = 1091
  ExplicitWidth = 1107
  ExplicitHeight = 571
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1091
    Height = 438
    ExplicitWidth = 1091
    ExplicitHeight = 438
    inherited tabListagem: TTabSheet
      ExplicitWidth = 1083
      ExplicitHeight = 410
      inherited pnlListagemTopo: TPanel
        Width = 1083
        ExplicitWidth = 1083
      end
      inherited grdListagem: TDBGrid
        Width = 1083
        Height = 345
        Columns = <
          item
            Expanded = False
            FieldName = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rg'
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
          end
          item
            Expanded = False
            FieldName = 'cep'
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
            FieldName = 'email'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataNascimento'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 1083
      ExplicitHeight = 410
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
        TabOrder = 8
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
        TabOrder = 7
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
        TabOrder = 11
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
        TabOrder = 10
        Text = ''
      end
      object edtTelefone: TMaskEdit
        Left = 551
        Top = 181
        Width = 110
        Height = 21
        EditMask = '(99) 9999-9999;1;_'
        MaxLength = 14
        TabOrder = 5
        Text = '(  )     -    '
      end
      object edtCelular: TMaskEdit
        Left = 691
        Top = 181
        Width = 110
        Height = 21
        EditMask = '(99) 99999-9999;1;_'
        MaxLength = 15
        TabOrder = 6
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
        TabOrder = 4
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
        MaxLength = 60
        TabOrder = 9
        Text = ''
      end
      object edtDataNascimento: TDateEdit
        Left = 288
        Top = 133
        Width = 108
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a data'
        NumGlyphs = 2
        CalendarStyle = csDialog
        TabOrder = 12
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 438
    Width = 1091
    ExplicitTop = 438
    ExplicitWidth = 1091
    DesignSize = (
      1091
      94)
    inherited btnFechar: TBitBtn
      Left = 923
      Width = 108
      ExplicitLeft = 923
      ExplicitWidth = 108
    end
    inherited btnNavigator: TDBNavigator
      Left = 589
      Hints.Strings = ()
      ExplicitLeft = 589
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
      #9'   celular,'
      #9'   email,'
      #9'   dataNascimento'
      'from Clientes')
    object QryListagemclienteId: TZIntegerField
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TZUnicodeStringField
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemcpf: TZUnicodeStringField
      FieldName = 'cpf'
      Size = 14
    end
    object QryListagemrg: TZUnicodeStringField
      FieldName = 'rg'
      Size = 12
    end
    object QryListagemendereco: TZUnicodeStringField
      FieldName = 'endereco'
      Size = 60
    end
    object QryListagemcidade: TZUnicodeStringField
      FieldName = 'cidade'
      Size = 50
    end
    object QryListagembairro: TZUnicodeStringField
      FieldName = 'bairro'
      Size = 40
    end
    object QryListagemestado: TZUnicodeStringField
      FieldName = 'estado'
      Size = 2
    end
    object QryListagemcep: TZUnicodeStringField
      FieldName = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TZUnicodeStringField
      FieldName = 'telefone'
      Size = 14
    end
    object QryListagemcelular: TZUnicodeStringField
      FieldName = 'celular'
      Size = 14
    end
    object QryListagememail: TZUnicodeStringField
      FieldName = 'email'
      Size = 100
    end
    object QryListagemdataNascimento: TZDateTimeField
      FieldName = 'dataNascimento'
    end
  end
end
