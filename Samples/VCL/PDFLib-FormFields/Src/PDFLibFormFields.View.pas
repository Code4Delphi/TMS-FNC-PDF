unit PDFLibFormFields.View;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  VCL.Controls,
  VCL.Forms,
  VCL.Graphics,
  VCL.Dialogs,
  VCL.StdCtrls;

type
  TPDFLibFormFieldsView = class(TForm)
    btnGeneratePDF: TButton;
    procedure btnGeneratePDFClick(Sender: TObject);
  private

  public

  end;

var
  PDFLibFormFieldsView: TPDFLibFormFieldsView;

implementation

uses
  VCL.TMSFNCPDFLib,
  VCL.TMSFNCGraphicsTypes,
  UConsts;

{$R *.dfm}

procedure TPDFLibFormFieldsView.btnGeneratePDFClick(Sender: TObject);
const
  cLeft = 40;
  cFieldLeft = 180;
  cHeight = 20;
  cGap = 15;
  cName = 80;
  cEmail = 110;
  cProduct = 150;
  cPurpose = 180;
  cSatisfaction = 220;
  cEaseOfUse = 250;
  cValueForMoney = 280;
  cSupport = 310;
  cLikes = 350;
  cImprove = 480;
  cContact = 620;
var
  LPDF: TTMSFNCPDFLib;
  LDissatisfiedTextRect: TRectF;
begin
  LPDF := TTMSFNCPDFLib.Create;
  try
    LPDF.Header := '';
    LPDF.Footer := '';
    LPDF.PageSize := psCustom;
    LPDF.PageWidth := 595;
    LPDF.PageHeight := 842;
    LPDF.BeginDocument('Customer_Feedback.pdf');
    LPDF.NewPage;

    LPDF.Graphics.Font.SizeNoScale := 16;
    LPDF.Graphics.Font.Style := [TFontStyle.fsBold];
    LPDF.Graphics.DrawText('Customer Feedback Form', PointF(cLeft, 40));

    LPDF.Graphics.Font.Style := [];
    LPDF.Graphics.Font.SizeNoScale := 14;
    LPDF.Graphics.DrawText('Customer name:', PointF(cLeft, cName));
    LPDF.FormFields.AddEdit(cCustomerName, RectF(cFieldLeft, cName, cFieldLeft + 200, cName + cHeight));

    LPDF.Graphics.DrawText('Email:', PointF(cLeft, cEmail));
    LPDF.FormFields.AddEdit(cCustomerEmail, RectF(cFieldLeft, cEmail, cFieldLeft + 200, cEmail + cHeight));

    LPDF.Graphics.DrawText('Product purchased:', PointF(cLeft, cProduct));
    LPDF.FormFields.AddComboBox(cProductName, RectF(cFieldLeft, cProduct, cFieldLeft + 100, cProduct + cHeight), ['Product A', 'Product B']);

    LPDF.Graphics.DrawText('Purpose of use:', PointF(cLeft, cPurpose));
    LPDF.FormFields.AddComboBox(cProductPurpose, RectF(cFieldLeft, cPurpose, cFieldLeft + 100, cPurpose + cHeight), ['Business', 'Education', 'Personal', 'Other']);

    LPDF.Graphics.DrawText('Overall satisfaction:', PointF(cLeft, cSatisfaction));
    LPDF.Graphics.Font.SizeNoScale := 7;
    LPDF.Graphics.Alignment := gtaCenter;
    LDissatisfiedTextRect := LPDF.Graphics.DrawText('Very Dissatisfied', RectF(cFieldLeft, cSatisfaction, cFieldLeft + 40, cSatisfaction + cHeight));
    LPDF.FormFields.AddRadioGroup(cSatisfactionOverall, 'SatisfactionGroup');
    LPDF.FormFields.AddRadioButton('1', RectF(LDissatisfiedTextRect.Right + cGap, cSatisFaction, LDissatisfiedTextRect.Right + cGap + cHeight, cSatisFaction + cHeight), 'SatisfactionGroup');
    LPDF.FormFields.AddRadioButton('2', RectF(LDissatisfiedTextRect.Right + cGap + 25, cSatisFaction, LDissatisfiedTextRect.Right + cGap + cHeight + 25, cSatisFaction + cHeight), 'SatisfactionGroup');
    LPDF.FormFields.AddRadioButton('3', RectF(LDissatisfiedTextRect.Right + cGap + 50, cSatisFaction, LDissatisfiedTextRect.Right + cGap + cHeight + 50, cSatisFaction + cHeight), 'SatisfactionGroup');
    LPDF.FormFields.AddRadioButton('4', RectF(LDissatisfiedTextRect.Right + cGap + 75, cSatisFaction, LDissatisfiedTextRect.Right + cGap + cHeight + 75, cSatisFaction + cHeight), 'SatisfactionGroup');
    LPDF.FormFields.AddRadioButton('5', RectF(LDissatisfiedTextRect.Right + cGap + 100, cSatisFaction, LDissatisfiedTextRect.Right + cGap + cHeight + 100, cSatisFaction + cHeight), 'SatisfactionGroup');
    LPDF.Graphics.DrawText('Very Satisfied', RectF(LDissatisfiedTextRect.Right +  2 * cGap + cHeight + 100, cSatisfaction, LDissatisfiedTextRect.Right + 2 * cGap + cHeight + 130, cSatisfaction + cHeight));

    LPDF.Graphics.Font.SizeNoScale := 14;
    LPDF.Graphics.Alignment := gtaLeading;
    LPDF.Graphics.DrawText('Ease of use:', PointF(cLeft, cEaseOfUse));
    LPDF.Graphics.Font.SizeNoScale := 7;
    LPDF.Graphics.Alignment := gtaCenter;
    LDissatisfiedTextRect := LPDF.Graphics.DrawText('Very Dissatisfied', RectF(cFieldLeft, cEaseOfUse, cFieldLeft + 40, cEaseOfUse + cHeight));
    LPDF.FormFields.AddRadioGroup(cSatisfactionEaseOfUse, 'EaseOfUseGroup');
    LPDF.FormFields.AddRadioButton('1', RectF(LDissatisfiedTextRect.Right + cGap, cEaseOfUse, LDissatisfiedTextRect.Right + cGap + cHeight, cEaseOfUse + cHeight), 'EaseOfUseGroup');
    LPDF.FormFields.AddRadioButton('2', RectF(LDissatisfiedTextRect.Right + cGap + 25, cEaseOfUse, LDissatisfiedTextRect.Right + cGap + cHeight + 25, cEaseOfUse + cHeight), 'EaseOfUseGroup');
    LPDF.FormFields.AddRadioButton('3', RectF(LDissatisfiedTextRect.Right + cGap + 50, cEaseOfUse, LDissatisfiedTextRect.Right + cGap + cHeight + 50, cEaseOfUse + cHeight), 'EaseOfUseGroup');
    LPDF.FormFields.AddRadioButton('4', RectF(LDissatisfiedTextRect.Right + cGap + 75, cEaseOfUse, LDissatisfiedTextRect.Right + cGap + cHeight + 75, cEaseOfUse + cHeight), 'EaseOfUseGroup');
    LPDF.FormFields.AddRadioButton('5', RectF(LDissatisfiedTextRect.Right + cGap + 100, cEaseOfUse, LDissatisfiedTextRect.Right + cGap + cHeight + 100, cEaseOfUse + cHeight), 'EaseOfUseGroup');
    LPDF.Graphics.DrawText('Very Satisfied', RectF(LDissatisfiedTextRect.Right +  2 * cGap + cHeight + 100, cEaseOfUse, LDissatisfiedTextRect.Right + 2 * cGap + cHeight + 130, cEaseOfUse + cHeight));

    LPDF.Graphics.Font.SizeNoScale := 14;
    LPDF.Graphics.Alignment := gtaLeading;
    LPDF.Graphics.DrawText('Value for money:', PointF(cLeft, cValueForMoney));
    LPDF.Graphics.Font.SizeNoScale := 7;
    LPDF.Graphics.Alignment := gtaCenter;
    LDissatisfiedTextRect := LPDF.Graphics.DrawText('Very Dissatisfied', RectF(cFieldLeft, cValueForMoney, cFieldLeft + 40, cValueForMoney + cHeight));
    LPDF.FormFields.AddRadioGroup(cSatisfactionValueForMoney, 'ValueForMoneyGroup');
    LPDF.FormFields.AddRadioButton('1', RectF(LDissatisfiedTextRect.Right + cGap, cValueForMoney, LDissatisfiedTextRect.Right + cGap + cHeight, cValueForMoney + cHeight), 'ValueForMoneyGroup');
    LPDF.FormFields.AddRadioButton('2', RectF(LDissatisfiedTextRect.Right + cGap + 25, cValueForMoney, LDissatisfiedTextRect.Right + cGap + cHeight + 25, cValueForMoney + cHeight), 'ValueForMoneyGroup');
    LPDF.FormFields.AddRadioButton('3', RectF(LDissatisfiedTextRect.Right + cGap + 50, cValueForMoney, LDissatisfiedTextRect.Right + cGap + cHeight + 50, cValueForMoney + cHeight), 'ValueForMoneyGroup');
    LPDF.FormFields.AddRadioButton('4', RectF(LDissatisfiedTextRect.Right + cGap + 75, cValueForMoney, LDissatisfiedTextRect.Right + cGap + cHeight + 75, cValueForMoney + cHeight), 'ValueForMoneyGroup');
    LPDF.FormFields.AddRadioButton('5', RectF(LDissatisfiedTextRect.Right + cGap + 100, cValueForMoney, LDissatisfiedTextRect.Right + cGap + cHeight + 100, cValueForMoney + cHeight), 'ValueForMoneyGroup');
    LPDF.Graphics.DrawText('Very Satisfied', RectF(LDissatisfiedTextRect.Right +  2 * cGap + cHeight + 100, cValueForMoney, LDissatisfiedTextRect.Right + 2 * cGap + cHeight + 130, cValueForMoney + cHeight));

    LPDF.Graphics.Font.SizeNoScale := 14;
    LPDF.Graphics.Alignment := gtaLeading;
    LPDF.Graphics.DrawText('Support experience:', PointF(cLeft, cSupport));
    LPDF.Graphics.Font.SizeNoScale := 7;
    LPDF.Graphics.Alignment := gtaCenter;
    LDissatisfiedTextRect := LPDF.Graphics.DrawText('Very Dissatisfied', RectF(cFieldLeft, cSupport, cFieldLeft + 40, cSupport + cHeight));
    LPDF.FormFields.AddRadioGroup(cSatisfactionSupport, 'SupportGroup');
    LPDF.FormFields.AddRadioButton('1', RectF(LDissatisfiedTextRect.Right + cGap, cSupport, LDissatisfiedTextRect.Right + cGap + cHeight, cSupport + cHeight), 'SupportGroup');
    LPDF.FormFields.AddRadioButton('2', RectF(LDissatisfiedTextRect.Right + cGap + 25, cSupport, LDissatisfiedTextRect.Right + cGap + cHeight + 25, cSupport + cHeight), 'SupportGroup');
    LPDF.FormFields.AddRadioButton('3', RectF(LDissatisfiedTextRect.Right + cGap + 50, cSupport, LDissatisfiedTextRect.Right + cGap + cHeight + 50, cSupport + cHeight), 'SupportGroup');
    LPDF.FormFields.AddRadioButton('4', RectF(LDissatisfiedTextRect.Right + cGap + 75, cSupport, LDissatisfiedTextRect.Right + cGap + cHeight + 75, cSupport + cHeight), 'SupportGroup');
    LPDF.FormFields.AddRadioButton('5', RectF(LDissatisfiedTextRect.Right + cGap + 100, cSupport, LDissatisfiedTextRect.Right + cGap + cHeight + 100, cSupport + cHeight), 'SupportGroup');
    LPDF.Graphics.DrawText('Very Satisfied', RectF(LDissatisfiedTextRect.Right +  2 * cGap + cHeight + 100, cSupport, LDissatisfiedTextRect.Right + 2 * cGap + cHeight + 130, cSupport + cHeight));

    LPDF.Graphics.Font.SizeNoScale := 14;
    LPDF.Graphics.Alignment := gtaLeading;
    LPDF.Graphics.DrawText('What did you like the most?', PointF(cLeft, cLikes));
    LPDF.FormFields.AddMemo(cFeedbackPositive, RectF(cLeft, cLikes + 20, cLeft + 400, cLikes + 120));

    LPDF.Graphics.DrawText('What could be improved?', PointF(cLeft, cImprove));
    LPDF.FormFields.AddMemo(cFeedbackImprove, RectF(cLeft, cImprove + 20, cLeft + 400, cImprove + 120));

    LPDF.FormFields.AddCheckBox(cCanContact, RectF(cLeft, cContact, cLeft + cHeight, cContact + cHeight), False);
    LPDF.Graphics.DrawText('You may contact me about this feedback.', PointF(cLeft + cHeight + cGap, cContact));

    LPDF.EndDocument(True);
  finally
    LPDF.Free;
  end;
end;

end.
