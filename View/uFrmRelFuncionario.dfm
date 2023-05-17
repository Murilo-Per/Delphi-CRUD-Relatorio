object FrmRelFuncionario: TFrmRelFuncionario
  Left = 297
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 405
  ClientWidth = 404
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
    TabOrder = 0
  end
  object btnImprimir: TBitBtn
    Left = 24
    Top = 104
    Width = 83
    Height = 33
    Caption = 'Imprimir'
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object btnCancelar: TBitBtn
    Left = 134
    Top = 104
    Width = 83
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object RLReport1: TRLReport
    Left = 128
    Top = 176
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
        Caption = 'Relat'#243'rio de Funcion'#225'rios'
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
        Left = 520
        Top = 56
        Width = 100
        Height = 14
        Alignment = taRightJustify
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 23
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel2: TRLLabel
        Left = 24
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
      object RLLabel3: TRLLabel
        Left = 351
        Top = 4
        Width = 47
        Height = 16
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 483
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
        Left = 576
        Top = 4
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
    object RLBand3: TRLBand
      Left = 38
      Top = 136
      Width = 718
      Height = 25
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
      object RLDBText3: TRLDBText
        Left = 304
        Top = 5
        Width = 148
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'CARGO'
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
        DataField = 'ANIVERSARIO'
        DataSource = DataSource1
        BeforePrint = RLDBText5BeforePrint
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DmFuncionario.sqlRelFuncionario
    Left = 280
    Top = 88
  end
end
