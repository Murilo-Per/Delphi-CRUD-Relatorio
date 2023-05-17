unit uDmFuncionario;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery,uFuncionario,uDmConexao;

type
  TDmFuncionario = class(TDataModule)
    sqlPesquisa: TIBQuery;
    sqlInserir: TIBQuery;
    sqlAlterar: TIBQuery;
    sqlExcluir: TIBQuery;
    sqlPesquisaCargo: TIBQuery;
    sqlRelFuncionario: TIBQuery;
    sqlRelFuncionarioCODIGO: TIntegerField;
    sqlRelFuncionarioNOME: TIBStringField;
    sqlRelFuncionarioSALARIO: TFloatField;
    sqlRelFuncionarioANIVERSARIO: TDateField;
    sqlRelFuncionarioCODIGOCARGO: TIntegerField;
    sqlRelFuncionarioCARGO: TIBStringField;
    sqlRelFuncionario_Cargo: TIBQuery;
    sqlRelFuncionario_CargoCODIGOCARGO: TIntegerField;
    sqlRelFuncionario_CargoCARGO: TIBStringField;
    sqlRelFuncionario_CargoCODIGO: TIntegerField;
    sqlRelFuncionario_CargoNOME: TIBStringField;
    sqlRelFuncionario_CargoSALARIO: TFloatField;
    sqlRelFuncionario_CargoDATA_NASCIMENTO: TDateField;
    sqlRelFuncionario_Salario: TIBQuery;
    sqlRelFuncionario_SalarioCODIGO: TIntegerField;
    sqlRelFuncionario_SalarioNOME: TIBStringField;
    sqlRelFuncionario_SalarioSALARIO: TFloatField;
    sqlRelFuncionario_Aniversario: TIBQuery;
    sqlRelFuncionario_AniversarioCODIGO: TIntegerField;
    sqlRelFuncionario_AniversarioNOME: TIBStringField;
    sqlRelFuncionario_AniversarioANIVERSARIO: TIBStringField;
    sqlRelFuncionario_AniversarioSALARIO: TFloatField;
  private
    { Private declarations }
  public
    function GerarID:Integer;
    procedure PesquisaCargo(sNome:String);
    procedure Pesquisar(sNome:String);
    procedure Carregar_Funcionario(oFuncionario:TFuncionario; iCodigo:Integer);
    function Inserir(oFuncionario:TFuncionario; out sMsgErro:String):Boolean;
    function Alterar(oFuncionario:TFuncionario; out sMsgErro:String):Boolean;
    function Excluir(iCodigo:Integer; out sMsgErro:String):Boolean;

    procedure RelatorioFuncionario(iCodigo:Integer);
    procedure RelatorioFuncionario_Cargo(iCodigo:Integer);
    procedure RelatorioFuncionario_Salario(fValor1,fValor2:Currency;bListarTodos:Boolean=False);
    procedure RelatorioFuncionario_Aniversario(sIncial,sFinal:String;bListarTodos:Boolean=False);

  end;

var
  DmFuncionario: TDmFuncionario;

implementation


{$R *.dfm}

{ TDmFuncionario }

function TDmFuncionario.Alterar(oFuncionario: TFuncionario; out sMsgErro: String): Boolean;
begin
  with sqlAlterar, oFuncionario do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=' update funcionario set nome = :nome, salario = :salario, data_nascimento = :data_nascimento, fk_cargo = :fk_cargo'+
               ' where (id = :id)';

    Params[0].AsString   := Nome;
    Params[1].AsCurrency := Salario;
    Params[2].AsDate     := DataNasc;
    Params[3].AsInteger  := Cargo;
    Params[4].AsInteger  := ID;

    try
      ExecSQL();
      Result := True;
    except on E:Exception do
    begin
      Result := False;
      sMsgErro := 'Não Foi Possível Atualizar o Funcionario:'+sLineBreak+e.message;
    end;
    end;
  end;

end;

procedure TDmFuncionario.Carregar_Funcionario(oFuncionario: TFuncionario; iCodigo: Integer);
var sqlQuery: TIBQuery;
begin
  sqlQuery := TIBQuery.Create(nil);
  sqlQuery.Database := DMConexao.bdConexao;
  try
    with sqlQuery, oFuncionario do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ' select f.id, f.nome, f.salario, f.data_nascimento, f.fk_cargo, c.descricao as Nome_Cargo'+
                  ' from funcionario f'+
                  ' left join funcionario_cargo c on (f.fk_cargo =c.id)'+
                  ' where f.id = :ID ';

      Params[0].AsInteger := iCodigo;
      Open;

      ID         := Fields[0].AsInteger;
      Nome       := Fields[1].AsString;
      Salario    := Fields[2].AsCurrency;
      DataNasc   := Fields[3].AsDateTime;
      Cargo      := Fields[4].AsInteger;
      Cargo_Nome := Fields[5].AsString;
    end;
  finally
    FreeAndNil(sqlQuery);
  end;
end;

function TDmFuncionario.Excluir(iCodigo:Integer; out sMsgErro: String): Boolean;
begin
  with sqlExcluir do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from funcionario where (id = :id)');
    Params[0].AsInteger := iCodigo;

    try
      ExecSQL();
      Result := True;
    except on E:Exception do
    begin
      Result := False;
      sMsgErro := 'Não Foi Possível Excluir o Funcionario:'+sLineBreak+e.message;
    end;
    end;
  end;

end;

function TDmFuncionario.GerarID: Integer;
var SqlQuery: TIBQuery;
begin
  try
    SqlQuery := TIBQuery.Create(Nil);
    SqlQuery.Database := DMConexao.bdConexao;

    SqlQuery.SQL.Add('SELECT GEN_ID(GEN_FUNCIONARIO_ID, 1) FROM RDB$DATABASE');
    SqlQuery.Open;

    Result := SqlQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(SqlQuery);
  end;
end;

function TDmFuncionario.Inserir(oFuncionario: TFuncionario; out sMsgErro: String): Boolean;
begin
  with sqlInserir,oFuncionario do
  begin
    Close;
    SQL.Clear;
    SQL.ADD('insert into funcionario (id, nome, salario, data_nascimento, fk_cargo)');
    SQL.ADD(' values (:id, :nome, :salario, :data_nascimento, :fk_cargo)');

    Params[0].AsInteger  := GerarID;
    Params[1].AsString   := Nome;
    Params[2].AsCurrency := Salario;
    Params[3].AsDate     := DataNasc;
    Params[4].AsInteger  := Cargo;
    try
      ExecSQL();
      Result := True;
    except on E:Exception do
    begin
      Result := False;
      sMsgErro := 'Não Foi Possível Inserir o Funcionario:'+sLineBreak+e.message;
    end;

  end;
  end;
end;

procedure TDmFuncionario.PesquisaCargo(sNome: String);
begin
  if trim(sNome) <> EmptyStr then
  begin
    with sqlPesquisaCargo do
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
    with sqlPesquisaCargo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ID, DESCRICAO from FUNCIONARIO_CARGO');
      Open;
    end;
  end;
end;

procedure TDmFuncionario.Pesquisar(sNome: String);
begin
  if Trim(sNome) = EmptyStr then
  begin
    with sqlPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ' select f.id, f.nome'+
                  ' from funcionario f';
      Open;
      First;
    end;
  end else
  begin
    with sqlPesquisa do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ' select f.id, f.nome '+
                  ' from funcionario f'+
                  ' where f.nome like :nome ';
      Params[0].AsString := '%'+sNome+'%';
      Open;
    end; 
  end;
end;

procedure TDmFuncionario.RelatorioFuncionario(iCodigo: Integer);
begin
  with sqlRelFuncionario do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=' select f.id as Codigo, f.nome as Nome, f.salario as Salario, f.data_nascimento as Aniversario,'+
               ' f.fk_cargo as CodigoCargo, c.descricao as Cargo'+
               ' from funcionario f'+
               ' inner join funcionario_cargo c on f.fk_cargo = c.id';
    case iCodigo of
      1:SQL.Add(' order by f.id');
      2:SQL.Add(' order by f.nome');
    end;
    Open;
  end;
end;

procedure TDmFuncionario.RelatorioFuncionario_Aniversario(sIncial,
  sFinal: String; bListarTodos: Boolean);
  var sqlDiaMes:String;
begin
  //Comando SQL pra formatar a data para DIA e MES 00/00
  sqlDiaMes := 'CAST(LPAD(EXTRACT(DAY FROM f.data_nascimento), 2, '+QuotedStr('0')+
               ')||'+QuotedStr('/')+'||LPAD(EXTRACT(MONTH FROM f.data_nascimento), 2, '+QuotedStr('0')+')';

  with sqlRelFuncionario_Aniversario do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select f.id as codigo,'+
                ' f.nome as Nome,'+
                 sqlDiaMes+'as varchar(5)) AS Aniversario,'+
                ' f.salario as Salario'+
                ' from funcionario f';


    if not bListarTodos then
    begin
      SQL.Add(' where EXTRACT(month FROM f.data_nascimento) between :inicial and :Final');

      Params[0].AsSmallInt := StrToInt(Copy(sIncial,4,5));
      Params[1].AsSmallInt := StrToInt(Copy(sFinal,4,5));
    end;
    SQL.Add(' order by LPAD(EXTRACT(month FROM f.data_nascimento), 2, ''0''), LPAD(EXTRACT(day FROM f.data_nascimento), 2, ''0''),');
    SQL.Add(' f.salario desc');
    Open;
  end;
end;

procedure TDmFuncionario.RelatorioFuncionario_Cargo(iCodigo: Integer);
begin
  with sqlRelFuncionario_Cargo do
  begin
    Close;
    SQL.Clear;
    SQL.Text :='select f.fk_cargo as CodigoCargo,'+
               ' c.descricao as Cargo,'+
               ' f.id as Codigo,'+
               ' f.nome as Nome,'+
               ' f.salario as Salario,'+
               ' f.data_nascimento'+
               ' from funcionario f '+
               ' inner join funcionario_cargo c on f.fk_cargo = c.id';
    case iCodigo of
      1:SQL.Add(' order by f.fk_cargo');
      2:SQL.Add(' order by c.descricao');
    end;
    Open;
  end;
end;

procedure TDmFuncionario.RelatorioFuncionario_Salario(fValor1,
  fValor2: Currency; bListarTodos: Boolean);
begin
  with sqlRelFuncionario_Salario do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=' select f.id as codigo,'+
               ' f.nome as Nome,'+
               ' f.salario as Salario'+
               ' from funcionario f';
    if not bListarTodos then
    begin
    SQL.Add(' where f.salario between :inicial and :Final');
    Params[0].AsCurrency := fValor1;
    Params[1].AsCurrency := fValor2;

    end;
    SQL.Add(' order by f.salario desc');

    Open;
  end
end;

end.



