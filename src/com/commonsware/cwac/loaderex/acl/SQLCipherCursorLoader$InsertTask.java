package com.commonsware.cwac.loaderex.acl;

import android.content.ContentValues;
import net.sqlcipher.database.SQLiteDatabase;

class SQLCipherCursorLoader$InsertTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLCipherCursorLoader$InsertTask(SQLCipherCursorLoader paramSQLCipherCursorLoader1, SQLCipherCursorLoader paramSQLCipherCursorLoader2)
  {
    super(paramSQLCipherCursorLoader2);
  }
  
  protected Void doInBackground(Object... paramVarArgs)
  {
    ((SQLiteDatabase)paramVarArgs[0]).insert((String)paramVarArgs[1], (String)paramVarArgs[2], (ContentValues)paramVarArgs[3]);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.acl.SQLCipherCursorLoader.InsertTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */