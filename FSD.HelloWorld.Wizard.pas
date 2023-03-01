unit FSD.HelloWorld.Wizard;

interface

uses
  ToolsApi,
  Vcl.Dialogs;

type TFSDHelloWorldWizard = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)

  protected
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;

    function GetMenuText: string;

    { Launh the AddIn }
    procedure Execute;

  public
    class function New: IOTAWizard;
end;

procedure RegisterHelloWorldWizard;

implementation

procedure RegisterHelloWorldWizard;
begin
  RegisterPackageWizard(TFSDHelloWorldWizard.New);
end;

{ TFSDHelloWorldWizard }

procedure TFSDHelloWorldWizard.Execute;
begin
  ShowMessage('Hello World');
end;

function TFSDHelloWorldWizard.GetIDString: string;
begin
  Result:='HelloWorld';
end;

function TFSDHelloWorldWizard.GetMenuText: string;
begin
  result := 'Hello World';
end;

function TFSDHelloWorldWizard.GetName: string;
begin
  Result:= 'Hello Wolord'; //nome do Wizard
end;

function TFSDHelloWorldWizard.GetState: TWizardState;
begin
  result:= [wsEnabled];   //retorna o estado do Wizard
end;

class function TFSDHelloWorldWizard.New: IOTAWizard;
begin
  result := Self.Create;
end;

end.
