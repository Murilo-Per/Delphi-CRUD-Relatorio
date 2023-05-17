unit uFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TFrmLogin = class(TForm)
    pnlLogin: TPanel;
    edtSenha: TEdit;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    btnLogin: TButton;
    btnSair: TButton;
    procedure edtSenhaEnter(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormHide(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses uDmUsuario, uFrmPrincipal;

{$R *.dfm}

procedure TFrmLogin.edtSenhaEnter(Sender: TObject);
begin
  if edtSenha.Text = 'Senha' then
  begin
    edtSenha.Clear;
    edtSenha.PasswordChar := '*';
  end;
end;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
  if dmUsuario.Login(edtUsuario.Text,edtSenha.Text) then
  begin
    FrmPrincipal.ShowModal;
    FrmLogin.Hide;
  end
  else
    MessageDlg('Usuário/Senha Inválido!',mtWarning,[mbOK],0);
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  dmUsuario := TdmUsuario.Create(Nil);
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmLogin.FormHide(Sender: TObject);
begin
  FreeAndNil(dmUsuario);
end;

procedure TFrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if edtUsuario.Text = 'Usuario' then
    edtUsuario.Clear;
end;

end.
