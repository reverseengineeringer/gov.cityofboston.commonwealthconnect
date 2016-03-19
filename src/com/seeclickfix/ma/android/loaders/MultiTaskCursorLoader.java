package com.seeclickfix.ma.android.loaders;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteOpenHelper;
import com.commonsware.cwac.loaderex.acl.SQLiteCursorLoader;
import com.seeclickfix.ma.android.tasks.CancellableTask;

public class MultiTaskCursorLoader
  extends SQLiteCursorLoader
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "MultiTaskCursorLoader";
  private Context context;
  private CancellableTask<?> task;
  
  private MultiTaskCursorLoader(Builder paramBuilder)
  {
    super(c, db, rawQuery, sqlArgs);
    task = task;
  }
  
  private void cancelAllTasks()
  {
    try
    {
      task.cancel();
      return;
    }
    catch (Exception localException) {}
  }
  
  public Cursor loadInBackground()
  {
    if (task != null) {}
    try
    {
      task.call();
      return super.loadInBackground();
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public void onCanceled(Cursor paramCursor)
  {
    super.onCanceled(paramCursor);
    cancelAllTasks();
  }
  
  public static class Builder
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
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.loaders.MultiTaskCursorLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */