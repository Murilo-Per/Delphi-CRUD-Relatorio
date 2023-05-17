object FrmPadrao: TFrmPadrao
  Left = 349
  Top = 138
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 523
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object PnlBtnLateral: TPanel
    Left = 0
    Top = 480
    Width = 672
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 0
    object btnFechar: TButton
      Left = 580
      Top = 7
      Width = 81
      Height = 31
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object PgcCadPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 672
    Height = 480
    ActivePage = tbPesquisa
    Align = alClient
    MultiLine = True
    TabOrder = 1
    TabStop = False
    object tbPesquisa: TTabSheet
      object PnlPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 664
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object lblPesquisa: TLabel
          Left = 16
          Top = 16
          Width = 62
          Height = 14
          Caption = 'Pesquisar'
        end
        object edtPesquisa: TEdit
          Left = 16
          Top = 32
          Width = 505
          Height = 22
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 552
          Top = 30
          Width = 105
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
        end
      end
      object dbgPesquisa: TDBGrid
        Left = 0
        Top = 73
        Width = 664
        Height = 334
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = True
        FixedColor = clSilver
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
      end
      object pnlBtPesquisa: TPanel
        Left = 0
        Top = 407
        Width = 664
        Height = 44
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 2
        object btnDetalhar: TButton
          Left = 396
          Top = 7
          Width = 81
          Height = 31
          Caption = 'Detalhar'
          TabOrder = 0
          OnClick = btnDetalharClick
        end
        object btnIncluir: TButton
          Left = 486
          Top = 7
          Width = 81
          Height = 31
          Caption = 'Incluir'
          TabOrder = 1
          OnClick = btnIncluirClick
        end
        object btnExcluir: TButton
          Left = 575
          Top = 7
          Width = 81
          Height = 31
          Caption = 'Excluir'
          TabOrder = 2
        end
      end
    end
    object tbDados: TTabSheet
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 407
        Width = 664
        Height = 44
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        TabOrder = 0
        object btnAlterar: TButton
          Left = 396
          Top = 7
          Width = 81
          Height = 31
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 486
          Top = 7
          Width = 81
          Height = 31
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 575
          Top = 7
          Width = 81
          Height = 31
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 2
          OnClick = btnCancelarClick
        end
        object btnListar: TButton
          Left = 307
          Top = 7
          Width = 81
          Height = 31
          Caption = 'Listar'
          TabOrder = 3
          OnClick = btnListarClick
        end
      end
      object pnlCampos: TPanel
        Left = 0
        Top = 0
        Width = 664
        Height = 407
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlTituloCad: TPanel
          Left = 0
          Top = 0
          Width = 664
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlTituloCad'
          Color = clSkyBlue
          TabOrder = 0
          object lblTitulo: TLabel
            Left = 0
            Top = 0
            Width = 664
            Height = 41
            Align = alClient
            Alignment = taCenter
            Caption = 'CADASTROS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -20
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
        end
      end
    end
  end
  object dsPesquisa: TDataSource
    Left = 172
    Top = 176
  end
end
