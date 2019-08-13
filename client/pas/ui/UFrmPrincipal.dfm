object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'page'
  ClientHeight = 297
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 312
    Top = 8
    Width = 118
    Height = 13
    Caption = 'Retorno do WebService:'
  end
  object mmRetornoWebService: TMemo
    Left = 312
    Top = 25
    Width = 265
    Height = 260
    Lines.Strings = (
      'mmRetornoWebService')
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 289
    Height = 281
    ActivePage = TabSheet1
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Fazer Pedido'
      object Label1: TLabel
        Left = 16
        Top = 93
        Width = 90
        Height = 13
        Caption = 'Tamanho da Pizza:'
      end
      object Label2: TLabel
        Left = 16
        Top = 136
        Width = 74
        Height = 13
        Caption = 'Sabor da Pizza:'
      end
      object edtDocumentoCliente: TLabeledEdit
        Left = 16
        Top = 64
        Width = 193
        Height = 21
        EditLabel.Width = 98
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero Documento:'
        TabOrder = 0
      end
      object cmbTamanhoPizza: TComboBox
        Left = 16
        Top = 109
        Width = 193
        Height = 21
        TabOrder = 1
        Items.Strings = (
          'enPequena'
          'enMedia'
          'enGrande')
      end
      object cmbSaborPizza: TComboBox
        Left = 16
        Top = 155
        Width = 193
        Height = 21
        TabOrder = 2
        Items.Strings = (
          'enCalabresa'
          'enMarguerita'
          'enPortuguesa')
      end
      object Button1: TButton
        Left = 167
        Top = 212
        Width = 105
        Height = 25
        Caption = '&1 - Fazer Pedido'
        TabOrder = 3
        OnClick = Button1Click
      end
      object edtEnderecoBackend: TLabeledEdit
        Left = 16
        Top = 24
        Width = 161
        Height = 21
        EditLabel.Width = 131
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o Pizzaria Backend:'
        TabOrder = 4
        Text = 'http://localhost'
      end
      object edtPortaBackend: TLabeledEdit
        Left = 167
        Top = 24
        Width = 114
        Height = 21
        EditLabel.Width = 112
        EditLabel.Height = 13
        EditLabel.Caption = 'Porta Pizzaria Backend:'
        TabOrder = 5
        Text = '8080'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consultar Pedido'
      ImageIndex = 1
      object edtEnderecoConsulta: TLabeledEdit
        Left = 9
        Top = 32
        Width = 161
        Height = 21
        EditLabel.Width = 131
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o Pizzaria Backend:'
        TabOrder = 0
        Text = 'http://localhost'
      end
      object edtPortaConsulta: TLabeledEdit
        Left = 152
        Top = 32
        Width = 114
        Height = 21
        EditLabel.Width = 112
        EditLabel.Height = 13
        EditLabel.Caption = 'Porta Pizzaria Backend:'
        TabOrder = 1
        Text = '8080'
      end
      object edtDocumentoClienteConsulta: TLabeledEdit
        Left = 9
        Top = 72
        Width = 193
        Height = 21
        EditLabel.Width = 98
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#250'mero Documento:'
        TabOrder = 2
      end
      object Button2: TButton
        Left = 173
        Top = 212
        Width = 105
        Height = 25
        Caption = '&2 - Consultar Pedido'
        TabOrder = 3
        OnClick = Button2Click
      end
    end
  end
end
