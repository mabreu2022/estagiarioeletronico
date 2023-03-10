unit FSD.NewProject.Creator;

interface

Uses
  ToolsAPI,
  PlatformAPI,
  DCCStrs,
  System.SysUtils,
  System.Classes,
  FSD.NewProject.NewUnit.Behaviors,
  FSD.NewProject.NewUnit.Component.ConnectionInterfaces,
  FSD.NewProject.NewUnit.Component.ConnectionFiredac,
  FSD.NewProject.NewFormMain.Creator;

type TFSDNewProjectCreator = class(TNotifierObject, IOTACreator,
                                                    IOTAProjectCreator,
                                                    IOTAProjectCreator80,
                                                    IOTAProjectCreator160)
  private
     FProjectName: string;
     FNameSpace: string;
     FPath: string;

  protected

      //IOTACREATOR
      function GetCreatorType: string;
      function GetExisting: Boolean;
      function GetFileSystem: string;
      function GetOwner: IOTAModule;
      function GetUnnamed: Boolean;


      // IOTAPROJECTCREATOR
      function GetFileName: string;
      function GetOptionFileName: string; deprecated;
      function GetShowSource: Boolean;
      procedure NewDefaultModule; deprecated;
      function NewOptionSource(const ProjectName: string): IOTAFile; deprecated;
      procedure NewProjectResource(const Project: IOTAProject);
      function NewProjectSource(const ProjectName: string): IOTAFile;
      procedure NewDefaultProjectModule(const Project: IOTAProject);
      function GetProjectPersonality: string;


      function GetFrameworkType: string;
      function GetPlatforms: TArray<string>;
      function GetPreferredPlatform: string;
      procedure SetInitialOptions(const NewProject: IOTAProject);

      public
         constructor create(ProjectName, NameSpace, Path : string);
         class function New(ProjectName, NameSpace, Path : string): IOTAPRojectCreator;
end;

implementation

uses
  FSD.NewProject.SourceFile;

{ TFSDNewProjectCreator }

constructor TFSDNewProjectCreator.create(ProjectName, NameSpace, Path: string);
begin
  FProjectName := ProjectName;
  FNameSpace   := NameSpace;
  FPath        := Path;
end;

function TFSDNewProjectCreator.GetCreatorType: string;
begin
  Result:= sApplication;
end;

function TFSDNewProjectCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TFSDNewProjectCreator.GetFileName: string;
begin
  Result := FPath + FProjectName + '.dpr';
end;

function TFSDNewProjectCreator.GetFileSystem: string;
begin
  Result:= EmptyStr;
end;

function TFSDNewProjectCreator.GetFrameworkType: string;
begin
  Result := 'VCL';
end;

function TFSDNewProjectCreator.GetOptionFileName: string;
begin
  Result:= EmptyStr;
end;

function TFSDNewProjectCreator.GetOwner: IOTAModule;
begin
   Result := (BorlandIDEServices as IOTAModuleServices).MainProjectGroup;
end;

function TFSDNewProjectCreator.GetPlatforms: TArray<string>;
begin
  SetLength(Result, 0);
end;

function TFSDNewProjectCreator.GetPreferredPlatform: string;
begin
  Result := '';
end;

function TFSDNewProjectCreator.GetProjectPersonality: string;
begin
  result := sDelphiPersonality;
end;

function TFSDNewProjectCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TFSDNewProjectCreator.GetUnnamed: Boolean;
begin
   Result:= True;
end;

class function TFSDNewProjectCreator.New(ProjectName, NameSpace, Path: string): IOTAPRojectCreator;
begin
  Result:= Self.create(PRojectName, NameSpace, Path);
end;

procedure TFSDNewProjectCreator.NewDefaultModule;
begin

end;

procedure TFSDNewProjectCreator.NewDefaultProjectModule(
  const Project: IOTAProject);
begin

end;

function TFSDNewProjectCreator.NewOptionSource(const ProjectName: string): IOTAFile;
begin

end;

procedure TFSDNewProjectCreator.NewProjectResource(const Project: IOTAProject);
begin
end;

function TFSDNewProjectCreator.NewProjectSource(const ProjectName: string): IOTAFile;
begin

end;

procedure TFSDNewProjectCreator.SetInitialOptions(const NewProject: IOTAProject);
var
  config : IOTAProjectOptionsConfigurations;
  build  : IOTABuildConfiguration;
  verInfoKeys: String;

begin
{https://stackoverflow.com/questions/1083334/how-to-specify-msbuild-output-folder}
{https://stackoverflow.com/questions/2373991/what-are-the-msbuild-project-level-properties-for-delphi}

verInfoKeys := 'CompanyName=;FileDescription=$(MSBuildProjectName);' +
             'FileVersion=1.0.0.0;InternalName=;LegalCopyright=;LegalTrademarks=;' +
             'OriginalFilename=;ProgramID=com.embarcadero.$(MSBuildProjectName);' +
             'ProductName=$(MSBuildProjectName);ProductVersion=1.0.0.0;Comments=;' +
             'Namespace=' + FNamespace;    //Não funcionou o NameSpace não apareceu

  config := (NewProject.ProjectOptions as IOTAProjectOptionsConfigurations);
  build  := config.BaseConfiguration;

  build.SetValue(sDUPLICATE_CTOR_DTOR, 'false');
  build.SetValue(sExeOutput, Self.FPath);
  build.SetValue('VerInfo_IncludeVerInfo', 'true');
  build.SetValue('VerInfo_Keys', verInfoKeys);

  CreateUnitBehaviors(FPath, FNameSpace);
  CreateUnitComponentConnectionInterfaces(FPath, FNameSpace);
  CreateUnitComponentConnectionFiredac(FPath, FNameSpace);


  TFSDNewProjectNewFormMainCreator.New(FPath, FNameSpace);

end;

end.
