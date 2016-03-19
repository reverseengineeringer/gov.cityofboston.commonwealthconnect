package net.sqlcipher.database;

import android.content.Context;
import android.util.Log;
import java.io.File;

public abstract class SQLiteOpenHelper
{
  private static final String TAG = SQLiteOpenHelper.class.getSimpleName();
  private final Context mContext;
  private SQLiteDatabase mDatabase = null;
  private final SQLiteDatabase.CursorFactory mFactory;
  private boolean mIsInitializing = false;
  private final String mName;
  private final int mNewVersion;
  
  public SQLiteOpenHelper(Context paramContext, String paramString, SQLiteDatabase.CursorFactory paramCursorFactory, int paramInt)
  {
    if (paramInt < 1) {
      throw new IllegalArgumentException("Version must be >= 1, was " + paramInt);
    }
    mContext = paramContext;
    mName = paramString;
    mFactory = paramCursorFactory;
    mNewVersion = paramInt;
  }
  
  public void close()
  {
    try
    {
      if (mIsInitializing) {
        throw new IllegalStateException("Closed during initialization");
      }
    }
    finally {}
    if ((mDatabase != null) && (mDatabase.isOpen()))
    {
      mDatabase.close();
      mDatabase = null;
    }
  }
  
  public SQLiteDatabase getReadableDatabase(String paramString)
  {
    for (;;)
    {
      try
      {
        if ((mDatabase != null) && (mDatabase.isOpen()))
        {
          paramString = mDatabase;
          return paramString;
        }
        if (mIsInitializing) {
          throw new IllegalStateException("getReadableDatabase called recursively");
        }
      }
      finally {}
      SQLiteDatabase localSQLiteDatabase3;
      SQLiteDatabase localSQLiteDatabase2;
      try
      {
        SQLiteDatabase localSQLiteDatabase1 = getWritableDatabase(paramString);
        paramString = localSQLiteDatabase1;
      }
      catch (SQLiteException localSQLiteException)
      {
        if (mName == null) {
          throw localSQLiteException;
        }
        Log.e(TAG, "Couldn't open " + mName + " for writing (will try read-only):", localSQLiteException);
        localSQLiteDatabase3 = null;
        localSQLiteDatabase2 = null;
        Object localObject = localSQLiteDatabase3;
        try
        {
          mIsInitializing = true;
          localObject = localSQLiteDatabase3;
          String str = mContext.getDatabasePath(mName).getPath();
          localObject = localSQLiteDatabase3;
          File localFile1 = new File(str);
          localObject = localSQLiteDatabase3;
          File localFile2 = new File(mContext.getDatabasePath(mName).getParent());
          localObject = localSQLiteDatabase3;
          if (!localFile2.exists())
          {
            localObject = localSQLiteDatabase3;
            localFile2.mkdirs();
          }
          localObject = localSQLiteDatabase3;
          if (!localFile1.exists())
          {
            localObject = localSQLiteDatabase3;
            mIsInitializing = false;
            localObject = localSQLiteDatabase3;
            localSQLiteDatabase2 = getWritableDatabase(paramString);
            localObject = localSQLiteDatabase2;
            mIsInitializing = true;
            localObject = localSQLiteDatabase2;
            localSQLiteDatabase2.close();
          }
          localObject = localSQLiteDatabase2;
          localSQLiteDatabase2 = SQLiteDatabase.openDatabase(str, paramString, mFactory, 1);
          localObject = localSQLiteDatabase2;
          if (localSQLiteDatabase2.getVersion() != mNewVersion)
          {
            localObject = localSQLiteDatabase2;
            throw new SQLiteException("Can't upgrade read-only database from version " + localSQLiteDatabase2.getVersion() + " to " + mNewVersion + ": " + str);
          }
        }
        finally
        {
          mIsInitializing = false;
          if ((localObject != null) && (localObject != mDatabase)) {
            ((SQLiteDatabase)localObject).close();
          }
        }
        localObject = localSQLiteDatabase2;
        onOpen(localSQLiteDatabase2);
        localObject = localSQLiteDatabase2;
        Log.w(TAG, "Opened " + mName + " in read-only mode");
        localObject = localSQLiteDatabase2;
        mDatabase = localSQLiteDatabase2;
        localObject = localSQLiteDatabase2;
        localSQLiteDatabase3 = mDatabase;
        mIsInitializing = false;
        paramString = localSQLiteDatabase3;
      }
      if (localSQLiteDatabase2 != null)
      {
        paramString = localSQLiteDatabase3;
        if (localSQLiteDatabase2 != mDatabase)
        {
          localSQLiteDatabase2.close();
          paramString = localSQLiteDatabase3;
        }
      }
    }
  }
  
  /* Error */
  public SQLiteDatabase getWritableDatabase(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   6: ifnull +32 -> 38
    //   9: aload_0
    //   10: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   13: invokevirtual 76	net/sqlcipher/database/SQLiteDatabase:isOpen	()Z
    //   16: ifeq +22 -> 38
    //   19: aload_0
    //   20: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   23: invokevirtual 150	net/sqlcipher/database/SQLiteDatabase:isReadOnly	()Z
    //   26: ifne +12 -> 38
    //   29: aload_0
    //   30: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   33: astore_3
    //   34: aload_0
    //   35: monitorexit
    //   36: aload_3
    //   37: areturn
    //   38: aload_0
    //   39: getfield 36	net/sqlcipher/database/SQLiteOpenHelper:mIsInitializing	Z
    //   42: ifeq +18 -> 60
    //   45: new 67	java/lang/IllegalStateException
    //   48: dup
    //   49: ldc -104
    //   51: invokespecial 70	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   54: athrow
    //   55: astore_1
    //   56: aload_0
    //   57: monitorexit
    //   58: aload_1
    //   59: athrow
    //   60: aconst_null
    //   61: astore 4
    //   63: aload_0
    //   64: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   67: ifnull +10 -> 77
    //   70: aload_0
    //   71: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   74: invokevirtual 155	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   77: aload 4
    //   79: astore_3
    //   80: aload_0
    //   81: iconst_1
    //   82: putfield 36	net/sqlcipher/database/SQLiteOpenHelper:mIsInitializing	Z
    //   85: aload 4
    //   87: astore_3
    //   88: aload_0
    //   89: getfield 60	net/sqlcipher/database/SQLiteOpenHelper:mName	Ljava/lang/String;
    //   92: ifnonnull +111 -> 203
    //   95: aload 4
    //   97: astore_3
    //   98: aconst_null
    //   99: aload_1
    //   100: invokestatic 159	net/sqlcipher/database/SQLiteDatabase:create	(Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;Ljava/lang/String;)Lnet/sqlcipher/database/SQLiteDatabase;
    //   103: astore_1
    //   104: aload_1
    //   105: astore_3
    //   106: aload_1
    //   107: invokevirtual 126	net/sqlcipher/database/SQLiteDatabase:getVersion	()I
    //   110: istore_2
    //   111: aload_1
    //   112: astore_3
    //   113: iload_2
    //   114: aload_0
    //   115: getfield 64	net/sqlcipher/database/SQLiteOpenHelper:mNewVersion	I
    //   118: if_icmpeq +36 -> 154
    //   121: aload_1
    //   122: astore_3
    //   123: aload_1
    //   124: invokevirtual 162	net/sqlcipher/database/SQLiteDatabase:beginTransaction	()V
    //   127: iload_2
    //   128: ifne +148 -> 276
    //   131: aload_0
    //   132: aload_1
    //   133: invokevirtual 165	net/sqlcipher/database/SQLiteOpenHelper:onCreate	(Lnet/sqlcipher/database/SQLiteDatabase;)V
    //   136: aload_1
    //   137: aload_0
    //   138: getfield 64	net/sqlcipher/database/SQLiteOpenHelper:mNewVersion	I
    //   141: invokevirtual 169	net/sqlcipher/database/SQLiteDatabase:setVersion	(I)V
    //   144: aload_1
    //   145: invokevirtual 172	net/sqlcipher/database/SQLiteDatabase:setTransactionSuccessful	()V
    //   148: aload_1
    //   149: astore_3
    //   150: aload_1
    //   151: invokevirtual 175	net/sqlcipher/database/SQLiteDatabase:endTransaction	()V
    //   154: aload_1
    //   155: astore_3
    //   156: aload_0
    //   157: aload_1
    //   158: invokevirtual 137	net/sqlcipher/database/SQLiteOpenHelper:onOpen	(Lnet/sqlcipher/database/SQLiteDatabase;)V
    //   161: aload_0
    //   162: iconst_0
    //   163: putfield 36	net/sqlcipher/database/SQLiteOpenHelper:mIsInitializing	Z
    //   166: iconst_1
    //   167: ifeq +177 -> 344
    //   170: aload_0
    //   171: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   174: astore_3
    //   175: aload_3
    //   176: ifnull +17 -> 193
    //   179: aload_0
    //   180: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   183: invokevirtual 78	net/sqlcipher/database/SQLiteDatabase:close	()V
    //   186: aload_0
    //   187: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   190: invokevirtual 178	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   193: aload_0
    //   194: aload_1
    //   195: putfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   198: aload_1
    //   199: astore_3
    //   200: goto -166 -> 34
    //   203: aload 4
    //   205: astore_3
    //   206: aload_0
    //   207: getfield 58	net/sqlcipher/database/SQLiteOpenHelper:mContext	Landroid/content/Context;
    //   210: aload_0
    //   211: getfield 60	net/sqlcipher/database/SQLiteOpenHelper:mName	Ljava/lang/String;
    //   214: invokevirtual 103	android/content/Context:getDatabasePath	(Ljava/lang/String;)Ljava/io/File;
    //   217: invokevirtual 108	java/io/File:getPath	()Ljava/lang/String;
    //   220: astore 5
    //   222: aload 4
    //   224: astore_3
    //   225: new 105	java/io/File
    //   228: dup
    //   229: aload 5
    //   231: invokespecial 109	java/io/File:<init>	(Ljava/lang/String;)V
    //   234: astore 6
    //   236: aload 4
    //   238: astore_3
    //   239: aload 6
    //   241: invokevirtual 115	java/io/File:exists	()Z
    //   244: ifne +15 -> 259
    //   247: aload 4
    //   249: astore_3
    //   250: aload 6
    //   252: invokevirtual 182	java/io/File:getParentFile	()Ljava/io/File;
    //   255: invokevirtual 118	java/io/File:mkdirs	()Z
    //   258: pop
    //   259: aload 4
    //   261: astore_3
    //   262: aload 5
    //   264: aload_1
    //   265: aload_0
    //   266: getfield 62	net/sqlcipher/database/SQLiteOpenHelper:mFactory	Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;
    //   269: invokestatic 186	net/sqlcipher/database/SQLiteDatabase:openOrCreateDatabase	(Ljava/lang/String;Ljava/lang/String;Lnet/sqlcipher/database/SQLiteDatabase$CursorFactory;)Lnet/sqlcipher/database/SQLiteDatabase;
    //   272: astore_1
    //   273: goto -169 -> 104
    //   276: aload_0
    //   277: aload_1
    //   278: iload_2
    //   279: aload_0
    //   280: getfield 64	net/sqlcipher/database/SQLiteOpenHelper:mNewVersion	I
    //   283: invokevirtual 190	net/sqlcipher/database/SQLiteOpenHelper:onUpgrade	(Lnet/sqlcipher/database/SQLiteDatabase;II)V
    //   286: goto -150 -> 136
    //   289: astore 4
    //   291: aload_1
    //   292: astore_3
    //   293: aload_1
    //   294: invokevirtual 175	net/sqlcipher/database/SQLiteDatabase:endTransaction	()V
    //   297: aload_1
    //   298: astore_3
    //   299: aload 4
    //   301: athrow
    //   302: astore_1
    //   303: aload_0
    //   304: iconst_0
    //   305: putfield 36	net/sqlcipher/database/SQLiteOpenHelper:mIsInitializing	Z
    //   308: iconst_0
    //   309: ifeq +64 -> 373
    //   312: aload_0
    //   313: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   316: astore 4
    //   318: aload 4
    //   320: ifnull +17 -> 337
    //   323: aload_0
    //   324: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   327: invokevirtual 78	net/sqlcipher/database/SQLiteDatabase:close	()V
    //   330: aload_0
    //   331: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   334: invokevirtual 178	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   337: aload_0
    //   338: aload_3
    //   339: putfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   342: aload_1
    //   343: athrow
    //   344: aload_0
    //   345: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   348: ifnull +10 -> 358
    //   351: aload_0
    //   352: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   355: invokevirtual 178	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   358: aload_1
    //   359: astore_3
    //   360: aload_1
    //   361: ifnull -327 -> 34
    //   364: aload_1
    //   365: invokevirtual 78	net/sqlcipher/database/SQLiteDatabase:close	()V
    //   368: aload_1
    //   369: astore_3
    //   370: goto -336 -> 34
    //   373: aload_0
    //   374: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   377: ifnull +10 -> 387
    //   380: aload_0
    //   381: getfield 34	net/sqlcipher/database/SQLiteOpenHelper:mDatabase	Lnet/sqlcipher/database/SQLiteDatabase;
    //   384: invokevirtual 178	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   387: aload_3
    //   388: ifnull -46 -> 342
    //   391: aload_3
    //   392: invokevirtual 78	net/sqlcipher/database/SQLiteDatabase:close	()V
    //   395: goto -53 -> 342
    //   398: astore 4
    //   400: goto -70 -> 330
    //   403: astore_3
    //   404: goto -218 -> 186
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	407	0	this	SQLiteOpenHelper
    //   0	407	1	paramString	String
    //   110	169	2	i	int
    //   33	359	3	localObject1	Object
    //   403	1	3	localException1	Exception
    //   61	199	4	localObject2	Object
    //   289	11	4	localObject3	Object
    //   316	3	4	localSQLiteDatabase	SQLiteDatabase
    //   398	1	4	localException2	Exception
    //   220	43	5	str	String
    //   234	17	6	localFile	File
    // Exception table:
    //   from	to	target	type
    //   2	34	55	finally
    //   38	55	55	finally
    //   63	77	55	finally
    //   161	166	55	finally
    //   170	175	55	finally
    //   179	186	55	finally
    //   186	193	55	finally
    //   193	198	55	finally
    //   303	308	55	finally
    //   312	318	55	finally
    //   323	330	55	finally
    //   330	337	55	finally
    //   337	342	55	finally
    //   342	344	55	finally
    //   344	358	55	finally
    //   364	368	55	finally
    //   373	387	55	finally
    //   391	395	55	finally
    //   131	136	289	finally
    //   136	148	289	finally
    //   276	286	289	finally
    //   80	85	302	finally
    //   88	95	302	finally
    //   98	104	302	finally
    //   106	111	302	finally
    //   113	121	302	finally
    //   123	127	302	finally
    //   150	154	302	finally
    //   156	161	302	finally
    //   206	222	302	finally
    //   225	236	302	finally
    //   239	247	302	finally
    //   250	259	302	finally
    //   262	273	302	finally
    //   293	297	302	finally
    //   299	302	302	finally
    //   323	330	398	java/lang/Exception
    //   179	186	403	java/lang/Exception
  }
  
  public abstract void onCreate(SQLiteDatabase paramSQLiteDatabase);
  
  public void onOpen(SQLiteDatabase paramSQLiteDatabase) {}
  
  public abstract void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2);
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteOpenHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */