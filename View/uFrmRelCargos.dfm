object FrmRelCargos: TFrmRelCargos
  Left = 456
  Top = 198
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmRelCargos'
  ClientHeight = 438
  ClientWidth = 923
  Color = clSilver
  Font.Charset = ANSI_CHARSET
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
  object BtnImprimir: TBitBtn
    Left = 29
    Top = 104
    Width = 89
    Height = 33
    Caption = 'Imprimir'
    TabOrder = 0
    OnClick = BtnImprimirClick
  end
  object rgOrdemDados: TRadioGroup
    Left = 7
    Top = 12
    Width = 274
    Height = 65
    Caption = 'Ordem de Exibi'#231#227'o'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '1-Codigo'
      '2-Alfabetica')
    TabOrder = 1
  end
  object btnCancelar: TBitBtn
    Left = 160
    Top = 104
    Width = 89
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object RLReportCargos: TRLReport
    Left = 24
    Top = 160
    Width = 794
    Height = 1123
    DataSource = dsRelatorioCargos
    ParentFont = True
    Visible = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 459
        Top = 46
        Width = 185
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
      end
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 29
        Align = faTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relat'#243'rio de Cargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 648
        Top = 46
        Width = 66
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Info = itHour
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 152
        Top = 4
        Width = 48
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 416
        Top = 4
        Width = 58
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 26
      object RLDBText1: TRLDBText
        Left = 152
        Top = 8
        Width = 56
        Height = 14
        Alignment = taCenter
        DataField = 'CODIGO'
        DataSource = dsRelatorioCargos
      end
      object RLDBText2: TRLDBText
        Left = 422
        Top = 8
        Width = 48
        Height = 14
        Alignment = taCenter
        DataField = 'CARGO'
        DataSource = dsRelatorioCargos
      end
    end
  end
  object dsRelatorioCargos: TDataSource
    DataSet = DmFuncionario_Cargo.sqlRelCargos
    Left = 384
    Top = 40
  end
end
