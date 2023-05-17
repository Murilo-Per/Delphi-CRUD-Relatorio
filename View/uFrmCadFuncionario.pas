unit uFrmCadFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, Mask, ExtCtrls, DB, Grids, DBGrids, StdCtrls,
  ComCtrls, Buttons;

type
  TFrmCadFuncionario = class(TFrmPadrao)
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSalario: TLabeledEdit;
    edtDataNasc: TMaskEdit;
    lblDataNasc: TLabel;
    edtCodCargo: TLabeledEdit;
    edtNomeCargo: TLabeledEdit;
    btnPesqCargo: TBitBtn;
    procedure edtSalarioExit(Sender: TObject);
    procedure edtSalarioEnter(Sender: TObject);
    procedure edtSalarioClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesqCargoClick(Sender: TObject);
  private
    function RemoveCaracter(sTexto:String):Currency;
    procedure NovoRegistro;
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Gravar;
    procedure Pesquisar(sNome:String);
    procedure Carregar_Funcionario;
    procedure PreencherCargo(iCodigo:Integer;sNome:String); 

  public
    { Public declarations }
  end;

var
  FrmCadFuncionario: TFrmCadFuncionario;

implementation

uses uFuncionario_Control, uFuncionario, uDmFuncionario,
  uFrmPesquisaSimples;

{$R *.dfm}

procedure TFrmCadFuncionario.edtSalarioExit(Sender: TObject);
begin
  inherited;
  if Trim(edtSalario.Text) <> EmptyStr then
    edtSalario.Text := 'R$'+FormatCurr('###,###,##0.00',StrToFloat(edtSalario.text));
end;

procedure TFrmCadFuncionario.edtSalarioEnter(Sender: TObject);
begin
  inherited;
  edtSalario.Clear;
end;

procedure TFrmCadFuncionario.edtSalarioClick(Sender: TObject);
begin
  inherited;
  edtSalario.Clear;
end;

procedure TFrmCadFuncionario.Inserir;
var oFuncionario: TFuncionario;
    oFuncionario_Control : TFuncionario_Control;
    sMsgErro:String;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario_Control := TFuncionario_Control.Create;
  try
    with oFuncionario do
    begin
      ID := 0;
      Nome       := edtNome.Text;
      Salario    := RemoveCaracter(edtSalario.Text);
      DataNasc   := StrToDate(edtDataNasc.Text);
      Cargo      := StrToInt(edtCodCargo.Text);
      Cargo_Nome := edtNomeCargo.Text;
    end;
    if oFuncionario_Control.Inserir(oFuncionario,sMsgErro) = False then
      Raise Exception.Create(sMsgErro);
  finally
    begin
      FreeAndNil(oFuncionario);
      FreeAndNil(oFuncionario_Control);
    end;
  end;
end;

function TFrmCadFuncionario.RemoveCaracter(sTexto: String): Currency;
begin
  Result := StrToCurr(Stringreplace(Copy(sTexto,3,Length(sTexto)-5),'.','',[rfReplaceall]));
end;

procedure TFrmCadFuncionario.Alterar;
var oFuncionario :TFuncionario;
    oFuncionario_Control:TFuncionario_Control;
    sMsg:String;
begin
  oFuncionario         := TFuncionario.Create;
  oFuncionario_Control := TFuncionario_Control.Create;

  try
    with oFuncionario do
    begin
      ID         := StrToInt(edtCodigo.text);
      Nome       := edtNome.Text;
      Salario    := RemoveCaracter(edtSalario.Text);
      DataNasc   := StrToDate(edtDataNasc.Text);
      Cargo      := StrToInt(edtCodCargo.Text);
      Cargo_Nome := edtNomeCargo.Text;
    end;
    if oFuncionario_Control.Alterar(oFuncionario,sMsg) = False then
      raise Exception.Create(sMsg);

  finally
  begin
    FreeAndNil(oFuncionario);
    FreeAndNil(oFuncionario_Control);
  end;
  end;
end;

procedure TFrmCadFuncionario.Excluir;
var oFuncionario_Control : TFuncionario_Control;
    sMsg:String;
begin
  oFuncionario_Control := TFuncionario_Control.Create;

  try
    if (DmFuncionario.sqlPesquisa.Active) and (DmFuncionario.sqlPesquisa.RecordCount > 0) then
      if MessageDlg('Deseja Realmente Excluir este Registro?',mtConfirmation,[mbOk,mbCancel],0) = MrOK then
        if oFuncionario_Control.Excluir(DmFuncionario.sqlPesquisa.FieldByName('ID').AsInteger,sMsg) = False then
          raise Exception.Create(sMsg)
        else
          oFuncionario_Control.Pesquisar(edtPesquisa.Text);
  finally
    FreeAndNil(oFuncionario_Control);
  end;
end;

procedure TFrmCadFuncionario.Pesquisar(sNome: String);
var oFuncionario_Control : TFuncionario_Control;
begin
  oFuncionario_Control := TFuncionario_Control.Create;
  try
    oFuncionario_Control.Pesquisar(sNome);
  finally
    FreeAndNil(oFuncionario_Control);
  end;
end;

procedure TFrmCadFuncionario.Carregar_Funcionario;
var oFuncionario :TFuncionario;
    oFuncionario_Control:TFuncionario_Control;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionario_Control := TFuncionario_Control.Create;

  try
    oFuncionario_Control.Carregar_Funcionario(oFuncionario,dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    with oFuncionario do
    begin
      edtCodigo.Text    := IntToStr(ID);
      edtNome.Text      := Nome;
      edtSalario.Text   := 'R$'+FormatFloat('####,###,00',Salario);
      edtDataNasc.Text  := DateToStr(DataNasc);
      edtCodCargo.Text  := IntToStr(Cargo);
      edtNomeCargo.Text := Cargo_Nome;
    end;
  finally
  begin
    FreeAndNil(oFuncionario);
    FreeAndNil(oFuncionario_Control);
  end;
  end;
end;

procedure TFrmCadFuncionario.Gravar;
var oFuncionario_Control : TFuncionario_Control;
begin
  oFuncionario_Control := TFuncionario_Control.Create;
  try
    case fOperacao of
      opIncluir:Inserir;
      opAlterar:Alterar;
    end;
    oFuncionario_Control.Pesquisar('');
    btnListarClick(Self);
  finally
    FreeAndNil(oFuncionario_Control);
  end;
end;

procedure TFrmCadFuncionario.NovoRegistro;
begin
  edtNome.Text := EmptyStr;
  edtSalario.Text := EmptyStr;
  edtDataNasc.Text := EmptyStr;
  edtCodCargo.Text := EmptyStr;
  edtCodCargo.Text := EmptyStr;
  edtNomeCargo.Text := EmptyStr;
  edtCodigo.Text := EmptyStr;
  if edtNome.CanFocus then
    edtNome.SetFocus;
end;

procedure TFrmCadFuncionario.btnIncluirClick(Sender: TObject);
begin
  inherited;
  NovoRegistro;
end;

procedure TFrmCadFuncionario.btnDetalharClick(Sender: TObject);
begin
  if (DmFuncionario.sqlPesquisa.Active) and (DmFuncionario.sqlPesquisa.RecordCount > 0) then
  begin
    Carregar_Funcionario;
    inherited;
  end;
end;

procedure TFrmCadFuncionario.btnExcluirClick(Sender: TObject);
begin
  inherited;
  Excluir;
end;

procedure TFrmCadFuncionario.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar(edtPesquisa.Text);
end;

procedure TFrmCadFuncionario.btnAlterarClick(Sender: TObject);
begin
  inherited;
   //Alterar;
end;

procedure TFrmCadFuncionario.btnGravarClick(Sender: TObject);
begin
  Gravar;
  inherited;
end;

procedure TFrmCadFuncionario.btnCancelarClick(Sender: TObject);
begin
  case fOperacao of
    opIncluir:
      begin
        Pesquisar(EmptyStr);
        btnListarClick(Self);
      end;
    opAlterar:Carregar_Funcionario;
  end;
  inherited;
end;

procedure TFrmCadFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  DmFuncionario := TDmFuncionario.Create(nil);
end;

procedure TFrmCadFuncionario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DmFuncionario);
end;

procedure TFrmCadFuncionario.btnPesqCargoClick(Sender: TObject);
begin
  inherited;
  if ((Trim(edtCodCargo.Text) = EmptyStr) and (Trim(edtNomeCargo.Text) = EmptyStr))
   or (fOperacao = opAlterar) then
  begin
    FrmPesquisaSimples := TFrmPesquisaSimples.Create(Nil);
    FrmPesquisaSimples.ShowModal;
    PreencherCargo(FrmPesquisaSimples.iID,FrmPesquisaSimples.sNome);
    FreeAndNil(FrmPesquisaSimples);
  end;
  if btnGravar.CanFocus then
    btnGravar.SetFocus;

end;

procedure TFrmCadFuncionario.PreencherCargo(iCodigo: Integer;
  sNome: String);
begin
  edtCodCargo.Text := IntToStr(iCodigo);
  edtNomeCargo.Text := sNome;
end;

end.
