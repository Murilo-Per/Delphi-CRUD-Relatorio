program PTeste3LM;

uses
  Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {FrmPrincipal},
  uFrmPadrao in 'Model\uFrmPadrao.pas' {FrmPadrao},
  uFrmCadCargo in 'View\uFrmCadCargo.pas' {FrmCadCargo},
  uFuncionario_Cargo in 'Model\uFuncionario_Cargo.pas',
  uFuncionario_Cargo_Control in 'Control\uFuncionario_Cargo_Control.pas',
  uDmConexao in 'Control\uDmConexao.pas' {DMConexao: TDataModule},
  uDmFuncionario_Cargo in 'Control\uDmFuncionario_Cargo.pas' {DmFuncionario_Cargo: TDataModule},
  uFrmCadFuncionario in 'View\uFrmCadFuncionario.pas' {FrmCadFuncionario},
  uFuncionario in 'Model\uFuncionario.pas',
  uFuncionario_Control in 'Control\uFuncionario_Control.pas',
  uDmFuncionario in 'Control\uDmFuncionario.pas' {DmFuncionario: TDataModule},
  uFrmPesquisaSimples in 'View\uFrmPesquisaSimples.pas' {FrmPesquisaSimples},
  uFrmUsuario in 'View\uFrmUsuario.pas' {FrmCadUsuario},
  uUsuario in 'Model\uUsuario.pas',
  uDmUsuario in 'Control\uDmUsuario.pas' {dmUsuario: TDataModule},
  uUsuario_Control in 'Control\uUsuario_Control.pas',
  uFrmLogin in 'View\uFrmLogin.pas' {FrmLogin},
  uFrmRelCargos in 'View\uFrmRelCargos.pas' {FrmRelCargos},
  uFrmRelFuncionario in 'View\uFrmRelFuncionario.pas' {FrmRelFuncionario},
  uFrmRelFuncionarioCargo in 'View\uFrmRelFuncionarioCargo.pas' {FrmRelFuncionarioCargo},
  uRelFuncionarioSalario in 'View\uRelFuncionarioSalario.pas' {FrmRelFuncionarioSalario},
  uFrmFuncionarioAniversario in 'View\uFrmFuncionarioAniversario.pas' {FrmFuncionarioAniversario};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
