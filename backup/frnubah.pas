unit frnUbah;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, mysql80conn, odbcconn, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    btnSimpan: TButton;
    Button1: TButton;
    edtKategori: TEdit;
    edtNama: TEdit;
    edtHarga: TEdit;
    edtHargaJual: TEdit;
    edtJumlahStok: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnSimpanClick(Sender: TObject);
    procedure edtKategoriChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIDBarang: Integer; // Deklarasikan variabel FIDBarang di bagian private form

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }
procedure TForm3.edtKategoriChange(Sender: TObject);
begin

end;

procedure TForm3.btnSimpanClick(Sender: TObject);
begin
  // memasukan data kedalam basis data
  try
    with SQLQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE data_barang SET kategori_id=:kategori_id, nama=:nama,');
      SQL.Add('harga_beli=:harga_beli, harga_jual=:harga_jual, stok=:stok');
      SQL.Add('WHERE id_barang=:id_barang');
      Params.ParamByName('kategori_id').AsInteger := StrToInt(edtKategori.Text);
      Params.ParamByName('nama').AsString := edtNama.Text;
      Params.ParamByName('harga_beli').AsInteger := StrToInt(edtHarga.Text);
      Params.ParamByName('harga_jual').AsInteger := StrToInt(edtHargaJual.Text);
      Params.ParamByName('stok').AsInteger := StrToInt(edtJumlahStok.Text);
      Params.ParamByName('id_barang').AsInteger := FIDBarang;
      ExecSQL;

      // pesan sukses dan reset input
      ShowMessage('Data Barang Berhasil Diubah');
      edtNama.Text := '';
      edtHarga.Text := '';
      edtHargaJual.Text := '';
      edtJumlahStok.Text := '';
    end;
  except
    on E: Exception do
      ShowMessage('Terjadi Kesalahan: ' + E.Message);
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

end.

