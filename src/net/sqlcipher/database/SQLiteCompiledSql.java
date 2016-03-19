package net.sqlcipher.database;

import android.util.Log;

class SQLiteCompiledSql
{
  private static final String TAG = "SQLiteCompiledSql";
  SQLiteDatabase mDatabase;
  private boolean mInUse = false;
  private String mSqlStmt = null;
  private Throwable mStackTrace = null;
  int nHandle = 0;
  int nStatement = 0;
  
  SQLiteCompiledSql(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    if (!paramSQLiteDatabase.isOpen()) {
      throw new IllegalStateException("database " + paramSQLiteDatabase.getPath() + " already closed");
    }
    mDatabase = paramSQLiteDatabase;
    mSqlStmt = paramString;
    mStackTrace = new DatabaseObjectNotClosedException().fillInStackTrace();
    nHandle = mNativeHandle;
    compile(paramString, true);
  }
  
  private void compile(String paramString, boolean paramBoolean)
  {
    if (!mDatabase.isOpen()) {
      throw new IllegalStateException("database " + mDatabase.getPath() + " already closed");
    }
    if (paramBoolean) {
      mDatabase.lock();
    }
    try
    {
      native_compile(paramString);
      return;
    }
    finally
    {
      mDatabase.unlock();
    }
  }
  
  private final native void native_compile(String paramString);
  
  private final native void native_finalize();
  
  /* Error */
  boolean acquire()
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_2
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 33	net/sqlcipher/database/SQLiteCompiledSql:mInUse	Z
    //   8: istore_1
    //   9: iload_1
    //   10: ifeq +9 -> 19
    //   13: iconst_0
    //   14: istore_1
    //   15: aload_0
    //   16: monitorexit
    //   17: iload_1
    //   18: ireturn
    //   19: aload_0
    //   20: iconst_1
    //   21: putfield 33	net/sqlcipher/database/SQLiteCompiledSql:mInUse	Z
    //   24: iload_2
    //   25: istore_1
    //   26: getstatic 95	net/sqlcipher/database/SQLiteDebug:DEBUG_ACTIVE_CURSOR_FINALIZATION	Z
    //   29: ifeq -14 -> 15
    //   32: ldc 8
    //   34: new 43	java/lang/StringBuilder
    //   37: dup
    //   38: invokespecial 44	java/lang/StringBuilder:<init>	()V
    //   41: ldc 97
    //   43: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: aload_0
    //   47: getfield 27	net/sqlcipher/database/SQLiteCompiledSql:nStatement	I
    //   50: invokevirtual 100	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   53: ldc 102
    //   55: invokevirtual 50	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   58: invokevirtual 59	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   61: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   64: pop
    //   65: iload_2
    //   66: istore_1
    //   67: goto -52 -> 15
    //   70: astore_3
    //   71: aload_0
    //   72: monitorexit
    //   73: aload_3
    //   74: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	75	0	this	SQLiteCompiledSql
    //   8	59	1	bool1	boolean
    //   1	65	2	bool2	boolean
    //   70	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   4	9	70	finally
    //   19	24	70	finally
    //   26	65	70	finally
  }
  
  protected void finalize()
    throws Throwable
  {
    try
    {
      int i = nStatement;
      if (i == 0) {
        return;
      }
      if (SQLiteDebug.DEBUG_ACTIVE_CURSOR_FINALIZATION) {
        Log.v("SQLiteCompiledSql", "** warning ** Finalized DbObj (id#" + nStatement + ")");
      }
      int j = mSqlStmt.length();
      StringBuilder localStringBuilder = new StringBuilder().append("Releasing statement in a finalizer. Please ensure that you explicitly call close() on your cursor: ");
      String str = mSqlStmt;
      i = j;
      if (j > 100) {
        i = 100;
      }
      Log.w("SQLiteCompiledSql", str.substring(0, i), mStackTrace);
      releaseSqlStatement();
      return;
    }
    finally
    {
      super.finalize();
    }
  }
  
  void release()
  {
    try
    {
      if (SQLiteDebug.DEBUG_ACTIVE_CURSOR_FINALIZATION) {
        Log.v("SQLiteCompiledSql", "Released DbObj (id#" + nStatement + ") back to DB cache");
      }
      mInUse = false;
      return;
    }
    finally {}
  }
  
  void releaseSqlStatement()
  {
    if (nStatement != 0) {
      if (SQLiteDebug.DEBUG_ACTIVE_CURSOR_FINALIZATION) {
        Log.v("SQLiteCompiledSql", "closed and deallocated DbObj (id#" + nStatement + ")");
      }
    }
    try
    {
      mDatabase.lock();
      native_finalize();
      nStatement = 0;
      return;
    }
    finally
    {
      mDatabase.unlock();
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteCompiledSql
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */