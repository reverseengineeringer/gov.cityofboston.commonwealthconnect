package com.commonsware.cwac.loaderex;

import net.sqlcipher.database.SQLiteDatabase;

class SQLCipherCursorLoader$ExecSQLTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLCipherCursorLoader$ExecSQLTask(SQLCipherCursorLoader paramSQLCipherCursorLoader1, SQLCipherCursorLoader paramSQLCipherCursorLoader2)
  {
    super(paramSQLCipherCursorLoader2);
  }
  
  protected Void doInBackground(Object... paramVarArgs)
  {
    ((SQLiteDatabase)paramVarArgs[0]).execSQL((String)paramVarArgs[1], (Object[])paramVarArgs[2]);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLCipherCursorLoader.ExecSQLTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */