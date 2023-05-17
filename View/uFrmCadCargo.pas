unit uFrmCadCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmCadCargo = class(TFrmPadrao)
    lblCodigo: TLabel;
    edtID: TEdit;
    edtCargo: TEdit;
    Label1: TLabel;
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    procedure Carregar_Funcionario_Cargo;
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Pesquisar;
    procedure Gravar;
    procedure Novo;

  public
    { Public declarations }
  end;

var
  FrmCadCargo: TFrmCadCargo;

implementation

uses uFuncionario_Cargo_Control, uFuncionario_Cargo, uDmFuncionario_Cargo,
  Math;

{$R *.dfm}

{ TFrmCadCargo }

procedure TFrmCadCargo.Alterar;
var
  oFuncionario_Cargo_Control: TFuncionario_Cargo_Control;
  oFuncionario_Cargo:TFuncionario_Cargo;
  sErro:String;
begin
  oFuncionario_Cargo_Control := TFuncionario_Cargo_Control.Create;
  oFuncionario_Cargo         := TFuncionario_Cargo.Create;

  try
    with oFuncionario_Cargo do
    begin
      ID        := StrToInt(edtID.Text);
      DESCRICAO := edtCargo.Text;

      if (oFuncionario_Cargo_Control.Alterar(oFuncionario_Cargo, sErro)) = False then
        Raise Exception.Create(sErro);

    end
  finally
  begin
    FreeAndNil(oFuncionario_Cargo_Control);
    FreeAndNil(oFuncionario_Cargo);
  end;
end;
end;

procedure TFrmCadCargo.Carregar_Funcionario_Cargo;
var
  oFuncionario_Cargo_Control: TFuncionario_Cargo_Control;
  oFuncionario_Cargo:TFuncionario_Cargo;
begin
  oFuncionario_Cargo_Control := TFuncionario_Cargo_Control.Create;
  oFuncionario_Cargo         := TFuncionario_Cargo.Create;

  try
    oFuncionario_Cargo_Control.Carregar_Funcionario_Cargo(oFuncionario_Cargo,dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    with oFuncionario_Cargo do
    begin
      edtID.Text := IntToStr(ID);
      edtCargo.Text := DESCRICAO;
    end;
  finally
  begin
    FreeAndNil(oFuncionario_Cargo_Control);
    FreeAndNil(oFuncionario_Cargo);
  end;
  end;
end;

procedure TFrmCadCargo.Excluir;
var oFuncionario_Cargo_Control:TFuncionario_Cargo_Control;
    sErro:String;
begin
  oFuncionario_Cargo_Control := TFuncionario_Cargo_Control.Create;
  try
    if (DmFuncionario_Cargo.sqlPesquisa.Active)
    and (DmFuncionario_Cargo.sqlPesquisa.RecordCount > 0) then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOK,mbCancel],0) = IDOk then
      begin
        if oFuncionario_Cargo_Control.Excluir(dsPesquisa.DataSet.FieldbyName('ID').AsInteger,sErro) = False then
          Raise Exception.Create(sErro);
        oFuncionario_Cargo_Control.Pesquisar(edtPesquisa.Text);
      end;
    end else
          Raise Exception.Create('Não a registro a ser excluido!');
  finally
    FreeAndNil(oFuncionario_Cargo_Control);
  end;
end;

procedure TFrmCadCargo.Gravar;
var
  oFuncionario_Cargo_Control: TFuncionario_Cargo_Control;
begin
  oFuncionario_Cargo_Control := TFuncionario_Cargo_Control.Create;
  try
    case fOperacao of
      opIncluir:Inserir;
      opAlterar:Alterar;
    end;
    oFuncionario_Cargo_Control.Pesquisar(edtPesquisa.Text);
    btnListarClick(Self);
  finally
    FreeAndNil(oFuncionario_Cargo_Control);
  end;

end;

procedure TFrmCadCargo.Inserir;
var
  oFuncionario_Cargo_Control: TFuncionario_Cargo_Control;
  oFuncionario_Cargo:TFuncionario_Cargo;
  sErro:String;
begin
  oFuncionario_Cargo_Control:= TFuncionario_Cargo_Control.Create;
  oFuncionario_Cargo :=TFuncionario_Cargo.Create;

  try
    with oFuncionario_Cargo do
    begin
      ID        := 0;
      DESCRICAO := edtCargo.Text;

      if oFuncionario_Cargo_Control.Inserir(oFuncionario_Cargo,sErro) = False then
        Raise Exception.Create(sErro);
    end;
  finally
    FreeAndNil(oFuncionario_Cargo_Control);
    FreeAndNil(oFuncionario_Cargo);
  end;
end;

procedure TFrmCadCargo.Pesquisar;
var oFuncionario_Cargo_Control:TFuncionario_Cargo_Control;
begin
  oFuncionario_Cargo_Control := TFuncionario_Cargo_Control.Create;
  try
    oFuncionario_Cargo_Control.Pesquisar(edtPesquisa.Text);
  finally
    FreeAndNil(oFuncionario_Cargo_Control);
  end;
end;

procedure TFrmCadCargo.btnDetalharClick(Sender: TObject);
begin
  if (DmFuncionario_Cargo.sqlPesquisa.Active) and (DmFuncionario_Cargo.sqlPesquisa.RecordCount > 0) then
  begin
    Carregar_Funcionario_Cargo;
    inherited;
  end;
end;

procedure TFrmCadCargo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TFrmCadCargo.btnGravarClick(Sender: TObject);
begin
  Gravar;
  inherited;
end;

procedure TFrmCadCargo.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFrmCadCargo.FormCreate(Sender: TObject);
begin
  inherited;
  DmFuncionario_Cargo := TDmFuncionario_Cargo.Create(Nil)
end;

procedure TFrmCadCargo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DmFuncionario_Cargo)
end;

procedure TFrmCadCargo.Novo;
begin
  edtID.Text := EmptyStr;
  edtCargo.Text := EmptyStr;
  if edtCargo.CanFocus then
    edtCargo.SetFocus;
end;

procedure TFrmCadCargo.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Novo;
end;

procedure TFrmCadCargo.btnCancelarClick(Sender: TObject);
begin
  case fOperacao of
    opIncluir:
      begin
        Pesquisar;
        btnListarClick(Self);
      end;
    opAlterar:Carregar_Funcionario_Cargo;
  end;
  inherited;
end;

procedure TFrmCadCargo.btnAlterarClick(Sender: TObject);
begin
  inherited;
  //Alterar
end;

end.
