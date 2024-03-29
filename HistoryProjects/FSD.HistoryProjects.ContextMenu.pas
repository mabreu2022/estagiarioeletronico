unit FSD.HistoryProjects.ContextMenu;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  FSD.HistoryProjects.Forms;

type TFSDHistoryProjectsContextMenu = class(TNotifierObject, IOTAPRojectMenuItemCreatorNotifier)

  protected
     procedure AddMenu(const Project: IOTAProject;
                       const IdentList: TStrings;
                       const ProjectManagerMenuList: IInterfaceList;
                             IsMultiSelect: Boolean);
  public
    class function New: IOTAProjectMenuItemCreatorNotifier;
end;

  TFSDHistoryProjectsItemMenu = class(TNotifierObject, IOTALocalMenu, IOTAProjectManagerMenu)
    protected
      function GetCaption: string;
      function GetChecked: Boolean;
      function GetEnabled: Boolean;
      function GetHelpContext: Integer;
      function GetName: string;
      function GetParent: string;
      function GetPosition: Integer;
      function GetVerb: string;
      procedure SetCaption(const Value: string);
      procedure SetChecked(Value: Boolean);
      procedure SetEnabled(Value: Boolean);
      procedure SetHelpContext(Value: Integer);
      procedure SetName(const Value: string);
      procedure SetParent(const Value: string);
      procedure SetPosition(Value: Integer);
      procedure SetVerb(const Value: string);
      function GetIsMultiSelectable: Boolean;
      procedure SetIsMultiSelectable(Value: Boolean);
      procedure Execute(const MenuContextList: IInterfaceList); overload;
      function PreExecute(const MenuContextList: IInterfaceList): Boolean;
      function PostExecute(const MenuContextList: IInterfaceList): Boolean;

  public
     class function New: IOTAProjectManagerMenu;
  end;

var
  index: integer  = - 1;

procedure RegisterContextMenuHistoryProjects;

implementation

procedure RegisterContextMenuHistoryProjects;
begin
  index:= (BorlandIDEServices as IOTAProjectManager)
     .AddMenuItemCreatorNotifier(TFSDHistoryProjectsContextMenu.New);
end;

{ TFSDHistoryProjectsContextMenu }

procedure TFSDHistoryProjectsContextMenu.AddMenu(const Project: IOTAProject;
                                                 const IdentList: TStrings;
                                                 const ProjectManagerMenuList: IInterfaceList;
                                                       IsMultiSelect: Boolean);
begin
  if (IdentList.IndexOf(sProjectGroupContainer)) < 0 then
    Exit;

  ProjectManagerMenuList.Add(TFSDHistoryProjectsItemMenu.New);

end;

class function TFSDHistoryProjectsContextMenu.New: IOTAProjectMenuItemCreatorNotifier;
begin
  Result := Self.Create;
end;

{ TFSDHistoryProjectsItemMEnu }

procedure TFSDHistoryProjectsItemMEnu.Execute(const MenuContextList: IInterfaceList);
begin
  ShowHistoryProjects;
end;

function TFSDHistoryProjectsItemMEnu.GetCaption: string;
begin
  Result := 'History Projects';
end;

function TFSDHistoryProjectsItemMEnu.GetChecked: Boolean;
begin
  Result := False;
end;

function TFSDHistoryProjectsItemMEnu.GetEnabled: Boolean;
begin
  Result := True;
end;

function TFSDHistoryProjectsItemMEnu.GetHelpContext: Integer;
begin
  Result := 0;
end;

function TFSDHistoryProjectsItemMEnu.GetIsMultiSelectable: Boolean;
begin
   Result := False;
end;

function TFSDHistoryProjectsItemMEnu.GetName: string;
begin
  Result := Self.ClassName;
end;

function TFSDHistoryProjectsItemMEnu.GetParent: string;
begin
  Result := '';
end;

function TFSDHistoryProjectsItemMEnu.GetPosition: Integer;
begin
  Result := pmmpAddExistingTarget + 100;
end;

function TFSDHistoryProjectsItemMEnu.GetVerb: string;
begin
  Result := 'HistoryProjects';
end;

class function TFSDHistoryProjectsItemMEnu.New: IOTAProjectManagerMenu;
begin
  Result := Self.Create;
end;

function TFSDHistoryProjectsItemMEnu.PostExecute(const MenuContextList: IInterfaceList): Boolean;
begin
  Result:= True;
end;

function TFSDHistoryProjectsItemMEnu.PreExecute(const MenuContextList: IInterfaceList): Boolean;
begin
  Result:= False;
end;

procedure TFSDHistoryProjectsItemMEnu.SetCaption(const Value: string);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetChecked(Value: Boolean);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetEnabled(Value: Boolean);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetHelpContext(Value: Integer);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetIsMultiSelectable(Value: Boolean);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetName(const Value: string);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetParent(const Value: string);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetPosition(Value: Integer);
begin

end;

procedure TFSDHistoryProjectsItemMEnu.SetVerb(const Value: string);
begin

end;

initialization

finalization
  (BorlandIDEservices as IOTAProjectManager)
    .removeMenuItemCreatorNotifier(Index);
end.
