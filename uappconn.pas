unit uappconn;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

const
  APP_NAME = 'SISTEM INFORMASI SISWA';
  APP_VERSION = '0.1';
  APP_AUTHOR = 'Aan Kurniawan';
  APP_AUTHOR_EMAIL = 'aan.phpy@gmail.com';

type
  TAppUser = record
    UID: Integer;
    Nama: String;
  end;

var
  AppUser: TAppUser;

implementation

end.

