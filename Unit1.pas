unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    SIMPAN: TButton;
    EDIT: TButton;
    HAPUS: TButton;
    BATAL: TButton;
    DBGrid1: TDBGrid;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    BARU: TButton;
    Label9: TLabel;
    CETAK: TButton;
    LAPORAN: TButton;
    procedure SIMPANClick(Sender: TObject);
    procedure EDITClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BATALClick(Sender: TObject);
    procedure HAPUSClick(Sender: TObject);
    procedure BARUClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HitungDiskon;
    procedure LAPORANClick(Sender: TObject);
    procedure CETAKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: Integer;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.BARUClick(Sender: TObject);
begin
  Edit1.Enabled := True;
  Edit2.Enabled := True;
  Edit3.Enabled := True;
  Edit4.Enabled := True;
  Edit5.Enabled := True;
  ComboBox1.Enabled := True;
  SIMPAN.Enabled := True;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  ComboBox1.ItemIndex := -1;
  Label8.Caption := '';
  ShowMessage('Silahkan masukkan data baru.');
end;


procedure TForm1.BATALClick(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  ComboBox1.ItemIndex := -1;
  Label8.Caption := '';
  ShowMessage('Inputan berhasil dibersihkan');
end;

procedure TForm1.CETAKClick(Sender: TObject);
begin
Form2.QuickRep1.Print;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
HitungDiskon;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  a := ZQuery1.FieldByName('id').AsInteger;
  Edit1.Text := ZQuery1.FieldByName('nik').AsString;
  Edit2.Text := ZQuery1.FieldByName('nama').AsString;
  Edit3.Text := ZQuery1.FieldByName('telp').AsString;
  Edit4.Text := ZQuery1.FieldByName('email').AsString;
  Edit5.Text := ZQuery1.FieldByName('alamat').AsString;
  ComboBox1.Text := ZQuery1.FieldByName('member').AsString;
  HitungDiskon;
end;

procedure TForm1.EDITClick(Sender: TObject);
begin
  with ZQuery1 do
  begin
    SQL.Clear;
    SQL.Add('UPDATE kustomer SET nik = "' + Edit1.Text + '",');
    SQL.Add('nama = "' + Edit2.Text + '",');
    SQL.Add('telp = "' + Edit3.Text + '",');
    SQL.Add('email = "' + Edit4.Text + '",');
    SQL.Add('alamat = "' + Edit5.Text + '",');
    SQL.Add('member = "' + ComboBox1.Text + '"');
    SQL.Add('WHERE id = ' + IntToStr(a));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM kustomer');
    Open;

    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
    ComboBox1.ItemIndex := -1;
  end;

  ShowMessage('Data Berhasil Diedit');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  BARU.Enabled := True;
  SIMPAN.Enabled := False;
  EDIT.Enabled := False;
  HAPUS.Enabled := False;
  Edit1.Enabled := False;
  Edit2.Enabled := False;
  Edit3.Enabled := False;
  Edit4.Enabled := False;
  Edit5.Enabled := False;
  ComboBox1.Enabled := False;
end;

procedure TForm1.HAPUSClick(Sender: TObject);
begin
  with ZQuery1 do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM kustomer WHERE id = ' + IntToStr(a));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM kustomer');
    Open;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
    ComboBox1.ItemIndex := -1;
  end;

  ShowMessage('Data Berhasil Dihapus');
end;

procedure TForm1.SIMPANClick(Sender: TObject);
begin
  begin
  with ZQuery1 do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO kustomer (nik, nama, telp, email, alamat, member) VALUES ('''
      + Edit1.Text + ''', '''
      + Edit2.Text + ''', '''
      + Edit3.Text + ''', '''
      + Edit4.Text + ''', '''
      + Edit5.Text + ''', '''
      + ComboBox1.Text + ''')');
      Label8.Caption := '';
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM kustomer');
    Open;

    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
    ComboBox1.ItemIndex := -1;

  end;
  ShowMessage('Data Berhasil Disimpan');

  EDIT.Enabled := True;
  HAPUS.Enabled := True;
end;
end;
procedure TForm1.HitungDiskon;
begin
  if ComboBox1.Text = 'IYA' then
    Label8.Caption := '10%'
  else if ComboBox1.Text = 'TIDAK' then
    Label8.Caption := '5%'
  else
    Label8.Caption := '';
end;


procedure TForm1.LAPORANClick(Sender: TObject);
begin
Form2.QuickRep1.Preview;
end;

end.

