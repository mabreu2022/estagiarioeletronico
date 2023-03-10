unit FSD.NewProject.NewUnit.Component.ConnectionFiredac;

interface

Uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitComponentConnectionFiredac(ProjectPath, Namespace: string);

implementation

procedure CreateUnitComponentConnectionFiredac(ProjectPath, Namespace: string);
var
  unitName: string;
  unitPath: string;
  unitFileName: string;
begin
  unitPath := ProjectPath + '\src\Model\Components\Connection\';
  unitName := NameSpace + '.Components.Connection.Firedac';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.Components.Connection.Firedac;																							');
    Add('                                                                                                                                   ');
    Add('interface                                                                                                                          ');
    Add('                                                                                                                                   ');
    Add('uses                                                                                                                               ');
    Add('  %0:s.Components.Connection.Interfaces,                                                                                           ');
    Add('  FireDAC.Stan.Intf,                                                                                                               ');
    Add('  FireDAC.Stan.Option,                                                                                                             ');
    Add('  FireDAC.Stan.Error,                                                                                                              ');
    Add('  FireDAC.UI.Intf,                                                                                                                 ');
    Add('  FireDAC.Phys.Intf,                                                                                                               ');
    Add('  FireDAC.Stan.Def,                                                                                                                ');
    Add('  FireDAC.Stan.Pool,                                                                                                               ');
    Add('  FireDAC.Stan.Async,                                                                                                              ');
    Add('  FireDAC.Phys,                                                                                                                    ');
    Add('  FireDAC.Phys.SQLite,                                                                                                             ');
    Add('  FireDAC.Phys.SQLiteDef,                                                                                                          ');
    Add('  FireDAC.Stan.ExprFuncs,                                                                                                          ');
    Add('  FireDAC.VCLUI.Wait,                                                                                                              ');
    Add('  FireDAC.DApt,                                                                                                                    ');
    Add('  Data.DB,                                                                                                                         ');
    Add('  FireDAC.Comp.Client,                                                                                                             ');
    Add('  FireDAC.Stan.Param,                                                                                                              ');
    Add('  System.SysUtils,                                                                                                                 ');
    Add('  System.Classes;                                                                                                                  ');
    Add('                                                                                                                                   ');
    Add('type T%0:sComponentsConnectionFiredac = class(TInterfacedObject, I%0:sComponentsConnection)                                       ');
    Add('  private                                                                                                                          ');
    Add('    FConnection : TFDConnection;                                                                                                   ');
    Add('    FQuery : TFDQuery;                                                                                                             ');
    Add('  public                                                                                                                           ');
    Add('    constructor Create;                                                                                                            ');
    Add('    destructor Destroy; override;                                                                                                  ');
    Add('    class function New : I%0:sComponentsConnection;                                                                                ');
    Add('    function Active ( aValue : Boolean ) : I%0:sComponentsConnection;                                                              ');
    Add('    function AddParam ( aParam : String; aValue : Variant ) : I%0:sComponentsConnection; overload;                                 ');
    Add('    function AddParam ( aParam : String; aValue : TPersistent ) : I%0:sComponentsConnection; overload;                             ');
    Add('    function DataSet : TDataSet;                                                                                                   ');
    Add('    function ExecSQL : I%0:sComponentsConnection;                                                                                  ');
    Add('    function Open : I%0:sComponentsConnection;                                                                                     ');
    Add('    function SQL ( aValue : String ) : I%0:sComponentsConnection;                                                                  ');
    Add('    function SQLClear : I%0:sComponentsConnection;                                                                                 ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('implementation                                                                                                                     ');
    Add('                                                                                                                                   ');
    Add('{ T%0:sComponentsConnectionFiredac }                                                                                              ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.Active(aValue: Boolean): I%0:sComponentsConnection;                                     ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self;                                                                                                                  ');
    Add('  FQuery.Active := aValue;                                                                                                         ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.AddParam(aParam: String; aValue: Variant): I%0:sComponentsConnection;                   ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self;                                                                                                                  ');
    Add('  FQuery.ParamByName(aParam).Value := aValue;                                                                                      ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.AddParam(aParam: String; aValue: TPersistent): I%0:sComponentsConnection;               ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self;                                                                                                                  ');
    Add('  FQuery.ParamByName(aParam).Assign(aValue);                                                                                       ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('constructor T%0:sComponentsConnectionFiredac.Create;                                                                              ');
    Add('begin                                                                                                                              ');
    Add('  FConnection := TFDConnection.Create(nil);                                                                                        ');
    Add('  FQuery := TFDQuery.Create(nil);                                                                                                  ');
    Add('  FQuery.Connection := FConnection;                                                                                                ');
    Add('  FConnection.Params.DriverID := ''SQLite'';                                                                                         ');
    Add('  FConnection.Params.Database := ExtractFilePath(GetModuleName(HInstance)) + ''%0:s.db3'';                                           ');
    Add('  FConnection.Params.Add(''LockingMode=Normal'');                                                                                    ');
    Add('  FConnection.Connected;                                                                                                           ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.DataSet: TDataSet;                                                                      ');
    Add('begin                                                                                                                              ');
    Add('  Result := FQuery;                                                                                                                ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('destructor T%0:sComponentsConnectionFiredac.Destroy;                                                                              ');
    Add('begin                                                                                                                              ');
    Add('  FQuery.DisposeOf;                                                                                                                ');
    Add('  FConnection.DisposeOf;                                                                                                           ');
    Add('  inherited;                                                                                                                       ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.ExecSQL: I%0:sComponentsConnection;                                                     ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self;                                                                                                                  ');
    Add('  FQuery.ExecSQL;                                                                                                                  ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('class function T%0:sComponentsConnectionFiredac.New: I%0:sComponentsConnection;                                                   ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self.Create;                                                                                                           ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.Open: I%0:sComponentsConnection;                                                        ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self;                                                                                                                  ');
    Add('  FQuery.Open;                                                                                                                     ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.SQL(aValue: String): I%0:sComponentsConnection;                                         ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self;                                                                                                                  ');
    Add('  FQuery.SQL.Add(aValue);                                                                                                          ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('function T%0:sComponentsConnectionFiredac.SQLClear: I%0:sComponentsConnection;                                                    ');
    Add('begin                                                                                                                              ');
    Add('  Result := Self;                                                                                                                  ');
    Add('  FQuery.SQL.Clear;                                                                                                                ');
    Add('end;                                                                                                                               ');
    Add('                                                                                                                                   ');
    Add('end.                                                                                                                               ');

    Text := Format(Text, [Namespace]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);

    // Criar Arquivo de Banco SQLite
    with TStringList.Create do
    try
      SaveToFile(ProjectPath + Namespace + '.db3');
    finally
      Free;
    end;
  finally
    Free;
  end;
end;

end.
