unit uDmConexao;

interface

uses
  SysUtils, Classes, DB, DBTables, IBDatabase;

type
  TDMConexao = class(TDataModule)
    bdConexao: TIBDatabase;
    IBTransaction1: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{$R *.dfm}

end.
