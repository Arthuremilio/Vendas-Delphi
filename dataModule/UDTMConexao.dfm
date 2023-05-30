object dtmPrincipal: TdtmPrincipal
  Height = 579
  Width = 804
  PixelsPerInch = 96
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True'
      'RawStringEncoding=DB_CP')
    SQLHourGlass = True
    HostName = '.\SERVERCURSO'
    Port = 1433
    Database = 'Vendas'
    User = 'sa'
    Password = '123456'
    Protocol = 'mssql'
    LibraryLocation = 'C:\Users\USER\Desktop\Arthur\Projeto delphi\ntwdblib.dll'
    Left = 60
    Top = 60
  end
end
