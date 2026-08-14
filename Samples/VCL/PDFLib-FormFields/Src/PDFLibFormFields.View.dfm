object PDFLibFormFieldsView: TPDFLibFormFieldsView
  Left = 0
  Top = 0
  Caption = 'TMS FNC PDFLib - Form Fields'
  ClientHeight = 188
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnGeneratePDF: TButton
    Left = 64
    Top = 64
    Width = 225
    Height = 57
    Caption = 'Generate PDF'
    TabOrder = 0
    WordWrap = True
    OnClick = btnGeneratePDFClick
  end
end
