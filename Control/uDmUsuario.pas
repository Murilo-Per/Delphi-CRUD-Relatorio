unit uDmUsuario;

interface

uses
  SysUtils, Classes,uUsuario, DB, IBCustomDataSet, IBQuery;

type
  TdmUsuario = class(TDataModule)
    sqlPesquisa: TIBQuery;
    sqlInserir: TIBQuery;
    sqlAlterar: TIBQuery;
    sqlExcluir: TIBQuery;
  private
    { Private declarations }
  public
    function GerarID :Integer;
    procedure Pesquisar(sNome:string);
    procedure Carregar_Usuario(oUsuario:TUsuario; iCodigo:Integer);
    function Inserir(oUsuario:TUsuario; out sMsgErro:String):Boolean;
    function Alterar(oUsuario:TUsuario; out sMsgErro:String):Boolean;
    function Excluir(iCodigo:Integer; out sMsgErro:String):Boolean;
    function Login(sUsuario,sSenha:string):Boolean;
  end;

var
  dmUsuario: TdmUsuario;

implementation

uses uDmConexao;

{$R *.dfm}

function TdmUsuario.Alterar(oUsuario: TUsuario; out sMsgErro: String): Boolean;
begin
  with sqlAlterar,oUsuario do
  begin

    SQL.Clear;
    SQL.Text :=' update usuario set nome = :nome, senha = :senha where f.id = :ID ';
    Params[0].AsString  := Nome;
    Params[1].AsString  := Senha;
    Params[2].AsInteger := ID;
    try
      ExecSQL();
      Result :=True;
    except on e:Exception do
    begin
      Result := False;
      sMsgErro := 'Não foi Possivel Realizar o Procedimento de Alterar USUARIO:'+sLineBreak+e.Message;
    end;
  end;
end;
end;

procedure TdmUsuario.Carregar_Usuario(oUsuario: TUsuario; iCodigo: Integer);
var SqlQuery: TIBQuery;
begin
  try
    SqlQuery := TIBQuery.Create(Nil);
    SqlQuery.Database := DMConexao.bdConexao;

    SqlQuery.SQL.Add('Select * From USUARIO where ID ='+IntToStr(icodigo));
    SqlQuery.Open;

    with oUsuario, SqlQuery do
    begin
      ID        := Fields[0].AsInteger;
      Nome      := Fields[1].AsString;
      Senha     := Fields[2].AsString;
    end;

  finally
    FreeAndNil(SqlQuery);
  end;
end;

function TdmUsuario.Excluir(iCodigo: Integer; out sMsgErro: String): Boolean;
begin
  with sqlExcluir do
  begin

    SQL.Clear;
    SQL.Text := 'delete from usuario where ID = :id';
    Params[0].AsInteger := iCodigo;
    try
      ExecSQL();
      Result := True;
    except on e:Exception do
    begin
      Result := False;
      sMsgErro := 'Não foi Possivel Realizar o Procedimento de Excluir Usuario:'+sLineBreak+e.Message;
    end;
  end;
end;
end;

function TdmUsuario.GerarID: Integer;
var SqlQuery: TIBQuery;
begin
  try
    SqlQuery := TIBQuery.Create(Nil);
    SqlQuery.Database := DMConexao.bdConexao;

    SqlQuery.SQL.Add('SELECT GEN_ID(GEN_USUARIO_ID, 1) FROM RDB$DATABASE');
    SqlQuery.Open;

    Result := SqlQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(SqlQuery);
  end;
end;

function TdmUsuario.Inserir(oUsuario: TUsuario; out sMsgErro: String): Boolean;
begin
  with sqlInserir,oUsuario do
  begin
    SQL.Clear;
    SQL.Text :='insert into usuario (id, nome, senha) values (:id, :nome, :senha)';
    Params[0].AsInteger := GerarID;
    Params[1].AsString := Nome;
    Params[2].AsString := Senha;
    try
      ExecSQL;
      Result := True;
    except on E:Exception do
    begin
      Result := False;
      sMsgErro := 'Não foi Possivel Realizar o Procedimento de Inserir Usuario:'+sLineBreak+e.Message;
    end;
  end;
end;
end;

function TdmUsuario.Login(sUsuario, sSenha: string): Boolean;
var sqlQuery :TIBQuery;
begin
  sqlQuery := TIBQuery.Create(nil);
  sqlQuery.Database := DMConexao.bdConexao;
  try
    if (trim(sUsuario) <> EmptyStr) and (trim(sSenha) <> EmptyStr) then
    begin
      with sqlQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select ID, NOME, SENHA from USUARIO');
        SQL.Add('where UPPER(NOME) = UPPER(:USUARIO) and SENHA = :SENHA');
        Params[0].AsString := sUsuario;
        Params[1].AsString := sSenha;
        Open;

        if sqlQuery.RecordCount > 0 then
          Result := True
        else
          Result := False;
      end;
    end;
  finally
    FreeAndNil(sqlQuery);
  end;
end;

procedure TdmUsuario.Pesquisar(sNome: string);
begin
  if trim(sNome) <> EmptyStr then
  begin
    with sqlPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ID, NOME from USUARIO');
      SQL.Add('where UPPER(NOME) Like UPPER(:NOME)');
      Params[0].AsString := '%'+sNome+'%';
      Open;
    end;
  end
  else
  begin
    with sqlPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ID, NOME from USUARIO');
      Open;
    end;
  end;
end;

end.
