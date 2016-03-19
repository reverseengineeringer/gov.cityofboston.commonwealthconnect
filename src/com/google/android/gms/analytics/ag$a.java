package com.google.android.gms.analytics;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build.VERSION;
import com.google.android.gms.internal.ld;
import java.io.File;
import java.util.HashSet;
import java.util.Set;

class ag$a
  extends SQLiteOpenHelper
{
  private boolean BZ;
  private long Ca = 0L;
  
  ag$a(ag paramag, Context paramContext, String paramString)
  {
    super(paramContext, paramString, null, 1);
  }
  
  private void a(SQLiteDatabase paramSQLiteDatabase)
  {
    int j = 0;
    Cursor localCursor = paramSQLiteDatabase.rawQuery("SELECT * FROM hits2 WHERE 0", null);
    HashSet localHashSet = new HashSet();
    try
    {
      String[] arrayOfString = localCursor.getColumnNames();
      i = 0;
      while (i < arrayOfString.length)
      {
        localHashSet.add(arrayOfString[i]);
        i += 1;
      }
      localCursor.close();
      if ((!localHashSet.remove("hit_id")) || (!localHashSet.remove("hit_url")) || (!localHashSet.remove("hit_string")) || (!localHashSet.remove("hit_time"))) {
        throw new SQLiteException("Database column missing");
      }
    }
    finally
    {
      localCursor.close();
    }
    int i = j;
    if (!localHashSet.remove("hit_app_id")) {
      i = 1;
    }
    if (!localHashSet.isEmpty()) {
      throw new SQLiteException("Database has extra columns");
    }
    if (i != 0) {
      paramSQLiteDatabase.execSQL("ALTER TABLE hits2 ADD COLUMN hit_app_id");
    }
  }
  
  /* Error */
  private boolean a(String paramString, SQLiteDatabase paramSQLiteDatabase)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_2
    //   4: ldc 86
    //   6: iconst_1
    //   7: anewarray 88	java/lang/String
    //   10: dup
    //   11: iconst_0
    //   12: ldc 90
    //   14: aastore
    //   15: ldc 92
    //   17: iconst_1
    //   18: anewarray 88	java/lang/String
    //   21: dup
    //   22: iconst_0
    //   23: aload_1
    //   24: aastore
    //   25: aconst_null
    //   26: aconst_null
    //   27: aconst_null
    //   28: invokevirtual 96	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   31: astore_2
    //   32: aload_2
    //   33: invokeinterface 99 1 0
    //   38: istore_3
    //   39: aload_2
    //   40: ifnull +9 -> 49
    //   43: aload_2
    //   44: invokeinterface 52 1 0
    //   49: iload_3
    //   50: ireturn
    //   51: astore_2
    //   52: aconst_null
    //   53: astore_2
    //   54: new 101	java/lang/StringBuilder
    //   57: dup
    //   58: invokespecial 102	java/lang/StringBuilder:<init>	()V
    //   61: ldc 104
    //   63: invokevirtual 108	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   66: aload_1
    //   67: invokevirtual 108	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   70: invokevirtual 112	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   73: invokestatic 117	com/google/android/gms/analytics/ae:W	(Ljava/lang/String;)V
    //   76: aload_2
    //   77: ifnull +9 -> 86
    //   80: aload_2
    //   81: invokeinterface 52 1 0
    //   86: iconst_0
    //   87: ireturn
    //   88: astore_1
    //   89: aload 4
    //   91: astore_2
    //   92: aload_2
    //   93: ifnull +9 -> 102
    //   96: aload_2
    //   97: invokeinterface 52 1 0
    //   102: aload_1
    //   103: athrow
    //   104: astore_1
    //   105: goto -13 -> 92
    //   108: astore_1
    //   109: goto -17 -> 92
    //   112: astore 4
    //   114: goto -60 -> 54
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	117	0	this	a
    //   0	117	1	paramString	String
    //   0	117	2	paramSQLiteDatabase	SQLiteDatabase
    //   38	12	3	bool	boolean
    //   1	89	4	localObject	Object
    //   112	1	4	localSQLiteException	SQLiteException
    // Exception table:
    //   from	to	target	type
    //   3	32	51	android/database/sqlite/SQLiteException
    //   3	32	88	finally
    //   32	39	104	finally
    //   54	76	108	finally
    //   32	39	112	android/database/sqlite/SQLiteException
  }
  
  public SQLiteDatabase getWritableDatabase()
  {
    if ((BZ) && (Ca + 3600000L > ag.a(Cb).currentTimeMillis())) {
      throw new SQLiteException("Database creation failed");
    }
    Object localObject1 = null;
    BZ = true;
    Ca = ag.a(Cb).currentTimeMillis();
    try
    {
      localObject2 = super.getWritableDatabase();
      localObject1 = localObject2;
    }
    catch (SQLiteException localSQLiteException)
    {
      for (;;)
      {
        Object localObject2;
        ag.c(Cb).getDatabasePath(ag.b(Cb)).delete();
      }
    }
    localObject2 = localObject1;
    if (localObject1 == null) {
      localObject2 = super.getWritableDatabase();
    }
    BZ = false;
    return (SQLiteDatabase)localObject2;
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    t.ag(paramSQLiteDatabase.getPath());
  }
  
  public void onOpen(SQLiteDatabase paramSQLiteDatabase)
  {
    Cursor localCursor;
    if (Build.VERSION.SDK_INT < 15) {
      localCursor = paramSQLiteDatabase.rawQuery("PRAGMA journal_mode=memory", null);
    }
    try
    {
      localCursor.moveToFirst();
      localCursor.close();
      if (!a("hits2", paramSQLiteDatabase))
      {
        paramSQLiteDatabase.execSQL(ag.fk());
        return;
      }
    }
    finally
    {
      localCursor.close();
    }
    a(paramSQLiteDatabase);
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2) {}
}

/* Location:
 * Qualified Name:     com.google.android.gms.analytics.ag.a
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */