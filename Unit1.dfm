object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 604
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 115
    Width = 19
    Height = 15
    Caption = 'NIK'
  end
  object Label2: TLabel
    Left = 48
    Top = 160
    Width = 36
    Height = 15
    Caption = 'NAMA'
  end
  object Label3: TLabel
    Left = 48
    Top = 200
    Width = 25
    Height = 15
    Caption = 'TELP'
  end
  object Label4: TLabel
    Left = 48
    Top = 243
    Width = 34
    Height = 15
    Caption = 'EMAIL'
  end
  object Label5: TLabel
    Left = 48
    Top = 280
    Width = 46
    Height = 15
    Caption = 'ALAMAT'
  end
  object Label6: TLabel
    Left = 48
    Top = 315
    Width = 48
    Height = 15
    Caption = 'MEMBER'
  end
  object Label7: TLabel
    Left = 291
    Top = 315
    Width = 50
    Height = 15
    Caption = 'DISKON : '
  end
  object Label8: TLabel
    Left = 347
    Top = 315
    Width = 3
    Height = 15
  end
  object Label9: TLabel
    Left = 90
    Top = 40
    Width = 316
    Height = 49
    Caption = 'FITUR MEMBER'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Montserrat'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 129
    Top = 109
    Width = 318
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 129
    Top = 157
    Width = 318
    Height = 23
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 129
    Top = 194
    Width = 318
    Height = 23
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 129
    Top = 237
    Width = 318
    Height = 23
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 129
    Top = 274
    Width = 318
    Height = 23
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 129
    Top = 312
    Width = 156
    Height = 23
    TabOrder = 5
    Text = 'Pilih--'
    OnChange = ComboBox1Change
    Items.Strings = (
      'IYA'
      'TIDAK')
  end
  object SIMPAN: TButton
    Left = 129
    Top = 368
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    DisabledImageName = 'Button1'
    TabOrder = 6
    OnClick = SIMPANClick
  end
  object EDIT: TButton
    Left = 210
    Top = 368
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 7
    OnClick = EDITClick
  end
  object HAPUS: TButton
    Left = 291
    Top = 368
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 8
    OnClick = HAPUSClick
  end
  object BATAL: TButton
    Left = 372
    Top = 368
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 9
    OnClick = BATALClick
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 416
    Width = 399
    Height = 120
    DataSource = DataSource1
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object BARU: TButton
    Left = 48
    Top = 368
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 11
    OnClick = BARUClick
  end
  object CETAK: TButton
    Left = 250
    Top = 552
    Width = 75
    Height = 25
    Caption = 'CETAK'
    DisabledImageName = 'Button1'
    TabOrder = 12
    OnClick = CETAKClick
  end
  object LAPORAN: TButton
    Left = 161
    Top = 552
    Width = 75
    Height = 25
    Caption = 'LAPORAN'
    TabOrder = 13
    OnClick = LAPORANClick
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3308
    Database = 'penjualan'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\Mutiara\Documents\UAS\libmysql.dll'
    Left = 160
    Top = 8
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'Select * from kustomer')
    Params = <>
    Left = 232
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 296
    Top = 8
  end
end
