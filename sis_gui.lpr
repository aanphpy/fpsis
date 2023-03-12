program sis_gui;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uformlogin, umainmenu,
  uformsekolah, uformtahunajaran,
  uformsekolahasalguru, uformcalonguru, uformguru,
  uformsekolahasalsiswa, uformwalimurid, uformcalonsiswa, uformsiswa,
  uformruangkelas, uformkelas, uformkelassiswa, udbconn
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormSekolah, FormSekolah);
  Application.CreateForm(TFormSekolahAsalsiswa, FormSekolahAsalsiswa);
  Application.CreateForm(TFormCalonSiswa, FormCalonSiswa);
  Application.CreateForm(TFormWaliMurid, FormWaliMurid);
  Application.CreateForm(TFormSiswa, FormSiswa);
  Application.CreateForm(TFormRuangKelas, FormRuangKelas);
  Application.CreateForm(TFormKelas, FormKelas);
  Application.CreateForm(TFormKelasSiswa, FormKelasSiswa);
  Application.CreateForm(TFormSekolahAsalGuru, FormSekolahAsalGuru);
  Application.CreateForm(TFormCalonGuru, FormCalonGuru);
  Application.CreateForm(TFormGuru, FormGuru);
  Application.Run;
end.

