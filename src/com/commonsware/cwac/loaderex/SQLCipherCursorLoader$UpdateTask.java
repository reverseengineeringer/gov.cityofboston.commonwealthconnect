package com.commonsware.cwac.loaderex;

import android.content.ContentValues;
import net.sqlcipher.database.SQLiteDatabase;

class SQLCipherCursorLoader$UpdateTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLCipherCursorLoader$UpdateTask(SQLCipherCursorLoader paramSQLCipherCursorLoader1, SQLCipherCursorLoader paramSQLCipherCursorLoader2)
  {
    super(paramSQLCipherCursorLoader2);
  }
  
  protected Void doInBackground(Object... paramVarArgs)
  {
    ((SQLiteDatabase)paramVarArgs[0]).update((String)paramVarArgs[1], (ContentValues)paramVarArgs[2], (String)paramVarArgs[3], (String[])paramVarArgs[4]);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLCipherCursorLoader.UpdateTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */