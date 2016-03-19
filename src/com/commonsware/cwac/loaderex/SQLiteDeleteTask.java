package com.commonsware.cwac.loaderex;

import android.database.sqlite.SQLiteDatabase;
import android.os.AsyncTask;

@Deprecated
public class SQLiteDeleteTask
  extends AsyncTask<Void, Void, Exception>
{
  String[] args;
  SQLiteDatabase db;
  String selection;
  String table;
  
  public SQLiteDeleteTask(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String[] paramArrayOfString)
  {
    db = paramSQLiteDatabase;
    table = paramString1;
    selection = paramString2;
    args = paramArrayOfString;
  }
  
  protected Exception doInBackground(Void... paramVarArgs)
  {
    try
    {
      db.delete(table, selection, args);
      return null;
    }
    catch (Exception paramVarArgs) {}
    return paramVarArgs;
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLiteDeleteTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */