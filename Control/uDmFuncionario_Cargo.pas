unit uDmFuncionario_Cargo;

interface

uses
  SysUtils, Classes, Provider, DBClient, DB, DBTables, IBCustomDataSet,
  IBQuery, IBSQL,uFuncionario_Cargo;

type
  TDmFuncionario_Cargo = class(TDataModule)
    sqlPesquisa: TIBQuery;
    sqlInserir: TIBQuery;
    sqlAlterar: TIBQuery;
    sqlExcluir: TIBQuery;
    sqlRelCargos: TIBQuery;
    sqlRelCargosCODIGO: TIntegerField;
    sqlRelCargosCARGO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID :Integer;
    procedure Pesquisar(sNome:string);
    procedure Carregar_Funcionario_Cargo(oFuncionario_Cargo:TFuncionario_Cargo; iCodigo:Integer);
    function Inserir(oFuncionario_Cargo:TFuncionario_Cargo; out sMsgErro:String):Boolean;
    function Alterar(oFuncionario_Cargo:TFuncionario_Cargo; out sMsgErro:String):Boolean;
    function Excluir(iCodigo:Integer; out sMsgErro:String):Boolean;

    procedure RelatorioCargos(iCodigo:Integer); 
  end;

var
  DmFuncionario_Cargo: TDmFuncionario_Cargo;

implementation

uses uDmConexao;

{$R *.dfm}

{ TDmFuncionario_Cargo }

function TDmFuncionario_Cargo.Alterar(oFuncionario_Cargo: TFuncionario_Cargo; out sMsgErro: String): Boolean;
begin
  with sqlAlterar,oFuncionario_Cargo do
  begin
    Params[0].AsString  := DESCRICAO;
    Params[1].AsInteger := ID;
    try
      ExecSQL();
      Result :=True;
    except on e:Exception do
    begin
      Result := False;
      sMsgErro := 'Não foi Possivel Realizar o Procedimento de Alterar Cargo:'+sLineBreak+e.Message;
    end;
  end;
end;
end;

procedure TDmFuncionario_Cargo.Carregar_Funcionario_Cargo(oFuncionario_Cargo: TFuncionario_Cargo; iCodigo: Integer);
var SqlQuery: TIBQuery;
begin
  try
    SqlQuery := TIBQuery.Create(Nil);
    SqlQuery.Database := DMConexao.bdConexao;

    SqlQuery.SQL.Add('Select * From FUNCIONARIO_CARGO where ID ='+IntToStr(icodigo));
    SqlQuery.Open;

    with oFuncionario_Cargo, SqlQuery do
    begin
      ID        := Fields[0].AsInteger;
      DESCRICAO := Fields[1].AsString;
    end;

  finally
    FreeAndNil(SqlQuery);
  end;
end;

function TDmFuncionario_Cargo.Excluir(iCodigo: Integer; out sMsgErro: String): Boolean;
begin
  with sqlExcluir do
  begin
    Params[0].AsInteger := iCodigo;
    try
      ExecSQL();
      Result := True;
    except on e:Exception do
    begin
      Result := False;
      sMsgErro := 'Não foi Possivel Realizar o Procedimento de Excluir Cargo:'+sLineBreak+e.Message;
    end;
  end;
end;
end;

function TDmFuncionario_Cargo.GerarID: Integer;
var SqlQuery: TIBQuery;
begin
  try
    SqlQuery := TIBQuery.Create(Nil);
    SqlQuery.Database := DMConexao.bdConexao;

    SqlQuery.SQL.Add('SELECT GEN_ID(GEN_FUNCIONARIO_CARGO_ID, 1) FROM RDB$DATABASE');
    SqlQuery.Open;

    Result := SqlQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(SqlQuery);
  end;
end;

function TDmFuncionario_Cargo.Inserir(oFuncionario_Cargo: TFuncionario_Cargo; out sMsgErro: String): Boolean;
begin
  with sqlInserir,oFuncionario_Cargo do
  begin
    Params[0].AsInteger := GerarID;
    Params[1].AsString := DESCRICAO;
    try
      ExecSQL;
      Result := True;
    except on E:Exception do
    begin
      Result := False;
      sMsgErro := 'Não foi Possivel Realizar o Procedimento de Inserir Cargo:'+sLineBreak+e.Message;
    end;
  end;
end;
end;

procedure TDmFuncionario_Cargo.Pesquisar(sNome: string);
begin
  if trim(sNome) <> EmptyStr then
  begin
    with sqlPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ID, DESCRICAO from FUNCIONARIO_CARGO');
      SQL.Add('where UPPER(Descricao) Like UPPER(:Descricao)');
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
      SQL.Add('Select ID, DESCRICAO from FUNCIONARIO_CARGO');
      Open;
    end;
  end;
end;

procedure TDmFuncionario_Cargo.RelatorioCargos(iCodigo: Integer);
begin
  with sqlRelCargos do
  begin
    Close;
    SQL.Clear;
    SQL.Text := ' Select c.id as Codigo, c.descricao as Cargo from funcionario_cargo c';

    Case iCodigo of
    1: SQL.Add(' order by c.id');
    2: SQL.Add(' order by c.descricao');
    end;
    Open;
  end;
end;

end.

