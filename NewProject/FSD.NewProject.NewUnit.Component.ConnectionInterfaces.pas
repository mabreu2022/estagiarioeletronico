unit FSD.NewProject.NewUnit.Component.ConnectionInterfaces;

interface

Uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitComponentConnectionInterfaces(ProjectPath, NameSpace: string);

implementation


procedure CreateUnitComponentConnectionInterfaces(ProjectPath, NameSpace: string);
var
  unitName: string;
  unitPath: string;
  unitFileName: string;
begin
   unitPath := ProjectPath + '\src\Model\Components\Connection\';
   unitName := NameSpace + '.Components.Connection.Interfaces';
   unitFileName := unitPath + unitName + '.pas';

   ForceDirectories(unitPath);

   with TStringList.Create do
  try
    Add('unit %0:s.Components.Connection.Interfaces;');
    Add('');
    Add('interface');
    Add('');
    Add('uses');
    Add('  Data.DB, ');
    Add('  System.SysUtils,');
    Add('  System.Classes;');
    Add('');
    Add('type');
    Add('  I%0:sComponentsConnection = interface');
    Add('    [''%1:s'']');
    Add('    function Active ( aValue : Boolean ) : IEstoqueComponentsConnection;');
    Add('    function AddParam ( aParam : String; aValue : Variant ) : IEstoqueComponentsConnection; overload;');
    Add('    function AddParam ( aParam : String; aValue : TPersistent ) : IEstoqueComponentsConnection; overload;');
    Add('    function DataSet : TDataSet;');
    Add('    function ExecSQL : IEstoqueComponentsConnection;');
    Add('    function Open : IEstoqueComponentsConnection;');
    Add('    function SQL ( aValue : String ) : IEstoqueComponentsConnection;');
    Add('    function SQLClear : IEstoqueComponentsConnection;');
    Add('  end;');
    Add('');
    Add('implementation');
    Add('');
    Add('end.');

    Text := Format(Text, [Namespace, TGuid.NewGuid.ToString]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);

  finally
    Free;
  end;
end;

end.
