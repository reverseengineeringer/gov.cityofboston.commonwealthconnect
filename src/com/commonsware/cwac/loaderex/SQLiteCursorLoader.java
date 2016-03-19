package com.commonsware.cwac.loaderex;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.Arrays;

public class SQLiteCursorLoader
  extends AbstractCursorLoader
{
  String[] args = null;
  SQLiteOpenHelper db = null;
  String rawQuery = null;
  
  public SQLiteCursorLoader(Context paramContext, SQLiteOpenHelper paramSQLiteOpenHelper, String paramString, String[] paramArrayOfString)
  {
    super(paramContext);
    db = paramSQLiteOpenHelper;
    rawQuery = paramString;
    args = paramArrayOfString;
  }
  
  protected Cursor buildCursor()
  {
    return db.getReadableDatabase().rawQuery(rawQuery, args);
  }
  
  public void delete(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    new DeleteTask(this).execute(new Object[] { db, paramString1, paramString2, paramArrayOfString });
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    super.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("rawQuery=");
    paramPrintWriter.println(rawQuery);
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("args=");
    paramPrintWriter.println(Arrays.toString(paramArrayOfString));
  }
  
  public void execSQL(String paramString, Object[] paramArrayOfObject)
  {
    new ExecSQLTask(this).execute(new Object[] { db, paramString, paramArrayOfObject });
  }
  
  public void insert(String paramString1, String paramString2, ContentValues paramContentValues)
  {
    new InsertTask(this).execute(new Object[] { db, paramString1, paramString2, paramContentValues });
  }
  
  public void replace(String paramString1, String paramString2, ContentValues paramContentValues)
  {
    new ReplaceTask(this).execute(new Object[] { db, paramString1, paramString2, paramContentValues });
  }
  
  public void update(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString)
  {
    new UpdateTask(this).execute(new Object[] { db, paramString1, paramContentValues, paramString2, paramArrayOfString });
  }
  
  private class DeleteTask
    extends ContentChangingTask<Object, Void, Void>
  {
    DeleteTask(SQLiteCursorLoader paramSQLiteCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      SQLiteOpenHelper localSQLiteOpenHelper = (SQLiteOpenHelper)paramVarArgs[0];
      String str1 = (String)paramVarArgs[1];
      String str2 = (String)paramVarArgs[2];
      paramVarArgs = (String[])paramVarArgs[3];
      localSQLiteOpenHelper.getWritableDatabase().delete(str1, str2, paramVarArgs);
      return null;
    }
  }
  
  private class ExecSQLTask
    extends ContentChangingTask<Object, Void, Void>
  {
    ExecSQLTask(SQLiteCursorLoader paramSQLiteCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      SQLiteOpenHelper localSQLiteOpenHelper = (SQLiteOpenHelper)paramVarArgs[0];
      String str = (String)paramVarArgs[1];
      paramVarArgs = (Object[])paramVarArgs[2];
      localSQLiteOpenHelper.getWritableDatabase().execSQL(str, paramVarArgs);
      return null;
    }
  }
  
  private class InsertTask
    extends ContentChangingTask<Object, Void, Void>
  {
    InsertTask(SQLiteCursorLoader paramSQLiteCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      SQLiteOpenHelper localSQLiteOpenHelper = (SQLiteOpenHelper)paramVarArgs[0];
      String str1 = (String)paramVarArgs[1];
      String str2 = (String)paramVarArgs[2];
      paramVarArgs = (ContentValues)paramVarArgs[3];
      localSQLiteOpenHelper.getWritableDatabase().insert(str1, str2, paramVarArgs);
      return null;
    }
  }
  
  private class ReplaceTask
    extends ContentChangingTask<Object, Void, Void>
  {
    ReplaceTask(SQLiteCursorLoader paramSQLiteCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      SQLiteOpenHelper localSQLiteOpenHelper = (SQLiteOpenHelper)paramVarArgs[0];
      String str1 = (String)paramVarArgs[1];
      String str2 = (String)paramVarArgs[2];
      paramVarArgs = (ContentValues)paramVarArgs[3];
      localSQLiteOpenHelper.getWritableDatabase().replace(str1, str2, paramVarArgs);
      return null;
    }
  }
  
  private class UpdateTask
    extends ContentChangingTask<Object, Void, Void>
  {
    UpdateTask(SQLiteCursorLoader paramSQLiteCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      SQLiteOpenHelper localSQLiteOpenHelper = (SQLiteOpenHelper)paramVarArgs[0];
      String str1 = (String)paramVarArgs[1];
      ContentValues localContentValues = (ContentValues)paramVarArgs[2];
      String str2 = (String)paramVarArgs[3];
      paramVarArgs = (String[])paramVarArgs[4];
      localSQLiteOpenHelper.getWritableDatabase().update(str1, localContentValues, str2, paramVarArgs);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLiteCursorLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */