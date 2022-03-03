program R2DWJSON;

uses
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
