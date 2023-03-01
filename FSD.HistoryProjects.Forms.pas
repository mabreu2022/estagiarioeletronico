unit FSD.HistoryProjects.Forms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.IniFiles, ToolsAPI;

type
  TFSDHistoryProjectsForms = class(TForm)
    Panel1: TPanel;
    edtSearch: TEdit;
    lstProjects: TListBox;
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure lstProjectsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIniFile: TIniFile;

    procedure AbrirProjeto;

    procedure LoadIniFile;
    procedure ListarProjetos;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FSDHistoryProjectsForms: TFSDHistoryProjectsForms;

procedure ShowHistoryProjects;

implementation

procedure ShowHistoryProjects;
begin
  if not Assigned(FSDHistoryProjectsForms) then
    FSDHistoryProjectsForms := TFSDHistoryProjectsForms.Create(nil);

  FSDHistoryProjectsForms.ShowModal;

end;

{$R *.dfm}

procedure TFSDHistoryProjectsForms.AbrirProjeto;
var
  projectPath : string;
  selecionado: string;
  index: integer;
begin
  index:= 0;

  if lstProjects.ItemIndex >= 0 then
     index:= lstProjects.ItemIndex;

  selecionado :=  lstProjects.Items[index];
  projectPath := (Copy(selecionado, Pos('|', selecionado) + 1, 5000)).Trim;

  (BorlandIDEServices as IOTAModuleServices).OpenModule(projectPath);

  ModalResult := mrOK;
end;

procedure TFSDHistoryProjectsForms.edtSearchChange(Sender: TObject);
begin
  listarProjetos;
end;

procedure TFSDHistoryProjectsForms.FormShow(Sender: TObject);
begin
  {$IF CompilerVersion >=32.0}
  (BorlandIDEServices as IOTAIDEThemingServices250)
    .RegisterFormClass(TFSDHistoryProjectsForms);
  {$ENDIF}

  listarProjetos;
end;

procedure TFSDHistoryProjectsForms.ListarProjetos;
var
  i: integer;
  sections : TStrings;
  projectName: string;
  fileName: string;
  search : String;
begin
  loadIniFile;
  lstProjects.Clear;
  search:= edtSearch.Text;

  sections := TStringList.Create;
  try
    FIniFile.ReadSections(sections);

    for i:=0 to Pred(sections.Count) do
    begin
      fileName:= sections[i];
      projectName :=  FIniFile.ReadString(sections[i], 'ProjectName', '');

      if not FileExists(fileName) then
        Continue;

      if (search.Trim.IsEmpty) or
         (fileName.ToLower.Contains(search)) or
         (projectName.ToLower.Contains(search))
     then
       lstProjects.Items.Add(projectName + ' | ' + fileName);

    end;

  finally
     sections.Free;
  end;

end;

procedure TFSDHistoryProjectsForms.LoadIniFile;
var
  iniFileName: string;
begin
  FreeAndNil(FIniFile);
  iniFileName := ExtractFilePath(GetModuleName(HInstance)) +
             '\SeniorDeveloper\HistoryProjects.ini';

  FIniFile := TIniFile.Create(iniFileName);
end;

procedure TFSDHistoryProjectsForms.lstProjectsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    AbrirProjeto;
end;

initialization

finalization
  FSDHistoryProjectsForms.Free;


end.
