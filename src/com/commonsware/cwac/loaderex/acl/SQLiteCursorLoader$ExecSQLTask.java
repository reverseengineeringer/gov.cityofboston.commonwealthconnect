package com.commonsware.cwac.loaderex.acl;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

class SQLiteCursorLoader$ExecSQLTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLiteCursorLoader$ExecSQLTask(SQLiteCursorLoader paramSQLiteCursorLoader1, SQLiteCursorLoader paramSQLiteCursorLoader2)
  {
    super(paramSQLiteCursorLoader2);
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

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.acl.SQLiteCursorLoader.ExecSQLTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */