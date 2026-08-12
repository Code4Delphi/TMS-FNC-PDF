program PDFLibBasic;

uses
  Vcl.Forms,
  PDFLibBasic.View in 'Src\PDFLibBasic.View.pas' {PDFLibBasicView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PDFLib - Demo Basic';
  Application.CreateForm(TPDFLibBasicView, PDFLibBasicView);
  Application.Run;
end.
