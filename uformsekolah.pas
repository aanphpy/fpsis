unit uformsekolah;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, PQConnection, DB, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DBGrids, DBCtrls, udbconn;

type

  { TFormSekolah }

  TFormSekolah = class(TForm)
    DBCAktif: TDBCheckBox;
    dbsrc: TDataSource;
    EditNama: TDBEdit;
    EditAlamat: TDBEdit;
    EditTelepon: TDBEdit;
    EditEmail: TDBEdit;
    DBGrid1: TDBGrid;
    dbnav: TDBNavigator;
    LabelAlamat: TLabel;
    LabelAktif: TLabel;
    LabelTelepon: TLabel;
    LabelNama: TLabel;
    dbq: TSQLQuery;
    dbtrans: TSQLTransaction;
    LabelEmail: TLabel;
    dbc: TPQConnection;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure InitDbConnection;
    procedure CloseDbConnection;
  private

  public

  end;

var
  FormSekolah: TFormSekolah;

implementation

{$R *.lfm}

{ TFormSekolah }

procedure TFormSekolah.InitDbConnection;
begin
  try
    OpenDbConnection(dbc, dbtrans);
    dbq.Active := False;
    dbq.SQLConnection := dbc;
    dbsrc.DataSet := dbq;
    dbq.SQL.Text := 'SELECT * FROM sekolah';
    dbq.Active := True;
  finally
  end;
end;

procedure TFormSekolah.CloseDbConnection;
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

procedure TFormSekolah.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseDbConnection;
end;

procedure TFormSekolah.FormShow(Sender: TObject);
begin
  InitDbConnection;
end;

end.

