unit FSD.NewProject.Wizard;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  WinApi.Windows,
  FSD.NewProjects.Forms,
  VCL.Dialogs;

type TFSDNewRepositoryWizard = class(TNotifierObject, IOTAWizard,
                                                      IOTAProjectWizard,
                                                      IOTARepositoryWizard)
  protected
     function GetIDString: string;
     function GetName: string;
     function GetState: TWizardState;

     { Launh the Addin }
     procedure Execute;
     function GetAuthor: string;
     function GetComment: string;
     function GetPage: string;
     { Handle to an Icon }
     function GetGlyph: Cardinal;

  public
    class function New : IOTAWizard;


end;

procedure RegisterRepositoryWizard;

implementation

procedure RegisterRepositoryWizard;
begin
  RegisterPackageWizard(TFSDNewRepositoryWizard.New);
end;

{ TFSDNewRepositoryWizard }

procedure TFSDNewRepositoryWizard.Execute;
begin
  FSDNewProjectForms := TFSDNewProjectForms.Create(nil);
  try
     FSDNewProjectForms.ShowModal;
  finally
     FSDNewProjectForms.Free;
  end;
end;

function TFSDNewRepositoryWizard.GetAuthor: string;
begin
  Result:= 'Mauricio Abreu - Conect Solutions';
end;

function TFSDNewRepositoryWizard.GetComment: string;
begin
  Result:= 'Criar Novo Projeto com estrutura MVC';
end;

function TFSDNewRepositoryWizard.GetGlyph: Cardinal;
begin
  Result:= LoadIcon(HInstance, 'delphi_ico');
end;

function TFSDNewRepositoryWizard.GetIDString: string;
begin
  Result:= Self.ClassName;
end;

function TFSDNewRepositoryWizard.GetName: string;
begin
   Result := 'Novo Projeto';
end;

function TFSDNewRepositoryWizard.GetPage: string;
begin
  Result := 'Estagiário Eletrônico';
end;

function TFSDNewRepositoryWizard.GetState: TWizardState;
begin
  Result:= [];
end;

class function TFSDNewRepositoryWizard.New: IOTAWizard;
begin
  Result := Self.Create;
end;

end.
