unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, IniFiles, jpeg, Buttons,midaslib, RLConsts;

type
  TFrmPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Funcionario1: TMenuItem;
    Cargos1: TMenuItem;
    Relatorios1: TMenuItem;
    Rel1: TMenuItem;
    Usurios1: TMenuItem;
    RelFuncionarios1: TMenuItem;
    pnlPrincipal: TPanel;
    imgPrincipal: TImage;
    btnSair: TBitBtn;
    RelFuncionarioporCargo1: TMenuItem;
    FuncionarioporSalrio1: TMenuItem;
    Aniversariantes1: TMenuItem;
    procedure Cargos1Click(Sender: TObject);
    procedure Funcionario1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rel1Click(Sender: TObject);
    procedure RelFuncionarios1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure RelFuncionarioporCargo1Click(Sender: TObject);
    procedure FuncionarioporSalrio1Click(Sender: TObject);
    procedure Aniversariantes1Click(Sender: TObject);
  private
    { Private declarations }

  public
    vIniFile: TIniFile;
    procedure ConectarBD;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses uFrmPadrao, uFrmCadCargo, uFrmCadFuncionario, uFrmUsuario, uDmConexao,
  uFrmRelCargos, uFrmRelFuncionario, uFrmRelFuncionarioCargo,
  uRelFuncionarioSalario, uFrmFuncionarioAniversario;

{$R *.dfm}


procedure TFrmPrincipal.Cargos1Click(Sender: TObject);
begin
  try
    FrmCadCargo := TFrmCadCargo.Create(nil);
    FrmCadCargo.ShowModal;
  finally
    FreeAndNil(FrmCadCargo);
  end;
end;

procedure TFrmPrincipal.Funcionario1Click(Sender: TObject);
begin
  try
    FrmCadFuncionario := TFrmCadFuncionario.Create(nil);
    FrmCadFuncionario.ShowModal;
  finally
    FreeAndNil(FrmCadFuncionario);
  end;
end;

procedure TFrmPrincipal.Usurios1Click(Sender: TObject);
begin
  try
    FrmCadUsuario := TFrmCadUsuario.Create(nil);
    FrmCadUsuario.ShowModal;
  finally
    FreeAndNil(FrmCadUsuario);
  end;
end;

procedure TFrmPrincipal.ConectarBD;
begin
  vIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.ini');

  with DMConexao do
  begin
    bdConexao.Close;
    bdConexao.DatabaseName := vIniFile.ReadString('PARAMETROS','LOCAL','');
    try
      bdConexao.Open;
    except
    begin
      raise Exception.Create('Banco de Danos não encontrado, a aplicação seta fechada!');
      Application.Terminate;
    end;
    end;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  ConectarBD;
end;

procedure TFrmPrincipal.Rel1Click(Sender: TObject);
begin
   FrmRelCargos := TFrmRelCargos.Create(Nil);
   FrmRelCargos.ShowModal;
   FreeAndNil(FrmRelCargos);
end;

procedure TFrmPrincipal.RelFuncionarios1Click(Sender: TObject);
begin
  FrmRelFuncionario := TFrmRelFuncionario.Create(nil);
  FrmRelFuncionario.ShowModal;
  FreeAndNil(FrmRelFuncionario);
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TFrmPrincipal.RelFuncionarioporCargo1Click(Sender: TObject);
begin
  FrmRelFuncionarioCargo := TFrmRelFuncionarioCargo.Create(nil);
  FrmRelFuncionarioCargo.ShowModal;
  FreeAndNil(FrmRelFuncionarioCargo);
end;

procedure TFrmPrincipal.FuncionarioporSalrio1Click(Sender: TObject);
begin
  FrmRelFuncionarioSalario := TFrmRelFuncionarioSalario.Create(nil);
  FrmRelFuncionarioSalario.ShowModal;
  FreeAndNil(FrmRelFuncionarioSalario);
end;

procedure TFrmPrincipal.Aniversariantes1Click(Sender: TObject);
begin
  FrmFuncionarioAniversario := TFrmFuncionarioAniversario.create(nil);
  FrmFuncionarioAniversario.ShowModal;
  FreeAndNil(FrmFuncionarioAniversario);
end;

end.
RLConsts.SetVersion(3,69,'B');
