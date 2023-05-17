object DMConexao: TDMConexao
  OldCreateOrder = False
  Left = 283
  Top = 117
  Height = 296
  Width = 283
  object bdConexao: TIBDatabase
    DatabaseName = 'E:\Teste_3LM\BD\BDTESTE.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 56
    Top = 32
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = bdConexao
    DefaultAction = TACommitRetaining
    AutoStopAction = saNone
    Left = 56
    Top = 96
  end
end
