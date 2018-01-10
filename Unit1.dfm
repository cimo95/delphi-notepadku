object Form1: TForm1
  Left = 296
  Top = 202
  Width = 870
  Height = 450
  Caption = 'Notepadku - Tak berjudul 1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 372
    Width = 854
    Height = 19
    Panels = <
      item
        Text = 'Baris 1, Kolom 1'
        Width = 50
      end>
  end
  object memo1: TRichEdit
    Left = 0
    Top = 0
    Width = 854
    Height = 372
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
    OnChange = memo1Change
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 80
    object Berkas1: TMenuItem
      Caption = 'Berkas'
      object Baru1: TMenuItem
        Caption = 'Baru'
        ShortCut = 16462
        OnClick = Baru1Click
      end
      object Buka1: TMenuItem
        Caption = 'Buka'
        ShortCut = 16463
        OnClick = Buka1Click
      end
      object Simpan1: TMenuItem
        Caption = 'Simpan'
        ShortCut = 16467
        OnClick = Simpan1Click
      end
      object SimpanSebagai1: TMenuItem
        Caption = 'Simpan Sebagai'
        ShortCut = 49235
        OnClick = SimpanSebagai1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Keluar1: TMenuItem
        Caption = 'Keluar'
        ShortCut = 32883
        OnClick = Keluar1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Urungkan1: TMenuItem
        Caption = 'Urungkan'
        ShortCut = 16474
        OnClick = Urungkan1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Potong1: TMenuItem
        Caption = 'Potong'
        ShortCut = 16472
        OnClick = Potong1Click
      end
      object Salin1: TMenuItem
        Caption = 'Salin'
        ShortCut = 16451
        OnClick = Salin1Click
      end
      object empel1: TMenuItem
        Caption = 'Tempel'
        ShortCut = 16470
        OnClick = empel1Click
      end
      object Hapus1: TMenuItem
        Caption = 'Hapus'
        ShortCut = 46
        OnClick = Hapus1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object PilihSemua1: TMenuItem
        Caption = 'Pilih Semua'
        ShortCut = 16449
        OnClick = PilihSemua1Click
      end
    end
    object Format1: TMenuItem
      Caption = 'Format'
      object LipatBaris1: TMenuItem
        Caption = 'Lipat Baris'
        OnClick = LipatBaris1Click
      end
      object Fon1: TMenuItem
        Caption = 'Fon'
        OnClick = Fon1Click
      end
    end
    object Lihat1: TMenuItem
      Caption = 'Lihat'
      object BilahStatus1: TMenuItem
        Caption = 'Bilah Status'
        Checked = True
        OnClick = BilahStatus1Click
      end
    end
    object Bantuan1: TMenuItem
      Caption = 'Bantuan'
      object entangNotepadku1: TMenuItem
        Caption = 'Tentang Notepadku'
        ShortCut = 112
        OnClick = entangNotepadku1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Berkas Teks|*.txt|Berkas Lainnya|*.*'
    Title = 'Buka Berkas'
    Left = 96
    Top = 40
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Berkas Teks|*.txt|Berkas Lainnya|*.*'
    Title = 'Simpan Berkas'
    Left = 128
    Top = 40
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 184
    Top = 40
  end
end
