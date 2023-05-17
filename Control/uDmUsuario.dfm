object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Left = 283
  Top = 117
  Height = 256
  Width = 344
  object sqlPesquisa: TIBQuery
    Database = DMConexao.bdConexao
    Transaction = DMConexao.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 24
    Top = 104
  end
  object sqlInserir: TIBQuery
    Database = DMConexao.bdConexao
    Transaction = DMConexao.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 32
  end
  object sqlAlterar: TIBQuery
    Database = DMConexao.bdConexao
    Transaction = DMConexao.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 128
    Top = 32
  end
  object sqlExcluir: TIBQuery
    Database = DMConexao.bdConexao
    Transaction = DMConexao.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 32
  end
end
