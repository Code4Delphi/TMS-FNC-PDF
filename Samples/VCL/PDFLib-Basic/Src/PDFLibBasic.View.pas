unit PDFLibBasic.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.Controls,
  Types,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCBitmapContainer,
  VCL.TMSFNCPDFLib,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCPDFCoreLibBase;

type
  TPDFLibBasicView = class(TForm)
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    btnExportPDF: TButton;
    procedure btnExportPDFClick(Sender: TObject);
  private

  public

  end;

var
  PDFLibBasicView: TPDFLibBasicView;

implementation

{$R *.dfm}

procedure TPDFLibBasicView.btnExportPDFClick(Sender: TObject);
var
  LPDF: TTMSFNCPDFLib;
  LText: string;
  LHTMLTextRect: TRectF;
  LHeaderRect: TRectF;
  LLastTextRect: TRectF;
  LTextLines: TStringList;
  LBasePath: string;
begin
  LBasePath := '';
  LPDF := TTMSFNCPDFLib.Create;
  try
    LText := 'Lorem Ipsum is simply <b>dummy</b> text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy'
      + 'text ever since the 1500s, when an <i><font color="gcOrange">unknown printer took a galley</font></i> of type and scrambled it to make a type specimen book. '
      + 'It has survived not only five <font size="12" color="gcRed">centuries</font>, but also the <sup>leap</sup> <sub>into</sub> <u>electronic</u> typeset'
      + 'ting,<br/><img src="TMSLogo.ico"/><br/>remaining essentially <font color"gcYellow" face="Comic Sans MS" bgcolor="gcBlue"><s>unchanged</s></font>. It'
      + ' was popularised in the 1960s with the <font size="8"><a href="http://www.tmssoftware.com">release</a></font> of Letraset sheets containing Lorem Ipsum passages, and more recently with des'
      + 'ktop publishing software like <font bgcolor="gcSteelBlue" color="gcWhite">Aldus PageMaker</font> including versions of Lorem Ipsum.';

    LPDF.BitmapContainer := TMSFNCBitmapContainer1;
    LPDF.BeginDocument(LBasePath + 'TMS PDF Library.pdf');
    LPDF.Header := 'TMS PDF Library';
    LPDF.Footer := 'Page 1/1';
    LPDF.NewPage;
    LHeaderRect := LPDF.GetHeaderRect;

    LPDF.Graphics.Font.SizeNoScale := 12;
    LPDF.Graphics.Font.Color := gcSteelblue;
    LPDF.Graphics.Font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
    LLastTextRect := LPDF.Graphics.DrawText('Drawing primitives', PointF(LHeaderRect.Left, LHeaderRect.Bottom + 10));

    LPDF.Graphics.Fill.Color := gcOrange;
    LPDF.Graphics.Stroke.Color := gcSteelblue;
    LPDF.Graphics.DrawRectangle(RectF(LHeaderRect.Left + 10, LLastTextRect.Bottom + 10, LHeaderRect.Left + 50, LLastTextRect.Bottom + 50));

    LPDF.Graphics.Fill.Color := gcLightseagreen;
    LPDF.Graphics.Fill.ColorTo := gcGreenyellow;
    LPDF.Graphics.Stroke.Color := gcBlack;
    LPDF.Graphics.Fill.Kind := gfkGradient;
    LPDF.Graphics.DrawEllipse(RectF(LHeaderRect.Left + 75, LLastTextRect.Bottom + 10, LHeaderRect.Left + 150, LLastTextRect.Bottom + 50));

    LPDF.Graphics.Stroke.Color := gcDarkmagenta;
    LPDF.Graphics.Stroke.Kind := gskSolid;
    LPDF.Graphics.DrawLine(PointF(LHeaderRect.Left + 180, LLastTextRect.Bottom + 10), PointF(LHeaderRect.Left + 250, LLastTextRect.Bottom + 10));
    LPDF.Graphics.Stroke.Kind := gskDash;
    LPDF.Graphics.DrawLine(PointF(LHeaderRect.Left + 180, LLastTextRect.Bottom + 20), PointF(LHeaderRect.Left + 250, LLastTextRect.Bottom + 20));
    LPDF.Graphics.Stroke.Kind := gskDot;
    LPDF.Graphics.DrawLine(PointF(LHeaderRect.Left + 180, LLastTextRect.Bottom + 30), PointF(LHeaderRect.Left + 250, LLastTextRect.Bottom + 30));
    LPDF.Graphics.Stroke.Kind := gskDashDot;
    LPDF.Graphics.DrawLine(PointF(LHeaderRect.Left + 180, LLastTextRect.Bottom + 40), PointF(LHeaderRect.Left + 250, LLastTextRect.Bottom + 40));
    LPDF.Graphics.Stroke.Kind := gskDashDotDot;
    LPDF.Graphics.DrawLine(PointF(LHeaderRect.Left + 180, LLastTextRect.Bottom + 50), PointF(LHeaderRect.Left + 250, LLastTextRect.Bottom + 50));

    LPDF.Graphics.Stroke.Color := gcDarkseagreen;
    LPDF.Graphics.Stroke.Width := 3;
    LPDF.Graphics.Stroke.Kind := gskSolid;
    LPDF.Graphics.DrawPathBegin;
    LPDF.Graphics.DrawPathMoveToPoint(PointF(350, LLastTextRect.Bottom - 10));
    LPDF.Graphics.DrawPathAddCurveToPoint(PointF(310, 130), PointF(445, 50), PointF(398, LLastTextRect.Bottom + 65));
    LPDF.Graphics.DrawPathEnd(dmPathStroke);

    LPDF.Graphics.Stroke.Width := 0.5;
    LPDF.Graphics.Stroke.Color := gcBlack;
    LPDF.Graphics.Fill.Color := gcNull;
    LPDF.Graphics.Fill.Kind := gfkSolid;
    LPDF.Graphics.DrawLine(PointF(350, LLastTextRect.Bottom - 10), PointF(310, 130));
    LPDF.Graphics.DrawLine(PointF(445, 50), PointF(398, LLastTextRect.Bottom + 65));

    LPDF.Graphics.DrawRectangle(RectF(442.5, 47.5, 447.5, 52.5));
    LPDF.Graphics.DrawRectangle(RectF(395.5, LLastTextRect.Bottom + 62.5, 400.5, LLastTextRect.Bottom + 67.5));
    LPDF.Graphics.DrawRectangle(RectF(347.5, LLastTextRect.Bottom - 12.5, 352.5, LLastTextRect.Bottom - 7.5));
    LPDF.Graphics.DrawRectangle(RectF(307.5, 127.5, 312.5, 132.5));

    LPDF.Graphics.Font.SizeNoScale := 12;
    LPDF.Graphics.Font.Color := gcSteelblue;
    LPDF.Graphics.Font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
    LLastTextRect := LPDF.Graphics.DrawText('HTML formatted text support', PointF(LHeaderRect.Left, LLastTextRect.Bottom + 75));
    LPDF.Graphics.Font.SizeNoScale := 10;
    LHeaderRect.Top := LHeaderRect.Top + 40;
    LHeaderRect.Bottom := LHeaderRect.Bottom + 40;
    LHTMLTextRect := RectF(LHeaderRect.Left + 10, LLastTextRect.Bottom + 10, LHeaderRect.Right, 300);
    LLastTextRect := LPDF.Graphics.DrawHTMLText(LText, LHTMLTextRect);

    LPDF.Graphics.Font.SizeNoScale := 12;
    LPDF.Graphics.Font.Color := gcSteelblue;
    LPDF.Graphics.Font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
    LLastTextRect := LPDF.Graphics.DrawText('Text flow in multiple columns', PointF(LHeaderRect.Left, LLastTextRect.Bottom + 10));

    LTextLines := TStringList.Create;
    try
      LTextLines.LoadFromFile(LBasePath + 'test2.txt');
      LPDF.Graphics.Font.SizeNoScale := 10;
      LPDF.Graphics.Font.Color := gcBlack;
      LPDF.Graphics.Font.Style := [];
      LPDF.Graphics.DrawText(LTextLines.Text, RectF(LHeaderRect.Left + 10, LLastTextRect.Bottom + 10, LHeaderRect.Right, LLastTextRect.Bottom + 150), 3);
    finally
      LTextLines.Free;
    end;

    LPDF.Graphics.Font.SizeNoScale := 12;
    LPDF.Graphics.Font.Color := gcSteelblue;
    LPDF.Graphics.Font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
    LLastTextRect := LPDF.Graphics.DrawText('Image drawing and quality', PointF(LHeaderRect.Left, LLastTextRect.Bottom + 150));

    LPDF.Graphics.DrawImageFromFile(LBasePath + 'Sample.jpg', RectF(LHeaderRect.Left + 10, LLastTextRect.Bottom + 10, LHeaderRect.Left + 110, LLastTextRect.Bottom + 110));
    LPDF.Graphics.DrawImageFromFile(LBasePath + 'Sample.jpg', RectF(LHeaderRect.Left + 120, LLastTextRect.Bottom + 10, LHeaderRect.Left + 220, LLastTextRect.Bottom + 110), True, True, itJPG, 0.1);

    LPDF.Graphics.DrawImageFromFile(LBasePath + 'Sample2.jpg', PointF(LHeaderRect.Left + 240, LLastTextRect.Bottom + 10));
    LPDF.Graphics.DrawImageFromFile(LBasePath + 'Sample2.jpg', RectF(LHeaderRect.Left + 420, LLastTextRect.Bottom + 10, LHeaderRect.Left + 520, LLastTextRect.Bottom + 110), True, True, itJPG, 0.1);
//
    LPDF.Graphics.Font.SizeNoScale := 12;
    LPDF.Graphics.Font.Color := gcSteelblue;
    LPDF.Graphics.Font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
    LLastTextRect := LPDF.Graphics.DrawText('Unicode text support', PointF(LHeaderRect.Left, LLastTextRect.Bottom + 150));
    LPDF.Graphics.Font.SizeNoScale := 10;
    LPDF.Graphics.Font.Color := gcBlack;
    LPDF.Graphics.Font.style := [];
    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Belarusian</font></b>: Прывітанне Сусвет', PointF(LHeaderRect.Left + 10, LLastTextRect.Bottom + 10));
    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Chinese</font></b>: 你好，世界', PointF(LHeaderRect.Left + 10, LLastTextRect.Bottom + 30));
    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Thai</font></b>: สวัสดีชาวโลก', PointF(LHeaderRect.Left + 10, LLastTextRect.Bottom + 50));

    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Kyrgyz</font></b>: салам дүйнө', PointF(LHeaderRect.Left + 210, LLastTextRect.Bottom + 10));
    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Japanese</font></b>: こんにちは世界', PointF(LHeaderRect.Left + 210, LLastTextRect.Bottom + 30));
    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Telugu</font></b>: హలో వరల్డ్', PointF(LHeaderRect.Left + 210, LLastTextRect.Bottom + 50));

    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Vietnamese</font></b>: Chào thế giới', PointF(LHeaderRect.Left + 410, LLastTextRect.Bottom + 10));
    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Greek</font></b>: Γειά σου Κόσμε', PointF(LHeaderRect.Left + 410, LLastTextRect.Bottom + 30));
    LPDF.Graphics.DrawHTMLText('<b><font color="gcDarkOrange">Lao</font></b>: ສະ​ບາຍ​ດີ​ຊາວ​ໂລກ', PointF(LHeaderRect.Left + 410, LLastTextRect.Bottom + 50));


    LPDF.EndDocument(True);
  finally
    LPDF.Free;
  end;
end;

end.
