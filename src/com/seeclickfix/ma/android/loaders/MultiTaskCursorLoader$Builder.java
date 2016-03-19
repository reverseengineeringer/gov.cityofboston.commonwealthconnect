package com.seeclickfix.ma.android.loaders;

import android.content.Context;
import android.database.sqlite.SQLiteOpenHelper;
import com.seeclickfix.ma.android.tasks.CancellableTask;

public class MultiTaskCursorLoader$Builder
{
  private Context c;
  private SQLiteOpenHelper db;
  private String rawQuery;
  private String[] sqlArgs;
  private CancellableTask<?> task;
  
  public MultiTaskCursorLoader build()
  {
    if ((db == null) || (rawQuery == null) || (c == null)) {
      throw new IllegalStateException("sqlOpenHelper, rawQuery, and context are required parameters");
    }
    return new MultiTaskCursorLoader(this, null);
  }
  
  public void setCancellableTask(CancellableTask<?> paramCancellableTask)
  {
    task = paramCancellableTask;
  }
  
  public void setContext(Context paramContext)
  {
    c = paramContext;
  }
  
  public void setRawQuery(String paramString)
  {
    rawQuery = paramString;
  }
  
  public void sqlArgs(String[] paramArrayOfString)
  {
    sqlArgs = paramArrayOfString;
  }
  
  public void sqlOpenHelper(SQLiteOpenHelper paramSQLiteOpenHelper)
  {
    db = paramSQLiteOpenHelper;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.loaders.MultiTaskCursorLoader.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */