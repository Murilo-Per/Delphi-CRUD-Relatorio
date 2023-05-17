unit uFuncionario_Control;

interface

uses uFuncionario,SysUtils;

type

  TFuncionario_Control = class
  private

  public
    procedure Pesquisar(sNome:String);
    procedure Carregar_Funcionario(oFuncionario:TFuncionario; iCodigo:Integer);
    function Inserir(oFuncionario: TFuncionario; var sMsgErro:String): Boolean;
    function Alterar(oFuncionario: TFuncionario; var sMsgErro:String): Boolean;
    function Excluir(iCodigo: Integer; var sMsgErro:String):Boolean;
  end;

implementation

uses uDmFuncionario;


{ TFuncionario_Control }

function TFuncionario_Control.Alterar(oFuncionario: TFuncionario; var sMsgErro: String): Boolean;
begin
  Result := DmFuncionario.Alterar(oFuncionario,sMsgErro);
end;

procedure TFuncionario_Control.Carregar_Funcionario(oFuncionario: TFuncionario; iCodigo: Integer);
begin
  DmFuncionario.Carregar_Funcionario(oFuncionario,iCodigo);
end;

function TFuncionario_Control.Excluir(iCodigo: Integer; var sMsgErro: String): Boolean;
begin
  Result := DmFuncionario.Excluir(iCodigo,sMsgErro);
end;

function TFuncionario_Control.Inserir(oFuncionario: TFuncionario; var sMsgErro: String): Boolean;
begin
  Result := DmFuncionario.Inserir(oFuncionario,sMsgErro);
end;

procedure TFuncionario_Control.Pesquisar(sNome: String);
begin
  DmFuncionario.Pesquisar(sNome);
end;

end.
