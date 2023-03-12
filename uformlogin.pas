unit uformlogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, PQConnection, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormLogin }

  TFormLogin = class(TForm)
    ButtonLogin: TButton;
    EditUsername: TEdit;
    EditPassword: TEdit;
    LabelUsername: TLabel;
    LabelPassword: TLabel;
    procedure ButtonLoginClick(Sender: TObject);
  private

  public

  end;

var
  FormLogin: TFormLogin;
  AppUserID: Integer = 0;


implementation

{$R *.lfm}

{ TFormLogin }

procedure TFormLogin.ButtonLoginClick(Sender: TObject);
var
  username: String;
  password: String;
begin
  AppUserID := 0;
  username := EditUsername.Text;
  password := EditPassword.Text;

  if (username = 'admin') and (password = 'admin') then begin
    AppUserID := 1;
    ShowMessage('Selamat Datang');
    Close;
  end else begin
    ShowMessage('Kombinasi username dan password salah');
  end;
end;

end.

