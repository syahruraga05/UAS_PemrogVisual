unit frnDataCustomer;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, mysql80conn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids;

type

  { TForm10 }

  TForm10 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure SQLConnector1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  Form10: TForm10;

implementation

{$R *.lfm}

{ TForm10 }

procedure TForm10.SQLConnector1AfterConnect(Sender: TObject);
begin

end;

end.

