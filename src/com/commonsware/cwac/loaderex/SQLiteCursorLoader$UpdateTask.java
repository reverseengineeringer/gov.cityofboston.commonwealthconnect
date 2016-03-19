package com.commonsware.cwac.loaderex;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

class SQLiteCursorLoader$UpdateTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLiteCursorLoader$UpdateTask(SQLiteCursorLoader paramSQLiteCursorLoader1, SQLiteCursorLoader paramSQLiteCursorLoader2)
  {
    super(paramSQLiteCursorLoader2);
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

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLiteCursorLoader.UpdateTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */