unit FSD.NewProjects.Forms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFSDNewProjectForms = class(TForm)
    EdtNomeProjeto: TEdit;
    EdtNameSpace: TEdit;
    EdtDiretorio: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCriar: TButton;
    Image1: TImage;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSDNewProjectForms: TFSDNewProjectForms;

implementation

{$R *.dfm}

uses
  ToolsAPI,
  FSD.NewProject.Creator;

procedure TFSDNewProjectForms.btnCriarClick(Sender: TObject);
var
  projectCreator: IOTAPRojectCreator;
  module: IOTAModule;
begin
  projectCreator := TFSDNewProjectCreator.New(edtNomeProjeto.Text,
                                              edtNameSpace.Text,
                                              edtDiretorio.Text);
  module := (BorlandIDESErvices as IOTAModuleServices).CreateModule(projectCreator);
  module.FileName := edtDiretorio.Text + edtNomeProjeto.Text + '.dproj';
  module.save(False, True);
//  module.refresh; //Não existe esse Refresh mais.

end;

procedure TFSDNewProjectForms.FormShow(Sender: TObject);
{$IF CompilerVersion >= 32.0}
var
  i: integer;
{$ENDIF}
begin
  {Não funciona}

  {$IF Compilerversion >= 32.0}
  (BorlandIDEServices as IOTAIDEThemingServices250)
    .RegisterFormClass(TFSDNewProjectForms);

  for i:=0 to ComponentCount -1 do
   (BorlandIDEServices as IOTAIDEThemingServices250)
     .ApplyTheme(Components[i]);

  {$ENDIF}
end;

end.
