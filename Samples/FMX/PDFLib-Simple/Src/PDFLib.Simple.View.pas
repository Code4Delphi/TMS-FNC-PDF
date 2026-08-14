unit PDFLib.Simple.View;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.TMSFNCPDFLib;

type
  TPDFLibSimpleView = class(TForm)
    btnGeneratePDF: TButton;
    btnGenerateWithImage: TButton;
    procedure btnGeneratePDFClick(Sender: TObject);
    procedure btnGenerateWithImageClick(Sender: TObject);
  private

  public

  end;

var
  PDFLibSimpleView: TPDFLibSimpleView;

implementation

{$R *.fmx}

procedure TPDFLibSimpleView.btnGeneratePDFClick(Sender: TObject);
var
  LPDF: TTMSFNCPDFLib;
  LHeaderRect: TRectF;
begin
  LPDF := TTMSFNCPDFLib.Create;
  try
    LPDF.BeginDocument('PDF criado pelo Delphi.pdf');
    LPDF.Header := 'Criando PDF com Delphi';
    LPDF.Footer := 'Page 1/1';
    LPDF.NewPage;

    LHeaderRect := LPDF.GetHeaderRect;
    LPDF.Graphics.DrawText('Texto no corpo do arquivo PDF criado pelo Delphi', PointF(LHeaderRect.Left, LHeaderRect.Bottom + 20));

    LPDF.Graphics.DrawImageFromFile('C:\Code4D\Cursos\TMS\TMS-FNC-PDF\Samples\FMX\PDFLib-Simple\Bin\Win32\Debug\c4d_logo.png', RectF(LHeaderRect.Left, LHeaderRect.Bottom + 40, LHeaderRect.Left + 200, LHeaderRect.Bottom + 120));

    LPDF.EndDocument(True);
  finally
    LPDF.Free;
  end;
end;

procedure TPDFLibSimpleView.btnGenerateWithImageClick(Sender: TObject);
var
  LPDF: TTMSFNCPDFLib;
  LHeaderRect: TRectF;
  LExecutablePath: string;
  LImagePath: string;
begin
  LExecutablePath := ExtractFilePath(ParamStr(0));
  LImagePath := LExecutablePath + 'c4d_logo.png';

  LPDF := TTMSFNCPDFLib.Create;
  try
    LPDF.BeginDocument(LExecutablePath + 'PDF com imagem criado pelo Delphi.pdf');
    LPDF.Header := 'Criando PDF com Delphi';
    LPDF.Footer := 'Page 1/1';
    LPDF.NewPage;

    LHeaderRect := LPDF.GetHeaderRect;
    LPDF.Graphics.DrawImageFromFile(LImagePath, RectF(LHeaderRect.Left, LHeaderRect.Bottom + 20, LHeaderRect.Left + 200, LHeaderRect.Bottom + 120));
    LPDF.Graphics.DrawText('Texto de teste TMS FNC PDF', PointF(LHeaderRect.Left, LHeaderRect.Bottom + 140));

    LPDF.EndDocument(True);
  finally
    LPDF.Free;
  end;
end;

end.
