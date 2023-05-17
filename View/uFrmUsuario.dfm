inherited FrmCadUsuario: TFrmCadUsuario
  Caption = 'FrmCadUsuario'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgcCadPrincipal: TPageControl
    inherited tbPesquisa: TTabSheet
      inherited PnlPesquisa: TPanel
        inherited btnPesquisar: TButton
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
      inherited pnlCampos: TPanel
        inherited pnlTituloCad: TPanel
          inherited lblTitulo: TLabel
            Caption = 'CADASTRO DE USU'#193'RIO'
          end
        end
        object edtCodigo: TLabeledEdit
          Left = 32
          Top = 96
          Width = 57
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'Codigo'
          TabOrder = 1
        end
        object edtNome: TLabeledEdit
          Left = 104
          Top = 96
          Width = 337
          Height = 21
          EditLabel.Width = 28
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          TabOrder = 2
        end
        object edtSenha: TLabeledEdit
          Left = 32
          Top = 144
          Width = 121
          Height = 21
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Senha'
          TabOrder = 3
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = dmUsuario.sqlPesquisa
  end
end
