unit uRelFuncionarioSalario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, RLReport, DB;

type
  TFrmRelFuncionarioSalario = class(TForm)
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    edtValorIni: TMaskEdit;
    edtValorFinal: TMaskEdit;
    Label1: TLabel;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    DataSource1: TDataSource;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel3: TRLLabel;
    rbListarTodos: TCheckBox;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorIniExit(Sender: TObject);
    procedure edtValorIniKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorIniEnter(Sender: TObject);
    procedure edtValorFinalEnter(Sender: TObject);
    procedure edtValorFinalExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rbListarTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RLDBText3BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
  private
    { Private declarations }
    procedure GerarRelatorio;
  public
    { Public declarations }
  end;

var
  FrmRelFuncionarioSalario: TFrmRelFuncionarioSalario;

implementation

uses uDmFuncionario;

{$R *.dfm}

procedure TFrmRelFuncionarioSalario.btnImprimirClick(Sender: TObject);
begin
  GerarRelatorio;
end;

procedure TFrmRelFuncionarioSalario.GerarRelatorio;
var cValor1,cValor2:Currency;
begin
  cValor1 :=  StrToCurr(Stringreplace(Copy(edtValorIni.Text,0,Length(edtValorIni.Text)-3),'.','',[rfReplaceall]));
  cValor2 :=  StrToCurr(Stringreplace(Copy(edtValorFinal.Text,0,Length(edtValorFinal.Text)-3),'.','',[rfReplaceall]));

  if rbListarTodos.Checked then
    DmFuncionario.RelatorioFuncionario_Salario(0,0,True)
  else
    DmFuncionario.RelatorioFuncionario_Salario(cValor1,cValor2);

  RLReport1.Preview();
end;

procedure TFrmRelFuncionarioSalario.FormShow(Sender: TObject);
begin
  FrmRelFuncionarioSalario.Height := 200;
  FrmRelFuncionarioSalario.Width := 250;
end;

procedure TFrmRelFuncionarioSalario.edtValorIniExit(Sender: TObject);
begin
  if Trim(edtValorIni.Text) <> EmptyStr then
    edtValorIni.Text := FormatCurr('###,###,##0.00',StrToFloat(edtValorIni.Text));
end;

procedure TFrmRelFuncionarioSalario.edtValorIniKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', '¬'])  then
    if not (key =  #8) then
    key :=  #0;
end;

procedure TFrmRelFuncionarioSalario.edtValorIniEnter(Sender: TObject);
begin
 if edtValorFinal.Text <> '0,00' then
  edtValorIni.Clear;
end;

procedure TFrmRelFuncionarioSalario.edtValorFinalEnter(Sender: TObject);
begin
  edtValorFinal.Clear;
end;

procedure TFrmRelFuncionarioSalario.edtValorFinalExit(Sender: TObject);
begin
  if Trim(edtValorFinal.Text) <> EmptyStr then
    edtValorFinal.Text := FormatCurr('###,###,##0.00',StrToFloat(edtValorFinal.Text));
end;

procedure TFrmRelFuncionarioSalario.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRelFuncionarioSalario.FormCreate(Sender: TObject);
begin
  DmFuncionario := TDmFuncionario.Create(nil);
end;

procedure TFrmRelFuncionarioSalario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmFuncionario);
end;

procedure TFrmRelFuncionarioSalario.rbListarTodosClick(Sender: TObject);
begin
  if rbListarTodos.Checked then
  begin
    edtValorIni.Text := '0,00';
    edtValorFinal.Text := '0,00';
    edtValorIni.Enabled := False;
    edtValorFinal.Enabled := False;
  end else
  begin
    edtValorIni.Enabled := True;
    edtValorFinal.Enabled := True;
  end;
end;

procedure TFrmRelFuncionarioSalario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmRelFuncionarioSalario.RLDBText3BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Text := 'R$'+formatcurr('##,##0.00', strtocurr(text));
end;

end.
