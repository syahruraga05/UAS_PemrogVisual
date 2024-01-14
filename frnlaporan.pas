unit frnLaporan;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LR_Class;

type

  { TForm11 }

  TForm11 = class(TForm)
    Button1: TButton;
    frReport1: TfrReport;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form11: TForm11;

implementation

{$R *.lfm}

{ TForm11 }

procedure TForm11.Button1Click(Sender: TObject);
begin
  begin
    frReport1.LoadFromFile(ExtractFilePath(Application.Exename)+'reporter.lrf');
    frReport1.ShowReport;
  end;
end;

end.

