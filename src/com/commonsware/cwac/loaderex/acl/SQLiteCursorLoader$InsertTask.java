package com.commonsware.cwac.loaderex.acl;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

class SQLiteCursorLoader$InsertTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLiteCursorLoader$InsertTask(SQLiteCursorLoader paramSQLiteCursorLoader1, SQLiteCursorLoader paramSQLiteCursorLoader2)
  {
    super(paramSQLiteCursorLoader2);
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

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.acl.SQLiteCursorLoader.InsertTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */