unit uFuncionario_Cargo_Control;

interface                                    

uses uFuncionario_Cargo, SysUtils;

type
  TFuncionario_Cargo_Control = class
  public
    procedure Pesquisar(sNome:String);
    procedure Carregar_Funcionario_Cargo(oFuncionaro_Cargo:TFuncionario_Cargo; iCodigo:Integer);
    function Inserir(oFuncionario_Cargo: TFuncionario_Cargo; var sMsgErro:String): Boolean;
    function Alterar(oFuncionario_Cargo: TFuncionario_Cargo; var sMsgErro:String): Boolean;
    function Excluir(iCodigo: Integer; var sMsgErro:String):Boolean;
  end;
implementation

uses uDmFuncionario_Cargo;


{ TFuncionario_Cargo_Control }

function TFuncionario_Cargo_Control.Alterar(oFuncionario_Cargo: TFuncionario_Cargo; var sMsgErro: String): Boolean;
begin
  Result := DmFuncionario_Cargo.Alterar(oFuncionario_Cargo,sMsgErro);
end;

procedure TFuncionario_Cargo_Control.Carregar_Funcionario_Cargo(oFuncionaro_Cargo: TFuncionario_Cargo; iCodigo: Integer);
begin
  DmFuncionario_Cargo.Carregar_Funcionario_Cargo(oFuncionaro_Cargo,iCodigo);
end;

function TFuncionario_Cargo_Control.Excluir(iCodigo: Integer; var sMsgErro: String): Boolean;
begin
  Result := DmFuncionario_Cargo.Excluir(iCodigo,sMsgErro);
end;

function TFuncionario_Cargo_Control.Inserir(oFuncionario_Cargo: TFuncionario_Cargo; var sMsgErro: String): Boolean;
begin
   Result := DmFuncionario_Cargo.Inserir(oFuncionario_Cargo,sMsgErro);
end;

procedure TFuncionario_Cargo_Control.Pesquisar(sNome: String);
begin
  DmFuncionario_Cargo.Pesquisar(sNome);
end;

end.
