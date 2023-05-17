unit uFrmFuncionarioAniversario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, RLReport, DB;

type
  TFrmFuncionarioAniversario = class(TForm)
    edtDataIni: TMaskEdit;
    edtDataFim: TMaskEdit;
    Label1: TLabel;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    cbListarTodos: TCheckBox;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    v: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText4: TRLDBText;
    DataSource1: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLDBText3BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbListarTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure GeraRelatorio;
  public
    { Public declarations }
  end;

var
  FrmFuncionarioAniversario: TFrmFuncionarioAniversario;

implementation

uses uDmFuncionario;

{$R *.dfm}

procedure TFrmFuncionarioAniversario.btnCancelarClick(Sender: TObject);
begin
 close;
end;

procedure TFrmFuncionarioAniversario.FormShow(Sender: TObject);
begin
  FrmFuncionarioAniversario.Height :=200;
  FrmFuncionarioAniversario.Width  :=230; 
end;

procedure TFrmFuncionarioAniversario.RLDBText3BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
   Text := 'R$'+formatcurr('##,##0.00', strtocurr(text));
end;

procedure TFrmFuncionarioAniversario.btnImprimirClick(Sender: TObject);
begin
  GeraRelatorio;
end;

procedure TFrmFuncionarioAniversario.GeraRelatorio;
var dDataIni, dDataFim :String;
begin
  dDataIni := edtDataIni.text;
  dDataFim := edtDataFim.Text;
  if cbListarTodos.Checked then
    DmFuncionario.RelatorioFuncionario_Aniversario('','',True)
  else
    DmFuncionario.RelatorioFuncionario_Aniversario(dDataIni,dDataFim);

  RLReport1.Preview();  

end;

procedure TFrmFuncionarioAniversario.cbListarTodosClick(Sender: TObject);
begin
  if cbListarTodos.Checked then
  begin
    edtDataIni.Clear;
    edtDataFim.Clear;
    edtDataIni.Enabled := False;
    edtDataFim.Enabled := False;
  end else
  begin
    edtDataIni.Enabled := True;
    edtDataFim.Enabled := True;
  end;
end;

procedure TFrmFuncionarioAniversario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmFuncionarioAniversario.FormCreate(Sender: TObject);
begin
  DmFuncionario := TDmFuncionario.Create(nil)
end;

procedure TFrmFuncionarioAniversario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmFuncionario);
end;

end.
