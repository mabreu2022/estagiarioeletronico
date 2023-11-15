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
  resPackageName = 'Estagiário Eletrônico';
  resLicense = 'Versão Free';
  resAboutCopyright = 'Copyright Conect Solutions em Serviços em TI Ltda.';
  resAboutTitle = 'Estagiário Eletrônico By Conect Solutions';
  resAboutDescription = 'Estagiário Eletrônico é um OTA para Delphi' +
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
