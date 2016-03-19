package com.commonsware.cwac.loaderex;

import android.content.ContentValues;
import net.sqlcipher.database.SQLiteDatabase;

class SQLCipherCursorLoader$ReplaceTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLCipherCursorLoader$ReplaceTask(SQLCipherCursorLoader paramSQLCipherCursorLoader1, SQLCipherCursorLoader paramSQLCipherCursorLoader2)
  {
    super(paramSQLCipherCursorLoader2);
  }
  
  protected Void doInBackground(Object... paramVarArgs)
  {
    ((SQLiteDatabase)paramVarArgs[0]).replace((String)paramVarArgs[1], (String)paramVarArgs[2], (ContentValues)paramVarArgs[3]);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLCipherCursorLoader.ReplaceTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */