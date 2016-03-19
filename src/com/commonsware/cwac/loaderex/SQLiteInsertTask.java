package com.commonsware.cwac.loaderex;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.os.AsyncTask;

@Deprecated
public class SQLiteInsertTask
  extends AsyncTask<Void, Void, Exception>
{
  SQLiteDatabase db;
  String nullColumnHack;
  String table;
  ContentValues values;
  
  public SQLiteInsertTask(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, ContentValues paramContentValues)
  {
    db = paramSQLiteDatabase;
    table = paramString1;
    nullColumnHack = paramString2;
    values = paramContentValues;
  }
  
  protected Exception doInBackground(Void... paramVarArgs)
  {
    try
    {
      db.insert(table, nullColumnHack, values);
      return null;
    }
    catch (Exception paramVarArgs) {}
    return paramVarArgs;
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLiteInsertTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */