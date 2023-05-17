unit uFrmPesquisaSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons;

type
  TFrmPesquisaSimples = class(TForm)
    DsPesquisaS: TDataSource;
    dbgPesquisaS: TDBGrid;
    pnlPesquisa: TPanel;
    edtPesquisaS: TLabeledEdit;
    btnPesquisaS: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPesquisaSKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisaSClick(Sender: TObject);
  private
    { Private declarations }
  public
    iID:Integer;
    sNome:String;
    procedure PesquisarCargo(sNome:String);
  end;

var
  FrmPesquisaSimples: TFrmPesquisaSimples;

implementation

uses uDmConexao, uFrmCadFuncionario, uDmFuncionario;

{$R *.dfm}

procedure TFrmPesquisaSimples.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end
  else if Key = #27 then
    close;
end;

procedure TFrmPesquisaSimples.PesquisarCargo(sNome: String);
begin
  DsPesquisaS.DataSet := DmFuncionario.sqlPesquisaCargo;
  DmFuncionario.PesquisaCargo(edtPesquisaS.Text);
end;

procedure TFrmPesquisaSimples.dbgPesquisaSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if (DsPesquisaS.DataSet.Active) and (DsPesquisaS.DataSet.RecordCount > 0) then
    begin
      iID   := DsPesquisaS.DataSet.Fields[0].AsInteger;
      sNome := DsPesquisaS.DataSet.Fields[1].AsString;
      Close;
    end;
  end;
end;

procedure TFrmPesquisaSimples.btnPesquisaSClick(Sender: TObject);
begin
  PesquisarCargo(edtPesquisaS.Text);
  FrmPesquisaSimples.KeyPreview := False;
  dbgPesquisaS.SetFocus;
end;

end.
