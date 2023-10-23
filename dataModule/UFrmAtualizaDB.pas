unit UFrmAtualizaDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFrmAtualizaDB = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    ChkConexao: TCheckBox;
    ChkCategoria: TCheckBox;
    ChkProduto: TCheckBox;
    ChkCliente: TCheckBox;
    ChkVendas: TCheckBox;
    ChkItensVendas: TCheckBox;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaDB: TFrmAtualizaDB;

implementation

{$R *.dfm}





end.
