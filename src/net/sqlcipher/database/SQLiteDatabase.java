package net.sqlcipher.database;

import android.content.ContentValues;
import android.content.Context;
import android.content.res.AssetManager;
import android.os.Debug;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.google.common.collect.Maps;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipInputStream;
import net.sqlcipher.CrossProcessCursorWrapper;
import net.sqlcipher.Cursor;
import net.sqlcipher.DatabaseUtils;
import net.sqlcipher.SQLException;

public class SQLiteDatabase
  extends SQLiteClosable
{
  private static final String COMMIT_SQL = "COMMIT;";
  public static final int CONFLICT_ABORT = 2;
  public static final int CONFLICT_FAIL = 3;
  public static final int CONFLICT_IGNORE = 4;
  public static final int CONFLICT_NONE = 0;
  public static final int CONFLICT_REPLACE = 5;
  public static final int CONFLICT_ROLLBACK = 1;
  private static final String[] CONFLICT_VALUES = { "", " OR ROLLBACK ", " OR ABORT ", " OR FAIL ", " OR IGNORE ", " OR REPLACE " };
  public static final int CREATE_IF_NECESSARY = 268435456;
  private static final Pattern EMAIL_IN_DB_PATTERN = Pattern.compile("[\\w\\.\\-]+@[\\w\\.\\-]+");
  private static final int EVENT_DB_CORRUPT = 75004;
  private static final int EVENT_DB_OPERATION = 52000;
  static final String GET_LOCK_LOG_PREFIX = "GETLOCK:";
  private static final int LOCK_ACQUIRED_WARNING_THREAD_TIME_IN_MS = 100;
  private static final int LOCK_ACQUIRED_WARNING_TIME_IN_MS = 300;
  private static final int LOCK_ACQUIRED_WARNING_TIME_IN_MS_ALWAYS_PRINT = 2000;
  private static final int LOCK_WARNING_WINDOW_IN_MS = 20000;
  private static final String LOG_SLOW_QUERIES_PROPERTY = "db.log.slow_query_threshold";
  public static final int MAX_SQL_CACHE_SIZE = 250;
  private static final int MAX_WARNINGS_ON_CACHESIZE_CONDITION = 1;
  public static final int NO_LOCALIZED_COLLATORS = 16;
  public static final int OPEN_READONLY = 1;
  public static final int OPEN_READWRITE = 0;
  private static final int OPEN_READ_MASK = 1;
  private static final int QUERY_LOG_SQL_LENGTH = 64;
  private static final int SLEEP_AFTER_YIELD_QUANTUM = 1000;
  public static final int SQLITE_MAX_LIKE_PATTERN_LENGTH = 50000;
  private static final String TAG = "Database";
  private static int sQueryLogTimeInMillis = 0;
  private int mCacheFullWarnings;
  Map<String, SQLiteCompiledSql> mCompiledQueries = Maps.newHashMap();
  private CursorFactory mFactory;
  private int mFlags;
  private boolean mInnerTransactionIsSuccessful;
  private long mLastLockMessageTime = 0L;
  private String mLastSqlStatement = null;
  private final ReentrantLock mLock = new ReentrantLock(true);
  private long mLockAcquiredThreadTime = 0L;
  private long mLockAcquiredWallTime = 0L;
  private boolean mLockingEnabled = true;
  private int mMaxSqlCacheSize = 250;
  int mNativeHandle = 0;
  private int mNumCacheHits;
  private int mNumCacheMisses;
  private String mPath;
  private String mPathForLogs = null;
  private WeakHashMap<SQLiteClosable, Object> mPrograms;
  private final Random mRandom = new Random();
  private final int mSlowQueryThreshold;
  private Throwable mStackTrace = null;
  private final Map<String, SyncUpdateInfo> mSyncUpdateInfo = new HashMap();
  int mTempTableSequence = 0;
  private String mTimeClosed = null;
  private String mTimeOpened = null;
  private boolean mTransactionIsSuccessful;
  private SQLiteTransactionListener mTransactionListener;
  
  public SQLiteDatabase(String paramString1, String paramString2, CursorFactory paramCursorFactory, int paramInt)
  {
    this(paramString1, paramString2, paramCursorFactory, paramInt, null);
  }
  
  public SQLiteDatabase(String paramString1, String paramString2, CursorFactory paramCursorFactory, int paramInt, SQLiteDatabaseHook paramSQLiteDatabaseHook)
  {
    if (paramString1 == null) {
      throw new IllegalArgumentException("path should not be null");
    }
    mFlags = paramInt;
    mPath = paramString1;
    mSlowQueryThreshold = -1;
    mStackTrace = new DatabaseObjectNotClosedException().fillInStackTrace();
    mFactory = paramCursorFactory;
    dbopen(mPath, mFlags);
    if (paramSQLiteDatabaseHook != null) {
      paramSQLiteDatabaseHook.preKey(this);
    }
    native_key(paramString2.toCharArray());
    if (paramSQLiteDatabaseHook != null) {
      paramSQLiteDatabaseHook.postKey(this);
    }
    if (SQLiteDebug.DEBUG_SQL_CACHE) {
      mTimeOpened = getTime();
    }
    mPrograms = new WeakHashMap();
    try
    {
      setLocale(Locale.getDefault());
      return;
    }
    catch (RuntimeException paramString1)
    {
      Log.e("Database", "Failed to setLocale() when constructing, closing the database", paramString1);
      dbclose();
      if (SQLiteDebug.DEBUG_SQL_CACHE) {
        mTimeClosed = getTime();
      }
      throw paramString1;
    }
  }
  
  private void checkLockHoldTime()
  {
    long l1 = SystemClock.elapsedRealtime();
    long l2 = l1 - mLockAcquiredWallTime;
    if ((l2 < 2000L) && (!Log.isLoggable("Database", 2)) && (l1 - mLastLockMessageTime < 20000L)) {}
    int i;
    do
    {
      do
      {
        return;
      } while (l2 <= 300L);
      i = (int)((Debug.threadCpuTimeNanos() - mLockAcquiredThreadTime) / 1000000L);
    } while ((i <= 100) && (l2 <= 2000L));
    mLastLockMessageTime = l1;
    String str = "lock held on " + mPath + " for " + l2 + "ms. Thread time was " + i + "ms";
    if (SQLiteDebug.DEBUG_LOCK_TIME_TRACKING_STACK_TRACE)
    {
      Log.d("Database", str, new Exception());
      return;
    }
    Log.d("Database", str);
  }
  
  private void closeClosable()
  {
    deallocCachedSqlStatements();
    Iterator localIterator = mPrograms.entrySet().iterator();
    while (localIterator.hasNext())
    {
      SQLiteClosable localSQLiteClosable = (SQLiteClosable)((Map.Entry)localIterator.next()).getKey();
      if (localSQLiteClosable != null) {
        localSQLiteClosable.onAllReferencesReleasedFromContainer();
      }
    }
  }
  
  public static SQLiteDatabase create(CursorFactory paramCursorFactory, String paramString)
  {
    return openDatabase(":memory:", paramString, paramCursorFactory, 268435456);
  }
  
  private native void dbclose();
  
  private native void dbopen(String paramString, int paramInt);
  
  private void deallocCachedSqlStatements()
  {
    synchronized (mCompiledQueries)
    {
      Iterator localIterator = mCompiledQueries.values().iterator();
      if (localIterator.hasNext()) {
        ((SQLiteCompiledSql)localIterator.next()).releaseSqlStatement();
      }
    }
    mCompiledQueries.clear();
  }
  
  private native void enableSqlProfiling(String paramString);
  
  private native void enableSqlTracing(String paramString);
  
  public static String findEditTable(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      int i = paramString.indexOf(' ');
      int j = paramString.indexOf(',');
      String str;
      if ((i > 0) && ((i < j) || (j < 0))) {
        str = paramString.substring(0, i);
      }
      do
      {
        do
        {
          return str;
          str = paramString;
        } while (j <= 0);
        if (j < i) {
          break;
        }
        str = paramString;
      } while (i >= 0);
      return paramString.substring(0, j);
    }
    throw new IllegalStateException("Invalid tables");
  }
  
  private static ArrayList<Pair<String, String>> getAttachedDbs(SQLiteDatabase paramSQLiteDatabase)
  {
    if (!paramSQLiteDatabase.isOpen()) {
      return null;
    }
    ArrayList localArrayList = new ArrayList();
    paramSQLiteDatabase = paramSQLiteDatabase.rawQuery("pragma database_list;", null);
    while (paramSQLiteDatabase.moveToNext()) {
      localArrayList.add(new Pair(paramSQLiteDatabase.getString(1), paramSQLiteDatabase.getString(2)));
    }
    paramSQLiteDatabase.close();
    return localArrayList;
  }
  
  static ArrayList<SQLiteDebug.DbStats> getDbStats()
  {
    ArrayList localArrayList1 = new ArrayList();
    Iterator localIterator = getInstancemActiveDatabases.iterator();
    while (localIterator.hasNext())
    {
      SQLiteDatabase localSQLiteDatabase = (SQLiteDatabase)((WeakReference)localIterator.next()).get();
      if ((localSQLiteDatabase != null) && (localSQLiteDatabase.isOpen()))
      {
        int j = localSQLiteDatabase.native_getDbLookaside();
        Object localObject = localSQLiteDatabase.getPath();
        int i = ((String)localObject).lastIndexOf("/");
        label92:
        label114:
        Pair localPair;
        long l;
        if (i != -1)
        {
          i += 1;
          String str1 = ((String)localObject).substring(i);
          ArrayList localArrayList2 = getAttachedDbs(localSQLiteDatabase);
          if (localArrayList2 == null) {
            continue;
          }
          i = 0;
          if (i < localArrayList2.size())
          {
            localPair = (Pair)localArrayList2.get(i);
            l = getPragmaVal(localSQLiteDatabase, (String)first + ".page_count;");
            if (i != 0) {
              break label215;
            }
            localObject = str1;
          }
        }
        label215:
        int k;
        do
        {
          if (l > 0L) {
            localArrayList1.add(new SQLiteDebug.DbStats((String)localObject, l, localSQLiteDatabase.getPageSize(), j));
          }
          i += 1;
          break label114;
          break;
          i = 0;
          break label92;
          k = 0;
          str2 = "  (attached) " + (String)first;
          localObject = str2;
          j = k;
        } while (((String)second).trim().length() <= 0);
        j = ((String)second).lastIndexOf("/");
        localObject = new StringBuilder().append(str2).append(" : ");
        String str2 = (String)second;
        if (j != -1) {
          j += 1;
        }
        for (;;)
        {
          localObject = str2.substring(j);
          j = k;
          break;
          j = 0;
        }
      }
    }
    return localArrayList1;
  }
  
  private String getPathForLogs()
  {
    if (mPathForLogs != null) {
      return mPathForLogs;
    }
    if (mPath == null) {
      return null;
    }
    if (mPath.indexOf('@') == -1) {}
    for (mPathForLogs = mPath;; mPathForLogs = EMAIL_IN_DB_PATTERN.matcher(mPath).replaceAll("XX@YY")) {
      return mPathForLogs;
    }
  }
  
  /* Error */
  private static long getPragmaVal(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 425	net/sqlcipher/database/SQLiteDatabase:isOpen	()Z
    //   4: ifne +7 -> 11
    //   7: lconst_0
    //   8: lstore_2
    //   9: lload_2
    //   10: lreturn
    //   11: aconst_null
    //   12: astore 6
    //   14: new 544	net/sqlcipher/database/SQLiteStatement
    //   17: dup
    //   18: aload_0
    //   19: new 306	java/lang/StringBuilder
    //   22: dup
    //   23: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   26: ldc_w 546
    //   29: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   32: aload_1
    //   33: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   36: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   39: invokespecial 549	net/sqlcipher/database/SQLiteStatement:<init>	(Lnet/sqlcipher/database/SQLiteDatabase;Ljava/lang/String;)V
    //   42: astore_0
    //   43: aload_0
    //   44: invokevirtual 552	net/sqlcipher/database/SQLiteStatement:simpleQueryForLong	()J
    //   47: lstore 4
    //   49: lload 4
    //   51: lstore_2
    //   52: aload_0
    //   53: ifnull -44 -> 9
    //   56: aload_0
    //   57: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   60: lload 4
    //   62: lreturn
    //   63: astore_1
    //   64: aload 6
    //   66: astore_0
    //   67: aload_0
    //   68: ifnull +7 -> 75
    //   71: aload_0
    //   72: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   75: aload_1
    //   76: athrow
    //   77: astore_1
    //   78: goto -11 -> 67
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	81	0	paramSQLiteDatabase	SQLiteDatabase
    //   0	81	1	paramString	String
    //   8	44	2	l1	long
    //   47	14	4	l2	long
    //   12	53	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   14	43	63	finally
    //   43	49	77	finally
  }
  
  private String getTime()
  {
    return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS ").format(Long.valueOf(System.currentTimeMillis()));
  }
  
  private static void loadICUData(Context paramContext, File paramFile)
  {
    try
    {
      paramFile = new File(paramFile, "icu");
      if (!paramFile.exists()) {
        paramFile.mkdirs();
      }
      paramFile = new File(paramFile, "icudt46l.dat");
      if (!paramFile.exists())
      {
        paramContext = new ZipInputStream(paramContext.getAssets().open("icudt46l.zip"));
        paramContext.getNextEntry();
        paramFile = new FileOutputStream(paramFile);
        byte[] arrayOfByte = new byte['Ѐ'];
        for (;;)
        {
          int i = paramContext.read(arrayOfByte);
          if (i <= 0) {
            break;
          }
          paramFile.write(arrayOfByte, 0, i);
        }
      }
      return;
    }
    catch (Exception paramContext)
    {
      Log.e("Database", "Error copying icu data file", paramContext);
    }
    paramContext.close();
    paramFile.flush();
    paramFile.close();
  }
  
  public static void loadLibs(Context paramContext)
  {
    loadLibs(paramContext, paramContext.getFilesDir());
  }
  
  public static void loadLibs(Context paramContext, File paramFile)
  {
    System.loadLibrary("stlport_shared");
    System.loadLibrary("sqlcipher_android");
    System.loadLibrary("database_sqlcipher");
    boolean bool = new File("/system/usr/icu/icudt46l.dat").exists();
    if (bool) {}
    for (String str = "/system/usr";; str = paramFile.getAbsolutePath())
    {
      setICURoot(str);
      if (!bool) {
        loadICUData(paramContext, paramFile);
      }
      return;
    }
  }
  
  private void lockForced()
  {
    mLock.lock();
    if ((SQLiteDebug.DEBUG_LOCK_TIME_TRACKING) && (mLock.getHoldCount() == 1))
    {
      mLockAcquiredWallTime = SystemClock.elapsedRealtime();
      mLockAcquiredThreadTime = Debug.threadCpuTimeNanos();
    }
  }
  
  /* Error */
  private void markTableSyncable(String paramString1, String arg2, String paramString3, String paramString4)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 678	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   4: aload_0
    //   5: new 306	java/lang/StringBuilder
    //   8: dup
    //   9: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   12: ldc_w 680
    //   15: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   18: aload_3
    //   19: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   22: ldc_w 682
    //   25: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   28: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   31: invokevirtual 685	net/sqlcipher/database/SQLiteDatabase:native_execSQL	(Ljava/lang/String;)V
    //   34: aload_0
    //   35: new 306	java/lang/StringBuilder
    //   38: dup
    //   39: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   42: ldc_w 687
    //   45: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   48: aload_2
    //   49: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   52: ldc_w 689
    //   55: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   58: aload_1
    //   59: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   62: ldc_w 682
    //   65: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   68: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   71: invokevirtual 685	net/sqlcipher/database/SQLiteDatabase:native_execSQL	(Ljava/lang/String;)V
    //   74: aload_0
    //   75: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   78: new 14	net/sqlcipher/database/SQLiteDatabase$SyncUpdateInfo
    //   81: dup
    //   82: aload_3
    //   83: aload 4
    //   85: aload_2
    //   86: invokespecial 695	net/sqlcipher/database/SQLiteDatabase$SyncUpdateInfo:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   89: astore_3
    //   90: aload_0
    //   91: getfield 202	net/sqlcipher/database/SQLiteDatabase:mSyncUpdateInfo	Ljava/util/Map;
    //   94: astore_2
    //   95: aload_2
    //   96: monitorenter
    //   97: aload_0
    //   98: getfield 202	net/sqlcipher/database/SQLiteDatabase:mSyncUpdateInfo	Ljava/util/Map;
    //   101: aload_1
    //   102: aload_3
    //   103: invokeinterface 699 3 0
    //   108: pop
    //   109: aload_2
    //   110: monitorexit
    //   111: return
    //   112: astore_1
    //   113: aload_0
    //   114: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   117: aload_1
    //   118: athrow
    //   119: astore_1
    //   120: aload_2
    //   121: monitorexit
    //   122: aload_1
    //   123: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	124	0	this	SQLiteDatabase
    //   0	124	1	paramString1	String
    //   0	124	3	paramString3	String
    //   0	124	4	paramString4	String
    // Exception table:
    //   from	to	target	type
    //   4	74	112	finally
    //   97	111	119	finally
    //   120	122	119	finally
  }
  
  private native int native_getDbLookaside();
  
  private native void native_key(String paramString)
    throws SQLException;
  
  private native void native_key(char[] paramArrayOfChar)
    throws SQLException;
  
  private native void native_rawExecSQL(String paramString);
  
  private native int native_status(int paramInt, boolean paramBoolean);
  
  public static SQLiteDatabase openDatabase(String paramString1, String paramString2, CursorFactory paramCursorFactory, int paramInt)
  {
    return openDatabase(paramString1, paramString2, paramCursorFactory, 268435456, null);
  }
  
  public static SQLiteDatabase openDatabase(String paramString1, String paramString2, CursorFactory paramCursorFactory, int paramInt, SQLiteDatabaseHook paramSQLiteDatabaseHook)
  {
    for (;;)
    {
      try
      {
        SQLiteDatabase localSQLiteDatabase3 = new SQLiteDatabase(paramString1, paramString2, paramCursorFactory, paramInt, paramSQLiteDatabaseHook);
        SQLiteDatabase localSQLiteDatabase1;
        Log.e("Database", "Deleting and re-creating corrupt database " + paramString1, localSQLiteDatabaseCorruptException1);
      }
      catch (SQLiteDatabaseCorruptException localSQLiteDatabaseCorruptException1)
      {
        try
        {
          if (SQLiteDebug.DEBUG_SQL_STATEMENTS) {
            localSQLiteDatabase3.enableSqlTracing(paramString1);
          }
          localSQLiteDatabase1 = localSQLiteDatabase3;
          if (SQLiteDebug.DEBUG_SQL_TIME)
          {
            localSQLiteDatabase3.enableSqlProfiling(paramString1);
            localSQLiteDatabase1 = localSQLiteDatabase3;
          }
          getInstancemActiveDatabases.add(new WeakReference(localSQLiteDatabase1));
          return localSQLiteDatabase1;
        }
        catch (SQLiteDatabaseCorruptException localSQLiteDatabaseCorruptException2)
        {
          SQLiteDatabase localSQLiteDatabase2;
          for (;;) {}
        }
        localSQLiteDatabaseCorruptException1 = localSQLiteDatabaseCorruptException1;
      }
      if (!paramString1.equalsIgnoreCase(":memory")) {
        new File(paramString1).delete();
      }
      localSQLiteDatabase2 = new SQLiteDatabase(paramString1, paramString2, paramCursorFactory, paramInt, paramSQLiteDatabaseHook);
    }
  }
  
  public static SQLiteDatabase openOrCreateDatabase(File paramFile, String paramString, CursorFactory paramCursorFactory)
  {
    return openOrCreateDatabase(paramFile.getPath(), paramString, paramCursorFactory, null);
  }
  
  public static SQLiteDatabase openOrCreateDatabase(File paramFile, String paramString, CursorFactory paramCursorFactory, SQLiteDatabaseHook paramSQLiteDatabaseHook)
  {
    return openOrCreateDatabase(paramFile.getPath(), paramString, paramCursorFactory, paramSQLiteDatabaseHook);
  }
  
  public static SQLiteDatabase openOrCreateDatabase(String paramString1, String paramString2, CursorFactory paramCursorFactory)
  {
    return openDatabase(paramString1, paramString2, paramCursorFactory, 268435456, null);
  }
  
  public static SQLiteDatabase openOrCreateDatabase(String paramString1, String paramString2, CursorFactory paramCursorFactory, SQLiteDatabaseHook paramSQLiteDatabaseHook)
  {
    return openDatabase(paramString1, paramString2, paramCursorFactory, 268435456, paramSQLiteDatabaseHook);
  }
  
  public static native int releaseMemory();
  
  public static native void setICURoot(String paramString);
  
  private void unlockForced()
  {
    if ((SQLiteDebug.DEBUG_LOCK_TIME_TRACKING) && (mLock.getHoldCount() == 1)) {
      checkLockHoldTime();
    }
    mLock.unlock();
  }
  
  public static void upgradeDatabaseFormatFromVersion1To2(File paramFile, String paramString)
    throws Exception
  {
    SQLiteDatabaseHook local1 = new SQLiteDatabaseHook()
    {
      public void postKey(SQLiteDatabase paramAnonymousSQLiteDatabase)
      {
        paramAnonymousSQLiteDatabase.execSQL("PRAGMA cipher_default_use_hmac = on");
      }
      
      public void preKey(SQLiteDatabase paramAnonymousSQLiteDatabase)
      {
        paramAnonymousSQLiteDatabase.execSQL("PRAGMA cipher_default_use_hmac = off");
      }
    };
    try
    {
      File localFile = File.createTempFile("temp", "db", paramFile.getParentFile());
      paramString = openOrCreateDatabase(paramFile, paramString, null, local1);
      paramString.rawExecSQL(String.format("ATTACH DATABASE '%s' as newdb", new Object[] { localFile.getAbsolutePath() }));
      paramString.rawExecSQL("SELECT sqlcipher_export('newdb')");
      paramString.rawExecSQL("DETACH DATABASE newdb");
      paramString.close();
      if (1 != 0)
      {
        paramFile.delete();
        localFile.renameTo(paramFile);
      }
      return;
    }
    catch (Exception paramFile)
    {
      throw paramFile;
    }
  }
  
  private boolean yieldIfContendedHelper(boolean paramBoolean, long paramLong)
  {
    if (mLock.getQueueLength() == 0)
    {
      mLockAcquiredWallTime = SystemClock.elapsedRealtime();
      mLockAcquiredThreadTime = Debug.threadCpuTimeNanos();
      return false;
    }
    setTransactionSuccessful();
    SQLiteTransactionListener localSQLiteTransactionListener = mTransactionListener;
    endTransaction();
    if ((paramBoolean) && (isDbLockedByCurrentThread())) {
      throw new IllegalStateException("Db locked more than once. yielfIfContended cannot yield");
    }
    for (;;)
    {
      long l;
      if ((paramLong > 0L) && (paramLong > 0L))
      {
        if (paramLong >= 1000L) {
          break label114;
        }
        l = paramLong;
      }
      try
      {
        for (;;)
        {
          Thread.sleep(l);
          paramLong -= 1000L;
          if (mLock.getQueueLength() != 0) {
            break;
          }
          beginTransactionWithListener(localSQLiteTransactionListener);
          return true;
          label114:
          l = 1000L;
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          Thread.interrupted();
        }
      }
    }
  }
  
  void addSQLiteClosable(SQLiteClosable paramSQLiteClosable)
  {
    lock();
    try
    {
      mPrograms.put(paramSQLiteClosable, null);
      return;
    }
    finally
    {
      unlock();
    }
  }
  
  void addToCompiledQueries(String paramString, SQLiteCompiledSql paramSQLiteCompiledSql)
  {
    if (mMaxSqlCacheSize == 0)
    {
      if (SQLiteDebug.DEBUG_SQL_CACHE) {
        Log.v("Database", "|NOT adding_sql_to_cache|" + getPath() + "|" + paramString);
      }
      return;
    }
    synchronized (mCompiledQueries)
    {
      if ((SQLiteCompiledSql)mCompiledQueries.get(paramString) != null) {
        return;
      }
    }
    if (mCompiledQueries.size() == mMaxSqlCacheSize)
    {
      int i = mCacheFullWarnings + 1;
      mCacheFullWarnings = i;
      if (i == 1) {
        Log.w("Database", "Reached MAX size for compiled-sql statement cache for database " + getPath() + "; i.e., NO space for this sql statement in cache: " + paramString + ". Please change your sql statements to use '?' for " + "bindargs, instead of using actual values");
      }
    }
    for (;;)
    {
      return;
      mCompiledQueries.put(paramString, paramSQLiteCompiledSql);
      if (SQLiteDebug.DEBUG_SQL_CACHE) {
        Log.v("Database", "|adding_sql_to_cache|" + getPath() + "|" + mCompiledQueries.size() + "|" + paramString);
      }
    }
  }
  
  public void beginTransaction()
  {
    beginTransactionWithListener(null);
  }
  
  public void beginTransactionWithListener(SQLiteTransactionListener paramSQLiteTransactionListener)
  {
    lockForced();
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    try
    {
      if (mLock.getHoldCount() <= 1) {
        break label83;
      }
      if (mInnerTransactionIsSuccessful)
      {
        paramSQLiteTransactionListener = new IllegalStateException("Cannot call beginTransaction between calling setTransactionSuccessful and endTransaction");
        Log.e("Database", "beginTransaction() failed", paramSQLiteTransactionListener);
        throw paramSQLiteTransactionListener;
      }
    }
    finally
    {
      if (0 == 0) {
        unlockForced();
      }
    }
    if (1 == 0) {
      unlockForced();
    }
    for (;;)
    {
      return;
      label83:
      execSQL("BEGIN EXCLUSIVE;");
      mTransactionListener = paramSQLiteTransactionListener;
      mTransactionIsSuccessful = true;
      mInnerTransactionIsSuccessful = false;
      if (paramSQLiteTransactionListener != null) {}
      try
      {
        paramSQLiteTransactionListener.onBegin();
        if (1 != 0) {
          continue;
        }
        unlockForced();
        return;
      }
      catch (RuntimeException paramSQLiteTransactionListener)
      {
        execSQL("ROLLBACK;");
        throw paramSQLiteTransactionListener;
      }
    }
  }
  
  public void close()
  {
    if (!isOpen()) {
      return;
    }
    lock();
    try
    {
      closeClosable();
      onAllReferencesReleased();
      return;
    }
    finally
    {
      unlock();
    }
  }
  
  public SQLiteStatement compileStatement(String paramString)
    throws SQLException
  {
    lock();
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    try
    {
      paramString = new SQLiteStatement(this, paramString);
      return paramString;
    }
    finally
    {
      unlock();
    }
  }
  
  public int delete(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    lock();
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    Object localObject4 = null;
    Object localObject3 = null;
    Object localObject2 = localObject3;
    Object localObject1 = localObject4;
    for (;;)
    {
      try
      {
        StringBuilder localStringBuilder = new StringBuilder().append("DELETE FROM ").append(paramString1);
        localObject2 = localObject3;
        localObject1 = localObject4;
        if (!TextUtils.isEmpty(paramString2))
        {
          localObject2 = localObject3;
          localObject1 = localObject4;
          paramString1 = " WHERE " + paramString2;
          localObject2 = localObject3;
          localObject1 = localObject4;
          paramString1 = compileStatement(paramString1);
          if (paramArrayOfString != null)
          {
            localObject2 = paramString1;
            localObject1 = paramString1;
            int j = paramArrayOfString.length;
            i = 0;
            if (i < j)
            {
              localObject2 = paramString1;
              localObject1 = paramString1;
              DatabaseUtils.bindObjectToProgram(paramString1, i + 1, paramArrayOfString[i]);
              i += 1;
              continue;
            }
          }
          localObject2 = paramString1;
          localObject1 = paramString1;
          paramString1.execute();
          localObject2 = paramString1;
          localObject1 = paramString1;
          int i = lastChangeCount();
          if (paramString1 != null) {
            paramString1.close();
          }
          unlock();
          return i;
        }
      }
      catch (SQLiteDatabaseCorruptException paramString1)
      {
        localObject1 = localObject2;
        onCorruption();
        localObject1 = localObject2;
        throw paramString1;
      }
      finally
      {
        if (localObject1 != null) {
          ((SQLiteStatement)localObject1).close();
        }
        unlock();
      }
      paramString1 = "";
    }
  }
  
  public void endTransaction()
  {
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    if (!mLock.isHeldByCurrentThread()) {
      throw new IllegalStateException("no transaction pending");
    }
    try
    {
      if (mInnerTransactionIsSuccessful) {
        mInnerTransactionIsSuccessful = false;
      }
      for (;;)
      {
        int i = mLock.getHoldCount();
        if (i == 1) {
          break;
        }
        return;
        mTransactionIsSuccessful = false;
      }
      localObject3 = null;
    }
    finally
    {
      mTransactionListener = null;
      unlockForced();
    }
    Object localObject3;
    SQLiteTransactionListener localSQLiteTransactionListener = mTransactionListener;
    Object localObject2 = localObject3;
    if (localSQLiteTransactionListener != null) {}
    for (;;)
    {
      try
      {
        if (!mTransactionIsSuccessful) {
          continue;
        }
        mTransactionListener.onCommit();
        localObject2 = localObject3;
      }
      catch (RuntimeException localRuntimeException)
      {
        mTransactionIsSuccessful = false;
        continue;
        try
        {
          execSQL("ROLLBACK;");
          if (localRuntimeException == null) {
            continue;
          }
          throw localRuntimeException;
        }
        catch (SQLException localSQLException)
        {
          Log.d("Database", "exception during rollback, maybe the DB previously performed an auto-rollback");
        }
        continue;
      }
      if (!mTransactionIsSuccessful) {
        continue;
      }
      execSQL("COMMIT;");
      mTransactionListener = null;
      unlockForced();
      return;
      mTransactionListener.onRollback();
      localObject2 = localObject3;
    }
  }
  
  public void execSQL(String paramString)
    throws SQLException
  {
    long l = SystemClock.uptimeMillis();
    lock();
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    logTimeStat(mLastSqlStatement, l, "GETLOCK:");
    try
    {
      native_execSQL(paramString);
      unlock();
      if (paramString == "COMMIT;")
      {
        logTimeStat(mLastSqlStatement, l, "COMMIT;");
        return;
      }
    }
    catch (SQLiteDatabaseCorruptException paramString)
    {
      throw paramString;
    }
    finally
    {
      unlock();
    }
    logTimeStat(paramString, l, null);
  }
  
  public void execSQL(String paramString, Object[] paramArrayOfObject)
    throws SQLException
  {
    if (paramArrayOfObject == null) {
      throw new IllegalArgumentException("Empty bindArgs");
    }
    long l = SystemClock.uptimeMillis();
    lock();
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    Object localObject2 = null;
    Object localObject1 = null;
    try
    {
      SQLiteStatement localSQLiteStatement = compileStatement(paramString);
      if (paramArrayOfObject != null)
      {
        localObject1 = localSQLiteStatement;
        localObject2 = localSQLiteStatement;
        int j = paramArrayOfObject.length;
        int i = 0;
        while (i < j)
        {
          localObject1 = localSQLiteStatement;
          localObject2 = localSQLiteStatement;
          DatabaseUtils.bindObjectToProgram(localSQLiteStatement, i + 1, paramArrayOfObject[i]);
          i += 1;
        }
      }
      localObject1 = localSQLiteStatement;
      localObject2 = localSQLiteStatement;
      localSQLiteStatement.execute();
      if (localSQLiteStatement != null) {
        localSQLiteStatement.close();
      }
      unlock();
      logTimeStat(paramString, l);
      return;
    }
    catch (SQLiteDatabaseCorruptException paramString)
    {
      localObject2 = localObject1;
      onCorruption();
      localObject2 = localObject1;
      throw paramString;
    }
    finally
    {
      if (localObject2 != null) {
        ((SQLiteStatement)localObject2).close();
      }
      unlock();
    }
  }
  
  protected void finalize()
  {
    if (isOpen())
    {
      Log.e("Database", "close() was never explicitly called on database '" + mPath + "' ", mStackTrace);
      closeClosable();
      onAllReferencesReleased();
    }
  }
  
  SQLiteCompiledSql getCompiledStatementForSql(String paramString)
  {
    for (;;)
    {
      synchronized (mCompiledQueries)
      {
        if (mMaxSqlCacheSize == 0)
        {
          if (SQLiteDebug.DEBUG_SQL_CACHE) {
            Log.v("Database", "|cache NOT found|" + getPath());
          }
          return null;
        }
        SQLiteCompiledSql localSQLiteCompiledSql = (SQLiteCompiledSql)mCompiledQueries.get(paramString);
        boolean bool;
        if (localSQLiteCompiledSql != null)
        {
          bool = true;
          if (bool)
          {
            mNumCacheHits += 1;
            if (SQLiteDebug.DEBUG_SQL_CACHE) {
              Log.v("Database", "|cache_stats|" + getPath() + "|" + mCompiledQueries.size() + "|" + mNumCacheHits + "|" + mNumCacheMisses + "|" + bool + "|" + mTimeOpened + "|" + mTimeClosed + "|" + paramString);
            }
            return localSQLiteCompiledSql;
          }
        }
        else
        {
          bool = false;
        }
      }
      mNumCacheMisses += 1;
    }
  }
  
  public int getMaxSqlCacheSize()
  {
    try
    {
      int i = mMaxSqlCacheSize;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public long getMaximumSize()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 5
    //   3: aload_0
    //   4: invokevirtual 678	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   7: aload_0
    //   8: invokevirtual 425	net/sqlcipher/database/SQLiteDatabase:isOpen	()Z
    //   11: ifne +14 -> 25
    //   14: new 417	java/lang/IllegalStateException
    //   17: dup
    //   18: ldc_w 853
    //   21: invokespecial 420	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   24: athrow
    //   25: new 544	net/sqlcipher/database/SQLiteStatement
    //   28: dup
    //   29: aload_0
    //   30: ldc_w 952
    //   33: invokespecial 549	net/sqlcipher/database/SQLiteStatement:<init>	(Lnet/sqlcipher/database/SQLiteDatabase;Ljava/lang/String;)V
    //   36: astore 7
    //   38: aload 7
    //   40: invokevirtual 552	net/sqlcipher/database/SQLiteStatement:simpleQueryForLong	()J
    //   43: lstore_1
    //   44: aload_0
    //   45: invokevirtual 513	net/sqlcipher/database/SQLiteDatabase:getPageSize	()J
    //   48: lstore_3
    //   49: aload 7
    //   51: ifnull +8 -> 59
    //   54: aload 7
    //   56: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   59: aload_0
    //   60: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   63: lload_3
    //   64: lload_1
    //   65: lmul
    //   66: lreturn
    //   67: astore 6
    //   69: aload 5
    //   71: ifnull +8 -> 79
    //   74: aload 5
    //   76: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   79: aload_0
    //   80: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   83: aload 6
    //   85: athrow
    //   86: astore 6
    //   88: aload 7
    //   90: astore 5
    //   92: goto -23 -> 69
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	95	0	this	SQLiteDatabase
    //   43	22	1	l1	long
    //   48	16	3	l2	long
    //   1	90	5	localObject1	Object
    //   67	17	6	localObject2	Object
    //   86	1	6	localObject3	Object
    //   36	53	7	localSQLiteStatement	SQLiteStatement
    // Exception table:
    //   from	to	target	type
    //   25	38	67	finally
    //   38	49	86	finally
  }
  
  /* Error */
  public long getPageSize()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aload_0
    //   3: invokevirtual 678	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   6: aload_0
    //   7: invokevirtual 425	net/sqlcipher/database/SQLiteDatabase:isOpen	()Z
    //   10: ifne +14 -> 24
    //   13: new 417	java/lang/IllegalStateException
    //   16: dup
    //   17: ldc_w 853
    //   20: invokespecial 420	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   23: athrow
    //   24: new 544	net/sqlcipher/database/SQLiteStatement
    //   27: dup
    //   28: aload_0
    //   29: ldc_w 954
    //   32: invokespecial 549	net/sqlcipher/database/SQLiteStatement:<init>	(Lnet/sqlcipher/database/SQLiteDatabase;Ljava/lang/String;)V
    //   35: astore 5
    //   37: aload 5
    //   39: invokevirtual 552	net/sqlcipher/database/SQLiteStatement:simpleQueryForLong	()J
    //   42: lstore_1
    //   43: aload 5
    //   45: ifnull +8 -> 53
    //   48: aload 5
    //   50: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   53: aload_0
    //   54: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   57: lload_1
    //   58: lreturn
    //   59: astore 4
    //   61: aload_3
    //   62: ifnull +7 -> 69
    //   65: aload_3
    //   66: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   69: aload_0
    //   70: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   73: aload 4
    //   75: athrow
    //   76: astore 4
    //   78: aload 5
    //   80: astore_3
    //   81: goto -20 -> 61
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	84	0	this	SQLiteDatabase
    //   42	16	1	l	long
    //   1	80	3	localObject1	Object
    //   59	15	4	localObject2	Object
    //   76	1	4	localObject3	Object
    //   35	44	5	localSQLiteStatement	SQLiteStatement
    // Exception table:
    //   from	to	target	type
    //   24	37	59	finally
    //   37	43	76	finally
  }
  
  public final String getPath()
  {
    return mPath;
  }
  
  public Map<String, String> getSyncedTables()
  {
    synchronized (mSyncUpdateInfo)
    {
      HashMap localHashMap = new HashMap();
      Iterator localIterator = mSyncUpdateInfo.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        SyncUpdateInfo localSyncUpdateInfo = (SyncUpdateInfo)mSyncUpdateInfo.get(str);
        if (deletedTable != null) {
          localHashMap.put(str, deletedTable);
        }
      }
    }
    return localMap1;
  }
  
  /* Error */
  public int getVersion()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_0
    //   4: invokevirtual 678	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   7: aload_0
    //   8: invokevirtual 425	net/sqlcipher/database/SQLiteDatabase:isOpen	()Z
    //   11: ifne +14 -> 25
    //   14: new 417	java/lang/IllegalStateException
    //   17: dup
    //   18: ldc_w 853
    //   21: invokespecial 420	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   24: athrow
    //   25: new 544	net/sqlcipher/database/SQLiteStatement
    //   28: dup
    //   29: aload_0
    //   30: ldc_w 967
    //   33: invokespecial 549	net/sqlcipher/database/SQLiteStatement:<init>	(Lnet/sqlcipher/database/SQLiteDatabase;Ljava/lang/String;)V
    //   36: astore 6
    //   38: aload 6
    //   40: invokevirtual 552	net/sqlcipher/database/SQLiteStatement:simpleQueryForLong	()J
    //   43: lstore_2
    //   44: lload_2
    //   45: l2i
    //   46: istore_1
    //   47: aload 6
    //   49: ifnull +8 -> 57
    //   52: aload 6
    //   54: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   57: aload_0
    //   58: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   61: iload_1
    //   62: ireturn
    //   63: astore 5
    //   65: aload 4
    //   67: ifnull +8 -> 75
    //   70: aload 4
    //   72: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   75: aload_0
    //   76: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   79: aload 5
    //   81: athrow
    //   82: astore 5
    //   84: aload 6
    //   86: astore 4
    //   88: goto -23 -> 65
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	91	0	this	SQLiteDatabase
    //   46	16	1	i	int
    //   43	2	2	l	long
    //   1	86	4	localObject1	Object
    //   63	17	5	localObject2	Object
    //   82	1	5	localObject3	Object
    //   36	49	6	localSQLiteStatement	SQLiteStatement
    // Exception table:
    //   from	to	target	type
    //   25	38	63	finally
    //   38	44	82	finally
  }
  
  public boolean inTransaction()
  {
    return mLock.getHoldCount() > 0;
  }
  
  public long insert(String paramString1, String paramString2, ContentValues paramContentValues)
  {
    try
    {
      long l = insertWithOnConflict(paramString1, paramString2, paramContentValues, 0);
      return l;
    }
    catch (SQLException paramString1)
    {
      Log.e("Database", "Error inserting " + paramContentValues, paramString1);
    }
    return -1L;
  }
  
  public long insertOrThrow(String paramString1, String paramString2, ContentValues paramContentValues)
    throws SQLException
  {
    return insertWithOnConflict(paramString1, paramString2, paramContentValues, 0);
  }
  
  /* Error */
  public long insertWithOnConflict(String paramString1, String paramString2, ContentValues paramContentValues, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 425	net/sqlcipher/database/SQLiteDatabase:isOpen	()Z
    //   4: ifne +14 -> 18
    //   7: new 417	java/lang/IllegalStateException
    //   10: dup
    //   11: ldc_w 853
    //   14: invokespecial 420	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   17: athrow
    //   18: new 306	java/lang/StringBuilder
    //   21: dup
    //   22: sipush 152
    //   25: invokespecial 985	java/lang/StringBuilder:<init>	(I)V
    //   28: astore 10
    //   30: aload 10
    //   32: ldc_w 987
    //   35: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: pop
    //   39: aload 10
    //   41: getstatic 131	net/sqlcipher/database/SQLiteDatabase:CONFLICT_VALUES	[Ljava/lang/String;
    //   44: iload 4
    //   46: aaload
    //   47: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   50: pop
    //   51: aload 10
    //   53: ldc_w 989
    //   56: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: pop
    //   60: aload 10
    //   62: aload_1
    //   63: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   66: pop
    //   67: new 306	java/lang/StringBuilder
    //   70: dup
    //   71: bipush 40
    //   73: invokespecial 985	java/lang/StringBuilder:<init>	(I)V
    //   76: astore_1
    //   77: aconst_null
    //   78: astore 8
    //   80: aload_3
    //   81: ifnull +238 -> 319
    //   84: aload_3
    //   85: invokevirtual 992	android/content/ContentValues:size	()I
    //   88: ifle +231 -> 319
    //   91: aload_3
    //   92: invokevirtual 995	android/content/ContentValues:valueSet	()Ljava/util/Set;
    //   95: astore 8
    //   97: aload 8
    //   99: invokeinterface 354 1 0
    //   104: astore_2
    //   105: aload 10
    //   107: bipush 40
    //   109: invokevirtual 998	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   112: pop
    //   113: iconst_0
    //   114: istore 4
    //   116: aload_2
    //   117: invokeinterface 360 1 0
    //   122: ifeq +61 -> 183
    //   125: iload 4
    //   127: ifeq +20 -> 147
    //   130: aload 10
    //   132: ldc_w 1000
    //   135: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   138: pop
    //   139: aload_1
    //   140: ldc_w 1000
    //   143: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   146: pop
    //   147: iconst_1
    //   148: istore 4
    //   150: aload 10
    //   152: aload_2
    //   153: invokeinterface 364 1 0
    //   158: checkcast 366	java/util/Map$Entry
    //   161: invokeinterface 369 1 0
    //   166: checkcast 117	java/lang/String
    //   169: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   172: pop
    //   173: aload_1
    //   174: bipush 63
    //   176: invokevirtual 998	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   179: pop
    //   180: goto -64 -> 116
    //   183: aload 10
    //   185: bipush 41
    //   187: invokevirtual 998	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   190: pop
    //   191: aload 10
    //   193: ldc_w 1002
    //   196: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   199: pop
    //   200: aload 10
    //   202: aload_1
    //   203: invokevirtual 1005	java/lang/StringBuilder:append	(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;
    //   206: pop
    //   207: aload 10
    //   209: ldc_w 1007
    //   212: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   215: pop
    //   216: aload_0
    //   217: invokevirtual 678	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   220: aconst_null
    //   221: astore_2
    //   222: aconst_null
    //   223: astore_1
    //   224: aload_0
    //   225: aload 10
    //   227: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   230: invokevirtual 889	net/sqlcipher/database/SQLiteDatabase:compileStatement	(Ljava/lang/String;)Lnet/sqlcipher/database/SQLiteStatement;
    //   233: astore 9
    //   235: aload 8
    //   237: ifnull +125 -> 362
    //   240: aload 9
    //   242: astore_1
    //   243: aload 9
    //   245: astore_2
    //   246: aload 8
    //   248: invokeinterface 1008 1 0
    //   253: istore 5
    //   255: aload 9
    //   257: astore_1
    //   258: aload 9
    //   260: astore_2
    //   261: aload 8
    //   263: invokeinterface 354 1 0
    //   268: astore 8
    //   270: iconst_0
    //   271: istore 4
    //   273: iload 4
    //   275: iload 5
    //   277: if_icmpge +85 -> 362
    //   280: aload 9
    //   282: astore_1
    //   283: aload 9
    //   285: astore_2
    //   286: aload 9
    //   288: iload 4
    //   290: iconst_1
    //   291: iadd
    //   292: aload 8
    //   294: invokeinterface 364 1 0
    //   299: checkcast 366	java/util/Map$Entry
    //   302: invokeinterface 1011 1 0
    //   307: invokestatic 895	net/sqlcipher/DatabaseUtils:bindObjectToProgram	(Lnet/sqlcipher/database/SQLiteProgram;ILjava/lang/Object;)V
    //   310: iload 4
    //   312: iconst_1
    //   313: iadd
    //   314: istore 4
    //   316: goto -43 -> 273
    //   319: aload 10
    //   321: new 306	java/lang/StringBuilder
    //   324: dup
    //   325: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   328: ldc_w 1013
    //   331: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   334: aload_2
    //   335: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   338: ldc_w 1015
    //   341: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   344: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   347: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   350: pop
    //   351: aload_1
    //   352: ldc_w 1017
    //   355: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   358: pop
    //   359: goto -168 -> 191
    //   362: aload 9
    //   364: astore_1
    //   365: aload 9
    //   367: astore_2
    //   368: aload 9
    //   370: invokevirtual 898	net/sqlcipher/database/SQLiteStatement:execute	()V
    //   373: aload 9
    //   375: astore_1
    //   376: aload 9
    //   378: astore_2
    //   379: aload_0
    //   380: invokevirtual 1020	net/sqlcipher/database/SQLiteDatabase:lastInsertRow	()J
    //   383: lstore 6
    //   385: lload 6
    //   387: ldc2_w 980
    //   390: lcmp
    //   391: ifne +63 -> 454
    //   394: aload 9
    //   396: astore_1
    //   397: aload 9
    //   399: astore_2
    //   400: ldc 73
    //   402: new 306	java/lang/StringBuilder
    //   405: dup
    //   406: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   409: ldc_w 976
    //   412: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   415: aload_3
    //   416: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   419: ldc_w 1022
    //   422: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   425: aload 10
    //   427: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   430: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   433: invokestatic 1024	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   436: pop
    //   437: aload 9
    //   439: ifnull +8 -> 447
    //   442: aload 9
    //   444: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   447: aload_0
    //   448: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   451: lload 6
    //   453: lreturn
    //   454: aload 9
    //   456: astore_1
    //   457: aload 9
    //   459: astore_2
    //   460: ldc 73
    //   462: iconst_2
    //   463: invokestatic 293	android/util/Log:isLoggable	(Ljava/lang/String;I)Z
    //   466: ifeq -29 -> 437
    //   469: aload 9
    //   471: astore_1
    //   472: aload 9
    //   474: astore_2
    //   475: ldc 73
    //   477: new 306	java/lang/StringBuilder
    //   480: dup
    //   481: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   484: ldc_w 1026
    //   487: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   490: lload 6
    //   492: invokevirtual 318	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   495: ldc_w 1028
    //   498: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   501: aload_3
    //   502: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   505: ldc_w 1022
    //   508: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   511: aload 10
    //   513: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   516: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   519: invokestatic 829	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   522: pop
    //   523: goto -86 -> 437
    //   526: astore_3
    //   527: aload_1
    //   528: astore_2
    //   529: aload_0
    //   530: invokevirtual 904	net/sqlcipher/database/SQLiteDatabase:onCorruption	()V
    //   533: aload_1
    //   534: astore_2
    //   535: aload_3
    //   536: athrow
    //   537: astore_1
    //   538: aload_2
    //   539: ifnull +7 -> 546
    //   542: aload_2
    //   543: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   546: aload_0
    //   547: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   550: aload_1
    //   551: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	552	0	this	SQLiteDatabase
    //   0	552	1	paramString1	String
    //   0	552	2	paramString2	String
    //   0	552	3	paramContentValues	ContentValues
    //   0	552	4	paramInt	int
    //   253	25	5	i	int
    //   383	108	6	l	long
    //   78	215	8	localObject	Object
    //   233	240	9	localSQLiteStatement	SQLiteStatement
    //   28	484	10	localStringBuilder	StringBuilder
    // Exception table:
    //   from	to	target	type
    //   224	235	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   246	255	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   261	270	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   286	310	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   368	373	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   379	385	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   400	437	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   460	469	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   475	523	526	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   224	235	537	finally
    //   246	255	537	finally
    //   261	270	537	finally
    //   286	310	537	finally
    //   368	373	537	finally
    //   379	385	537	finally
    //   400	437	537	finally
    //   460	469	537	finally
    //   475	523	537	finally
    //   529	533	537	finally
    //   535	537	537	finally
  }
  
  public boolean isDbLockedByCurrentThread()
  {
    return mLock.isHeldByCurrentThread();
  }
  
  public boolean isDbLockedByOtherThreads()
  {
    return (!mLock.isHeldByCurrentThread()) && (mLock.isLocked());
  }
  
  public boolean isInCompiledSqlCache(String paramString)
  {
    synchronized (mCompiledQueries)
    {
      boolean bool = mCompiledQueries.containsKey(paramString);
      return bool;
    }
  }
  
  public boolean isOpen()
  {
    return mNativeHandle != 0;
  }
  
  public boolean isReadOnly()
  {
    return (mFlags & 0x1) == 1;
  }
  
  native int lastChangeCount();
  
  native long lastInsertRow();
  
  void lock()
  {
    if (!mLockingEnabled) {}
    do
    {
      return;
      mLock.lock();
    } while ((!SQLiteDebug.DEBUG_LOCK_TIME_TRACKING) || (mLock.getHoldCount() != 1));
    mLockAcquiredWallTime = SystemClock.elapsedRealtime();
    mLockAcquiredThreadTime = Debug.threadCpuTimeNanos();
  }
  
  void logTimeStat(String paramString, long paramLong)
  {
    logTimeStat(paramString, paramLong, null);
  }
  
  void logTimeStat(String paramString1, long paramLong, String paramString2)
  {
    mLastSqlStatement = paramString1;
    paramLong = SystemClock.uptimeMillis() - paramLong;
    if ((paramLong == 0L) && (paramString2 == "GETLOCK:")) {
      return;
    }
    if (sQueryLogTimeInMillis == 0) {
      sQueryLogTimeInMillis = 500;
    }
    if (paramLong >= sQueryLogTimeInMillis) {}
    int i;
    do
    {
      String str = paramString1;
      if (paramString2 != null) {
        str = paramString2 + paramString1;
      }
      if (str.length() > 64) {
        str.substring(0, 64);
      }
      if ("unknown" != null) {
        break;
      }
      return;
      i = (int)(100L * paramLong / sQueryLogTimeInMillis);
    } while (mRandom.nextInt(100) < i + 1);
  }
  
  public void markTableSyncable(String paramString1, String paramString2)
  {
    markTableSyncable(paramString1, "_id", paramString1, paramString2);
  }
  
  public void markTableSyncable(String paramString1, String paramString2, String paramString3)
  {
    markTableSyncable(paramString1, paramString2, paramString3, null);
  }
  
  native void native_execSQL(String paramString)
    throws SQLException;
  
  native void native_setLocale(String paramString, int paramInt);
  
  public boolean needUpgrade(int paramInt)
  {
    return paramInt > getVersion();
  }
  
  protected void onAllReferencesReleased()
  {
    if (isOpen())
    {
      if (SQLiteDebug.DEBUG_SQL_CACHE) {
        mTimeClosed = getTime();
      }
      dbclose();
    }
  }
  
  void onCorruption()
  {
    Log.e("Database", "Removing corrupt database: " + mPath);
    try
    {
      close();
      return;
    }
    finally
    {
      if (!mPath.equalsIgnoreCase(":memory")) {
        new File(mPath).delete();
      }
    }
  }
  
  public void purgeFromCompiledSqlCache(String paramString)
  {
    synchronized (mCompiledQueries)
    {
      mCompiledQueries.remove(paramString);
      return;
    }
  }
  
  public Cursor query(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3, String paramString4, String paramString5)
  {
    return query(false, paramString1, paramArrayOfString1, paramString2, paramArrayOfString2, paramString3, paramString4, paramString5, null);
  }
  
  public Cursor query(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    return query(false, paramString1, paramArrayOfString1, paramString2, paramArrayOfString2, paramString3, paramString4, paramString5, paramString6);
  }
  
  public Cursor query(boolean paramBoolean, String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    return queryWithFactory(null, paramBoolean, paramString1, paramArrayOfString1, paramString2, paramArrayOfString2, paramString3, paramString4, paramString5, paramString6);
  }
  
  public Cursor queryWithFactory(CursorFactory paramCursorFactory, boolean paramBoolean, String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    return rawQueryWithFactory(paramCursorFactory, SQLiteQueryBuilder.buildQueryString(paramBoolean, paramString1, paramArrayOfString1, paramString2, paramString3, paramString4, paramString5, paramString6), paramArrayOfString2, findEditTable(paramString1));
  }
  
  public void rawExecSQL(String paramString)
  {
    long l = SystemClock.uptimeMillis();
    lock();
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    logTimeStat(mLastSqlStatement, l, "GETLOCK:");
    try
    {
      native_rawExecSQL(paramString);
      unlock();
      if (paramString == "COMMIT;")
      {
        logTimeStat(mLastSqlStatement, l, "COMMIT;");
        return;
      }
    }
    catch (SQLiteDatabaseCorruptException paramString)
    {
      throw paramString;
    }
    finally
    {
      unlock();
    }
    logTimeStat(paramString, l, null);
  }
  
  public Cursor rawQuery(String paramString, String[] paramArrayOfString)
  {
    return rawQueryWithFactory(null, paramString, paramArrayOfString, null);
  }
  
  public Cursor rawQuery(String paramString, String[] paramArrayOfString, int paramInt1, int paramInt2)
  {
    paramString = (SQLiteCursor)rawQueryWithFactory(null, paramString, paramArrayOfString, null);
    paramString.setLoadStyle(paramInt1, paramInt2);
    return paramString;
  }
  
  public Cursor rawQueryWithFactory(CursorFactory paramCursorFactory, String paramString1, String[] paramArrayOfString, String paramString2)
  {
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    l = 0L;
    if (mSlowQueryThreshold != -1) {
      l = System.currentTimeMillis();
    }
    paramString1 = new SQLiteDirectCursorDriver(this, paramString1, paramString2);
    if (paramCursorFactory != null) {}
    for (;;)
    {
      try
      {
        paramString2 = paramString1.query(paramCursorFactory, paramArrayOfString);
        if (mSlowQueryThreshold == -1) {
          continue;
        }
        i = -1;
        if (paramString2 != null) {
          i = paramString2.getCount();
        }
        l = System.currentTimeMillis() - l;
        if (l < mSlowQueryThreshold) {
          continue;
        }
        paramString1 = new StringBuilder().append("query (").append(l).append(" ms): ").append(paramString1.toString()).append(", args are ");
        if (paramArrayOfString == null) {
          continue;
        }
        paramCursorFactory = TextUtils.join(",", paramArrayOfString);
      }
      finally
      {
        int i;
        if (mSlowQueryThreshold == -1) {
          continue;
        }
        if (0 == 0) {
          continue;
        }
        throw new NullPointerException();
        l = System.currentTimeMillis() - l;
        if (l < mSlowQueryThreshold) {
          continue;
        }
        paramString1 = new StringBuilder().append("query (").append(l).append(" ms): ").append(paramString1.toString()).append(", args are ");
        if (paramArrayOfString == null) {
          continue;
        }
        paramCursorFactory = TextUtils.join(",", paramArrayOfString);
        continue;
        paramCursorFactory = "<null>";
        continue;
      }
      Log.v("Database", paramCursorFactory + ", count is " + i);
      return new CrossProcessCursorWrapper(paramString2);
      paramCursorFactory = mFactory;
    }
    paramCursorFactory = "<null>";
    Log.v("Database", paramCursorFactory + ", count is " + -1);
    throw paramString2;
  }
  
  void removeSQLiteClosable(SQLiteClosable paramSQLiteClosable)
  {
    lock();
    try
    {
      mPrograms.remove(paramSQLiteClosable);
      return;
    }
    finally
    {
      unlock();
    }
  }
  
  public long replace(String paramString1, String paramString2, ContentValues paramContentValues)
  {
    try
    {
      long l = insertWithOnConflict(paramString1, paramString2, paramContentValues, 5);
      return l;
    }
    catch (SQLException paramString1)
    {
      Log.e("Database", "Error inserting " + paramContentValues, paramString1);
    }
    return -1L;
  }
  
  public long replaceOrThrow(String paramString1, String paramString2, ContentValues paramContentValues)
    throws SQLException
  {
    return insertWithOnConflict(paramString1, paramString2, paramContentValues, 5);
  }
  
  public void resetCompiledSqlCache()
  {
    synchronized (mCompiledQueries)
    {
      mCompiledQueries.clear();
      return;
    }
  }
  
  void rowUpdated(String paramString, long paramLong)
  {
    synchronized (mSyncUpdateInfo)
    {
      SyncUpdateInfo localSyncUpdateInfo = (SyncUpdateInfo)mSyncUpdateInfo.get(paramString);
      if (localSyncUpdateInfo != null) {
        execSQL("UPDATE " + masterTable + " SET _sync_dirty=1 WHERE _id=(SELECT " + foreignKey + " FROM " + paramString + " WHERE _id=" + paramLong + ")");
      }
      return;
    }
  }
  
  public void setLocale(Locale paramLocale)
  {
    lock();
    try
    {
      native_setLocale(paramLocale.toString(), mFlags);
      return;
    }
    finally
    {
      unlock();
    }
  }
  
  public void setLockingEnabled(boolean paramBoolean)
  {
    mLockingEnabled = paramBoolean;
  }
  
  public void setMaxSqlCacheSize(int paramInt)
  {
    if ((paramInt > 250) || (paramInt < 0)) {
      try
      {
        throw new IllegalStateException("expected value between 0 and 250");
      }
      finally {}
    }
    if (paramInt < mMaxSqlCacheSize) {
      throw new IllegalStateException("cannot set cacheSize to a value less than the value set with previous setMaxSqlCacheSize() call.");
    }
    mMaxSqlCacheSize = paramInt;
  }
  
  public long setMaximumSize(long paramLong)
  {
    localObject1 = null;
    lock();
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    try
    {
      long l3 = getPageSize();
      long l2 = paramLong / l3;
      long l1 = l2;
      if (paramLong % l3 != 0L) {
        l1 = l2 + 1L;
      }
      localSQLiteStatement = new SQLiteStatement(this, "PRAGMA max_page_count = " + l1);
      if (localObject1 == null) {
        break label121;
      }
    }
    finally
    {
      try
      {
        paramLong = localSQLiteStatement.simpleQueryForLong();
        if (localSQLiteStatement != null) {
          localSQLiteStatement.close();
        }
        unlock();
        return paramLong * l3;
      }
      finally
      {
        SQLiteStatement localSQLiteStatement;
        localObject1 = localSQLiteStatement;
      }
      localObject2 = finally;
    }
    ((SQLiteStatement)localObject1).close();
    label121:
    unlock();
    throw ((Throwable)localObject2);
  }
  
  public void setPageSize(long paramLong)
  {
    execSQL("PRAGMA page_size = " + paramLong);
  }
  
  public void setTransactionSuccessful()
  {
    if (!isOpen()) {
      throw new IllegalStateException("database not open");
    }
    if (!mLock.isHeldByCurrentThread()) {
      throw new IllegalStateException("no transaction pending");
    }
    if (mInnerTransactionIsSuccessful) {
      throw new IllegalStateException("setTransactionSuccessful may only be called once per call to beginTransaction");
    }
    mInnerTransactionIsSuccessful = true;
  }
  
  public void setVersion(int paramInt)
  {
    execSQL("PRAGMA user_version = " + paramInt);
  }
  
  public int status(int paramInt, boolean paramBoolean)
  {
    return native_status(paramInt, paramBoolean);
  }
  
  void unlock()
  {
    if (!mLockingEnabled) {
      return;
    }
    if ((SQLiteDebug.DEBUG_LOCK_TIME_TRACKING) && (mLock.getHoldCount() == 1)) {
      checkLockHoldTime();
    }
    mLock.unlock();
  }
  
  public int update(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString)
  {
    return updateWithOnConflict(paramString1, paramContentValues, paramString2, paramArrayOfString, 0);
  }
  
  /* Error */
  public int updateWithOnConflict(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString, int paramInt)
  {
    // Byte code:
    //   0: aload_2
    //   1: ifnull +10 -> 11
    //   4: aload_2
    //   5: invokevirtual 992	android/content/ContentValues:size	()I
    //   8: ifne +14 -> 22
    //   11: new 204	java/lang/IllegalArgumentException
    //   14: dup
    //   15: ldc_w 1181
    //   18: invokespecial 209	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   21: athrow
    //   22: new 306	java/lang/StringBuilder
    //   25: dup
    //   26: bipush 120
    //   28: invokespecial 985	java/lang/StringBuilder:<init>	(I)V
    //   31: astore 10
    //   33: aload 10
    //   35: ldc_w 1137
    //   38: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: pop
    //   42: aload 10
    //   44: getstatic 131	net/sqlcipher/database/SQLiteDatabase:CONFLICT_VALUES	[Ljava/lang/String;
    //   47: iload 5
    //   49: aaload
    //   50: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: pop
    //   54: aload 10
    //   56: aload_1
    //   57: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: pop
    //   61: aload 10
    //   63: ldc_w 1183
    //   66: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   69: pop
    //   70: aload_2
    //   71: invokevirtual 995	android/content/ContentValues:valueSet	()Ljava/util/Set;
    //   74: astore 11
    //   76: aload 11
    //   78: invokeinterface 354 1 0
    //   83: astore_1
    //   84: aload_1
    //   85: invokeinterface 360 1 0
    //   90: ifeq +56 -> 146
    //   93: aload 10
    //   95: aload_1
    //   96: invokeinterface 364 1 0
    //   101: checkcast 366	java/util/Map$Entry
    //   104: invokeinterface 369 1 0
    //   109: checkcast 117	java/lang/String
    //   112: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: pop
    //   116: aload 10
    //   118: ldc_w 1185
    //   121: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: pop
    //   125: aload_1
    //   126: invokeinterface 360 1 0
    //   131: ifeq -47 -> 84
    //   134: aload 10
    //   136: ldc_w 1000
    //   139: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: pop
    //   143: goto -59 -> 84
    //   146: aload_3
    //   147: invokestatic 407	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   150: ifne +19 -> 169
    //   153: aload 10
    //   155: ldc_w 887
    //   158: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   161: pop
    //   162: aload 10
    //   164: aload_3
    //   165: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: pop
    //   169: aload_0
    //   170: invokevirtual 678	net/sqlcipher/database/SQLiteDatabase:lock	()V
    //   173: aload_0
    //   174: invokevirtual 425	net/sqlcipher/database/SQLiteDatabase:isOpen	()Z
    //   177: ifne +14 -> 191
    //   180: new 417	java/lang/IllegalStateException
    //   183: dup
    //   184: ldc_w 853
    //   187: invokespecial 420	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   190: athrow
    //   191: aconst_null
    //   192: astore_1
    //   193: aconst_null
    //   194: astore 8
    //   196: aconst_null
    //   197: astore_3
    //   198: aload_0
    //   199: aload 10
    //   201: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   204: invokevirtual 889	net/sqlcipher/database/SQLiteDatabase:compileStatement	(Ljava/lang/String;)Lnet/sqlcipher/database/SQLiteStatement;
    //   207: astore 9
    //   209: aload 9
    //   211: astore_3
    //   212: aload 9
    //   214: astore_1
    //   215: aload 9
    //   217: astore 8
    //   219: aload 11
    //   221: invokeinterface 1008 1 0
    //   226: istore 7
    //   228: aload 9
    //   230: astore_3
    //   231: aload 9
    //   233: astore_1
    //   234: aload 9
    //   236: astore 8
    //   238: aload 11
    //   240: invokeinterface 354 1 0
    //   245: astore 11
    //   247: iconst_1
    //   248: istore 5
    //   250: iconst_0
    //   251: istore 6
    //   253: iload 6
    //   255: iload 7
    //   257: if_icmpge +50 -> 307
    //   260: aload 9
    //   262: astore_3
    //   263: aload 9
    //   265: astore_1
    //   266: aload 9
    //   268: astore 8
    //   270: aload 9
    //   272: iload 5
    //   274: aload 11
    //   276: invokeinterface 364 1 0
    //   281: checkcast 366	java/util/Map$Entry
    //   284: invokeinterface 1011 1 0
    //   289: invokestatic 895	net/sqlcipher/DatabaseUtils:bindObjectToProgram	(Lnet/sqlcipher/database/SQLiteProgram;ILjava/lang/Object;)V
    //   292: iload 5
    //   294: iconst_1
    //   295: iadd
    //   296: istore 5
    //   298: iload 6
    //   300: iconst_1
    //   301: iadd
    //   302: istore 6
    //   304: goto -51 -> 253
    //   307: aload 4
    //   309: ifnull +65 -> 374
    //   312: aload 9
    //   314: astore_3
    //   315: aload 9
    //   317: astore_1
    //   318: aload 9
    //   320: astore 8
    //   322: aload 4
    //   324: arraylength
    //   325: istore 7
    //   327: iconst_0
    //   328: istore 6
    //   330: iload 6
    //   332: iload 7
    //   334: if_icmpge +40 -> 374
    //   337: aload 9
    //   339: astore_3
    //   340: aload 9
    //   342: astore_1
    //   343: aload 9
    //   345: astore 8
    //   347: aload 9
    //   349: iload 5
    //   351: aload 4
    //   353: iload 6
    //   355: aaload
    //   356: invokevirtual 1189	net/sqlcipher/database/SQLiteStatement:bindString	(ILjava/lang/String;)V
    //   359: iload 5
    //   361: iconst_1
    //   362: iadd
    //   363: istore 5
    //   365: iload 6
    //   367: iconst_1
    //   368: iadd
    //   369: istore 6
    //   371: goto -41 -> 330
    //   374: aload 9
    //   376: astore_3
    //   377: aload 9
    //   379: astore_1
    //   380: aload 9
    //   382: astore 8
    //   384: aload 9
    //   386: invokevirtual 898	net/sqlcipher/database/SQLiteStatement:execute	()V
    //   389: aload 9
    //   391: astore_3
    //   392: aload 9
    //   394: astore_1
    //   395: aload 9
    //   397: astore 8
    //   399: aload_0
    //   400: invokevirtual 901	net/sqlcipher/database/SQLiteDatabase:lastChangeCount	()I
    //   403: istore 5
    //   405: aload 9
    //   407: astore_3
    //   408: aload 9
    //   410: astore_1
    //   411: aload 9
    //   413: astore 8
    //   415: ldc 73
    //   417: iconst_2
    //   418: invokestatic 293	android/util/Log:isLoggable	(Ljava/lang/String;I)Z
    //   421: ifeq +61 -> 482
    //   424: aload 9
    //   426: astore_3
    //   427: aload 9
    //   429: astore_1
    //   430: aload 9
    //   432: astore 8
    //   434: ldc 73
    //   436: new 306	java/lang/StringBuilder
    //   439: dup
    //   440: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   443: ldc_w 1191
    //   446: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   449: iload 5
    //   451: invokevirtual 323	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   454: ldc_w 1022
    //   457: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   460: aload_2
    //   461: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   464: ldc_w 1193
    //   467: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   470: aload 10
    //   472: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   475: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   478: invokestatic 829	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   481: pop
    //   482: aload 9
    //   484: ifnull +8 -> 492
    //   487: aload 9
    //   489: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   492: aload_0
    //   493: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   496: iload 5
    //   498: ireturn
    //   499: astore_2
    //   500: aload_3
    //   501: astore_1
    //   502: aload_0
    //   503: invokevirtual 904	net/sqlcipher/database/SQLiteDatabase:onCorruption	()V
    //   506: aload_3
    //   507: astore_1
    //   508: aload_2
    //   509: athrow
    //   510: astore_2
    //   511: aload_1
    //   512: ifnull +7 -> 519
    //   515: aload_1
    //   516: invokevirtual 553	net/sqlcipher/database/SQLiteStatement:close	()V
    //   519: aload_0
    //   520: invokevirtual 692	net/sqlcipher/database/SQLiteDatabase:unlock	()V
    //   523: aload_2
    //   524: athrow
    //   525: astore_3
    //   526: aload 8
    //   528: astore_1
    //   529: ldc 73
    //   531: new 306	java/lang/StringBuilder
    //   534: dup
    //   535: invokespecial 307	java/lang/StringBuilder:<init>	()V
    //   538: ldc_w 1195
    //   541: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   544: aload_2
    //   545: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   548: ldc_w 1022
    //   551: invokevirtual 313	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   554: aload 10
    //   556: invokevirtual 979	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   559: invokevirtual 328	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   562: invokestatic 1024	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   565: pop
    //   566: aload 8
    //   568: astore_1
    //   569: aload_3
    //   570: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	571	0	this	SQLiteDatabase
    //   0	571	1	paramString1	String
    //   0	571	2	paramContentValues	ContentValues
    //   0	571	3	paramString2	String
    //   0	571	4	paramArrayOfString	String[]
    //   0	571	5	paramInt	int
    //   251	119	6	i	int
    //   226	109	7	j	int
    //   194	373	8	localObject1	Object
    //   207	281	9	localSQLiteStatement	SQLiteStatement
    //   31	524	10	localStringBuilder	StringBuilder
    //   74	201	11	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   198	209	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   219	228	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   238	247	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   270	292	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   322	327	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   347	359	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   384	389	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   399	405	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   415	424	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   434	482	499	net/sqlcipher/database/SQLiteDatabaseCorruptException
    //   198	209	510	finally
    //   219	228	510	finally
    //   238	247	510	finally
    //   270	292	510	finally
    //   322	327	510	finally
    //   347	359	510	finally
    //   384	389	510	finally
    //   399	405	510	finally
    //   415	424	510	finally
    //   434	482	510	finally
    //   502	506	510	finally
    //   508	510	510	finally
    //   529	566	510	finally
    //   569	571	510	finally
    //   198	209	525	net/sqlcipher/SQLException
    //   219	228	525	net/sqlcipher/SQLException
    //   238	247	525	net/sqlcipher/SQLException
    //   270	292	525	net/sqlcipher/SQLException
    //   322	327	525	net/sqlcipher/SQLException
    //   347	359	525	net/sqlcipher/SQLException
    //   384	389	525	net/sqlcipher/SQLException
    //   399	405	525	net/sqlcipher/SQLException
    //   415	424	525	net/sqlcipher/SQLException
    //   434	482	525	net/sqlcipher/SQLException
  }
  
  @Deprecated
  public boolean yieldIfContended()
  {
    return yieldIfContendedHelper(false, -1L);
  }
  
  public boolean yieldIfContendedSafely()
  {
    return yieldIfContendedHelper(true, -1L);
  }
  
  public boolean yieldIfContendedSafely(long paramLong)
  {
    return yieldIfContendedHelper(true, paramLong);
  }
  
  static class ActiveDatabases
  {
    private static final ActiveDatabases activeDatabases = new ActiveDatabases();
    private HashSet<WeakReference<SQLiteDatabase>> mActiveDatabases = new HashSet();
    
    static ActiveDatabases getInstance()
    {
      return activeDatabases;
    }
  }
  
  public static abstract interface CursorFactory
  {
    public abstract Cursor newCursor(SQLiteDatabase paramSQLiteDatabase, SQLiteCursorDriver paramSQLiteCursorDriver, String paramString, SQLiteQuery paramSQLiteQuery);
  }
  
  private static class SyncUpdateInfo
  {
    String deletedTable;
    String foreignKey;
    String masterTable;
    
    SyncUpdateInfo(String paramString1, String paramString2, String paramString3)
    {
      masterTable = paramString1;
      deletedTable = paramString2;
      foreignKey = paramString3;
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteDatabase
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */