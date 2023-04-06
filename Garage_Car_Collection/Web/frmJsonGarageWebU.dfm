object frmJsonGarage: TfrmJsonGarage
  Width = 640
  Height = 480
  OnCreate = WebFormCreate
  OnResize = WebFormResize
  object TMSFNCToolBar1: TTMSFNCToolBar
    Left = 0
    Top = 0
    Width = 640
    Height = 30
    Align = alTop
    ParentDoubleBuffered = False
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 0
    CompactBitmaps = <>
    Text = ''
    object btnImport: TTMSFNCToolBarButton
      Left = 12
      Top = 3
      Width = 48
      Height = 24
      ParentDoubleBuffered = False
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      TabOrder = 0
      OnClick = btnImportClick
      Text = 'Import'
      Bitmaps = <>
      LargeLayoutBitmaps = <>
      DisabledBitmaps = <>
      HoverBitmaps = <>
      LargeLayoutDisabledBitmaps = <>
      LargeLayoutHoverBitmaps = <>
      ControlIndex = 0
    end
    object btnCheckCylinders: TTMSFNCToolBarButton
      Left = 63
      Top = 3
      Width = 48
      Height = 24
      ParentDoubleBuffered = False
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      TabOrder = 2
      OnClick = btnCheckCylindersClick
      Text = 'Cylinder'
      Bitmaps = <>
      LargeLayoutBitmaps = <>
      DisabledBitmaps = <>
      HoverBitmaps = <>
      LargeLayoutDisabledBitmaps = <>
      LargeLayoutHoverBitmaps = <>
      ControlIndex = 1
    end
  end
  object tvLive: TTMSFNCTreeView
    Left = 0
    Top = 30
    Width = 350
    Height = 341
    Align = alLeft
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    Stroke.Color = 11119017
    Groups = <>
    GroupsAppearance.TopSize = 50.000000000000000000
    GroupsAppearance.BottomSize = 50.000000000000000000
    GroupsAppearance.TopFill.Kind = gfkNone
    GroupsAppearance.BottomFill.Kind = gfkNone
    GroupsAppearance.TopFont.Charset = DEFAULT_CHARSET
    GroupsAppearance.TopFont.Color = 4539717
    GroupsAppearance.TopFont.Height = -11
    GroupsAppearance.TopFont.Name = 'Segoe UI'
    GroupsAppearance.TopFont.Style = []
    GroupsAppearance.BottomFont.Charset = DEFAULT_CHARSET
    GroupsAppearance.BottomFont.Color = 4539717
    GroupsAppearance.BottomFont.Height = -11
    GroupsAppearance.BottomFont.Name = 'Segoe UI'
    GroupsAppearance.BottomFont.Style = []
    Columns = <
      item
        Name = 'Column0'
        Text = 'Name'
        Width = 100.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        TopFont.Charset = DEFAULT_CHARSET
        TopFont.Color = clWindowText
        TopFont.Height = -11
        TopFont.Name = 'Segoe UI'
        TopFont.Style = []
        BottomFont.Charset = DEFAULT_CHARSET
        BottomFont.Color = clWindowText
        BottomFont.Height = -11
        BottomFont.Name = 'Segoe UI'
        BottomFont.Style = []
      end
      item
        Name = 'Column1'
        Text = 'Unit'
        HorizontalTextAlign = gtaTrailing
        Width = 90.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        TopFont.Charset = DEFAULT_CHARSET
        TopFont.Color = clWindowText
        TopFont.Height = -11
        TopFont.Name = 'Segoe UI'
        TopFont.Style = []
        BottomFont.Charset = DEFAULT_CHARSET
        BottomFont.Color = clWindowText
        BottomFont.Height = -11
        BottomFont.Name = 'Segoe UI'
        BottomFont.Style = []
      end
      item
        Name = 'Column2'
        Text = 'Status'
        HorizontalTextAlign = gtaCenter
        Width = 80.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        TopFont.Charset = DEFAULT_CHARSET
        TopFont.Color = clWindowText
        TopFont.Height = -11
        TopFont.Name = 'Segoe UI'
        TopFont.Style = []
        BottomFont.Charset = DEFAULT_CHARSET
        BottomFont.Color = clWindowText
        BottomFont.Height = -11
        BottomFont.Name = 'Segoe UI'
        BottomFont.Style = []
      end>
    Nodes = <
      item
        Values = <
          item
            Text = 'Managers'
          end>
        Expanded = True
        Tag = 0
        Nodes = <
          item
            Values = <
              item
                Text = 'Liam Andersson'
              end
              item
                Text = 'Sales'
              end
              item
                Text = 'Office'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Yusuf Wang'
              end
              item
                Text = 'Manufactering'
              end
              item
                Text = 'Office'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Yusuf Moyo'
              end
              item
                Text = 'Sales'
              end
              item
                Text = 'Abroad'
              end>
            Tag = 0
            Nodes = <>
          end>
      end
      item
        Values = <
          item
            Text = 'Specialists'
          end>
        Expanded = True
        Tag = 0
        Nodes = <
          item
            Values = <
              item
                Text = 'Omar Moyo'
              end
              item
                Text = 'Customers'
              end
              item
                Text = 'Abroad'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Arthur Wang'
              end
              item
                Text = 'Sales'
              end
              item
                Text = 'On Leave'
              end>
            Tag = 0
            Nodes = <>
          end>
      end
      item
        Values = <
          item
            Text = 'Assistants'
          end>
        Tag = 0
        Nodes = <
          item
            Values = <
              item
                Text = 'Isabella Smith'
              end
              item
                Text = 'Sales'
              end
              item
                Text = 'On Leave'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Isabella Gonzales'
              end
              item
                Text = 'Marketing'
              end
              item
                Text = 'Abroad'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Fatma Gonzales'
              end
              item
                Text = 'Finance'
              end
              item
                Text = 'Office'
              end>
            Tag = 0
            Nodes = <>
          end>
      end>
    ColumnsAppearance.StretchColumn = 0
    ColumnsAppearance.StretchAll = False
    ColumnsAppearance.TopSize = 36.000000000000000000
    ColumnsAppearance.BottomSize = 25.000000000000000000
    ColumnsAppearance.TopFont.Charset = DEFAULT_CHARSET
    ColumnsAppearance.TopFont.Color = 4539717
    ColumnsAppearance.TopFont.Height = -13
    ColumnsAppearance.TopFont.Name = 'Segoe UI'
    ColumnsAppearance.TopFont.Style = [fsBold]
    ColumnsAppearance.BottomFont.Charset = DEFAULT_CHARSET
    ColumnsAppearance.BottomFont.Color = 4539717
    ColumnsAppearance.BottomFont.Height = -11
    ColumnsAppearance.BottomFont.Name = 'Segoe UI'
    ColumnsAppearance.BottomFont.Style = []
    ColumnsAppearance.TopFill.Color = 16380654
    ColumnsAppearance.BottomFill.Kind = gfkNone
    ColumnsAppearance.BottomFill.Color = 16380654
    ColumnsAppearance.TopStroke.Kind = gskNone
    NodesAppearance.ShowFocus = False
    NodesAppearance.ExpandWidth = 18.000000000000000000
    NodesAppearance.ExpandHeight = 18.000000000000000000
    NodesAppearance.LevelIndent = 20.000000000000000000
    NodesAppearance.FixedHeight = 25.000000000000000000
    NodesAppearance.VariableMinimumHeight = 25.000000000000000000
    NodesAppearance.Font.Charset = DEFAULT_CHARSET
    NodesAppearance.Font.Color = 8026746
    NodesAppearance.Font.Height = -11
    NodesAppearance.Font.Name = 'Segoe UI'
    NodesAppearance.Font.Style = []
    NodesAppearance.TitleFont.Charset = DEFAULT_CHARSET
    NodesAppearance.TitleFont.Color = clBlack
    NodesAppearance.TitleFont.Height = -11
    NodesAppearance.TitleFont.Name = 'Segoe UI'
    NodesAppearance.TitleFont.Style = []
    NodesAppearance.SelectedFontColor = 4539717
    NodesAppearance.ExtendedFontColor = 4539717
    NodesAppearance.SelectedFill.Color = 16578806
    NodesAppearance.SelectedStroke.Color = 15702829
    NodesAppearance.SelectedStroke.Width = 2.000000000000000000
    NodesAppearance.ExtendedFont.Charset = DEFAULT_CHARSET
    NodesAppearance.ExtendedFont.Color = clWindowText
    NodesAppearance.ExtendedFont.Height = -11
    NodesAppearance.ExtendedFont.Name = 'Segoe UI'
    NodesAppearance.ExtendedFont.Style = []
    NodesAppearance.ExpandNodeIcon.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D494844520000000B0000
      000B080200000026CEE071000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
      1874455874536F667477617265007061696E742E6E657420342E302E36FC8C63
      DF000000334944415478DA63ACAEAD66C00B18812A5A9A5A7049D7D4D5A0ABF0
      F6F3DEBA692B8D540025301D01544A6F7710080FFC610A005ADF3FFDA83755DB
      0000000049454E44AE426082}
    NodesAppearance.CollapseNodeIcon.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D494844520000000B0000
      000B080200000026CEE071000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
      1874455874536F667477617265007061696E742E6E657420342E302E36FC8C63
      DF0000002C4944415478DA63ACAEAD66C00B18812A5A9A5A7049D7D4D5D05B85
      B79F37B2DCD64D5B07C61DF854E00F53005DBC2DFDD89D52A70000000049454E
      44AE426082}
    NodesAppearance.ExpandNodeIconLarge.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000160000
      001608020000004BD6FB6C000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
      1874455874536F667477617265007061696E742E6E657420342E302E36FC8C63
      DF000000404944415478DA63ACAEAD66A00C3052CD8896A6163234D7D4D5D0C5
      086F3F6F20B975D3D6512306C40888066200C450DA183138C262D488C1535E50
      02A8600400AA8F7FF987EC13380000000049454E44AE426082}
    NodesAppearance.CollapseNodeIconLarge.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000160000
      001608020000004BD6FB6C0000000467414D410000B18F0BFC61050000000970
      48597300000EC200000EC20115284A800000001874455874536F667477617265
      007061696E742E6E657420342E302E36FC8C63DF000000384944415478DA63AC
      AEAD66A00C3052CD8896A6163234D7D4D58C1A31628CF0F6F3C6A36DEBA6AD74
      31627084C5A81183C1084A00158C000071065BF9A44132100000000049454E44
      AE426082}
    GlobalFont.Name = 'Segoe UI'
    GlobalFont.Scale = 1.000000000000000000
    GlobalFont.Style = []
    DefaultViewJSONOptions.NameHTMLTemplate = '<#NAME>'
    DefaultViewJSONOptions.ValueHTMLTemplate = '<#VALUE>'
  end
  object TMSFNCSplitter1: TTMSFNCSplitter
    Left = 350
    Top = 30
    Width = 10
    Height = 341
    Cursor = crHSplit
    Align = alLeft
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    MinSize = 20.000000000000000000
  end
  object tvImport: TTMSFNCTreeView
    Left = 360
    Top = 30
    Width = 280
    Height = 341
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 3
    Stroke.Color = 11119017
    Groups = <>
    GroupsAppearance.TopSize = 50.000000000000000000
    GroupsAppearance.BottomSize = 50.000000000000000000
    GroupsAppearance.TopFill.Kind = gfkNone
    GroupsAppearance.BottomFill.Kind = gfkNone
    GroupsAppearance.TopFont.Charset = DEFAULT_CHARSET
    GroupsAppearance.TopFont.Color = 4539717
    GroupsAppearance.TopFont.Height = -11
    GroupsAppearance.TopFont.Name = 'Segoe UI'
    GroupsAppearance.TopFont.Style = []
    GroupsAppearance.BottomFont.Charset = DEFAULT_CHARSET
    GroupsAppearance.BottomFont.Color = 4539717
    GroupsAppearance.BottomFont.Height = -11
    GroupsAppearance.BottomFont.Name = 'Segoe UI'
    GroupsAppearance.BottomFont.Style = []
    Columns = <
      item
        Name = 'Column0'
        Text = 'Name'
        Width = 100.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        TopFont.Charset = DEFAULT_CHARSET
        TopFont.Color = clWindowText
        TopFont.Height = -11
        TopFont.Name = 'Segoe UI'
        TopFont.Style = []
        BottomFont.Charset = DEFAULT_CHARSET
        BottomFont.Color = clWindowText
        BottomFont.Height = -11
        BottomFont.Name = 'Segoe UI'
        BottomFont.Style = []
      end
      item
        Name = 'Column1'
        Text = 'Unit'
        HorizontalTextAlign = gtaTrailing
        Width = 90.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        TopFont.Charset = DEFAULT_CHARSET
        TopFont.Color = clWindowText
        TopFont.Height = -11
        TopFont.Name = 'Segoe UI'
        TopFont.Style = []
        BottomFont.Charset = DEFAULT_CHARSET
        BottomFont.Color = clWindowText
        BottomFont.Height = -11
        BottomFont.Name = 'Segoe UI'
        BottomFont.Style = []
      end
      item
        Name = 'Column2'
        Text = 'Status'
        HorizontalTextAlign = gtaCenter
        Width = 80.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        TopFont.Charset = DEFAULT_CHARSET
        TopFont.Color = clWindowText
        TopFont.Height = -11
        TopFont.Name = 'Segoe UI'
        TopFont.Style = []
        BottomFont.Charset = DEFAULT_CHARSET
        BottomFont.Color = clWindowText
        BottomFont.Height = -11
        BottomFont.Name = 'Segoe UI'
        BottomFont.Style = []
      end>
    Nodes = <
      item
        Values = <
          item
            Text = 'Managers'
          end>
        Expanded = True
        Tag = 0
        Nodes = <
          item
            Values = <
              item
                Text = 'Isabella Wang'
              end
              item
                Text = 'Marketing'
              end
              item
                Text = 'Office'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Yusuf Andersson'
              end
              item
                Text = 'Sales'
              end
              item
                Text = 'Office'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Fatma Peeters'
              end
              item
                Text = 'Research'
              end
              item
                Text = 'Abroad'
              end>
            Tag = 0
            Nodes = <>
          end>
      end
      item
        Values = <
          item
            Text = 'Specialists'
          end>
        Expanded = True
        Tag = 0
        Nodes = <
          item
            Values = <
              item
                Text = 'Marie Andersson'
              end
              item
                Text = 'Sales'
              end
              item
                Text = 'Office'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Marie Smith'
              end
              item
                Text = 'Marketing'
              end
              item
                Text = 'On Leave'
              end>
            Tag = 0
            Nodes = <>
          end>
      end
      item
        Values = <
          item
            Text = 'Assistants'
          end>
        Tag = 0
        Nodes = <
          item
            Values = <
              item
                Text = 'Liam Gonzales'
              end
              item
                Text = 'HR'
              end
              item
                Text = 'Abroad'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Liam Smith'
              end
              item
                Text = 'Customers'
              end
              item
                Text = 'Office'
              end>
            Tag = 0
            Nodes = <>
          end
          item
            Values = <
              item
                Text = 'Liam Ali'
              end
              item
                Text = 'Sales'
              end
              item
                Text = 'On Leave'
              end>
            Tag = 0
            Nodes = <>
          end>
      end>
    ColumnsAppearance.StretchColumn = 0
    ColumnsAppearance.StretchAll = False
    ColumnsAppearance.TopSize = 36.000000000000000000
    ColumnsAppearance.BottomSize = 25.000000000000000000
    ColumnsAppearance.TopFont.Charset = DEFAULT_CHARSET
    ColumnsAppearance.TopFont.Color = 4539717
    ColumnsAppearance.TopFont.Height = -13
    ColumnsAppearance.TopFont.Name = 'Segoe UI'
    ColumnsAppearance.TopFont.Style = [fsBold]
    ColumnsAppearance.BottomFont.Charset = DEFAULT_CHARSET
    ColumnsAppearance.BottomFont.Color = 4539717
    ColumnsAppearance.BottomFont.Height = -11
    ColumnsAppearance.BottomFont.Name = 'Segoe UI'
    ColumnsAppearance.BottomFont.Style = []
    ColumnsAppearance.TopFill.Color = 16380654
    ColumnsAppearance.BottomFill.Kind = gfkNone
    ColumnsAppearance.BottomFill.Color = 16380654
    ColumnsAppearance.TopStroke.Kind = gskNone
    NodesAppearance.ShowFocus = False
    NodesAppearance.ExpandWidth = 18.000000000000000000
    NodesAppearance.ExpandHeight = 18.000000000000000000
    NodesAppearance.LevelIndent = 20.000000000000000000
    NodesAppearance.FixedHeight = 25.000000000000000000
    NodesAppearance.VariableMinimumHeight = 25.000000000000000000
    NodesAppearance.Font.Charset = DEFAULT_CHARSET
    NodesAppearance.Font.Color = 8026746
    NodesAppearance.Font.Height = -11
    NodesAppearance.Font.Name = 'Segoe UI'
    NodesAppearance.Font.Style = []
    NodesAppearance.TitleFont.Charset = DEFAULT_CHARSET
    NodesAppearance.TitleFont.Color = clBlack
    NodesAppearance.TitleFont.Height = -11
    NodesAppearance.TitleFont.Name = 'Segoe UI'
    NodesAppearance.TitleFont.Style = []
    NodesAppearance.SelectedFontColor = 4539717
    NodesAppearance.ExtendedFontColor = 4539717
    NodesAppearance.SelectedFill.Color = 16578806
    NodesAppearance.SelectedStroke.Color = 15702829
    NodesAppearance.SelectedStroke.Width = 2.000000000000000000
    NodesAppearance.ExtendedFont.Charset = DEFAULT_CHARSET
    NodesAppearance.ExtendedFont.Color = clWindowText
    NodesAppearance.ExtendedFont.Height = -11
    NodesAppearance.ExtendedFont.Name = 'Segoe UI'
    NodesAppearance.ExtendedFont.Style = []
    NodesAppearance.ExpandNodeIcon.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D494844520000000B0000
      000B080200000026CEE071000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
      1874455874536F667477617265007061696E742E6E657420342E302E36FC8C63
      DF000000334944415478DA63ACAEAD66C00B18812A5A9A5A7049D7D4D5A0ABF0
      F6F3DEBA692B8D540025301D01544A6F7710080FFC610A005ADF3FFDA83755DB
      0000000049454E44AE426082}
    NodesAppearance.CollapseNodeIcon.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D494844520000000B0000
      000B080200000026CEE071000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
      1874455874536F667477617265007061696E742E6E657420342E302E36FC8C63
      DF0000002C4944415478DA63ACAEAD66C00B18812A5A9A5A7049D7D4D5D05B85
      B79F37B2DCD64D5B07C61DF854E00F53005DBC2DFDD89D52A70000000049454E
      44AE426082}
    NodesAppearance.ExpandNodeIconLarge.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000160000
      001608020000004BD6FB6C000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
      1874455874536F667477617265007061696E742E6E657420342E302E36FC8C63
      DF000000404944415478DA63ACAEAD66A00C3052CD8896A6163234D7D4D5D0C5
      086F3F6F20B975D3D6512306C40888066200C450DA183138C262D488C1535E50
      02A8600400AA8F7FF987EC13380000000049454E44AE426082}
    NodesAppearance.CollapseNodeIconLarge.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000160000
      001608020000004BD6FB6C0000000467414D410000B18F0BFC61050000000970
      48597300000EC200000EC20115284A800000001874455874536F667477617265
      007061696E742E6E657420342E302E36FC8C63DF000000384944415478DA63AC
      AEAD66A00C3052CD8896A6163234D7D4D58C1A31628CF0F6F3C6A36DEBA6AD74
      31627084C5A81183C1084A00158C000071065BF9A44132100000000049454E44
      AE426082}
    GlobalFont.Name = 'Segoe UI'
    GlobalFont.Scale = 1.000000000000000000
    GlobalFont.Style = []
    DefaultViewJSONOptions.NameHTMLTemplate = '<#NAME>'
    DefaultViewJSONOptions.ValueHTMLTemplate = '<#VALUE>'
  end
  object TMSFNCStatusBar1: TTMSFNCStatusBar
    Left = 0
    Top = 460
    Width = 640
    Height = 20
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 4
    Panels = <>
    PanelAppearance.Font.Charset = DEFAULT_CHARSET
    PanelAppearance.Font.Color = clWindowText
    PanelAppearance.Font.Height = -11
    PanelAppearance.Font.Name = 'Segoe UI'
    PanelAppearance.Font.Style = []
  end
  object WebMemo1: TWebMemo
    Left = 0
    Top = 371
    Width = 640
    Height = 89
    Align = alBottom
    AutoSize = False
    HeightPercent = 100.000000000000000000
    Lines.Strings = (
      'WebMemo1')
    SelLength = 0
    SelStart = 0
    WidthPercent = 100.000000000000000000
  end
end
