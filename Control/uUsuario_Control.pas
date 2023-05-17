unit uUsuario_Control;

interface
uses uUsuario;

type
  TUsuario_Control = class

  private

  public
    procedure Pesquisar(sNome:String);
    procedure Carregar_Usuario(oUsuario:TUsuario; iCodigo:Integer);
    function Inserir(oUsuario: TUsuario; var sMsgErro:String): Boolean;
    function Alterar(oUsuario: TUsuario; var sMsgErro:String): Boolean;
    function Excluir(iCodigo: Integer; var sMsgErro:String):Boolean;
  end;

implementation

uses uDmUsuario;


{ TUsuario_Control }

function TUsuario_Control.Alterar(oUsuario: TUsuario; var sMsgErro: String): Boolean;
begin
  Result := dmUsuario.Alterar(oUsuario,sMsgErro);
end;

procedure TUsuario_Control.Carregar_Usuario(oUsuario: TUsuario; iCodigo: Integer);
begin
  dmUsuario.Carregar_Usuario(oUsuario,iCodigo);
end;

function TUsuario_Control.Excluir(iCodigo: Integer; var sMsgErro: String): Boolean;
begin
  Result := dmUsuario.Excluir(iCodigo,sMsgErro);
end;

function TUsuario_Control.Inserir(oUsuario: TUsuario; var sMsgErro: String): Boolean;
begin
  Result := dmUsuario.Inserir(oUsuario,sMsgErro);
end;

procedure TUsuario_Control.Pesquisar(sNome: String);
begin
  dmUsuario.Pesquisar(sNome);
end;

end.
