unit FSD.NewProject.NewFormMain.Creator;

interface

Uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  FSD.NewProject.NewFormMain.SourceFile;

type TFSDNewProjectNewFormMainCreator = class(TNotifierObject, IOTACreator,
                                                               IOTAModuleCreator)

  private
    FNamespace: string;

  protected
     function GetCreatorType: string;
     function GetExisting: Boolean;
     function GetFileSystem: string;
     function GetOwner: IOTAModule;
     function GetUnnamed: Boolean;

     function GetAncestorName: string;
     function GetImplFileName: string;
     function GetIntfFileName: string;
     function GetFormName: string;
     function GetMainForm: Boolean;
     function GetShowForm: Boolean;
     function GetShowSource: Boolean;
     function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
     function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
     function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
     procedure FormCreated(const FormEditor: IOTAFormEditor);

  public
    constructor create(Path, Namespace: string);
    class function New(Path, Namespace: string): IOTACreator;
end;


implementation


{ TFSDNewProjectNewFormMainCreator }

constructor TFSDNewProjectNewFormMainCreator.create(Path, Namespace: string);
var
  module : IOTAModule;
  unitFileName: string;
  unitPath: string;
begin
  FNamespace   := Namespace;
  unitPath     := Path + 'src\View\';
  unitFileName := unitPath + FNamespace + '.View.Main.pas';

  module := (BorlandIDEServices as IOTAModuleServices).createModule(Self);
  module.FileName :=  unitFileName;
  module.Save(False, True);
end;

procedure TFSDNewProjectNewFormMainCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin

end;

function TFSDNewProjectNewFormMainCreator.GetAncestorName: string;
begin
  Result:= 'TForm';
end;

function TFSDNewProjectNewFormMainCreator.GetCreatorType: string;
begin
   result:= sForm;
end;

function TFSDNewProjectNewFormMainCreator.GetExisting: Boolean;
begin
  Result:= False;
end;

function TFSDNewProjectNewFormMainCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TFSDNewProjectNewFormMainCreator.GetFormName: string;
begin
  Result := '';
end;

function TFSDNewProjectNewFormMainCreator.GetImplFileName: string;
begin
  Result := '';
end;

function TFSDNewProjectNewFormMainCreator.GetIntfFileName: string;
begin
  Result := '';
end;

function TFSDNewProjectNewFormMainCreator.GetMainForm: Boolean;
begin
  Result := True;
end;

function TFSDNewProjectNewFormMainCreator.GetOwner: IOTAModule;
begin
  Result:= GetActiveProject;
end;

function TFSDNewProjectNewFormMainCreator.GetShowForm: Boolean;
begin
  Result := True;
end;

function TFSDNewProjectNewFormMainCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TFSDNewProjectNewFormMainCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

class function TFSDNewProjectNewFormMainCreator.New(Path,
  Namespace: string): IOTACreator;
begin
  Result := Self.create(Path, Namespace);
end;

function TFSDNewProjectNewFormMainCreator.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TFSDNewProjectNewFormMainSourceDFM.New(FNamespace);
end;

function TFSDNewProjectNewFormMainCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
   Result := TFSDNewProjectNewFormMainSourcePAS.New(FNamespace);
end;

function TFSDNewProjectNewFormMainCreator.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin

end;

end.
