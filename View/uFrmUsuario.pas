unit uFrmUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, DB, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmCadUsuario = class(TFrmPadrao)
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure Carregar_Usuario;
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Pesquisar;
    procedure Gravar;
    procedure Novo;
  public

  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

uses uDmUsuario, uUsuario_Control, uUsuario;

{$R *.dfm}

procedure TFrmCadUsuario.Alterar;
var
  oUsuario_Control: TUsuario_Control;
  oUsuario:TUsuario;
  sErro:String;
begin
  oUsuario_Control := TUsuario_Control.Create;
  oUsuario         := TUsuario.Create;

  try
    with oUsuario do
    begin
      ID     := StrToInt(edtCodigo.Text);
      Nome   := edtNome.Text;
      Senha  := edtSenha.Text;

      if (oUsuario_Control.Alterar(oUsuario, sErro)) = False then
        Raise Exception.Create(sErro);

    end
  finally
  begin
    FreeAndNil(oUsuario_Control);
    FreeAndNil(oUsuario);
  end;
end;
end;

procedure TFrmCadUsuario.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TFrmCadUsuario.Carregar_Usuario;
var
  oUsuario_Control: TUsuario_Control;
  oUsuario:TUsuario;
begin
  oUsuario_Control := TUsuario_Control.Create;
  oUsuario         := TUsuario.Create;

  try
    oUsuario_Control.Carregar_Usuario(oUsuario,dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    with oUsuario do
    begin
      edtCodigo.Text := IntToStr(ID);
      edtNome.Text   := Nome;
      edtSenha.Text  := Senha
    end;
  finally
  begin
    FreeAndNil(oUsuario_Control);
    FreeAndNil(oUsuario);
  end;
  end;
end;

procedure TFrmCadUsuario.Excluir;
var oUsuario_Control:TUsuario_Control;
    sErro:String;
begin
  oUsuario_Control := TUsuario_Control.Create;
  try
    if (DmUsuario.sqlPesquisa.Active)
    and (DmUsuario.sqlPesquisa.RecordCount > 0) then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOK,mbCancel],0) = IDOk then
      begin
        if oUsuario_Control.Excluir(dsPesquisa.DataSet.FieldbyName('ID').AsInteger,sErro) = False then
          Raise Exception.Create(sErro);
        oUsuario_Control.Pesquisar(edtPesquisa.Text);
      end;
    end else
          Raise Exception.Create('Não a registro a ser excluido!');
  finally
    FreeAndNil(oUsuario_Control);
  end;
end;

procedure TFrmCadUsuario.Gravar;
var
  oUsuario_Control: TUsuario_Control;
begin
  oUsuario_Control := TUsuario_Control.Create;
  try
    case fOperacao of
      opIncluir:Inserir;
      opAlterar:Alterar;
    end;
    oUsuario_Control.Pesquisar(edtPesquisa.Text);
    btnListarClick(Self);
  finally
    FreeAndNil(oUsuario_Control);
  end;
end;

procedure TFrmCadUsuario.Inserir;
var
  oUsuario_Control: TUsuario_Control;
  oUsuario:TUsuario;
  sErro:String;
begin
  oUsuario_Control:= TUsuario_Control.Create;
  oUsuario :=TUsuario.Create;

  try
    with oUsuario do
    begin
      ID    := 0;
      Nome  := edtNome.Text;
      Senha := edtSenha.Text;

      if oUsuario_Control.Inserir(oUsuario,sErro) = False then
        Raise Exception.Create(sErro);
    end;
  finally
    FreeAndNil(oUsuario_Control);
    FreeAndNil(oUsuario);
  end;
end;

procedure TFrmCadUsuario.Novo;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtSenha.Clear;

  if edtNome.CanFocus then
    edtNome.SetFocus;

end;

procedure TFrmCadUsuario.Pesquisar;
var oUsuario_Control:TUsuario_Control;
begin
  oUsuario_Control := TUsuario_Control.Create;
  try
    oUsuario_Control.Pesquisar(edtPesquisa.Text);
  finally
    FreeAndNil(oUsuario_Control);
  end;
end;

procedure TFrmCadUsuario.btnDetalharClick(Sender: TObject);
begin
  if (dmUsuario.sqlPesquisa.Active) and (dmUsuario.sqlPesquisa.RecordCount > 0) then
  begin
    Carregar_Usuario;
    inherited;
  end;
end;

procedure TFrmCadUsuario.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Novo;
end;

procedure TFrmCadUsuario.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TFrmCadUsuario.btnGravarClick(Sender: TObject);
begin
  Gravar;
  inherited;
end;

procedure TFrmCadUsuario.btnCancelarClick(Sender: TObject);
begin
  case fOperacao of
    opIncluir:
      begin
        Pesquisar;
        btnListarClick(Self);
      end;
    opAlterar:Carregar_Usuario;
  end;
  inherited;
end;

procedure TFrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  dmUsuario := TdmUsuario.Create(nil);
end;

procedure TFrmCadUsuario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmUsuario);
end;

end.
