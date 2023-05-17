unit uFrmRelFuncionarioCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RLReport, DB;

type
  TFrmRelFuncionarioCargo = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    rgOrdemExibir: TRadioGroup;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    DataSource1: TDataSource;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLDBText4BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBText5BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFuncionarioCargo: TFrmRelFuncionarioCargo;

implementation

uses uDmFuncionario;

{$R *.dfm}

procedure TFrmRelFuncionarioCargo.FormShow(Sender: TObject);
begin
  FrmRelFuncionarioCargo.Width:= 260;
  FrmRelFuncionarioCargo.Height := 200;
end;

procedure TFrmRelFuncionarioCargo.btnImprimirClick(Sender: TObject);
var iCodigo:Integer;
begin
  iCodigo := rgOrdemExibir.ItemIndex+1;
  DmFuncionario.RelatorioFuncionario_Cargo(iCodigo);
  RLReport1.Preview();
end;

procedure TFrmRelFuncionarioCargo.RLDBText4BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Text := 'R$'+formatcurr('##,##0.00', strtocurr(text));
end;

procedure TFrmRelFuncionarioCargo.RLDBText5BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  text := FormatDateTime('DD/MM',StrToDate(text));
end;

procedure TFrmRelFuncionarioCargo.FormCreate(Sender: TObject);
begin
  DmFuncionario := TDmFuncionario.Create(Nil);
end;

procedure TFrmRelFuncionarioCargo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmFuncionario);
end;

procedure TFrmRelFuncionarioCargo.btnCancelarClick(Sender: TObject);
begin
  close;
end;

end.
