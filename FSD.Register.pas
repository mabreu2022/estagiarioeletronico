unit FSD.Register;

interface

uses
  FSD.MainMenu.Wizard,
  FSD.HelloWorld.Wizard,
  FSD.HistoryProjects.Notifier,
  FSD.HistoryProjects.Binding,
  FSD.HistoryProjects.ContextMenu,
  FSD.NewProject.Wizard;

  procedure Register;

implementation

procedure Register;
begin
  RegisterHelloWorldWizard;
  RegisterMenuWizard;
  RegisterHistoryNotifier;
  RegisterKeyBindingHistory;
  RegisterContextMenuHistoryProjects;
  RegisterRepositoryWizard;
end;

end.
