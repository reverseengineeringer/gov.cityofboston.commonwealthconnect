package net.sqlcipher.database;

import android.util.Log;
import java.util.Map;

public abstract class SQLiteProgram
  extends SQLiteClosable
{
  private static final String TAG = "SQLiteProgram";
  private SQLiteCompiledSql mCompiledSql;
  @Deprecated
  protected SQLiteDatabase mDatabase;
  final String mSql;
  @Deprecated
  protected int nHandle = 0;
  @Deprecated
  protected int nStatement = 0;
  
  SQLiteProgram(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    mDatabase = paramSQLiteDatabase;
    mSql = paramString.trim();
    paramSQLiteDatabase.acquireReference();
    paramSQLiteDatabase.addSQLiteClosable(this);
    nHandle = mNativeHandle;
    String str = mSql.substring(0, 6);
    if ((!str.equalsIgnoreCase("INSERT")) && (!str.equalsIgnoreCase("UPDATE")) && (!str.equalsIgnoreCase("REPLAC")) && (!str.equalsIgnoreCase("DELETE")) && (!str.equalsIgnoreCase("SELECT")))
    {
      mCompiledSql = new SQLiteCompiledSql(paramSQLiteDatabase, paramString);
      nStatement = mCompiledSql.nStatement;
      return;
    }
    mCompiledSql = paramSQLiteDatabase.getCompiledStatementForSql(paramString);
    if (mCompiledSql == null)
    {
      mCompiledSql = new SQLiteCompiledSql(paramSQLiteDatabase, paramString);
      mCompiledSql.acquire();
      paramSQLiteDatabase.addToCompiledQueries(paramString, mCompiledSql);
      if (SQLiteDebug.DEBUG_ACTIVE_CURSOR_FINALIZATION) {
        Log.v("SQLiteProgram", "Created DbObj (id#" + mCompiledSql.nStatement + ") for sql: " + paramString);
      }
    }
    for (;;)
    {
      nStatement = mCompiledSql.nStatement;
      return;
      if (!mCompiledSql.acquire())
      {
        int i = mCompiledSql.nStatement;
        mCompiledSql = new SQLiteCompiledSql(paramSQLiteDatabase, paramString);
        if (SQLiteDebug.DEBUG_ACTIVE_CURSOR_FINALIZATION) {
          Log.v("SQLiteProgram", "** possible bug ** Created NEW DbObj (id#" + mCompiledSql.nStatement + ") because the previously created DbObj (id#" + i + ") was not released for sql:" + paramString);
        }
      }
    }
  }
  
  private final native void native_clear_bindings();
  
  private void releaseCompiledSqlIfNotInCache()
  {
    if (mCompiledSql == null) {
      return;
    }
    for (;;)
    {
      synchronized (mDatabase.mCompiledQueries)
      {
        if (!mDatabase.mCompiledQueries.containsValue(mCompiledSql))
        {
          mCompiledSql.releaseSqlStatement();
          mCompiledSql = null;
          nStatement = 0;
          return;
        }
      }
      mCompiledSql.release();
    }
  }
  
  public void bindBlob(int paramInt, byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      throw new IllegalArgumentException("the bind value at index " + paramInt + " is null");
    }
    if (!mDatabase.isOpen()) {
      throw new IllegalStateException("database " + mDatabase.getPath() + " already closed");
    }
    acquireReference();
    try
    {
      native_bind_blob(paramInt, paramArrayOfByte);
      return;
    }
    finally
    {
      releaseReference();
    }
  }
  
  public void bindDouble(int paramInt, double paramDouble)
  {
    if (!mDatabase.isOpen()) {
      throw new IllegalStateException("database " + mDatabase.getPath() + " already closed");
    }
    acquireReference();
    try
    {
      native_bind_double(paramInt, paramDouble);
      return;
    }
    finally
    {
      releaseReference();
    }
  }
  
  public void bindLong(int paramInt, long paramLong)
  {
    if (!mDatabase.isOpen()) {
      throw new IllegalStateException("database " + mDatabase.getPath() + " already closed");
    }
    acquireReference();
    try
    {
      native_bind_long(paramInt, paramLong);
      return;
    }
    finally
    {
      releaseReference();
    }
  }
  
  public void bindNull(int paramInt)
  {
    if (!mDatabase.isOpen()) {
      throw new IllegalStateException("database " + mDatabase.getPath() + " already closed");
    }
    acquireReference();
    try
    {
      native_bind_null(paramInt);
      return;
    }
    finally
    {
      releaseReference();
    }
  }
  
  public void bindString(int paramInt, String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("the bind value at index " + paramInt + " is null");
    }
    if (!mDatabase.isOpen()) {
      throw new IllegalStateException("database " + mDatabase.getPath() + " already closed");
    }
    acquireReference();
    try
    {
      native_bind_string(paramInt, paramString);
      return;
    }
    finally
    {
      releaseReference();
    }
  }
  
  public void clearBindings()
  {
    if (!mDatabase.isOpen()) {
      throw new IllegalStateException("database " + mDatabase.getPath() + " already closed");
    }
    acquireReference();
    try
    {
      native_clear_bindings();
      return;
    }
    finally
    {
      releaseReference();
    }
  }
  
  public void close()
  {
    if (!mDatabase.isOpen()) {
      return;
    }
    mDatabase.lock();
    try
    {
      releaseReference();
      return;
    }
    finally
    {
      mDatabase.unlock();
    }
  }
  
  @Deprecated
  protected void compile(String paramString, boolean paramBoolean) {}
  
  String getSqlString()
  {
    return mSql;
  }
  
  public final int getUniqueId()
  {
    return nStatement;
  }
  
  protected final native void native_bind_blob(int paramInt, byte[] paramArrayOfByte);
  
  protected final native void native_bind_double(int paramInt, double paramDouble);
  
  protected final native void native_bind_long(int paramInt, long paramLong);
  
  protected final native void native_bind_null(int paramInt);
  
  protected final native void native_bind_string(int paramInt, String paramString);
  
  @Deprecated
  protected final native void native_compile(String paramString);
  
  @Deprecated
  protected final native void native_finalize();
  
  protected void onAllReferencesReleased()
  {
    releaseCompiledSqlIfNotInCache();
    mDatabase.releaseReference();
    mDatabase.removeSQLiteClosable(this);
  }
  
  protected void onAllReferencesReleasedFromContainer()
  {
    releaseCompiledSqlIfNotInCache();
    mDatabase.releaseReference();
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteProgram
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */