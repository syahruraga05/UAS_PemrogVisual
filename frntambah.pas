unit frnTambah;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, mysql80conn, odbcconn, DB, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    btnSimpan: TButton;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
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
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnSimpanClick(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.btnSimpanClick(Sender: TObject);
begin
  try
    // Memasukkan data ke dalam basis data
    with SQLQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO data_barang (nama, kategori_id, harga_beli, harga_jual, stok)');
      SQL.Add('VALUES (:nama, :kategori_id, :harga_beli, :harga_jual, :stok)');
      Params.ParamByName('nama').AsString := edtNama.Text;
      Params.ParamByName('kategori_id').AsInteger := DBLookupComboBox1.KeyValue;
      Params.ParamByName('harga_beli').AsInteger := StrToInt(edtHarga.Text);
      Params.ParamByName('harga_jual').AsInteger := StrToInt(edtHargaJual.Text);
      Params.ParamByName('stok').AsInteger := StrToInt(edtJumlahStok.Text);
      ExecSQL;
      SQLTransaction1.Commit;

      // Pesan sukses dan reset input
      ShowMessage('Data barang berhasil ditambahkan. ');
      edtNama.Text := '';
      edtHarga.Text := '';
      edtHargaJual.Text := '';
      edtJumlahStok.Text := '';
    end;
  except
    on E: Exception do
      ShowMessage('Terjadi kesalahan: ' + E.Message);
  end;
end;



end.

