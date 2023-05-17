inherited FrmCadCargo: TFrmCadCargo
  Caption = 'Cadastro de Cargos'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgcCadPrincipal: TPageControl
    inherited tbPesquisa: TTabSheet
      inherited PnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          Left = 536
          OnClick = btnPesquisarClick
        end
      end
      inherited dbgPesquisa: TDBGrid
        DataSource = dsPesquisa
      end
      inherited pnlBtPesquisa: TPanel
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
      end
    end
    inherited tbDados: TTabSheet
      inherited pnlCampos: TPanel [0]
        object lblCodigo: TLabel [0]
          Left = 24
          Top = 64
          Width = 33
          Height = 13
          Caption = 'Codigo'
        end
        object Label1: TLabel [1]
          Left = 24
          Top = 112
          Width = 28
          Height = 13
          Caption = 'Cargo'
        end
        object edtID: TEdit [2]
          Left = 24
          Top = 80
          Width = 105
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edtCargo: TEdit [3]
          Left = 24
          Top = 128
          Width = 353
          Height = 21
          TabOrder = 1
        end
        inherited pnlTituloCad: TPanel
          TabOrder = 2
          inherited lblTitulo: TLabel
            Caption = 'CADASTRO DE CARGOS'
          end
        end
      end
      inherited Panel1: TPanel [1]
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DmFuncionario_Cargo.sqlPesquisa
  end
end
