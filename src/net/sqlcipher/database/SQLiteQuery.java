package net.sqlcipher.database;

import net.sqlcipher.CursorWindow;

public class SQLiteQuery
  extends SQLiteProgram
{
  private static final String TAG = "Cursor";
  private String[] mBindArgs;
  private boolean mClosed = false;
  private int mOffsetIndex;
  
  SQLiteQuery(SQLiteDatabase paramSQLiteDatabase, String paramString, int paramInt, String[] paramArrayOfString)
  {
    super(paramSQLiteDatabase, paramString);
    mOffsetIndex = paramInt;
    mBindArgs = paramArrayOfString;
  }
  
  private final native int native_column_count();
  
  private final native String native_column_name(int paramInt);
  
  private final native int native_fill_window(CursorWindow paramCursorWindow, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  public void bindDouble(int paramInt, double paramDouble)
  {
    mBindArgs[(paramInt - 1)] = Double.toString(paramDouble);
    if (!mClosed) {
      super.bindDouble(paramInt, paramDouble);
    }
  }
  
  public void bindLong(int paramInt, long paramLong)
  {
    mBindArgs[(paramInt - 1)] = Long.toString(paramLong);
    if (!mClosed) {
      super.bindLong(paramInt, paramLong);
    }
  }
  
  public void bindNull(int paramInt)
  {
    mBindArgs[(paramInt - 1)] = null;
    if (!mClosed) {
      super.bindNull(paramInt);
    }
  }
  
  public void bindString(int paramInt, String paramString)
  {
    mBindArgs[(paramInt - 1)] = paramString;
    if (!mClosed) {
      super.bindString(paramInt, paramString);
    }
  }
  
  public void close()
  {
    super.close();
    mClosed = true;
  }
  
  int columnCountLocked()
  {
    acquireReference();
    try
    {
      int i = native_column_count();
      return i;
    }
    finally
    {
      releaseReference();
    }
  }
  
  String columnNameLocked(int paramInt)
  {
    acquireReference();
    try
    {
      String str = native_column_name(paramInt);
      return str;
    }
    finally
    {
      releaseReference();
    }
  }
  
  /* Error */
  int fillWindow(CursorWindow paramCursorWindow, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: invokestatic 87	android/os/SystemClock:uptimeMillis	()J
    //   3: lstore 4
    //   5: aload_0
    //   6: getfield 91	net/sqlcipher/database/SQLiteQuery:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   9: invokevirtual 96	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   12: aload_0
    //   13: getfield 91	net/sqlcipher/database/SQLiteQuery:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   16: aload_0
    //   17: getfield 99	net/sqlcipher/database/SQLiteQuery:mSql	Ljava/lang/String;
    //   20: lload 4
    //   22: ldc 101
    //   24: invokevirtual 105	net/sqlcipher/database/SQLiteDatabase:logTimeStat	(Ljava/lang/String;JLjava/lang/String;)V
    //   27: aload_0
    //   28: invokevirtual 67	net/sqlcipher/database/SQLiteQuery:acquireReference	()V
    //   31: aload_1
    //   32: invokevirtual 108	net/sqlcipher/CursorWindow:acquireReference	()V
    //   35: aload_0
    //   36: aload_1
    //   37: aload_1
    //   38: invokevirtual 111	net/sqlcipher/CursorWindow:getStartPosition	()I
    //   41: aload_0
    //   42: getfield 23	net/sqlcipher/database/SQLiteQuery:mOffsetIndex	I
    //   45: iload_2
    //   46: iload_3
    //   47: invokespecial 113	net/sqlcipher/database/SQLiteQuery:native_fill_window	(Lnet/sqlcipher/CursorWindow;IIII)I
    //   50: istore_2
    //   51: getstatic 118	net/sqlcipher/database/SQLiteDebug:DEBUG_SQL_STATEMENTS	Z
    //   54: ifeq +31 -> 85
    //   57: ldc 8
    //   59: new 120	java/lang/StringBuilder
    //   62: dup
    //   63: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   66: ldc 124
    //   68: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: aload_0
    //   72: getfield 99	net/sqlcipher/database/SQLiteQuery:mSql	Ljava/lang/String;
    //   75: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   78: invokevirtual 131	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   81: invokestatic 137	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   84: pop
    //   85: aload_0
    //   86: getfield 91	net/sqlcipher/database/SQLiteQuery:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   89: aload_0
    //   90: getfield 99	net/sqlcipher/database/SQLiteQuery:mSql	Ljava/lang/String;
    //   93: lload 4
    //   95: invokevirtual 140	net/sqlcipher/database/SQLiteDatabase:logTimeStat	(Ljava/lang/String;J)V
    //   98: aload_1
    //   99: invokevirtual 141	net/sqlcipher/CursorWindow:releaseReference	()V
    //   102: aload_0
    //   103: invokevirtual 72	net/sqlcipher/database/SQLiteQuery:releaseReference	()V
    //   106: aload_0
    //   107: getfield 91	net/sqlcipher/database/SQLiteQuery:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   110: invokevirtual 144	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   113: iload_2
    //   114: ireturn
    //   115: astore 6
    //   117: aload_1
    //   118: invokevirtual 141	net/sqlcipher/CursorWindow:releaseReference	()V
    //   121: aload_0
    //   122: invokevirtual 72	net/sqlcipher/database/SQLiteQuery:releaseReference	()V
    //   125: aload_0
    //   126: getfield 91	net/sqlcipher/database/SQLiteQuery:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   129: invokevirtual 144	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   132: iconst_0
    //   133: ireturn
    //   134: astore 6
    //   136: aload_0
    //   137: getfield 91	net/sqlcipher/database/SQLiteQuery:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   140: invokevirtual 147	net/sqlcipher/database/SQLiteDatabase:onCorruption	()V
    //   143: aload 6
    //   145: athrow
    //   146: astore 6
    //   148: aload_1
    //   149: invokevirtual 141	net/sqlcipher/CursorWindow:releaseReference	()V
    //   152: aload 6
    //   154: athrow
    //   155: astore_1
    //   156: aload_0
    //   157: invokevirtual 72	net/sqlcipher/database/SQLiteQuery:releaseReference	()V
    //   160: aload_0
    //   161: getfield 91	net/sqlcipher/database/SQLiteQuery:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   164: invokevirtual 144	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   167: aload_1
    //   168: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	169	0	this	SQLiteQuery
    //   0	169	1	paramCursorWindow	CursorWindow
    //   0	169	2	paramInt1	int
    //   0	169	3	paramInt2	int
    //   3	91	4	l	long
    //   115	1	6	localIllegalStateException	IllegalStateException
    //   134	10	6	localSQLiteDatabaseCorruptException	SQLiteDatabaseCorruptException
    //   146	7	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   31	85	115	java/lang/IllegalStateException
    //   85	98	115	java/lang/IllegalStateException
    //   31	85	134	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   85	98	134	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   31	85	146	finally
    //   85	98	146	finally
    //   136	146	146	finally
    //   27	31	155	finally
    //   98	102	155	finally
    //   117	121	155	finally
    //   148	155	155	finally
  }
  
  void requery()
  {
    if (mBindArgs != null)
    {
      int j = mBindArgs.length;
      int i = 0;
      while (i < j) {
        try
        {
          super.bindString(i + 1, mBindArgs[i]);
          i += 1;
        }
        catch (SQLiteMisuseException localSQLiteMisuseException)
        {
          StringBuilder localStringBuilder = new StringBuilder("mSql " + mSql);
          i = 0;
          while (i < j)
          {
            localStringBuilder.append(" ");
            localStringBuilder.append(mBindArgs[i]);
            i += 1;
          }
          localStringBuilder.append(" ");
          throw new IllegalStateException(localStringBuilder.toString(), localSQLiteMisuseException);
        }
      }
    }
  }
  
  public String toString()
  {
    return "SQLiteQuery: " + mSql;
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteQuery
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */