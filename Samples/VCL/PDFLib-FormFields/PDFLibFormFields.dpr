program PDFLibFormFields;

uses
  VCL.Forms,
  PDFLibFormFields.View in 'Src\PDFLibFormFields.View.pas' {PDFLibFormFieldsView},
  UConsts in 'UConsts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPDFLibFormFieldsView, PDFLibFormFieldsView);
  Application.Run;
end.
