unit FSD.NewProject.NewUnit.Behaviors;

interface

Uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitBehaviors(ProjectPath, NameSpace : string);


implementation

procedure CreateUnitBehaviors(ProjectPath, NameSpace : string);
var
 unitName: string;
 unitPath: string;
 unitFileName: string;
begin
  unitPath := ProjectPath  + 'src\Model\Behaviors\';
  unitName := NameSpace + '.Model.Behaviors';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.Model.Behaviors;																');
    Add('                                                                                   ');
    Add('interface                                                                          ');
    Add('                                                                                   ');
    Add('uses                                                                               ');
    Add('  System.SysUtils,                                                                 ');
    Add('  System.UITypes,                                                                  ');
    Add('  Vcl.Dialogs,                                                                     ');
    Add('  Vcl.Forms;                                                                       ');
    Add('                                                                                   ');
    Add('type T%0:sBehaviors = class                                                        ');
    Add('                                                                                   ');
    Add('  private                                                                          ');
    Add('    procedure BehaviorException(Sender: TObject; E: Exception);                    ');
    Add('                                                                                   ');
    Add('  public                                                                           ');
    Add('    constructor create;                                                            ');
    Add('    destructor Destroy; override;                                                  ');
    Add('end;                                                                               ');
    Add('                                                                                   ');
    Add('var                                                                                ');
    Add('  ModelBehaviors : T%0:sBehaviors;                                                 ');
    Add('                                                                                   ');
    Add('implementation                                                                     ');
    Add('                                                                                   ');
    Add('{ T%0:sBehaviors }                                                                 ');
    Add('                                                                                   ');
    Add('procedure T%0:sBehaviors.BehaviorException(Sender: TObject; E: Exception);         ');
    Add('begin                                                                              ');
    Add('  MessageDlg(E.Message, mtWarning, [mbOK], 0);                                     ');
    Add('end;                                                                               ');
    Add('                                                                                   ');
    Add('constructor T%0:sBehaviors.create;                                                 ');
    Add('begin                                                                              ');
    Add('  ReportMemoryLeaksOnShutdown := True;                                             ');
    Add('  Application.OnException := BehaviorException;                                    ');
    Add('end;                                                                               ');
    Add('                                                                                   ');
    Add('destructor T%0:sBehaviors.Destroy;                                                 ');
    Add('begin                                                                              ');
    Add('                                                                                   ');
    Add('  inherited;                                                                       ');
    Add('end;                                                                               ');
    Add('                                                                                   ');
    Add('initialization                                                                     ');
    Add('  ModelBehaviors := T%0:sBehaviors.Create;                                         ');
    Add('                                                                                   ');
    Add('finalization                                                                       ');
    Add('  ModelBehaviors.DisposeOf;                                                        ');
    Add('                                                                                   ');
    Add('end.                                                                               ');

    Text := Format(Text, [Namespace, TGuid.NewGuid.ToString]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);

  finally
    Free;
  end;
end;

end.
