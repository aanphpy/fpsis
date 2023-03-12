unit umainmenu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  uformlogin,
  uformsekolah, uformtahunajaran,
  uformsekolahasalguru, uformcalonguru, uformguru,
  uformsekolahasalsiswa, uformwalimurid, uformcalonsiswa, uformsiswa,
  uformruangkelas, uformkelas, uformkelassiswa;

type

  { TFormMenu }

  TFormMenu = class(TForm)
    MainMenu: TMainMenu;
    MenuLogin: TMenuItem;
    Separator3: TMenuItem;
    MenuSekolah: TMenuItem;
    MenuWaliMurid: TMenuItem;
    MenuSiswaSiswa: TMenuItem;
    MenuKelas: TMenuItem;
    MenuRuangKelas: TMenuItem;
    MenuKelasKelas: TMenuItem;
    MenuKelasSiswa: TMenuItem;
    MenuCalonSiswa: TMenuItem;
    MenuApp: TMenuItem;
    MenuKeluar: TMenuItem;
    Separator2: TMenuItem;
    Separator1: TMenuItem;
    MenuSekolahSekolah: TMenuItem;
    MenuTahunAjaran: TMenuItem;
    MenuGuru: TMenuItem;
    MenuSekolahAsal: TMenuItem;
    MenuCalonGuru: TMenuItem;
    MenuGuruGuru: TMenuItem;
    MenuSiswa: TMenuItem;
    MenuSiswaSekolahAsal: TMenuItem;
    AFormLogin: TFormLogin;
    AFormSekolah: TFormSekolah;
    AFormTahunAjaran: TFormTahunAjaran;
    AFormSekolahAsalGuru: TFormSekolahAsalGuru;
    AFormCalonGuru: TFormCalonGuru;
    AFormGuru: TFormGuru;
    AFormSekolahAsalSiswa: TFormSekolahAsalSiswa;
    AFormWaliMurid: TFormWaliMurid;
    AFormCalonSiswa: TFormCalonSiswa;
    AFormSiswa: TFormSiswa;
    AFormRuangKelas: TFormRuangKelas;
    AFormKelas: TFormKelas;
    AFormKelasSiswa: TFormKelasSiswa;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuCalonGuruClick(Sender: TObject);
    procedure MenuCalonSiswaClick(Sender: TObject);
    procedure MenuGuruGuruClick(Sender: TObject);
    procedure MenuKelasKelasClick(Sender: TObject);
    procedure MenuKelasSiswaClick(Sender: TObject);
    procedure MenuKeluarClick(Sender: TObject);
    procedure DisableMenus;
    procedure EnableMenus;
    procedure MenuLoginClick(Sender: TObject);
    procedure MenuRuangKelasClick(Sender: TObject);
    procedure MenuSekolahAsalClick(Sender: TObject);
    procedure MenuSekolahSekolahClick(Sender: TObject);
    procedure MenuSiswaSekolahAsalClick(Sender: TObject);
    procedure MenuSiswaSiswaClick(Sender: TObject);
    procedure MenuTahunAjaranClick(Sender: TObject);
    procedure MenuWaliMuridClick(Sender: TObject);
    procedure OnFormLoginClosed(Sender: TObject; var CloseAction: TCloseAction);
    procedure ShowFormLogin;
  private

  public

  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.lfm}

{ TFormMenu }


procedure TFormMenu.DisableMenus;
begin
  MenuSekolah.Visible := False;
  MenuGuru.Visible := False;
  MenuSiswa.Visible := False;
  MenuKelas.Visible := False;
end;

procedure TFormMenu.EnableMenus;
begin
  MenuSekolah.Visible := True;
  MenuGuru.Visible := True;
  MenuSiswa.Visible := True;
  MenuKelas.Visible := True;
end;

procedure TFormMenu.MenuLoginClick(Sender: TObject);
begin
  DisableMenus;
  AppUserID := 0;
  ShowFormLogin;
end;

procedure TFormMenu.MenuRuangKelasClick(Sender: TObject);
begin
  AFormRuangKelas := TFormRuangKelas.Create(Self);
  AFormRuangKelas.Show;
end;

procedure TFormMenu.MenuSekolahAsalClick(Sender: TObject);
begin
  AFormSekolahAsalGuru := TFormSekolahAsalGuru.Create(Self);
  AFormSekolahAsalGuru.Show;
end;

procedure TFormMenu.MenuSekolahSekolahClick(Sender: TObject);
begin
  AFormSekolah := TFormSekolah.Create(Self);
  AFormSekolah.Show;
end;

procedure TFormMenu.MenuSiswaSekolahAsalClick(Sender: TObject);
begin
  AFormSekolahAsalSiswa := TFormSekolahAsalSiswa.Create(Self);
  AFormSekolahAsalSiswa.Show;
end;

procedure TFormMenu.MenuSiswaSiswaClick(Sender: TObject);
begin
  AFormSiswa := TFormSiswa.Create(Self);
  AFormSiswa.Show;
end;

procedure TFormMenu.MenuTahunAjaranClick(Sender: TObject);
begin
  AFormTahunAjaran := TFormTahunAjaran.Create(Self);
  AFormTahunAjaran.Show;
end;

procedure TFormMenu.MenuWaliMuridClick(Sender: TObject);
begin
  AFormWaliMurid := TFormWaliMurid.Create(Self);
  AFormWaliMurid.Show;
end;

procedure TFormMenu.MenuKeluarClick(Sender: TObject);
begin
  Halt;
end;

procedure TFormMenu.FormShow(Sender: TObject);
begin
  DisableMenus;
  ShowFormLogin;
end;

procedure TFormMenu.MenuCalonGuruClick(Sender: TObject);
begin
  AFormCalonGuru := TFormCalonGuru.Create(Self);
  AFormCalonGuru.Show;
end;

procedure TFormMenu.MenuCalonSiswaClick(Sender: TObject);
begin
  AFormCalonSiswa := TFormCalonSiswa.Create(Self);
  AFormCalonSiswa.Show;
end;

procedure TFormMenu.MenuGuruGuruClick(Sender: TObject);
begin
  AFormGuru := TFormGuru.Create(Self);
  AFormGuru.Show;
end;

procedure TFormMenu.MenuKelasKelasClick(Sender: TObject);
begin
  AFormKelas := TFormKelas.Create(Self);
  AFormKelas.Show;
end;

procedure TFormMenu.MenuKelasSiswaClick(Sender: TObject);
begin
  AFormKelasSiswa := TFormKelasSiswa.Create(Self);
  AFormKelasSiswa.Show;
end;

procedure TFormMenu.FormCreate(Sender: TObject);
begin

end;

procedure TFormMenu.OnFormLoginClosed(Sender: TObject; var CloseAction: TCloseAction);
begin
  if AppUserID > 0 then begin
    EnableMenus;
  end;
end;

procedure TFormMenu.ShowFormLogin;
begin
  AFormLogin := TFormLogin.Create(Self);
  try
    AFormLogin.OnClose := @OnFormLoginClosed;
    AFormLogin.ShowModal;
  finally
    AFormLogin.Free;
  end;
end;

end.

