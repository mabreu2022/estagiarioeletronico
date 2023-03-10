unit FSD.HistoryProjects.Binding;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  FSD.HistoryProjects.Forms, 
  Vcl.Menus;

type  TFSDHistoryPprojectsBinding = class(TNotifierObject, IOTAKeyboardBinding)

  private
    procedure Execute (const Context: IOTAKeyContext; KeyCode: TShortcut;
                       var BindingResult: TKeyBindingResult);

  protected
    function GetBindingType: TBindingType;
    function GetDisplayName: string;
    function GetName: string;
    procedure BindKeyboard(const BindingServices: IOTAKeyBindingServices);

  public
    class function New:  IOTAKeyboardBinding;
end;

var
   Index: Integer = -1;

procedure RegisterKeyBindingHistory;


implementation

procedure RegisterKeyBindingHistory;
begin
  Index := (BorlandIDEServices as IOTAKeyboardServices)
    .AddKeyboardBinding(TFSDHistoryPprojectsBinding.New);
end;

{ TFSDHistoryPprojectsBinding }

procedure TFSDHistoryPprojectsBinding.BindKeyboard(const BindingServices: IOTAKeyBindingServices);
begin
   BindingServices.AddKeyBinding([TextToShortCut('Ctrl+Shift+P')],
     Execute, 0, 0, '', 'imHistoricoProjetos');
end;

procedure TFSDHistoryPprojectsBinding.Execute(const Context: IOTAKeyContext;
  KeyCode: TShortcut; var BindingResult: TKeyBindingResult);
begin
  BindingResult := krHandled;
  ShowHistoryProjects;
end;

function TFSDHistoryPprojectsBinding.GetBindingType: TBindingType;
begin
  Result := TBindingType.btPartial;
end;

function TFSDHistoryPprojectsBinding.GetDisplayName: string;
begin
   result := Self.ClassName;
end;

function TFSDHistoryPprojectsBinding.GetName: string;
begin
  result := Self.ClassName;
end;

class function TFSDHistoryPprojectsBinding.New: IOTAKeyboardBinding;
begin
  result := Self.Create;
end;

initialization

finalization
  (BorlandIDEServices as IOTAKeyBoardServices)
    .RemoveKeyboardBinding(Index); 

end.
