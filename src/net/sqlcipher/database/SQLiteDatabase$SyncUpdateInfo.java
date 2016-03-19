package net.sqlcipher.database;

class SQLiteDatabase$SyncUpdateInfo
{
  String deletedTable;
  String foreignKey;
  String masterTable;
  
  SQLiteDatabase$SyncUpdateInfo(String paramString1, String paramString2, String paramString3)
  {
    masterTable = paramString1;
    deletedTable = paramString2;
    foreignKey = paramString3;
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteDatabase.SyncUpdateInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */