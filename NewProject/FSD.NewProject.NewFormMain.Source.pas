unit FSD.NewProject.NewFormMain.Source;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

type TFSDNewProjectNewFormMainSourceDFM = class(TNotifierObject, IOTAFIle)

   private
     FNAmespace: string;
   protected
     function GetSource: string;
     function GetAge: TDateTime;
   public
     constructor create(Namespace: String);
     class function New(Namespace: String): IOTAFile;
end;

implementation

{ TFSDNewProjectNewFormMainSourceDFM }

constructor TFSDNewProjectNewFormMainSourceDFM.create(Namespace: String);
begin
  FNamespace:= Namespace;
end;

function TFSDNewProjectNewFormMainSourceDFM.GetAge: TDateTime;
begin
  result:= -1;
end;

function TFSDNewProjectNewFormMainSourceDFM.GetSource: string;
begin
  with TStringList.Create do
  try
    Add('object %0:sViewMain: T%0:sViewMain                ');
    Add('         Left = 0                                 ');
    Add('         Top  = 0                                 ');
    Add('         BorderStyle = bsDialog                   ');
    Add('         ClientHeigth = 334                       ');
    Add('         ClientWidth  = 705                       ');
    Add('         Color = clBtnFace                        ');
    Add('         Font.CharSet = DEFAULT_CHARSET           ');
    Add('         Font.Color = clWindowsText               ');
    Add('         Font.Height = -19                        ');
    Add('         Font.Name = ''Segoe UI''                 ');
    Add('         Font.Style = []                          ');
    Add('         OldCreateOrder = False                   ');
    Add('         Position = poScreenCenter                ');
    Add('         PixelsPerInch = 96                       ');
    Add('         TextHeight = 25                          ');
    Add('         object pnlTop: TPanel                    ');
    Add('           AlignWithMargins = True                ');
    Add('           Left = 10                              ');
    Add('           Top = 3                                ');
    Add('           Width = 85                             ');
    Add('           Heigth = 35                            ');
    Add('           Margins.Left = 10                      ');
    Add('           Align = alLeft                         ');
    Add('           Caption = ''%0:s''                     ');
    Add('           Font.Charset = DEFAULT_CHARSET         ');
    Add('           Font.Color = clWindowText              ');
    Add('           Font.Height = -24                      ');
    Add('           Font.Name = ''Segoe UI''               ');
    Add('           Font.Style = []                        ');
    Add('           ParentFont = False                     ');
    Add('           Layout = tlCenter                      ');
    Add('           ExplicitHeight = 32                    ');
    Add('         End                                      ');
    Add('       End                                        ');
    Add('     end                                          ');

    result := Format(Text, [FNamespace]);
  finally
    Free;
  end;
end;

class function TFSDNewProjectNewFormMainSourceDFM.New(
  Namespace: String): IOTAFile;
begin
  result := Self.create(Namespace);
end;

end.
