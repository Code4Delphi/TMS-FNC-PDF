object PDFLibFormFieldsView: TPDFLibFormFieldsView
  Left = 0
  Top = 0
  Caption = 'PDF Generation'
  ClientHeight = 188
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 24
    Top = 64
    Width = 225
    Height = 57
    Caption = 'Generate PDF'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
end
