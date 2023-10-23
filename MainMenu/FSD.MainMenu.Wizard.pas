unit FSD.MainMenu.Wizard;

interface

uses
  ToolsAPI,
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Winapi.ShellAPI,
  FSD.HistoryProjects.Forms,
  Vcl.Graphics,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.Clipbrd,
  StdCtrls,
  IniFiles;


type TFSDMainMenuWizard = class(TNotifierObject, IOTAWizard)
  private
     FImageSQLite: integer;
     FImageMySQL: Integer;
     FImagePostGres: integer;
     FImagePostMan: integer;
     FChatGpt: integer;
     FAnalisarHints: integer;
     FImageFireBird: integer;
     FImageIbExpert: integer;
     FSQLServerManagerStudio: integer;
     FForumDelphi: integer;
     FLingua: string;

     function GetWindowsDefaultLanguage: string;

     procedure CreateMenu;

     procedure OnClickNovoWizard(Sender: TObject);
     procedure OnClickDocWiki(Sender: TObject);
     //procedure OnClickLoja(Sender: TObject);
     procedure OnClickMenuHistoryProjects(Sender: TObject);

     {Vagas}
     procedure OnClickVagasDelphi(Sender: TObject);

     {Utilitários}
     procedure OnClickSQLite(Sender: TObject);
     procedure OnClickMySQL(Sender: TObject);
     procedure OnClickForumDelphi(Sender: TObject);
     procedure OnClickPostGres(Sender: TObject);
     procedure OnClickPostman(Sender: TObject);
     procedure OnClickChatGPT(Sender: TObject);
     procedure OnClickAnalisarHints(Sender: TObject);
     procedure OnClickIBExpert(Sender: TObject);
     procedure OnClickSQLSErverManagerStudio(Sender: TObject);
     procedure OnClickJSONtoDelphiClass(Sender: TObject);
     procedure OnClickJSONFormater(Sender: TObject);
     procedure OnClickIconFinder(Sender: TObject);
     procedure OnClickIcons8(Sender: TObject);
     procedure OnClickAcoplamentosUnits(Sender: TObject);
     procedure OnClickimGetIt(Sender: TObject);


     {Cursos}
     procedure OnClickNutror(Sender: TOBject);
     procedure OnClickNovoEAD(Sender: TObject);
     procedure OnClickDevPoint(Sender: TObject);
     procedure OnclickGitHubBozon(Sender: TObject);
     procedure OnclickPostGresBozon(Sender: TObject);

     {YouTube}
     procedure OnClickEmbarcaderoBrasil(Sender: TObject);
     procedure OnClickEmbarcadero(Sender: TObject);
     procedure onClickYouTubeConectSolutions(Sender: Tobject);
     procedure onClickVoiceEnabledApp(Sender: TObject);
     procedure OnClickGitHubCurso(Sender: TObject);
     procedure OnClickCursoApiREst(Sender: TObject);
     procedure OnClickOpenToosAPI(Sender: TObject);
     procedure OnClickBossSSH(Sender: TObject);
     procedure OnClickDelphicon2023_day1(Sender: TObject);
     procedure OnClickDelphicon2023_day2(Sender: TObject);
     procedure OnClickDelphicon2023_day3(Sender: TObject);
     procedure OnClickmqfb(Sender: TObject);
     procedure OnClickChapmanWorld(Sender: TObject);

     procedure OnClickOTA(Sender: TObject);
     procedure OnclickDelphiBasics(Sender: TObject);

     procedure OnClickHorseBasicAuth(Sender: TObject);
     procedure OnClickHandleException(Sender: TObject);
     procedure OnClickHorseJWT(Sender: TObject);

     {Git Hubs}
     procedure OnClickSynopseSynPDF(Sender: TObject);
     procedure OnClickNewAudio(Sender: TObject);
     procedure OnClickRedisClient(Sender: TObject);
     procedure OnClickFireBase4Delphi(Sender: TObject);
     procedure OnClickTurboPackVCL(Sender: TObject);
     procedure OnClickFortesReportCE(Sender: TObject);
     procedure OnClickDelphiJose(Sebder: TObject);
     procedure OnClickXPAD(Sender: TObject);
     procedure OnClickHorse(Sender: TObject);
     procedure OnClickSimpleORM(Sender: TObject);
     procedure OnClickHorseETag(Sender: TObject);
     procedure OnClickDelphiMVCFrameWork(Sender: TObject);
     procedure OnclickJEDIJCL(Sender: TObject);
     procedure OnclickJEDIJVCL(Sender: TObject);
     procedure OnclickJediInc(Sender: TObject);
     procedure OnclickDelphiMessageBus(Sender: TObject);
     procedure OnclickDelphiDocker(Sender: TObject);
     procedure OnclickEmbarcaderoGitHub(Sender: TObject);
     procedure OnclickChromiumGitHub(Sender: TObject);
     procedure OnclickSkia4Delphi(Sender: TObject);
     procedure OnclickUserControl(Sender: TObject);
     procedure OnclickAeggys(Sender: TObject);

     {Blogs}
     procedure OnClickBlogConectSolutions(Sender: TObject);
     procedure OnClickBlogAndreCelestino(Sender: TObject);
     procedure OnClickBlogEmbarcadero(Sender: TObject);
     procedure OnClickBlogMarcoCantu(Sender: TObject);
     procedure OnClickBlogZettaOmmnis(Sender: TObject);
     procedure OnClickBlogChapmanWorld(Sender: TObject);
     procedure OnClickBlogRoadToDelphi(Sender: TObject);
     procedure OnClickBlogLandgrafDev(Sender: TObject);
     procedure OnClickBlogStephenBalls(Sender: TObject);
     procedure OnClickBlogKonopka(Sender: TObject);
     procedure OnClickBlogAndys(Sender: TObject);

     {Ferramentas para Download}
     procedure OnClickFerramentasIbExpert(Sender: TObject);
     procedure OnClickFerramentasFirebird(Sender: TObject);
     procedure OnClickFerramentasMySQL(Sender: TObject);
     procedure OnClickFerramentasSQLiteExpert(Sender: TObject);
     procedure OnClickFerramentasInnoSetup(Sender: TObject);
     procedure OnClickFerramentasCNPack(Sender: TObject);
     procedure OnClickFerramentasInnoScriptStudio(Sender: TObject);
     procedure OnClickFerramentasInsomnia(Sender: TObject);
     procedure OnClickFerramentasNavicat(Sender: TObject);
     procedure OnClickFerramentasIdeFixPack(Sender: TObject);
     procedure OnClickFerramentasToolsFree(Sender: TObject);
     procedure OnClickFerramentasSiteGitIgnore(Sender: TObject);
     procedure OnClickFerramentasSiteRegexLib(Sender: TObject);
     procedure OnClickFerramentasGoogleMeeting(Sender: TObject);


     {Grupos de Facebook}
     procedure OnClickFacebookDelphiTips(Sender: TObject);
     procedure OnClickFacebookLiteratudaDelphi(Sender: TObject);

     {Livros}
     procedure OnClickLivroDelphiAndroid(Sender: TObject);
     procedure OnClickLivroObjectPascal(Sender: TObject);



     function CreateSubMenu(AParent: TMenuItem;
                            ACaption: String;
                            AName: String;
                            AOnClick: TNotifyEvent;
                            AImageIndex: Integer = -1): TMenuItem;

     procedure AddImageToImageList;
     procedure OnClickYouTube(Sender: TObject);
     procedure VoiceEnabledApp(Sender: TObject);



  protected
     function GetIDString: string;
     function GetName: string;
     function GetState: TWizardState;


    { Launh the AddIn }
    procedure Execute;

  public

  constructor create;
end;

  procedure RegisterMenuWizard;

implementation

procedure RegisterMenuWizard;
begin
  RegisterPackageWizard(TFSDMainMenuWizard.create);
end;

{ TFSDMainMenuWizard }

procedure TFSDMainMenuWizard.AddImageToImageList;  //Foi criada uma variável para cada imagem e não deveria
var
  bitmap: TBitMap;
begin
  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'sqlite');
    FImageSQLite := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_sqlite');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'mysql');
    FImageMySQL := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_mysql');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'postgres');
    FImagePostGres := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_postgres');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'postman');
    FImagePostMan := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_postman');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'chatgpt');
    FChatGpt := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_chatgpt');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'analisarhints');
    FAnalisarHints := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_analisarhints');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'ibexpert');
    FImageIbExpert := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_ibexpert');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'sqlserver');
    FSQLServerManagerStudio := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_sqlserver');
  finally
    bitmap.Free;
  end;

  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'forumdelphi');
    FForumDelphi := (BorlandIDEServices as INTAServices).AddMasked(bitmap, bitmap.TransparentColor, 'img_forumdelphi');
  finally
    bitmap.Free;
  end;

end;

constructor TFSDMainMenuWizard.create;
begin
  AddImageToImageList;
  createMenu;
end;

procedure TFSDMainMenuWizard.CreateMenu;
var
  menu: TMainMenu;
  menuName: string;
  itemFormacao: TMenuItem;
  itemUtilitarios: TMenuItem;
  itemCursos: TMenuItem;
  itemGitHubs: TMenuItem;
  itemYoutube: TMenuItem;
  itemAPI: TMenuItem;
  itemBlogs: TMenuItem;
  itemGruposFaceBook: TMenuItem;
  itemFerramentas: TMenuItem;
  itemLivros: TMenuItem;
  itemLoja: TMenuItem;
  itemVagas: TMenuItem;

  Lingua: string;
begin
  menu := (BorlandIDEServices as INTAServices).MainMenu;
  menuName := 'Informacao';

  if menu.FindComponent(menuName) <> nil then
    menu.FindComponent(menuName).Free;

  itemFormacao := TMenuItem.Create(menu);
  itemFormacao.Name := menuName;
  itemFormacao.Caption := 'Estagiário Eletrônico';

  menu.Items.Add(itemFormacao);

 // CreateSubMenu(itemFormacao, 'Novo Wirzard', 'imNovoWizard', OnClickNovoWizard);
  CreateSubMenu(itemFormacao, 'Histórico Projetos', 'imHistoricoProjetos', OnclickMenuHistoryProjects);
  CreateSubMenu(itemFormacao, 'Embarcadero Doc Wiki', 'imDocWiki', OnClickDocWiki);
  CreateSubMenu(itemFormacao, 'Transmitir via Google Meeting', 'imFerramentasGoogleMeeeting', OnClickFerramentasGoogleMeeting);

  //CreateSuBMenu(itemFormacao, 'Loja', 'imLoja', OnClickLoja);

  {Livros} //Recurso de Linguagem ainda em testes.
  FLingua:= GetWindowsDefaultLanguage;
  if FLingua <> 'Português(Brasil)' then
  begin
    itemLivros := CreateSubMenu(itemFormacao, 'Livros de Delphi (Compras)', 'imLivros', nil);
    CreateSubMenu(itemLivros, 'Delphi para Android e iOS: Desenvolvendo Aplicativos Móveis', 'imLivrosDelphiAndroid', OnClickLivroDelphiAndroid);
    CreateSubMenu(itemLivros, 'Object Pascal Para Delphi', 'imLivrosObjectPascal', OnClickLivroObjectPascal);
  end
  else
  begin
    itemLivros := CreateSubMenu(itemFormacao, 'Books Delphi (Buy)', 'imLivros', nil);
    CreateSubMenu(itemLivros, 'Delphi for Android and iOS: Desenvolvendo Aplicativos Móveis', 'imLivrosDelphiAndroid', OnClickLivroDelphiAndroid);
    CreateSubMenu(itemLivros, 'Object Pascal for Delphi', 'imLivrosObjectPascal', OnClickLivroObjectPascal);
  end;

  {Ferramentas para Download}
  itemFerramentas := CreateSubMenu(itemFormacao, 'Ferramentas para Download', 'imFerramentas', nil);
  CreateSubMenu(itemFerramentas, 'IbExpert', 'imFerramentasIbExpert', OnClickFerramentasIbExpert);
  CreateSubMenu(itemFerramentas, 'Firebird', 'imFerramentasFirebird', OnClickFerramentasFirebird);
  CreateSubMenu(itemFerramentas, 'MySQL', 'imFerramentasMySQL', OnClickFerramentasMySQL);
  CreateSubMenu(itemFerramentas, 'SQLite Expert', 'imFerramentasSQLiteExpert', OnClickFerramentasSQLiteExpert);
  CreateSubMenu(itemFerramentas, 'Inno Setup', 'imFerramentasInnoSetup', OnClickFerramentasInnoSetup);
  CreateSubMenu(itemFerramentas, 'CNPAck', 'imFerramentasCNPack', OnClickFerramentasCNPack);
  CreateSubMenu(itemFerramentas, 'Inno Setup Script Studio', 'imFerramentasInnoScriptStudio', OnClickFerramentasInnoScriptStudio);
  CreateSubMenu(itemFerramentas, 'Insomnia', 'imFerramentasInsomnia', OnClickFerramentasInsomnia);
  CreateSubMenu(itemFerramentas, 'Navicat', 'imFerramentasNavicat', OnClickFerramentasNavicat);
  CreateSubMenu(itemFerramentas, 'Ide Fix Pack e DDevExtensions', 'imFerramentasIdeFixPack', OnClickFerramentasIdeFixPack);
  CreateSubMenu(itemFerramentas, 'Ferramentas free da Embarcadero', 'imFerramentasToolsFree', OnClickFerramentasToolsFree);
  CreateSubMenu(itemFerramentas, 'Site que gera .GitIgnore', 'imFerramentasSiteGitIgnore', OnClickFerramentasSiteGitIgnore);
  CreateSubMenu(itemFerramentas, 'Site que gera Expressões Regulares', 'imFerramentasSiteRegexLib', OnClickFerramentasSiteRegexLib);
  CreateSubMenu(itemFerramentas, 'Transmitir Via Google Meeting', 'imFerramentasGoogleMeeeting', OnClickFerramentasGoogleMeeting);


  {Blogs}
  itemBlogs := CreateSubMenu(itemFormacao, 'Blogs', 'imBlogs', nil);
  CreateSubMenu(itemBlogs, 'Conect Solutions Blog', 'imBlogConectSolutions', OnClickBlogConectSolutions);
  CreateSubMenu(itemBlogs, 'André Celestino', 'imBlogAndreCelestino', OnClickBlogAndreCelestino);
  CreateSubMenu(itemBlogs, 'Embarcadero Blog', 'imBlogEmbarcadero', OnClickBlogEmbarcadero);
  CreateSubMenu(itemBlogs, 'Marco Tech Blog', 'imBlogMarcoCantu', OnClickBlogMarcoCantu);
  CreateSubMenu(itemBlogs, 'Zetta Ommnis Soluções', 'imBlogZettaOmmnis', OnClickBlogZettaOmmnis);
  CreateSubMenu(itemBlogs, 'Chapman World', 'imBlogChapmanWorld', OnClickBlogChapmanWorld);
  CreateSubMenu(itemBlogs, 'The Road to Delphi', 'imBlogRoadToDelphi', OnClickBlogRoadToDelphi);
  CreateSubMenu(itemBlogs, 'Landrgraf.Dev', 'imBlogLandgrafDev', OnClickBlogLandgrafDev);
  CreateSubMenu(itemBlogs, 'Stephen Balls Technical Blog', 'imBlogStephenBalls', OnClickBlogStephenBalls);
  CreateSubMenu(itemBlogs, 'Ray Knopka Blog', 'imKonopka', OnClickBlogKonopka);
  CreateSubMenu(itemBlogs, 'Andys Blog and Tools', 'imAndys', OnClickBlogAndys);


  {Grupos FaceBook - Delphi}
  itemGruposFaceBook := CreateSubMenu(itemFormacao, 'Grupos de Facebook', 'imFaceGroup', nil);
  CreateSubMenu(itemGruposFaceBook, 'Delphi Tips', 'imFacebookDelphiTips', OnClickFacebookDelphiTips);
  CreateSubMenu(itemGruposFaceBook, 'Literatura Tips', 'imFacebookLiteratudaDelphi', OnClickFacebookLiteratudaDelphi);


  {Cursos}
  itemCursos := CreateSubMenu(itemFormacao, 'Cursos', 'imCursos', nil);
  CreateSubMenu(itemCursos, 'Nutror', 'imNutror', OnClickNutror);
  CreateSubMenu(itemCursos, 'Novo EAD - Thulio', 'imNovoEAD', OnClickNovoEAD);
  CreateSubMenu(itemCursos, 'Dev Point - 99Coders', 'imDevPoint', OnClickDevPoint);
  CreateSubMenu(itemCursos, 'Curso OTA', 'imOTA', OnClickOTA);
  CreateSubMenu(itemCursos, 'Delphi Basics', 'imDelphiBasics', OnclickDelphiBasics);
  CreateSubMenu(itemCursos, 'Curso GitHub Bozon Treinamentos', 'imGitHubBozon', OnclickGitHubBozon);
  CreateSubMenu(itemCursos, 'Curso de Postgres Bozon Treinamentos', 'imPostGresBozon', OnclickPostGresBozon);


  {YouTube}
  itemYouTube:= CreateSubMenu(itemFormacao, 'YouTube', 'imYouTube', nil);
  CreateSubMenu(itemYouTube, 'Embarcadero Brasil', 'imEmbarcaderoBrasil', OnClickEmbarcaderoBrasil);
  CreateSubMenu(itemYouTube, 'Embarcadero', 'imEmbarcadero', OnClickEmbarcadero);
  CreateSubMenu(itemYouTube, 'Conect Solutions ', 'imYouTubeConectSolutions', onClickYouTubeConectSolutions);
  CreateSubMenu(itemYouTube, 'Voice Enable Your Android Object Pascal Apps', 'imVoiceEnabledApp', onClickVoiceEnabledApp);
  CreateSubMenu(itemYouTube, 'Curso de GIT e GITHUB - O que é git?', 'imGitHubCurso', OnClickGitHubCurso);
  CreateSubMenu(itemYouTube, 'Criando uma API REST com Delphi', 'imCursoApiREst', OnClickCursoApiREst);
  CreateSubMenu(itemYouTube, 'Produtividade com OpenTools API', 'imOpenToosAPI', OnClickOpenToosAPI);
  CreateSubMenu(itemYouTube, 'Delphi Boss - Autenticação GitHub SSH', 'imBossSSH', OnClickBossSSH);
  CreateSubMenu(itemYouTube, 'Delphicon 2023 - Dia 1', 'imDelphicon2023_day1', OnClickDelphicon2023_day1);
  CreateSubMenu(itemYouTube, 'Delphicon 2023 - Dia 2', 'imDelphicon2023_day2', OnClickDelphicon2023_day2);
  CreateSubMenu(itemYouTube, 'Delphicon 2023 - Dia 3', 'imDelphicon2023_day3', OnClickDelphicon2023_day3);
  CreateSubMenu(itemYouTube, 'Meu Querido Firebird', 'immqfb', OnClickmqfb);
  CreateSubMenu(itemYouTube, 'Chapman World', 'imChapmanWorld', OnClickChapmanWorld);

  {Utilitários}
  itemUtilitarios := CreateSubMenu(itemFormacao, 'Utilitários', 'imUtilitarios', nil);
  CreateSubMenu(itemUtilitarios, 'SQLite', 'imSQLite', OnClickSQLite, FImageSQLite);
  CreateSubMenu(itemUtilitarios, 'MySQL', 'imMySQL', OnClickMySQL, FImageMySQL);
  CreateSubMenu(itemUtilitarios, 'Fórum Delphi', 'imForumDelphi', onClickForumDelphi, FForumDelphi);
  CreateSubMenu(itemUtilitarios, 'PostGres', 'imPostGres', OnclickPostgres, FImagePostGres);
  CreateSubMenu(itemUtilitarios, 'Postman', 'imPostman', OnClickPostMan, FImagePostMan);
  CreateSubMenu(itemUtilitarios, 'ChatGpt' , 'imChatGpt', OnClickChatGPT, FChatGpt);
  CreateSubMenu(itemUtilitarios, 'Analisar Hints', 'imAnalisarHints', OnClickAnalisarHints, FAnalisarHints);
  CreateSubMenu(itemUtilitarios, 'IBExpert' , 'imIbExpert', OnClickIBExpert, FImageIbExpert);
  CreateSubMenu(itemUtilitarios, 'SQL Server Manager Studio' , 'imSQLServerManagerStudio', OnClickSQLServerManagerStudio, FSQLServerManagerStudio);
  CreateSubMenu(itemUtilitarios, 'JSON to Delphi Class' , 'imJSONtoDelphiClass', OnClickJSONtoDelphiClass);
  CreateSubMenu(itemUtilitarios, 'JSON Formater' , 'imJSONFormater', OnClickJSONFormater);
  CreateSubMenu(itemUtilitarios, 'Icon Finder' , 'imIconFinder', OnClickIconFinder);
  CreateSubMenu(itemUtilitarios, 'Icons8' , 'imIcons8', OnClickIcons8);
  CreateSubMenu(itemUtilitarios, 'Buscar Acoplamentos de Units' , 'imAcoplamentosUnits', OnClickAcoplamentosUnits);
  CreateSubMenu(itemUtilitarios, 'Embarcadero Get It', 'imGetIt', OnClickimGetIt);

  {Git Hubs}
  itemGitHubs:= CreateSubMenu(itemFormacao, 'Componentes Git Hubs', 'imGitHub', nil);
  CreateSubMenu(itemGitHubs, 'Synopse SynPDf' , 'imSynopseSynPDF', OnClickSynopseSynPDF);
  CreateSubMenu(itemGitHubs, 'New Audio Components (NewAC)' , 'imNewAudio', OnClickNewAudio);
  CreateSubMenu(itemGitHubs, 'Redis Client' , 'imRedisClient', OnClickRedisClient);
  CreateSubMenu(itemGitHubs, 'FireBase4Delphi' , 'imFireBase4Delphi', OnClickFireBase4Delphi);
  CreateSubMenu(itemGitHubs, 'Turbo Pack Onguard VCL' , 'imTurboPackVCL', OnClickTurboPackVCL);
  CreateSubMenu(itemGitHubs, 'Fortes Report CE' , 'imFortesReportCE', OnClickFortesReportCE);
  CreateSubMenu(itemGitHubs, 'Delphi JOSE and JWT Library' , 'imDelphiJose', OnClickDelphiJose);
  CreateSubMenu(itemGitHubs, 'XPAD Atualização Automática' , 'imXPAD', OnClickXPAD);
  CreateSubMenu(itemGitHubs, 'SimpleORM' , 'imSimpleORM', OnClickSimpleORM);
  CreateSubMenu(itemGitHubs, 'Delphi MVC FrameWork' , 'imDelphiMVCFrameWork', OnClickDelphiMVCFrameWork);
  CreateSubMenu(itemGitHubs, 'JEDI JCL' , 'imJediJCL', OnclickJEDIJCL);
  CreateSubMenu(itemGitHubs, 'JEDI JVCL' , 'imJediJVCL', OnclickJEDIJVCL);
  CreateSubMenu(itemGitHubs, 'Onde pegar o JEdi.inc' , 'imJediINC', OnclickJediInc);
  CreateSubMenu(itemGitHubs, 'Delphi MessageBus' , 'imDelphiMessageBus', OnclickDelphiMessageBus);
  CreateSubMenu(itemGitHubs, 'Delphi Docker' , 'imDelphiDocker', OnclickDelphiDocker);
  CreateSubMenu(itemGitHubs, 'Embarcadero' , 'imEmbarcaderoGitHub', OnclickEmbarcaderoGitHub);
  CreateSubMenu(itemGitHubs, 'Chromium' , 'imChromiumGitHub', OnclickChromiumGitHub);
  CreateSubMenu(itemGitHubs, 'Skia4Delphi' , 'imSkia4Delphi', OnclickSkia4Delphi);
  CreateSubMenu(itemGitHubs, 'User Control' , 'imUsercontrol', OnclickUserControl);
  CreateSubMenu(itemGitHubs, 'Aeggys Acesso Remoto' , 'imAeggys', OnclickAeggys);



  {Horse API}
  itemAPI:= CreateSubMenu(itemFormacao, 'Horse API', 'imAPI', nil);
  CreateSubMenu(itemAPI, 'Horse' , 'imHorse', OnClickHorse);
  CreateSubMenu(itemAPI, 'Horse E-Tag' , 'imHorseETag', OnClickHorseETag);
  CreateSubMenu(itemAPI, 'Horse basic auth' , 'imHorseBasicAuth', OnClickHorseBasicAuth);
  CreateSubMenu(itemAPI, 'Horse Handle Exception' , 'imHorseHandleException', OnClickHandleException);
  CreateSubMenu(itemAPI, 'Horse JWT' , 'imHorseJWT', OnClickHorseJWT);

end;

function TFSDMainMenuWizard.CreateSubMenu(AParent: TMenuItem;
                                          ACaption,
                                          AName: String;
                                          AOnClick: TNotifyEvent;
                                          AImageIndex: Integer = -1): TMenuItem;
begin
  Result := TMenuItem.Create(AParent);
  Result.Caption:= ACaption;
  Result.Name:= AName;
  Result.OnClick:= AOnClick;

  if AImageIndex > -1  then
    Result.ImageIndex := AImageIndex;


  AParent.Add(Result);

end;

procedure TFSDMainMenuWizard.Execute;
begin

end;

function TFSDMainMenuWizard.GetIDString: string;
begin
  Result := Self.ClassName;
end;

function TFSDMainMenuWizard.GetName: string;
begin
  Result := Self.ClassName;
end;

function TFSDMainMenuWizard.GetState: TWizardState;
begin
  result := [wsEnabled];
end;


function TFSDMainMenuWizard.GetWindowsDefaultLanguage: string;
var
  LangID: WORD;
  Buffer: array [0..255] of Char;
begin
  LangID := GetUserDefaultLangID;
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SLANGUAGE, Buffer, SizeOf(Buffer));
  Result := Buffer;

end;

procedure TFSDMainMenuWizard.OnClickJSONFormater(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://jsonformatter.curiousconcept.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickJSONtoDelphiClass(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://jsontodelphi.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickLivroDelphiAndroid(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.amazon.com.br/Delphi-para-Android-iOS-Desenvolvendo-ebook/dp/B016QRGCMK/ref=sr_1_1?keywords=delphi+programa%C3%A7%C3%A3o&qid=1675782875&sprefix=Delphi+programa%2Caps%2C213&sr=8-1', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickLivroObjectPascal(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.amazon.com.br/Object-Pascal-Delphi-Israel-Avillano/dp/8573938323/ref=sr_1_2?keywords=delphi+programa%C3%A7%C3%A3o&qid=1675782875&sprefix=Delphi+programa%2Caps%2C213&sr=8-2', '', '', 0);
end;

//procedure TFSDMainMenuWizard.OnClickLoja(Sender: TObject);
//begin
//  ShellExecute(HInstance, 'open', 'https://conectsolutionsti.com.br/loja.php', '', '', 0);
//end;

procedure TFSDMainMenuWizard.OnClickMenuHistoryProjects(Sender: TObject);
begin
  ShowHistoryProjects;
end;

procedure TFSDMainMenuWizard.OnClickmqfb(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/@mqfs', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickMySQL(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Program Files\MySQL\MySQL Workbench 8.0\MySQLWorkbench.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickNewAudio(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/CHERTS/newac?fbclid=IwAR1pksYzZ4PyWdhWYR-CftWMYGPw1rTuiqtIgb4FNzLFv-QxI4M_DLi8s58', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickNovoEAD(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://novoead.com.br/home', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickNovoWizard(sender: TObject);
begin
  ShowMessage('Novo Wizard');
end;

procedure TFSDMainMenuWizard.OnClickNutror(Sender: TOBject);
begin
  ShellExecute(HInstance, 'open', 'https://www.nutror.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickOpenToosAPI(Sender: TObject);
begin
   ShellExecute(HInstance, 'open', 'https://youtu.be/qUvyp7V4X78', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickOTA(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Fontes\ToolsApi\ListaCurso OTA Delphi.mpcpl', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickPostGres(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Program Files\pgAdmin 4\v6\runtime\pgAdmin4.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickPostGresBozon(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/playlist?list=PLucm8g_ezqNoAkYKXN_zWupyH6hQCAwxY', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickPostman(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Users\conec\AppData\Local\Postman\Postman.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickRedisClient(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/danieleteti/delphiredisclient', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickAcoplamentosUnits(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Users\conec\Desktop\PesquisaAcoplamento\Win32\Debug\PesquisaAcoplamento.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickAeggys(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/OpenSourceCommunityBrasil/Aegys-Acesso-Remoto/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickAnalisarHints(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Users\conec\Desktop\AnaisaHintsWarnings\Win32\Debug\AnalisaHintsWarnings.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogAndreCelestino(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.andrecelestino.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogAndys(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.idefixpack.de/blog/ide-tools/ide-fix-pack/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogChapmanWorld(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://chapmanworld.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogConectSolutions(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://conectsolutions.wordpress.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogEmbarcadero(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://blogs.embarcadero.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogKonopka(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://delphibydesign.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogLandgrafDev(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://landgraf.dev/en/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogMarcoCantu(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://blog.marcocantu.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogRoadToDelphi(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://theroadtodelphi.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogStephenBalls(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://delphiaball.co.uk/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBlogZettaOmmnis(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'http://www.zettaomnis.net.br/portal/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickBossSSH(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/watch?v=geAGT-M0RGY', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickChapmanWorld(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/@ChapmanWorldOnTube', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickChatGPT(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'D:\DelphiChatGPT-main\DelphiChatGPT-main\Win32\Debug\ChatGptDemo.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickChromiumGitHub(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/chromium/chromium', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickCursoApiREst(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/watch?v=M-4gwrCI21w&list=PL_YzAvjux_LZPLp1LGBESZvXuohP6I7HC', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickDelphiBasics(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.delphibasics.co.uk/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickDelphicon2023_day1(Sender: TObject);
begin
   ShellExecute(HInstance, 'open', 'https://youtu.be/aU130QvzF24', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickDelphicon2023_day2(Sender: TObject);
begin
   ShellExecute(HInstance, 'open', 'https://youtu.be/PMYplkUv6Po', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickDelphicon2023_day3(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://youtu.be/xzfiy01Q8o0', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickDelphiDocker(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/HashLoad/delphi-docker', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickDelphiJose(Sebder: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/paolo-rossi/delphi-jose-jwt', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickDelphiMessageBus(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/THSoftPoland/DelphiMessageBus', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickDelphiMVCFrameWork(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/danieleteti/delphimvcframework', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickDevPoint(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://devpoint.alumy.com/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickDocWiki(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://docwiki.embarcadero.com/Libraries/Alexandria/en/Main_Page', '', '',0);
end;

procedure TFSDMainMenuWizard.OnClickEmbarcadero(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/@EmbarcaderoTech', '', '',0);
end;

procedure TFSDMainMenuWizard.OnClickEmbarcaderoBrasil(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/@embarcaderodobrasil', '', '',0);
end;

procedure TFSDMainMenuWizard.OnclickEmbarcaderoGitHub(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/Embarcadero', '', '',0);
end;

procedure TFSDMainMenuWizard.OnClickIBExpert(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Users\conec\Downloads\IBExpert SFX 2020.4.21\IBExpert.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickIconFinder(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.iconfinder.com/', '', '',0);
end;

procedure TFSDMainMenuWizard.OnClickIcons8(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://icons8.com/', '', '',0);
end;

procedure TFSDMainMenuWizard.OnClickimGetIt(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://getitnow.embarcadero.com/', '', '',0);
end;

procedure TFSDMainMenuWizard.OnclickJediInc(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/project-jedi/jedi', '', '',0);
end;

procedure TFSDMainMenuWizard.OnclickJEDIJCL(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/project-jedi/jcl', '', '',0);
end;

procedure TFSDMainMenuWizard.OnclickJEDIJVCL(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/project-jedi/jvcl', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFacebookDelphiTips(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.facebook.com/groups/884032961705860', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFacebookLiteratudaDelphi(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.facebook.com/groups/1367500199938862/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasCNPack(Sender: TObject);
begin
   ShellExecute(HInstance, 'open', 'https://www.cnpack.org/showlist.php?id=39&lang=en', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasFirebird(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://firebirdsql.org/en/server-packages/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasGoogleMeeting(Sender: TObject);
begin
   ShellExecute(HInstance, 'open', 'https://meet.google.com/rpr-dcvr-zbv?hs=122&authuser=0', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasIbExpert(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.ibexpert.net/downloadcenter/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasIdeFixPack(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.idefixpack.de/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasInnoScriptStudio(
  Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.kymoto.org/products/inno-script-studio', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasInnoSetup(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://jrsoftware.org/isdl.php', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasInsomnia(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://insomnia.rest/download', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasMySQL(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.mysql.com/downloads/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasNavicat(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://navicat.com/en/products', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasSiteGitIgnore(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.toptal.com/developers/gitignore', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasSiteRegexLib(Sender: TObject);
begin
   ShellExecute(HInstance, 'open', 'https://regexlib.com/Default.aspx', '', '', 0);
end;




procedure TFSDMainMenuWizard.OnClickFerramentasSQLiteExpert(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.sqliteexpert.com/download.html', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFerramentasToolsFree(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.embarcadero.com/free-tools', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFireBase4Delphi(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/spinettaro/Firebase4Delphi/tree/master/sources', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickFortesReportCE(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/fortesinformatica/fortesreport-ce', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickForumDelphi(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://conectsolutionsti.com.br/Upload/', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickGitHubBozon(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/watch?v=YnVnFanIAzU&list=PLucm8g_ezqNq0dOgug6paAkH0AQSJPlIe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickGitHubCurso(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/watch?v=FF1f4bKYhoo&list=PLbEOwbQR9lqzK14I7OOeREEIE4k6rjgIj&index=1', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickHandleException(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/HashLoad/handle-exception', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickHorse(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/HashLoad/horse', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickHorseBasicAuth(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/HashLoad/horse-basic-auth', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickHorseETag(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/academiadocodigo/Horse-ETag', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickHorseJWT(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/HashLoad/horse-jwt', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickSimpleORM(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/academiadocodigo/SimpleORM/tree/Dev', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickSkia4Delphi(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/skia4delphi/skia4delphi', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickSQLite(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Program Files\SQLite Expert\Professional 5\SQLiteExpertPro64.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickSQLSErverManagerStudio(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickSynopseSynPDF(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/synopse/SynPDF', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickTurboPackVCL(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/TurboPack/OnGuard-VCL', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnclickUserControl(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/infussolucoes/usercontrol-sd', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickVagasDelphi(Sender: TObject);
begin

end;

procedure TFSDMainMenuWizard.onClickVoiceEnabledApp(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.linkedin.com/jobs/search/?currentJobId=3476236992&keywords=Programador%20Delphi&refresh=true', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickXPAD(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://github.com/jeantux/XPad?fbclid=IwAR1HonOjdG1YpKJmB4-7WXxLlzYNjveIpre5q_8BBmG6f-A064PGDNn1c30', '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickYouTube(Sender: TObject);
begin

end;

procedure TFSDMainMenuWizard.onClickYouTubeConectSolutions(Sender: Tobject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/@ConectvideoBr', '', '', 0);
end;

procedure TFSDMainMenuWizard.VoiceEnabledApp(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'https://www.youtube.com/watch?v=pGh4FRgKy5w', '', '', 0);
end;

end.
