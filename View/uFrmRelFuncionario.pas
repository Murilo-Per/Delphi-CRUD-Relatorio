unit uFrmRelFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, RLReport;

type
  TFrmRelFuncionario = class(TForm)
    rgOrdemExibir: TRadioGroup;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    DataSource1: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLDBText4BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBText5BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFuncionario: TFrmRelFuncionario;

implementation

uses uDmFuncionario;

{$R *.dfm}

procedure TFrmRelFuncionario.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRelFuncionario.btnImprimirClick(Sender: TObject);
var iCodigo:Integer;
begin
  iCodigo := rgOrdemExibir.ItemIndex+1;
  DmFuncionario.RelatorioFuncionario(iCodigo);
  RLReport1.Preview();
end;

procedure TFrmRelFuncionario.FormCreate(Sender: TObject);
begin
  DmFuncionario := TDmFuncionario.Create(Nil);
end;

procedure TFrmRelFuncionario.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmFuncionario);
end;

procedure TFrmRelFuncionario.FormShow(Sender: TObject);
begin
  FrmRelFuncionario.Width:= 260;
  FrmRelFuncionario.Height := 200;
end;

procedure TFrmRelFuncionario.RLDBText4BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Text := 'R$'+formatcurr('##,##0.00', strtocurr(text));
end;

procedure TFrmRelFuncionario.RLDBText5BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  text := FormatDateTime('DD/MM',StrToDate(text));
end;

end.
