program PDFLibSimple;

uses
  System.StartUpCopy,
  FMX.Forms,
  PDFLib.Simple.View in 'Src\PDFLib.Simple.View.pas' {PDFLibSimpleView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPDFLibSimpleView, PDFLibSimpleView);
  Application.Run;
end.
