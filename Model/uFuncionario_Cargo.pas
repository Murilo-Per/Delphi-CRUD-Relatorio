unit uFuncionario_Cargo;

interface

type
  TFuncionario_Cargo = class

  private
    FID: Integer;
    FDESCRICAO: String;
    procedure SetDESCRICAO(const Value: String);

  public
    property ID: Integer read FID write FID;
    property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
  end;

implementation

uses SysUtils;

{ TFucionario_Cargo }

procedure TFuncionario_Cargo.SetDESCRICAO(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('''Descrição''não pode ser vazio!');
  FDESCRICAO := Value;
end;

end.
