package net.sqlcipher;

import android.content.ContentValues;
import android.content.OperationApplicationException;
import android.os.Parcel;
import android.text.TextUtils;
import android.util.Log;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.text.CollationKey;
import java.text.Collator;
import java.util.HashMap;
import net.sqlcipher.database.SQLiteAbortException;
import net.sqlcipher.database.SQLiteConstraintException;
import net.sqlcipher.database.SQLiteDatabase;
import net.sqlcipher.database.SQLiteDatabaseCorruptException;
import net.sqlcipher.database.SQLiteDiskIOException;
import net.sqlcipher.database.SQLiteException;
import net.sqlcipher.database.SQLiteFullException;
import net.sqlcipher.database.SQLiteProgram;
import net.sqlcipher.database.SQLiteStatement;
import org.apache.commons.codec.binary.Hex;

public class DatabaseUtils
{
  private static final boolean DEBUG = false;
  private static final boolean LOCAL_LOGV = false;
  private static final String TAG = "DatabaseUtils";
  private static final String[] countProjection = { "count(*)" };
  private static Collator mColl = null;
  
  public static void appendEscapedSQLString(StringBuilder paramStringBuilder, String paramString)
  {
    paramStringBuilder.append('\'');
    if (paramString.indexOf('\'') != -1)
    {
      int j = paramString.length();
      int i = 0;
      while (i < j)
      {
        char c = paramString.charAt(i);
        if (c == '\'') {
          paramStringBuilder.append('\'');
        }
        paramStringBuilder.append(c);
        i += 1;
      }
    }
    paramStringBuilder.append(paramString);
    paramStringBuilder.append('\'');
  }
  
  public static final void appendValueToSql(StringBuilder paramStringBuilder, Object paramObject)
  {
    if (paramObject == null)
    {
      paramStringBuilder.append("NULL");
      return;
    }
    if ((paramObject instanceof Boolean))
    {
      if (((Boolean)paramObject).booleanValue())
      {
        paramStringBuilder.append('1');
        return;
      }
      paramStringBuilder.append('0');
      return;
    }
    appendEscapedSQLString(paramStringBuilder, paramObject.toString());
  }
  
  public static void bindObjectToProgram(SQLiteProgram paramSQLiteProgram, int paramInt, Object paramObject)
  {
    if (paramObject == null)
    {
      paramSQLiteProgram.bindNull(paramInt);
      return;
    }
    if (((paramObject instanceof Double)) || ((paramObject instanceof Float)))
    {
      paramSQLiteProgram.bindDouble(paramInt, ((Number)paramObject).doubleValue());
      return;
    }
    if ((paramObject instanceof Number))
    {
      paramSQLiteProgram.bindLong(paramInt, ((Number)paramObject).longValue());
      return;
    }
    if ((paramObject instanceof Boolean))
    {
      if (((Boolean)paramObject).booleanValue())
      {
        paramSQLiteProgram.bindLong(paramInt, 1L);
        return;
      }
      paramSQLiteProgram.bindLong(paramInt, 0L);
      return;
    }
    if ((paramObject instanceof byte[]))
    {
      paramSQLiteProgram.bindBlob(paramInt, (byte[])paramObject);
      return;
    }
    paramSQLiteProgram.bindString(paramInt, paramObject.toString());
  }
  
  public static String concatenateWhere(String paramString1, String paramString2)
  {
    if (TextUtils.isEmpty(paramString1)) {
      return paramString2;
    }
    if (TextUtils.isEmpty(paramString2)) {
      return paramString1;
    }
    return "(" + paramString1 + ") AND (" + paramString2 + ")";
  }
  
  public static void cursorDoubleToContentValues(android.database.Cursor paramCursor, String paramString1, ContentValues paramContentValues, String paramString2)
  {
    int i = paramCursor.getColumnIndex(paramString1);
    if (!paramCursor.isNull(i))
    {
      paramContentValues.put(paramString2, Double.valueOf(paramCursor.getDouble(i)));
      return;
    }
    paramContentValues.put(paramString2, (Double)null);
  }
  
  public static void cursorDoubleToContentValuesIfPresent(android.database.Cursor paramCursor, ContentValues paramContentValues, String paramString)
  {
    int i = paramCursor.getColumnIndexOrThrow(paramString);
    if (!paramCursor.isNull(i)) {
      paramContentValues.put(paramString, Double.valueOf(paramCursor.getDouble(i)));
    }
  }
  
  public static void cursorDoubleToCursorValues(android.database.Cursor paramCursor, String paramString, ContentValues paramContentValues)
  {
    cursorDoubleToContentValues(paramCursor, paramString, paramContentValues, paramString);
  }
  
  public static void cursorFloatToContentValuesIfPresent(android.database.Cursor paramCursor, ContentValues paramContentValues, String paramString)
  {
    int i = paramCursor.getColumnIndexOrThrow(paramString);
    if (!paramCursor.isNull(i)) {
      paramContentValues.put(paramString, Float.valueOf(paramCursor.getFloat(i)));
    }
  }
  
  public static void cursorIntToContentValues(android.database.Cursor paramCursor, String paramString, ContentValues paramContentValues)
  {
    cursorIntToContentValues(paramCursor, paramString, paramContentValues, paramString);
  }
  
  public static void cursorIntToContentValues(android.database.Cursor paramCursor, String paramString1, ContentValues paramContentValues, String paramString2)
  {
    int i = paramCursor.getColumnIndex(paramString1);
    if (!paramCursor.isNull(i))
    {
      paramContentValues.put(paramString2, Integer.valueOf(paramCursor.getInt(i)));
      return;
    }
    paramContentValues.put(paramString2, (Integer)null);
  }
  
  public static void cursorIntToContentValuesIfPresent(android.database.Cursor paramCursor, ContentValues paramContentValues, String paramString)
  {
    int i = paramCursor.getColumnIndexOrThrow(paramString);
    if (!paramCursor.isNull(i)) {
      paramContentValues.put(paramString, Integer.valueOf(paramCursor.getInt(i)));
    }
  }
  
  public static void cursorLongToContentValues(android.database.Cursor paramCursor, String paramString, ContentValues paramContentValues)
  {
    cursorLongToContentValues(paramCursor, paramString, paramContentValues, paramString);
  }
  
  public static void cursorLongToContentValues(android.database.Cursor paramCursor, String paramString1, ContentValues paramContentValues, String paramString2)
  {
    int i = paramCursor.getColumnIndex(paramString1);
    if (!paramCursor.isNull(i))
    {
      paramContentValues.put(paramString2, Long.valueOf(paramCursor.getLong(i)));
      return;
    }
    paramContentValues.put(paramString2, (Long)null);
  }
  
  public static void cursorLongToContentValuesIfPresent(android.database.Cursor paramCursor, ContentValues paramContentValues, String paramString)
  {
    int i = paramCursor.getColumnIndexOrThrow(paramString);
    if (!paramCursor.isNull(i)) {
      paramContentValues.put(paramString, Long.valueOf(paramCursor.getLong(i)));
    }
  }
  
  public static void cursorRowToContentValues(android.database.Cursor paramCursor, ContentValues paramContentValues)
  {
    AbstractWindowedCursor localAbstractWindowedCursor;
    String[] arrayOfString;
    int i;
    if ((paramCursor instanceof AbstractWindowedCursor))
    {
      localAbstractWindowedCursor = (AbstractWindowedCursor)paramCursor;
      arrayOfString = paramCursor.getColumnNames();
      int j = arrayOfString.length;
      i = 0;
      label27:
      if (i >= j) {
        return;
      }
      if ((localAbstractWindowedCursor == null) || (!localAbstractWindowedCursor.isBlob(i))) {
        break label74;
      }
      paramContentValues.put(arrayOfString[i], paramCursor.getBlob(i));
    }
    for (;;)
    {
      i += 1;
      break label27;
      localAbstractWindowedCursor = null;
      break;
      label74:
      paramContentValues.put(arrayOfString[i], paramCursor.getString(i));
    }
  }
  
  public static void cursorShortToContentValuesIfPresent(android.database.Cursor paramCursor, ContentValues paramContentValues, String paramString)
  {
    int i = paramCursor.getColumnIndexOrThrow(paramString);
    if (!paramCursor.isNull(i)) {
      paramContentValues.put(paramString, Short.valueOf(paramCursor.getShort(i)));
    }
  }
  
  public static void cursorStringToContentValues(android.database.Cursor paramCursor, String paramString, ContentValues paramContentValues)
  {
    cursorStringToContentValues(paramCursor, paramString, paramContentValues, paramString);
  }
  
  public static void cursorStringToContentValues(android.database.Cursor paramCursor, String paramString1, ContentValues paramContentValues, String paramString2)
  {
    paramContentValues.put(paramString2, paramCursor.getString(paramCursor.getColumnIndexOrThrow(paramString1)));
  }
  
  public static void cursorStringToContentValuesIfPresent(android.database.Cursor paramCursor, ContentValues paramContentValues, String paramString)
  {
    int i = paramCursor.getColumnIndexOrThrow(paramString);
    if (!paramCursor.isNull(i)) {
      paramContentValues.put(paramString, paramCursor.getString(i));
    }
  }
  
  public static void cursorStringToInsertHelper(android.database.Cursor paramCursor, String paramString, InsertHelper paramInsertHelper, int paramInt)
  {
    paramInsertHelper.bind(paramInt, paramCursor.getString(paramCursor.getColumnIndexOrThrow(paramString)));
  }
  
  public static void dumpCurrentRow(android.database.Cursor paramCursor)
  {
    dumpCurrentRow(paramCursor, System.out);
  }
  
  public static void dumpCurrentRow(android.database.Cursor paramCursor, PrintStream paramPrintStream)
  {
    String[] arrayOfString = paramCursor.getColumnNames();
    paramPrintStream.println("" + paramCursor.getPosition() + " {");
    int j = arrayOfString.length;
    int i = 0;
    for (;;)
    {
      if (i < j) {
        try
        {
          String str1 = paramCursor.getString(i);
          paramPrintStream.println("   " + arrayOfString[i] + '=' + str1);
          i += 1;
        }
        catch (SQLiteException localSQLiteException)
        {
          for (;;)
          {
            String str2 = "<unprintable>";
          }
        }
      }
    }
    paramPrintStream.println("}");
  }
  
  public static void dumpCurrentRow(android.database.Cursor paramCursor, StringBuilder paramStringBuilder)
  {
    String[] arrayOfString = paramCursor.getColumnNames();
    paramStringBuilder.append("" + paramCursor.getPosition() + " {\n");
    int j = arrayOfString.length;
    int i = 0;
    for (;;)
    {
      if (i < j) {
        try
        {
          String str1 = paramCursor.getString(i);
          paramStringBuilder.append("   " + arrayOfString[i] + '=' + str1 + "\n");
          i += 1;
        }
        catch (SQLiteException localSQLiteException)
        {
          for (;;)
          {
            String str2 = "<unprintable>";
          }
        }
      }
    }
    paramStringBuilder.append("}\n");
  }
  
  public static String dumpCurrentRowToString(android.database.Cursor paramCursor)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    dumpCurrentRow(paramCursor, localStringBuilder);
    return localStringBuilder.toString();
  }
  
  public static void dumpCursor(android.database.Cursor paramCursor)
  {
    dumpCursor(paramCursor, System.out);
  }
  
  public static void dumpCursor(android.database.Cursor paramCursor, PrintStream paramPrintStream)
  {
    paramPrintStream.println(">>>>> Dumping cursor " + paramCursor);
    if (paramCursor != null)
    {
      int i = paramCursor.getPosition();
      paramCursor.moveToPosition(-1);
      while (paramCursor.moveToNext()) {
        dumpCurrentRow(paramCursor, paramPrintStream);
      }
      paramCursor.moveToPosition(i);
    }
    paramPrintStream.println("<<<<<");
  }
  
  public static void dumpCursor(android.database.Cursor paramCursor, StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(">>>>> Dumping cursor " + paramCursor + "\n");
    if (paramCursor != null)
    {
      int i = paramCursor.getPosition();
      paramCursor.moveToPosition(-1);
      while (paramCursor.moveToNext()) {
        dumpCurrentRow(paramCursor, paramStringBuilder);
      }
      paramCursor.moveToPosition(i);
    }
    paramStringBuilder.append("<<<<<\n");
  }
  
  public static String dumpCursorToString(android.database.Cursor paramCursor)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    dumpCursor(paramCursor, localStringBuilder);
    return localStringBuilder.toString();
  }
  
  public static String getCollationKey(String paramString)
  {
    paramString = getCollationKeyInBytes(paramString);
    try
    {
      paramString = new String(paramString, 0, getKeyLen(paramString), "ISO8859_1");
      return paramString;
    }
    catch (Exception paramString) {}
    return "";
  }
  
  private static byte[] getCollationKeyInBytes(String paramString)
  {
    if (mColl == null)
    {
      mColl = Collator.getInstance();
      mColl.setStrength(0);
    }
    return mColl.getCollationKey(paramString).toByteArray();
  }
  
  public static String getHexCollationKey(String paramString)
  {
    paramString = getCollationKeyInBytes(paramString);
    return new String(Hex.encodeHex(paramString), 0, getKeyLen(paramString) * 2);
  }
  
  private static int getKeyLen(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte[(paramArrayOfByte.length - 1)] != 0) {
      return paramArrayOfByte.length;
    }
    return paramArrayOfByte.length - 1;
  }
  
  public static int getTypeOfObject(Object paramObject)
  {
    if (paramObject == null) {
      return 0;
    }
    if ((paramObject instanceof byte[])) {
      return 4;
    }
    if (((paramObject instanceof Float)) || ((paramObject instanceof Double))) {
      return 2;
    }
    if (((paramObject instanceof Long)) || ((paramObject instanceof Integer))) {
      return 1;
    }
    return 3;
  }
  
  public static long longForQuery(SQLiteDatabase paramSQLiteDatabase, String paramString, String[] paramArrayOfString)
  {
    paramSQLiteDatabase = paramSQLiteDatabase.compileStatement(paramString);
    try
    {
      long l = longForQuery(paramSQLiteDatabase, paramArrayOfString);
      return l;
    }
    finally
    {
      paramSQLiteDatabase.close();
    }
  }
  
  public static long longForQuery(SQLiteStatement paramSQLiteStatement, String[] paramArrayOfString)
  {
    if (paramArrayOfString != null)
    {
      int j = paramArrayOfString.length;
      int i = 0;
      while (i < j)
      {
        bindObjectToProgram(paramSQLiteStatement, i + 1, paramArrayOfString[i]);
        i += 1;
      }
    }
    return paramSQLiteStatement.simpleQueryForLong();
  }
  
  public static long queryNumEntries(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    paramSQLiteDatabase = paramSQLiteDatabase.query(paramString, countProjection, null, null, null, null, null);
    try
    {
      paramSQLiteDatabase.moveToFirst();
      long l = paramSQLiteDatabase.getLong(0);
      return l;
    }
    finally
    {
      paramSQLiteDatabase.close();
    }
  }
  
  public static final void readExceptionFromParcel(Parcel paramParcel)
  {
    int i = paramParcel.readInt();
    if (i == 0) {
      return;
    }
    readExceptionFromParcel(paramParcel, paramParcel.readString(), i);
  }
  
  private static final void readExceptionFromParcel(Parcel paramParcel, String paramString, int paramInt)
  {
    switch (paramInt)
    {
    default: 
      paramParcel.readException(paramInt, paramString);
      return;
    case 2: 
      throw new IllegalArgumentException(paramString);
    case 3: 
      throw new UnsupportedOperationException(paramString);
    case 4: 
      throw new SQLiteAbortException(paramString);
    case 5: 
      throw new SQLiteConstraintException(paramString);
    case 6: 
      throw new SQLiteDatabaseCorruptException(paramString);
    case 7: 
      throw new SQLiteFullException(paramString);
    case 8: 
      throw new SQLiteDiskIOException(paramString);
    }
    throw new SQLiteException(paramString);
  }
  
  public static void readExceptionWithFileNotFoundExceptionFromParcel(Parcel paramParcel)
    throws FileNotFoundException
  {
    int i = paramParcel.readInt();
    if (i == 0) {
      return;
    }
    String str = paramParcel.readString();
    if (i == 1) {
      throw new FileNotFoundException(str);
    }
    readExceptionFromParcel(paramParcel, str, i);
  }
  
  public static void readExceptionWithOperationApplicationExceptionFromParcel(Parcel paramParcel)
    throws OperationApplicationException
  {
    int i = paramParcel.readInt();
    if (i == 0) {
      return;
    }
    String str = paramParcel.readString();
    if (i == 10) {
      throw new OperationApplicationException(str);
    }
    readExceptionFromParcel(paramParcel, str, i);
  }
  
  public static String sqlEscapeString(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    appendEscapedSQLString(localStringBuilder, paramString);
    return localStringBuilder.toString();
  }
  
  public static String stringForQuery(SQLiteDatabase paramSQLiteDatabase, String paramString, String[] paramArrayOfString)
  {
    paramSQLiteDatabase = paramSQLiteDatabase.compileStatement(paramString);
    try
    {
      paramString = stringForQuery(paramSQLiteDatabase, paramArrayOfString);
      return paramString;
    }
    finally
    {
      paramSQLiteDatabase.close();
    }
  }
  
  public static String stringForQuery(SQLiteStatement paramSQLiteStatement, String[] paramArrayOfString)
  {
    if (paramArrayOfString != null)
    {
      int j = paramArrayOfString.length;
      int i = 0;
      while (i < j)
      {
        bindObjectToProgram(paramSQLiteStatement, i + 1, paramArrayOfString[i]);
        i += 1;
      }
    }
    return paramSQLiteStatement.simpleQueryForString();
  }
  
  public static final void writeExceptionToParcel(Parcel paramParcel, Exception paramException)
  {
    int j = 1;
    int i;
    if ((paramException instanceof FileNotFoundException))
    {
      i = 1;
      j = 0;
    }
    for (;;)
    {
      paramParcel.writeInt(i);
      paramParcel.writeString(paramException.getMessage());
      if (j != 0) {
        Log.e("DatabaseUtils", "Writing exception to parcel", paramException);
      }
      return;
      if ((paramException instanceof IllegalArgumentException))
      {
        i = 2;
      }
      else if ((paramException instanceof UnsupportedOperationException))
      {
        i = 3;
      }
      else if ((paramException instanceof SQLiteAbortException))
      {
        i = 4;
      }
      else if ((paramException instanceof SQLiteConstraintException))
      {
        i = 5;
      }
      else if ((paramException instanceof SQLiteDatabaseCorruptException))
      {
        i = 6;
      }
      else if ((paramException instanceof SQLiteFullException))
      {
        i = 7;
      }
      else if ((paramException instanceof SQLiteDiskIOException))
      {
        i = 8;
      }
      else if ((paramException instanceof SQLiteException))
      {
        i = 9;
      }
      else
      {
        if (!(paramException instanceof OperationApplicationException)) {
          break;
        }
        i = 10;
      }
    }
    paramParcel.writeException(paramException);
    Log.e("DatabaseUtils", "Writing exception to parcel", paramException);
  }
  
  public static class InsertHelper
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
    
    public InsertHelper(SQLiteDatabase paramSQLiteDatabase, String paramString)
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
}

/* Location:
 * Qualified Name:     net.sqlcipher.DatabaseUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */