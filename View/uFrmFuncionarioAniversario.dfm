object FrmFuncionarioAniversario: TFrmFuncionarioAniversario
  Left = 311
  Top = 213
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 451
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 25
    Top = 48
    Width = 53
    Height = 14
    Caption = 'Periodo:'
  end
  object edtDataIni: TMaskEdit
    Left = 25
    Top = 72
    Width = 72
    Height = 22
    EditMask = '!99/99;1;_'
    MaxLength = 5
    TabOrder = 0
    Text = '  /  '
  end
  object edtDataFim: TMaskEdit
    Left = 113
    Top = 72
    Width = 72
    Height = 22
    EditMask = '!99/99;1;_'
    MaxLength = 5
    TabOrder = 1
    Text = '  /  '
  end
  object btnImprimir: TBitBtn
    Left = 16
    Top = 112
    Width = 83
    Height = 33
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object btnCancelar: TBitBtn
    Left = 118
    Top = 112
    Width = 83
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object cbListarTodos: TCheckBox
    Left = 24
    Top = 16
    Width = 97
    Height = 17
    Caption = 'Listar Todos'
    TabOrder = 3
    OnClick = cbListarTodosClick
  end
  object RLReport1: TRLReport
    Left = 93
    Top = 160
    Width = 794
    Height = 1123
    DataSource = DataSource1
    ParentFont = True
    Visible = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 23
        Align = faTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relat'#243'rio de Aniversariantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 624
        Top = 56
        Width = 92
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Info = itHour
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 528
        Top = 56
        Width = 92
        Height = 14
        Alignment = taRightJustify
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 135
      Width = 718
      Height = 22
      object RLDBText1: TRLDBText
        Left = 72
        Top = 5
        Width = 27
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'CODIGO'
        DataSource = DataSource1
      end
      object RLDBText2: TRLDBText
        Left = 100
        Top = 5
        Width = 265
        Height = 14
        AutoSize = False
        DataField = 'NOME'
        DataSource = DataSource1
      end
      object RLDBText3: TRLDBText
        Left = 558
        Top = 5
        Width = 88
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'SALARIO'
        DataSource = DataSource1
        BeforePrint = RLDBText3BeforePrint
      end
      object RLDBText4: TRLDBText
        Left = 429
        Top = 5
        Width = 52
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'ANIVERSARIO'
        DataSource = DataSource1
      end
    end
    object v: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 22
      BandType = btColumnHeader
      Borders.Sides = sdAll
      object RLLabel2: TRLLabel
        Left = 82
        Top = 4
        Width = 80
        Height = 16
        Caption = 'Fucion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 576
        Top = 4
        Width = 54
        Height = 16
        Caption = 'Sal'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 415
        Top = 4
        Width = 87
        Height = 16
        Caption = 'Anivers'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 157
      Width = 718
      Height = 20
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      object RLSystemInfo3: TRLSystemInfo
        Left = 666
        Top = 3
        Width = 41
        Height = 14
        AutoSize = False
        Info = itDetailCount
      end
      object RLLabel3: TRLLabel
        Left = 414
        Top = 1
        Width = 250
        Height = 16
        Caption = 'Quantidade de Funcionarios Listados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DmFuncionario.sqlRelFuncionario_Aniversario
    Left = 280
    Top = 64
  end
end
