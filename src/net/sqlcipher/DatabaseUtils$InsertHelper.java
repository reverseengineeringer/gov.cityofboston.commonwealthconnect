package net.sqlcipher;

import android.content.ContentValues;
import android.util.Log;
import java.util.HashMap;
import net.sqlcipher.database.SQLiteDatabase;
import net.sqlcipher.database.SQLiteStatement;

public class DatabaseUtils$InsertHelper
{
  public static final int TABLE_INFO_PRAGMA_COLUMNNAME_INDEX = 1;
  public static final int TABLE_INFO_PRAGMA_DEFAULT_INDEX = 4;
  private HashMap<String, Integer> mColumns;
  private final SQLiteDatabase mDb;
  private String mInsertSQL = null;
  private SQLiteStatement mInsertStatement = null;
  private SQLiteStatement mPreparedStatement = null;
  private SQLiteStatement mReplaceStatement = null;
  private final String mTableName;
  
  public DatabaseUtils$InsertHelper(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    mDb = paramSQLiteDatabase;
    mTableName = paramString;
  }
  
  private void buildSQL()
    throws SQLException
  {
    StringBuilder localStringBuilder1 = new StringBuilder(128);
    localStringBuilder1.append("INSERT INTO ");
    localStringBuilder1.append(mTableName);
    localStringBuilder1.append(" (");
    StringBuilder localStringBuilder2 = new StringBuilder(128);
    localStringBuilder2.append("VALUES (");
    int i = 1;
    Object localObject1 = null;
    Cursor localCursor;
    for (;;)
    {
      try
      {
        localCursor = mDb.rawQuery("PRAGMA table_info(" + mTableName + ")", null);
        localObject1 = localCursor;
        mColumns = new HashMap(localCursor.getCount());
        localObject1 = localCursor;
        if (!localCursor.moveToNext()) {
          break;
        }
        localObject1 = localCursor;
        String str1 = localCursor.getString(1);
        localObject1 = localCursor;
        String str3 = localCursor.getString(4);
        localObject1 = localCursor;
        mColumns.put(str1, Integer.valueOf(i));
        localObject1 = localCursor;
        localStringBuilder1.append("'");
        localObject1 = localCursor;
        localStringBuilder1.append(str1);
        localObject1 = localCursor;
        localStringBuilder1.append("'");
        if (str3 == null)
        {
          localObject1 = localCursor;
          localStringBuilder2.append("?");
          localObject1 = localCursor;
          if (i == localCursor.getCount())
          {
            str1 = ") ";
            localObject1 = localCursor;
            localStringBuilder1.append(str1);
            localObject1 = localCursor;
            if (i != localCursor.getCount()) {
              break label338;
            }
            str1 = ");";
            localObject1 = localCursor;
            localStringBuilder2.append(str1);
            i += 1;
          }
        }
        else
        {
          localObject1 = localCursor;
          localStringBuilder2.append("COALESCE(?, ");
          localObject1 = localCursor;
          localStringBuilder2.append(str3);
          localObject1 = localCursor;
          localStringBuilder2.append(")");
          continue;
        }
        str2 = ", ";
      }
      finally
      {
        if (localObject1 != null) {
          ((android.database.Cursor)localObject1).close();
        }
      }
      continue;
      label338:
      String str2 = ", ";
    }
    if (localCursor != null) {
      localCursor.close();
    }
    localStringBuilder1.append(localStringBuilder2);
    mInsertSQL = localStringBuilder1.toString();
  }
  
  private SQLiteStatement getStatement(boolean paramBoolean)
    throws SQLException
  {
    if (paramBoolean)
    {
      if (mReplaceStatement == null)
      {
        if (mInsertSQL == null) {
          buildSQL();
        }
        String str = "INSERT OR REPLACE" + mInsertSQL.substring(6);
        mReplaceStatement = mDb.compileStatement(str);
      }
      return mReplaceStatement;
    }
    if (mInsertStatement == null)
    {
      if (mInsertSQL == null) {
        buildSQL();
      }
      mInsertStatement = mDb.compileStatement(mInsertSQL);
    }
    return mInsertStatement;
  }
  
  /* Error */
  private long insertInternal(ContentValues paramContentValues, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iload_2
    //   4: invokespecial 142	net/sqlcipher/DatabaseUtils$InsertHelper:getStatement	(Z)Lnet/sqlcipher/database/SQLiteStatement;
    //   7: astore 5
    //   9: aload 5
    //   11: invokevirtual 147	net/sqlcipher/database/SQLiteStatement:clearBindings	()V
    //   14: aload_1
    //   15: invokevirtual 153	android/content/ContentValues:valueSet	()Ljava/util/Set;
    //   18: invokeinterface 159 1 0
    //   23: astore 6
    //   25: aload 6
    //   27: invokeinterface 164 1 0
    //   32: ifeq +93 -> 125
    //   35: aload 6
    //   37: invokeinterface 168 1 0
    //   42: checkcast 170	java/util/Map$Entry
    //   45: astore 7
    //   47: aload 5
    //   49: aload_0
    //   50: aload 7
    //   52: invokeinterface 173 1 0
    //   57: checkcast 131	java/lang/String
    //   60: invokevirtual 177	net/sqlcipher/DatabaseUtils$InsertHelper:getColumnIndex	(Ljava/lang/String;)I
    //   63: aload 7
    //   65: invokeinterface 180 1 0
    //   70: invokestatic 184	net/sqlcipher/DatabaseUtils:bindObjectToProgram	(Lnet/sqlcipher/database/SQLiteProgram;ILjava/lang/Object;)V
    //   73: goto -48 -> 25
    //   76: astore 5
    //   78: ldc -70
    //   80: new 47	java/lang/StringBuilder
    //   83: dup
    //   84: invokespecial 61	java/lang/StringBuilder:<init>	()V
    //   87: ldc -68
    //   89: invokevirtual 56	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   92: aload_1
    //   93: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   96: ldc -63
    //   98: invokevirtual 56	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   101: aload_0
    //   102: getfield 41	net/sqlcipher/DatabaseUtils$InsertHelper:mTableName	Ljava/lang/String;
    //   105: invokevirtual 56	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: invokevirtual 69	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   111: aload 5
    //   113: invokestatic 199	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   116: pop
    //   117: ldc2_w 200
    //   120: lstore_3
    //   121: aload_0
    //   122: monitorexit
    //   123: lload_3
    //   124: lreturn
    //   125: aload 5
    //   127: invokevirtual 205	net/sqlcipher/database/SQLiteStatement:executeInsert	()J
    //   130: lstore_3
    //   131: goto -10 -> 121
    //   134: astore_1
    //   135: aload_0
    //   136: monitorexit
    //   137: aload_1
    //   138: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	139	0	this	InsertHelper
    //   0	139	1	paramContentValues	ContentValues
    //   0	139	2	paramBoolean	boolean
    //   120	11	3	l	long
    //   7	41	5	localSQLiteStatement	SQLiteStatement
    //   76	50	5	localSQLException	SQLException
    //   23	13	6	localIterator	java.util.Iterator
    //   45	19	7	localEntry	java.util.Map.Entry
    // Exception table:
    //   from	to	target	type
    //   2	25	76	net/sqlcipher/SQLException
    //   25	73	76	net/sqlcipher/SQLException
    //   125	131	76	net/sqlcipher/SQLException
    //   2	25	134	finally
    //   25	73	134	finally
    //   78	117	134	finally
    //   125	131	134	finally
  }
  
  public void bind(int paramInt, double paramDouble)
  {
    mPreparedStatement.bindDouble(paramInt, paramDouble);
  }
  
  public void bind(int paramInt, float paramFloat)
  {
    mPreparedStatement.bindDouble(paramInt, paramFloat);
  }
  
  public void bind(int paramInt1, int paramInt2)
  {
    mPreparedStatement.bindLong(paramInt1, paramInt2);
  }
  
  public void bind(int paramInt, long paramLong)
  {
    mPreparedStatement.bindLong(paramInt, paramLong);
  }
  
  public void bind(int paramInt, String paramString)
  {
    if (paramString == null)
    {
      mPreparedStatement.bindNull(paramInt);
      return;
    }
    mPreparedStatement.bindString(paramInt, paramString);
  }
  
  public void bind(int paramInt, boolean paramBoolean)
  {
    SQLiteStatement localSQLiteStatement = mPreparedStatement;
    if (paramBoolean) {}
    for (long l = 1L;; l = 0L)
    {
      localSQLiteStatement.bindLong(paramInt, l);
      return;
    }
  }
  
  public void bind(int paramInt, byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null)
    {
      mPreparedStatement.bindNull(paramInt);
      return;
    }
    mPreparedStatement.bindBlob(paramInt, paramArrayOfByte);
  }
  
  public void bindNull(int paramInt)
  {
    mPreparedStatement.bindNull(paramInt);
  }
  
  public void close()
  {
    if (mInsertStatement != null)
    {
      mInsertStatement.close();
      mInsertStatement = null;
    }
    if (mReplaceStatement != null)
    {
      mReplaceStatement.close();
      mReplaceStatement = null;
    }
    mInsertSQL = null;
    mColumns = null;
  }
  
  public long execute()
  {
    if (mPreparedStatement == null) {
      throw new IllegalStateException("you must prepare this inserter before calling execute");
    }
    try
    {
      long l = mPreparedStatement.executeInsert();
      return l;
    }
    catch (SQLException localSQLException)
    {
      Log.e("DatabaseUtils", "Error executing InsertHelper with table " + mTableName, localSQLException);
      return -1L;
    }
    finally
    {
      mPreparedStatement = null;
    }
  }
  
  public int getColumnIndex(String paramString)
  {
    getStatement(false);
    Integer localInteger = (Integer)mColumns.get(paramString);
    if (localInteger == null) {
      throw new IllegalArgumentException("column '" + paramString + "' is invalid");
    }
    return localInteger.intValue();
  }
  
  public long insert(ContentValues paramContentValues)
  {
    return insertInternal(paramContentValues, false);
  }
  
  public void prepareForInsert()
  {
    mPreparedStatement = getStatement(false);
    mPreparedStatement.clearBindings();
  }
  
  public void prepareForReplace()
  {
    mPreparedStatement = getStatement(true);
    mPreparedStatement.clearBindings();
  }
  
  public long replace(ContentValues paramContentValues)
  {
    return insertInternal(paramContentValues, true);
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.DatabaseUtils.InsertHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */