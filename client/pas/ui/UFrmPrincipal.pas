unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Label3: TLabel;
    mmRetornoWebService: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edtDocumentoCliente: TLabeledEdit;
    cmbTamanhoPizza: TComboBox;
    cmbSaborPizza: TComboBox;
    Button1: TButton;
    edtEnderecoBackend: TLabeledEdit;
    edtPortaBackend: TLabeledEdit;
    edtEnderecoConsulta: TLabeledEdit;
    edtPortaConsulta: TLabeledEdit;
    edtDocumentoClienteConsulta: TLabeledEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses
  Rest.JSON, MVCFramework.RESTClient, UEfetuarPedidoDTOImpl, System.Rtti,
  UPizzaSaborEnum, UPizzaTamanhoEnum, UPedidoRetornoDTOImpl,
  MVCFramework.Commons;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Clt: TRestClient;
  oEfetuarPedido: TEfetuarPedidoDTO;
begin
  Clt := MVCFramework.RESTClient.TRestClient.Create(edtEnderecoBackend.Text,
    StrToIntDef(edtPortaBackend.Text, 80), nil);
  try
    oEfetuarPedido := TEfetuarPedidoDTO.Create;
    try
      oEfetuarPedido.PizzaTamanho     := TRttiEnumerationType.GetValue<TPizzaTamanhoEnum>(cmbTamanhoPizza.Text);
      oEfetuarPedido.PizzaSabor       := TRttiEnumerationType.GetValue<TPizzaSaborEnum>(cmbSaborPizza.Text);
      oEfetuarPedido.DocumentoCliente := edtDocumentoCliente.Text;
      mmRetornoWebService.Text := Clt.doPOST('/efetuarPedido',[],TJson.ObjecttoJsonString(oEfetuarPedido)).BodyAsString;
    finally
      oEfetuarPedido.Free;
    end;
  finally
    Clt.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Clt: TRestClient;
  oDTO : TPedidoRetornoDTO;
  oRestReponse : IRESTResponse;
begin
  if (edtDocumentoClienteConsulta.Text = EmptyStr) OR (edtEnderecoConsulta.Text = EmptyStr) or (edtPortaConsulta.Text = EmptyStr) then
    exit;

  Clt := MVCFramework.RESTClient.TRestClient.Create(edtEnderecoConsulta.Text,
  StrToIntDef(edtPortaConsulta.Text, 80), nil);

  oRestReponse := Clt.doGET( '/consultarPedido', [edtDocumentoClienteConsulta.Text],nil);
  if oRestReponse.ResponseCode=HTTP_Status.NotFound then
     raise Exception.Create(oRestReponse.BodyAsString);

  oDTO := TJson.JsonToObject<TPedidoRetornoDTO>(oRestReponse.BodyAsString);
  mmRetornoWebService.Clear;

  mmRetornoWebService.Lines.Add('Tamanho da Pizza: '+ Copy(
                                                            TRttiEnumerationType.GetName<TPizzaTamanhoEnum>(oDTO.PizzaTamanho),
                                                            3,
                                                            length(TRttiEnumerationType.GetName<TPizzaTamanhoEnum>(oDTO.PizzaTamanho))
                                                          )
                                );
  mmRetornoWebService.Lines.Add('Sabor da Pizza  : '+ Copy(
                                                            TRttiEnumerationType.GetName<TPizzaSaborEnum>(oDTO.PizzaSabor),
                                                            3,
                                                            length(TRttiEnumerationType.GetName<TPizzaSaborEnum>(oDTO.PizzaSabor))
                                                          )
                                );

  mmRetornoWebService.Lines.Add('Preço da Pizza  : '+ FormatCurr('R$0.00',oDTO.ValorTotalPedido));

  mmRetornoWebService.Lines.Add('Tempo de Preparo: '+ oDTO.TempoPreparo.ToString + ' minutos.');
end;

end.
