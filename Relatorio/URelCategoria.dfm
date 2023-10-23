object frmRelCategoria: TfrmRelCategoria
  Left = 0
  Top = 0
  Caption = 'frmRelCategoria'
  ClientHeight = 1025
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsCategorias
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 3
        Width = 240
        Height = 28
        Caption = 'Listagem'#13#10' de Categorias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 59
        Width = 718
        Height = 8
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 183
      Width = 718
      Height = 96
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 6
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 23
        Top = 37
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 601
        Top = 38
        Width = 87
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 601
        Top = 37
        Width = 112
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 668
        Top = 37
        Width = 38
        Height = 16
        Caption = 'de'#13#10
      end
      object RLLabel3: TRLLabel
        Left = 578
        Top = 37
        Width = 44
        Height = 16
        Caption = 'P'#225'gina'
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 54
      object RLDBText1: TRLDBText
        Left = 0
        Top = 22
        Width = 68
        Height = 16
        Alignment = taCenter
        DataField = 'categoriaId'
        DataSource = dtsCategorias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 100
        Top = 22
        Width = 70
        Height = 16
        Alignment = taCenter
        DataField = 'descricaoId'
        DataSource = dtsCategorias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object RLLabel4: TRLLabel
        Left = 3
        Top = 2
        Width = 58
        Height = 19
        Alignment = taCenter
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 90
        Top = 1
        Width = 80
        Height = 19
        Alignment = taCenter
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object QryCategorias: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      'select categoriaId, descricaoId from categorias')
    Params = <>
    Left = 8
    Top = 8
    object QryCategoriascategoriaId: TZIntegerField
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryCategoriasdescricaoId: TZUnicodeStringField
      FieldName = 'descricaoId'
      Size = 30
    end
  end
  object dtsCategorias: TDataSource
    DataSet = QryCategorias
    Left = 41
    Top = 9
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 72
    Top = 8
  end
end
