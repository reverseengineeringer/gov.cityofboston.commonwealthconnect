package com.commonsware.cwac.loaderex;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.Arrays;
import net.sqlcipher.database.SQLiteDatabase;
import net.sqlcipher.database.SQLiteOpenHelper;

public class SQLCipherCursorLoader
  extends AbstractCursorLoader
{
  String[] args = null;
  SQLiteDatabase db = null;
  String rawQuery = null;
  
  public SQLCipherCursorLoader(Context paramContext, SQLiteOpenHelper paramSQLiteOpenHelper, String paramString1, String paramString2, String[] paramArrayOfString)
  {
    super(paramContext);
    db = paramSQLiteOpenHelper.getWritableDatabase(paramString1);
    rawQuery = paramString2;
    args = paramArrayOfString;
  }
  
  protected Cursor buildCursor()
  {
    return db.rawQuery(rawQuery, args);
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
    DeleteTask(SQLCipherCursorLoader paramSQLCipherCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      ((SQLiteDatabase)paramVarArgs[0]).delete((String)paramVarArgs[1], (String)paramVarArgs[2], (String[])paramVarArgs[3]);
      return null;
    }
  }
  
  private class ExecSQLTask
    extends ContentChangingTask<Object, Void, Void>
  {
    ExecSQLTask(SQLCipherCursorLoader paramSQLCipherCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      ((SQLiteDatabase)paramVarArgs[0]).execSQL((String)paramVarArgs[1], (Object[])paramVarArgs[2]);
      return null;
    }
  }
  
  private class InsertTask
    extends ContentChangingTask<Object, Void, Void>
  {
    InsertTask(SQLCipherCursorLoader paramSQLCipherCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      ((SQLiteDatabase)paramVarArgs[0]).insert((String)paramVarArgs[1], (String)paramVarArgs[2], (ContentValues)paramVarArgs[3]);
      return null;
    }
  }
  
  private class ReplaceTask
    extends ContentChangingTask<Object, Void, Void>
  {
    ReplaceTask(SQLCipherCursorLoader paramSQLCipherCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      ((SQLiteDatabase)paramVarArgs[0]).replace((String)paramVarArgs[1], (String)paramVarArgs[2], (ContentValues)paramVarArgs[3]);
      return null;
    }
  }
  
  private class UpdateTask
    extends ContentChangingTask<Object, Void, Void>
  {
    UpdateTask(SQLCipherCursorLoader paramSQLCipherCursorLoader)
    {
      super();
    }
    
    protected Void doInBackground(Object... paramVarArgs)
    {
      ((SQLiteDatabase)paramVarArgs[0]).update((String)paramVarArgs[1], (ContentValues)paramVarArgs[2], (String)paramVarArgs[3], (String[])paramVarArgs[4]);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLCipherCursorLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */