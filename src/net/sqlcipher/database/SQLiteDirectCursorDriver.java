package net.sqlcipher.database;

public class SQLiteDirectCursorDriver
  implements SQLiteCursorDriver
{
  private net.sqlcipher.Cursor mCursor;
  private SQLiteDatabase mDatabase;
  private String mEditTable;
  private SQLiteQuery mQuery;
  private String mSql;
  
  public SQLiteDirectCursorDriver(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    mDatabase = paramSQLiteDatabase;
    mEditTable = paramString2;
    mSql = paramString1;
  }
  
  public void cursorClosed()
  {
    mCursor = null;
  }
  
  public void cursorDeactivated() {}
  
  public void cursorRequeried(android.database.Cursor paramCursor) {}
  
  public net.sqlcipher.Cursor query(SQLiteDatabase.CursorFactory paramCursorFactory, String[] paramArrayOfString)
  {
    int i = 0;
    SQLiteQuery localSQLiteQuery2 = new SQLiteQuery(mDatabase, mSql, 0, paramArrayOfString);
    if (paramArrayOfString == null) {}
    for (;;)
    {
      int j = 0;
      for (;;)
      {
        if (j >= i) {
          break label70;
        }
        SQLiteQuery localSQLiteQuery1 = localSQLiteQuery2;
        try
        {
          localSQLiteQuery2.bindString(j + 1, paramArrayOfString[j]);
          j += 1;
        }
        finally
        {
          if (localSQLiteQuery1 == null) {
            break label171;
          }
          localSQLiteQuery1.close();
        }
      }
      localSQLiteQuery1 = localSQLiteQuery2;
      i = paramArrayOfString.length;
    }
    label70:
    if (paramCursorFactory == null) {
      localSQLiteQuery1 = localSQLiteQuery2;
    }
    for (mCursor = new SQLiteCursor(mDatabase, this, mEditTable, localSQLiteQuery2);; mCursor = paramCursorFactory.newCursor(mDatabase, this, mEditTable, localSQLiteQuery2))
    {
      localSQLiteQuery1 = localSQLiteQuery2;
      mQuery = localSQLiteQuery2;
      localSQLiteQuery1 = null;
      paramCursorFactory = mCursor;
      if (0 != 0) {
        throw new NullPointerException();
      }
      return paramCursorFactory;
      localSQLiteQuery1 = localSQLiteQuery2;
    }
  }
  
  public void setBindArguments(String[] paramArrayOfString)
  {
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      mQuery.bindString(i + 1, paramArrayOfString[i]);
      i += 1;
    }
  }
  
  public String toString()
  {
    return "SQLiteDirectCursorDriver: " + mSql;
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteDirectCursorDriver
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */