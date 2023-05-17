unit uFrmRelCargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, RLReport ;

type
  TFrmRelCargos = class(TForm)
    BtnImprimir: TBitBtn;
    rgOrdemDados: TRadioGroup;
    btnCancelar: TBitBtn;
    RLReportCargos: TRLReport;
    dsRelatorioCargos: TDataSource;
    RLBand1: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    procedure FormShow(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCargos: TFrmRelCargos;

implementation

uses uDmFuncionario_Cargo;

{$R *.dfm}

procedure TFrmRelCargos.FormShow(Sender: TObject);
begin
  FrmRelCargos.Height := 150;
  FrmRelCargos.Width := 300;
end;

procedure TFrmRelCargos.BtnImprimirClick(Sender: TObject);
var iCodigo:Integer;
begin
  iCodigo := (rgOrdemDados.ItemIndex+1);
  DmFuncionario_Cargo.RelatorioCargos(iCodigo);
  RLReportCargos.Preview();

end;

procedure TFrmRelCargos.FormCreate(Sender: TObject);
begin
  DmFuncionario_Cargo := TDmFuncionario_Cargo.Create(nil);
end;

procedure TFrmRelCargos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmFuncionario_Cargo);
end;

procedure TFrmRelCargos.btnCancelarClick(Sender: TObject);
begin
 close;
end;

end.
