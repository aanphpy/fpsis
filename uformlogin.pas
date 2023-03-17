unit uformlogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, PQConnection, SQLDB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, ExtCtrls, udbconn, DB, uappconn;

type

  { TFormLogin }

  TFormLogin = class(TForm)
    ButtonLogin: TBitBtn;
    dbc: TPQConnection;
    EditUsername: TEdit;
    EditPassword: TEdit;
    ImageLoginLogo: TImage;
    ImageBackground: TImage;
    LabelUsername: TLabel;
    LabelPassword: TLabel;
    dbtrans: TSQLTransaction;
    dbq: TSQLQuery;
    procedure ButtonLoginClick(Sender: TObject);
    procedure ClearForm;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    //procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImageBackgroundClick(Sender: TObject);
  private

  public

  end;

var
  FormLogin: TFormLogin;


implementation

{$R *.lfm}

{ TFormLogin }

procedure TFormLogin.ClearForm;
begin
  EditUsername.Clear;
  EditPassword.Clear;
  EditUsername.Focused;
end;

procedure TFormLogin.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  try
    dbq.Active := False;
    dbq.Free;

    dbtrans.Active := False;
    dbtrans.Free;

    dbc.Connected := False;
    dbc.Free;
  finally
  end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  ImageBackground.Top := 0;
  ImageBackground.Left := 0;
  ImageBackground.Width := Width;
  ImageBackground.Height := Height;
  try
     OpenDbConnection(dbc, dbtrans);
  finally
  end;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  ImageBackground.Width := Width;
  ImageBackground.Height := Height;
end;

procedure TFormLogin.ImageBackgroundClick(Sender: TObject);
begin

end;

procedure TFormLogin.ButtonLoginClick(Sender: TObject);
var
  username: String;
  password: String;
begin
  AppUser.UID := 0;
  username := EditUsername.Text;
  password := EditPassword.Text;
  try
     dbq.Active := False;
     dbq.SQLConnection := dbc;
     dbq.SQL.Text := 'SELECT id, nama FROM users WHERE username=''' + username + ''' AND credential=''' + password + ''' AND is_active=TRUE LIMIT 1';
     dbq.Active := True;

     if dbq.RecordCount = 0 then begin
       ShowMessage('Kombinasi username dan password salah');
       ClearForm;
     end else begin
       dbq.First;
       AppUser.UID := dbq.FieldByName('id').AsInteger;
       AppUser.Nama := dbq.FieldByName('nama').AsString;
       Close;
     end;
  finally
  end;
end;

end.

