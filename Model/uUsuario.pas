unit uUsuario;

interface

type
  TUsuario = class

  private
    fID: Integer;
    fNome: String;
    fSenha: String;

  public
    property ID:Integer read fID write fID;
    property Nome :String read fNome write fNome;
    property Senha :String read fSenha write fSenha;
  end;

implementation

end.
