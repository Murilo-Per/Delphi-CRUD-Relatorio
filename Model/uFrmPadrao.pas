unit uFrmPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, DB;

type
  TOperacao =(opIncluir, opAlterar, opNavegar);

  TFrmPadrao = class(TForm)
    PnlBtnLateral: TPanel;
    PgcCadPrincipal: TPageControl;
    tbPesquisa: TTabSheet;
    tbDados: TTabSheet;
    PnlPesquisa: TPanel;
    btnFechar: TButton;
    edtPesquisa: TEdit;
    lblPesquisa: TLabel;
    btnPesquisar: TButton;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    pnlBtPesquisa: TPanel;
    btnDetalhar: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    Panel1: TPanel;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnListar: TButton;
    pnlCampos: TPanel;
    pnlTituloCad: TPanel;
    lblTitulo: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure Incluir;
    procedure Detalhar;
    procedure Listar;
    procedure Config;
    procedure HabilitarControles(aOperacao:TOperacao);
  public
    fOperacao :TOperacao;
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.Config;
begin
  tbPesquisa.TabVisible := False;
  tbDados.TabVisible := False;
  PgcCadPrincipal.ActivePage := tbPesquisa;
end;

procedure TFrmPadrao.Detalhar;
begin
  fOperacao := opNavegar;
  PgcCadPrincipal.ActivePage := tbDados;
end;

procedure TFrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmPadrao.Incluir;
begin
  fOperacao := opIncluir;
  PgcCadPrincipal.ActivePage := tbDados;
  HabilitarControles(fOperacao);
end;

procedure TFrmPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPadrao.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrmPadrao.btnIncluirClick(Sender: TObject);
begin
  Incluir;
end;

procedure TFrmPadrao.FormShow(Sender: TObject);
begin
  Config;
end;

procedure TFrmPadrao.Listar;
begin
  fOperacao := opNavegar;
  PgcCadPrincipal.ActivePage := tbPesquisa;
end;

procedure TFrmPadrao.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TFrmPadrao.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
  opIncluir,opAlterar:
  begin
    pnlCampos.Enabled  := True;
    btnListar.Enabled  := False;
    btnAlterar.Enabled := False;
    btnFechar.Enabled  := False;
    btnGravar.Enabled  := True;
    btnCancelar.Enabled:= True;
  end;
  opNavegar:
  begin
    pnlCampos.Enabled  := False;
    btnListar.Enabled  := True;
    btnAlterar.Enabled := True;
    btnFechar.Enabled  := True;
    btnGravar.Enabled  := False;
    btnCancelar.Enabled:= False;
  end;
  end
end;

procedure TFrmPadrao.btnAlterarClick(Sender: TObject);
begin
  fOperacao := opAlterar;
  HabilitarControles(fOperacao);
end;

procedure TFrmPadrao.btnGravarClick(Sender: TObject);
begin
  fOperacao := opNavegar;
  HabilitarControles(fOperacao);
end;

procedure TFrmPadrao.btnCancelarClick(Sender: TObject);
begin
  fOperacao := opNavegar;
  HabilitarControles(fOperacao);
end;

end.
