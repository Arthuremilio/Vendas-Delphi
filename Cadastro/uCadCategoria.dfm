inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 640
  ClientWidth = 1037
  ExplicitWidth = 1053
  ExplicitHeight = 679
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1037
    Height = 546
    ActivePage = tabListagem
    ExplicitWidth = 1037
    ExplicitHeight = 546
    inherited tabListagem: TTabSheet
      ExplicitWidth = 1029
      ExplicitHeight = 518
      inherited pnlListagemTopo: TPanel
        Width = 1029
        ExplicitWidth = 1029
        inherited mskEdit: TMaskEdit
          OnClick = mskEditClick
        end
        inherited btnPesquisar: TBitBtn
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF7E7E7E7E7E7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF787878C4C4C47E7E7EFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF757575B0B1
            B17D7D7D898A8AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF757575999A9A868686878888FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7575758989898C8C8C8081
            81FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B77767B77767B
            77767575757A7B7B8F8F8F797A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF848484848484BAB8BACFCECEB7B5B6939092807F80707070FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF928C86C4C0BCFEFCF8FEFCFAFFFCFAFF
            FCFBFBFAF8B1ACADA49F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            928C86FEF3E7FEF7EFFEF7EFFEF7F0FEF8F0FEF8F2FAF4EEA49F9F747374FF00
            FFFF00FFFF00FFFF00FFFF00FF655F5CD4C4B2FCEFE0FCF2E5FCF2E6FCF3E6FC
            F3E7FEF3E7FEF3E9D3CAC5747374FF00FFFF00FFFF00FFFF00FFFF00FF655F5C
            E1CAB0FCEAD5FCEDDCFCEEDCFCEEDDFCEEDDFCEEDEFCEEDDDED1C6747374FF00
            FFFF00FFFF00FFFF00FFFF00FF655F5CCEB497FAE2C7FBE5CCFBE5CCFBE5CEFB
            E6CFFBE7D1FBEAD5D7C9BD747374FF00FFFF00FFFF00FFFF00FFFF00FF655F5C
            8C7B69FAE0C2FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3F8E6D17F7B7BFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF655F5CB49E87FBE9D3FBE9D3FBE9D3FB
            E9D3F8E6D1C6B8AB7F7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF6C686597897BCABAA6D9C9B4C9B8A67F7B7B7F7B7BFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B77767B77767B77767B
            7776FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentShowHint = False
        end
      end
      inherited grdListagem: TDBGrid
        Width = 1029
        Height = 453
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 1029
      ExplicitHeight = 518
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 17
        Top = 24
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
      object edtDescricaoId: TLabeledEdit
        Tag = 2
        Left = 17
        Top = 88
        Width = 504
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
        Text = ''
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 546
    Width = 1037
    ExplicitTop = 546
    ExplicitWidth = 1037
    DesignSize = (
      1037
      94)
    inherited btnNovo: TBitBtn
      Left = 17
      ExplicitLeft = 17
    end
    inherited btnAlterar: TBitBtn
      Left = 110
      ExplicitLeft = 110
    end
    inherited btnCancelar: TBitBtn
      Left = 216
      ExplicitLeft = 216
    end
    inherited btnGravar: TBitBtn
      Left = 330
      ExplicitLeft = 330
    end
    inherited btnApagar: TBitBtn
      Left = 436
      ExplicitLeft = 436
    end
    inherited btnFechar: TBitBtn
      Left = 922
      ExplicitLeft = 922
    end
    inherited btnNavigator: TDBNavigator
      Left = 590
      Hints.Strings = ()
      ExplicitLeft = 590
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'select categoriaId,'
      '       descricaoId'
      #9'from Categorias')
    Left = 836
  end
end
