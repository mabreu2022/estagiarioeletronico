unit FSD.MainMenu.Information;

interface

implementation

uses
  ToolsAPI, Windows, Graphics, SysUtils, DesignIntf;

const
  ICON_SPLASH = 'SPLASHICON';
  ICON_ABOUT = 'abouticon';

var
  AboutBoxServices: IOTAAboutBoxServices;
  AboutBoxIndex: Integer = 0;

  resourcestring
  resPackageName = 'Estagi�rio Eletr�nico';
  resLicense = 'Vers�o Free';
  resAboutCopyright = 'Copyright Conect Solutions em Servi�os em TI Ltda.';
  resAboutTitle = 'Estagi�rio Eletr�nico By Conect Solutions';
  resAboutDescription = 'Estagi�rio Eletr�nico � um OTA para Delphi' +
  'desenvolvido por Mauricio Abreu da Conect Solutions ';

procedure RegisterSplashScreen;
begin
  SplashScreenServices.AddPluginBitmap(resPackageName, LoadBitmap(HInstance,ICON_SPLASH), False, resLicense);
end;

procedure RegisterAboutBox;
begin
  if Supports(BorlandIDEServices,IOTAAboutBoxServices, AboutBoxServices) then
    AboutBoxIndex := AboutBoxServices.AddPluginInfo(resAboutTitle, resAboutCopyright + #13#10#13#10 + resAboutDescription, LoadBitmap(HInstance, ICON_ABOUT), False, resLicense);
end;

procedure UnregisterAboutBox;
begin
  if (AboutBoxIndex <> 0) and Assigned(AboutBoxServices) then
  begin
    AboutBoxServices.RemovePluginInfo(AboutBoxIndex);
    AboutBoxIndex := 0;
    AboutBoxServices := nil;
  end;
end;

initialization
  RegisterAboutBox;
  RegisterSplashScreen;

finalization
  UnRegisterAboutBox;

end.
