Unit Unit1;

Interface

Uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 Dialogs, ShellAPI, FileCtrl, XPMan, ComCtrls, StdCtrls, Menus, RichEdit, inifiles;

Type
 TForm1 = Class(TForm)
  MainMenu1: TMainMenu;
  Berkas1: TMenuItem;
  Baru1: TMenuItem;
  Buka1: TMenuItem;
  Simpan1: TMenuItem;
  SimpanSebagai1: TMenuItem;
  N1: TMenuItem;
  Keluar1: TMenuItem;
  Edit1: TMenuItem;
  Urungkan1: TMenuItem;
  N2: TMenuItem;
  Potong1: TMenuItem;
  Salin1: TMenuItem;
  empel1: TMenuItem;
  Hapus1: TMenuItem;
  N3: TMenuItem;
  PilihSemua1: TMenuItem;
  Format1: TMenuItem;
  LipatBaris1: TMenuItem;
  Fon1: TMenuItem;
  Lihat1: TMenuItem;
  BilahStatus1: TMenuItem;
  Bantuan1: TMenuItem;
  entangNotepadku1: TMenuItem;
  StatusBar1: TStatusBar;
  OpenDialog1: TOpenDialog;
  SaveDialog1: TSaveDialog;
  memo1: TRichEdit;
  FontDialog1: TFontDialog;
  Procedure FormCreate(Sender: TObject);
  Procedure memo1Change(Sender: TObject);
  Procedure Baru1Click(Sender: TObject);
  Procedure Buka1Click(Sender: TObject);
  Procedure Simpan1Click(Sender: TObject);
  Procedure SimpanSebagai1Click(Sender: TObject);
  Procedure Keluar1Click(Sender: TObject);
  Procedure entangNotepadku1Click(Sender: TObject);
  Procedure BilahStatus1Click(Sender: TObject);
  Procedure LipatBaris1Click(Sender: TObject);
  Procedure Fon1Click(Sender: TObject);
  Procedure Urungkan1Click(Sender: TObject);
  Procedure Potong1Click(Sender: TObject);
  Procedure Salin1Click(Sender: TObject);
  Procedure empel1Click(Sender: TObject);
  Procedure Hapus1Click(Sender: TObject);
  Procedure PilihSemua1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
 Private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }
 Public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
  iBaru: integer;
  bSimpan, bStatus: Boolean;
  sBerkas, sPathAkhir: String;
 End;

Var
 Form1: TForm1;

Implementation

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

Procedure pKillBS(kill: Boolean);
Begin
 With Form1 Do
 Begin
  BilahStatus1.Enabled := Not kill;
  If kill Then
  Begin
   bStatus := StatusBar1.Visible;
   StatusBar1.Hide;
  End
  Else
   StatusBar1.Visible := bStatus;
 End;
End;

Procedure pBacaKonfig;
var tif:tinifile;
begin
with Form1 do
begin
  if not FileExists(ChangeFileExt(Application.ExeName,'.itu')) then Exit
  else
  begin
    tif := tinifile.Create(ChangeFileExt(Application.ExeName,'.itu'));
    fontdialog1.Font.Name := tif.ReadString('konfigurasi','nama','Courier New');
    FontDialog1.Font.Size := tif.ReadInteger('konfigurasi','ukuran',8);
    FontDialog1.Font.Color := tif.ReadInteger('konfigurasi','warna',clBlack);
    if tif.ReadBool('konfigurasi','mtebal',true) then
    FontDialog1.Font.Style := FontDialog1.Font.Style+[fsBold];
    if tif.ReadBool('konfigurasi','mmiring',true) then
    FontDialog1.Font.Style := FontDialog1.Font.Style+[fsitalic];
    if tif.ReadBool('konfigurasi','mgb',true) then
    FontDialog1.Font.Style := FontDialog1.Font.Style+[fsUnderline];
    if tif.ReadBool('konfigurasi','mgc',true) then
    FontDialog1.Font.Style := FontDialog1.Font.Style+[fsStrikeOut];
    memo1.Font := FontDialog1.Font;
    if DirectoryExists(tif.ReadString('konfigurasi','terakhir','')) then
    spathAkhir := tif.ReadString('konfigurasi','terakhir','');
    tif.Free;
  end;
end;
end;

Procedure pTulisKonfig;
var tif:tinifile;
begin
with Form1 do
begin
  tif := tinifile.Create(ChangeFileExt(Application.ExeName,'.itu'));
  tif.WriteString('konfigurasi','nama',FontDialog1.Font.Name);
  tif.WriteInteger('konfigurasi','ukuran',FontDialog1.Font.Size);
  tif.WriteInteger('konfigurasi','warna',FontDialog1.Font.Color);
  tif.WriteBool('konfigurasi','mtebal',(fontdialog1.Font.Style = [fsBold]));
  tif.WriteBool('konfigurasi','mmiring',(fontdialog1.Font.Style = [fsItalic]));
  tif.WriteBool('konfigurasi','mgb',(fontdialog1.Font.Style = [fsUnderline]));
  tif.WriteBool('konfigurasi','mgc',(fontdialog1.Font.Style = [fsStrikeOut]));
  tif.WriteString('konfigurasi','terakhir',sPathAkhir);
  tif.Free;
end;
end;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
 bSimpan := True;
 bStatus := True;
 sBerkas := '';
 If iBaru <= 0 Then
  iBaru := 1
 Else
  Inc(iBaru, 1);
 Caption := 'Notepadku - Tak Berjudul ' + inttostr(iBaru);
 memo1.Clear;
 pBacaKonfig;
End;

Procedure TForm1.memo1Change(Sender: TObject);
Begin
 bSimpan := false;
 StatusBar1.Panels.Items[0].Text := 'Baris ' + inttostr(SendMessage(memo1.Handle, EM_EXLINEFROMCHAR, 0, memo1.SelStart + memo1.SelLength) + 1) + ', Kolom ' + inttostr(memo1.SelStart + memo1.SelLength - SendMessage(memo1.Handle, EM_LINEINDEX, -1, 0) + 1);
End;

Procedure TForm1.Baru1Click(Sender: TObject);
Begin
 If Not bSimpan Then
 Begin
  If MessageBox(Handle, 'Perubahan terakhir belum tersimpan, apakah anda ingin melanjutkan membuat berkas baru ?', 'Baru', 32 + 4) = mrno Then
   Exit
  Else
   FormCreate(Sender);
 End
 Else
  FormCreate(Sender);
End;

Procedure TForm1.Buka1Click(Sender: TObject);
Begin
 If Not OpenDialog1.Execute Then
  Exit
 Else
 Begin
  memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  Caption := 'Notepadku - ' + ExtractFileName(OpenDialog1.FileName);
  bSimpan := True;
  sBerkas := OpenDialog1.FileName;
  sPathAkhir := ExtractFilePath(opendialog1.FileName);
 End;
End;

Procedure TForm1.Simpan1Click(Sender: TObject);
Begin
 If FileExists(sBerkas) Then
 Begin
  memo1.Lines.SaveToFile(sBerkas);
  bSimpan := True;
 End
 Else
  SimpanSebagai1.Click;
End;

Procedure TForm1.SimpanSebagai1Click(Sender: TObject);
Begin
 If Not SaveDialog1.Execute Then
  Exit
 Else
 Begin
  If SaveDialog1.FilterIndex = 1 Then
   memo1.Lines.SaveToFile(ChangeFileExt(SaveDialog1.FileName, '.txt'))
  Else
   memo1.Lines.SaveToFile(SaveDialog1.FileName);
  bSimpan := True;
 End;
End;

Procedure TForm1.Keluar1Click(Sender: TObject);
Begin
 If bSimpan Then
  Application.Terminate
 Else
 Begin
  If MessageBox(handle, 'Perubahan terakhir belum disimpan, apakah anda ingin keluar dari aplikasi ?', 'Keluar', 32 + 4) = mrNo Then
   Exit
  Else
   Application.Terminate;
 End;
End;

Procedure TForm1.entangNotepadku1Click(Sender: TObject);
Begin
 MessageBox(Handle, PChar('NotepadKu 1.0'#13'versi 1.0'#13#13'Aplikasi ini berdasarkan aplikasi Notepad dari Microsoft Windows.'#13 + 'Dibuat ulang dengan menggunakan Delphi 7 dengan tujuan anda dapat mengembangkan versi Notepad anda sendiri.'#13#13#13 + 'Hak Cipta © 2016 - ' + formatdatetime('YYYY', Now) + ' Cimosoft Codelicious by Arachmadi Putra'), 'Tentang Notepadku', 64);
End;

Procedure TForm1.BilahStatus1Click(Sender: TObject);
Begin
 BilahStatus1.Checked := Not BilahStatus1.Checked;
 StatusBar1.Visible := BilahStatus1.Checked;
End;

Procedure TForm1.LipatBaris1Click(Sender: TObject);
Begin
 LipatBaris1.Checked := Not LipatBaris1.Checked;
 pKillBS(LipatBaris1.Checked);
End;

Procedure TForm1.Fon1Click(Sender: TObject);
Begin
 FontDialog1.Font := memo1.Font;
 If Not FontDialog1.Execute Then
  Exit
 Else
  memo1.Font := FontDialog1.Font;
End;

Procedure TForm1.Urungkan1Click(Sender: TObject);
Begin
 memo1.Undo;
End;

Procedure TForm1.Potong1Click(Sender: TObject);
Begin
 If memo1.SelLength < 1 Then
  MessageBox(Handle, 'mohon pilih teks yang ingin anda potong', 'Potong', 16)
 Else
  memo1.CutToClipboard;
End;

Procedure TForm1.Salin1Click(Sender: TObject);
Begin
 If memo1.SelLength < 1 Then
  MessageBox(Handle, 'mohon pilih teks yang ingin anda salin', 'Salin', 16)
 Else
  memo1.CopyToClipboard;
End;

Procedure TForm1.empel1Click(Sender: TObject);
Begin
 memo1.PasteFromClipboard;
End;

Procedure TForm1.Hapus1Click(Sender: TObject);
Begin
 If memo1.SelLength < 1 Then
  MessageBox(Handle, 'mohon pilih teks yang ingin anda hapus', 'Hapus', 16)
 Else
  memo1.SelText := '';
End;

Procedure TForm1.PilihSemua1Click(Sender: TObject);
Begin
 memo1.SelectAll;
End;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
pTulisKonfig;
end;

End.

