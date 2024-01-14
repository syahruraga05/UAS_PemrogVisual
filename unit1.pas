unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, mysql80conn, odbcconn, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids, DBCtrls, frnTambah, frnUbah;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnTambah: TButton;
    btnUbah: TButton;
    btnHapus: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnHapusClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    FIDBarang: Integer;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnTambahClick(Sender: TObject);
begin
  // Membuat objek Form2
  with TForm2.Create(Application) do
  begin
    try
      // Menampilkan form data barang
      ShowModal;
    finally
      Free; // Membebaskan memori objek Form1 setelah selesai digunakan
    end;
  end;
end;


procedure TForm1.btnHapusClick(Sender: TObject);
begin
  // menghapus data dari basis data
  try
    with SQLQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DELETE FROM data_barang WHERE id_barang=:id_barang');
      Params.ParamByName('id_barang').AsInteger := FIDBarang;
      ExecSQL;

      // pesan sukses dan reset input
      ShowMessage('Data Barang Berhasil Dihapus');
    end;
  except
    on E: Exception do
      ShowMessage('Terjadi Kesalahan: ' + E.Message);
  end;
end;



procedure TForm1.btnUbahClick(Sender: TObject);
begin
  // Membuat objek Form3
  with TForm3.Create(Application) do
  begin
    try
      // Menampilkan form data barang
      ShowModal;
    finally
      Free; // Membebaskan memori objek Form1 setelah selesai digunakan
    end;
  end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin

end;

end.

