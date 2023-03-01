unit FSD.NewProject.SourceFile;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

type  TFSDNewProjectSourceFile = class(TNotifierObject, IOTAFILE)

  private
    FPRojectName: string;

  protected
     function GetSource: string;
     function GetAge: TDateTime;

  public
    constructor create(PRojectName: string);
    class function New(ProjectName: string): IOTAFILE;
end;


implementation

{ TFSDNewProjectSourceFile }

constructor TFSDNewProjectSourceFile.create(PRojectName: string);
begin
  FPRojectName := ProjectName;
end;

function TFSDNewProjectSourceFile.GetAge: TDateTime;
begin
  Result:= -1;
end;

function TFSDNewProjectSourceFile.GetSource: string;
begin
  result :=
    'program %0:s;' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  //Formação Sênior Developer ' + sLineBreak +
    '  VCL.Forms, ' + sLineBreak +
    '  System.SysUtils, ' + sLineBreak +
    '  System.Classes; ' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  Application.Initialize;' + sLineBreak +
    '  Application.MainFormOnTaskBar := True;' + sLineBreak +
    '  Application.Run;' + sLineBreak +
    'end.';

   result:= Format(result, [FProjectName]);

end;

class function TFSDNewProjectSourceFile.New(ProjectName: string): IOTAFILE;
begin
  Result:= Self.Create(PRojectName);
end;

end.
