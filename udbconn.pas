unit udbconn;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, PQConnection, SQLDB;

const
  DB_HOST = 'localhost';
  DB_NAME = 'sisdb';
  DB_USER = 'admin';
  DB_PASSWORD = 'admin';
  DB_PORT = 5432;

procedure OpenDbConnection(var dbconn: TPQConnection; var dbtrans: TSQLTransaction);

implementation

procedure OpenDbConnection(var dbconn: TPQConnection; var dbtrans: TSQLTransaction);
begin
  try
    dbconn := TPQConnection.Create(nil);
    dbconn.Connected := False;
    dbconn.HostName := DB_HOST;
    dbconn.DatabaseName := DB_NAME;
    dbconn.UserName := DB_USER;
    dbconn.Password := DB_PASSWORD;

    dbtrans.Active := False;
    dbtrans.CloseDataSets;

    dbconn.Transaction := dbtrans;

    dbconn.Connected := True;
    dbtrans.Active := True;
  finally
  end;
end;

end.

