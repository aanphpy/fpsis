unit uformtahunajaran;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, PQConnection, DB, Forms, Controls, Graphics,
  Dialogs, DBCtrls, StdCtrls, DBGrids, udbconn;

type

  { TFormTahunAjaran }

  TFormTahunAjaran = class(TForm)
    dbc: TPQConnection;
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    dbq: TSQLQuery;
    dbsrc: TDataSource;
    dbtrans: TSQLTransaction;
    EditNama: TDBEdit;
    LabelNama: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure InitDbConnection;
    procedure CloseDbConnection;
  private

  public

  end;

var
  FormTahunAjaran: TFormTahunAjaran;

implementation

{$R *.lfm}

{ TFormTahunAjaran }

procedure TFormTahunAjaran.FormShow(Sender: TObject);
begin
  InitDbConnection;
end;

procedure TFormTahunAjaran.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseDbConnection;
end;

procedure TFormTahunAjaran.InitDbConnection;
begin
  try
    OpenDbConnection(dbc, dbtrans);
    dbq.Active := False;
    dbq.SQLConnection := dbc;
    dbsrc.DataSet := dbq;
    dbq.SQL.Text := 'SELECT * FROM tahun_ajaran';
    dbq.Active := True;
  finally
  end;
end;

procedure TFormTahunAjaran.CloseDbConnection;
begin
  try
    dbq.Active := False;
    dbq.Close;
    dbq.Free;

    dbsrc.Free;

    dbtrans.CloseDataSets;
    dbtrans.Active := False;
    dbtrans.Free;

    dbc.CloseDataSets;
    dbc.Connected := False;
    dbc.Free;
  finally
  end;
end;

end.

