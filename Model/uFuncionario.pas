unit uFuncionario;

interface
uses DateUtils;

type

  TFuncionario = Class
  private
    fSalario: Currency;
    fDataNasc: TDateTime;
    fCargo: Integer;
    fID: integer;
    fNome: String;
    fCargo_Nome: String;

  public
    property ID :integer read fID write fID;
    property Nome :String read fNome write fNome;
    property Salario :Currency read fSalario write fSalario;
    property DataNasc :TDateTime read fDataNasc write fDataNasc;
    property Cargo :Integer read fCargo write fCargo;
    property Cargo_Nome :String read fCargo_Nome write fCargo_Nome;

  end;

implementation

end.
