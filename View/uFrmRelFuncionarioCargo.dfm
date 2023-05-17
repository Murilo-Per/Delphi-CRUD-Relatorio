object FrmRelFuncionarioCargo: TFrmRelFuncionarioCargo
  Left = 74
  Top = 258
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 493
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object RLReport1: TRLReport
    Left = 115
    Top = 156
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
        Caption = 'Relat'#243'rio de Funcion'#225'ros por Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 664
        Top = 56
        Width = 51
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Info = itHour
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 571
        Top = 56
        Width = 92
        Height = 14
        Alignment = taRightJustify
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 90
      Borders.Sides = sdAll
      DataFields = 'CARGO'
      object RLBand3: TRLBand
        Left = 1
        Top = 43
        Width = 716
        Height = 23
        object RLDBText1: TRLDBText
          Left = 22
          Top = 5
          Width = 25
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'CODIGO'
          DataSource = DataSource1
        end
        object RLDBText2: TRLDBText
          Left = 48
          Top = 5
          Width = 248
          Height = 14
          AutoSize = False
          DataField = 'NOME'
          DataSource = DataSource1
        end
        object RLDBText4: TRLDBText
          Left = 464
          Top = 5
          Width = 102
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'SALARIO'
          DataSource = DataSource1
          BeforePrint = RLDBText4BeforePrint
        end
        object RLDBText5: TRLDBText
          Left = 584
          Top = 5
          Width = 112
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA_NASCIMENTO'
          DataSource = DataSource1
          BeforePrint = RLDBText5BeforePrint
        end
      end
      object RLBand2: TRLBand
        Left = 1
        Top = 1
        Width = 716
        Height = 42
        BandType = btHeader
        Borders.Sides = sdAll
        object RLLabel3: TRLLabel
          Left = 23
          Top = 4
          Width = 52
          Height = 16
          Caption = 'Cargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 77
          Top = 4
          Width = 148
          Height = 16
          AutoSize = False
          DataField = 'CARGO'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 22
          Top = 23
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
        object RLLabel8: TRLLabel
          Left = 487
          Top = 23
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
        object RLLabel9: TRLLabel
          Left = 574
          Top = 23
          Width = 128
          Height = 16
          Caption = 'Data Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 1
        Top = 66
        Width = 716
        Height = 24
        BandType = btColumnFooter
        Borders.Sides = sdAll
        object RLSystemInfo3: TRLSystemInfo
          Left = 627
          Top = 4
          Width = 64
          Height = 13
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Info = itDetailCount
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 476
          Top = 4
          Width = 150
          Height = 14
          Caption = 'Funcionarios no Cargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object rgOrdemExibir: TRadioGroup
    Left = 31
    Top = 16
    Width = 185
    Height = 73
    Caption = 'Ordem de Exibi'#231#227'o'
    ItemIndex = 0
    Items.Strings = (
      '1-C'#243'digo'
      '2-Alfabetica')
    TabOrder = 1
  end
  object btnImprimir: TBitBtn
    Left = 24
    Top = 104
    Width = 83
    Height = 33
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object btnCancelar: TBitBtn
    Left = 134
    Top = 104
    Width = 83
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object DataSource1: TDataSource
    DataSet = DmFuncionario.sqlRelFuncionario_Cargo
    Left = 288
    Top = 72
  end
end
