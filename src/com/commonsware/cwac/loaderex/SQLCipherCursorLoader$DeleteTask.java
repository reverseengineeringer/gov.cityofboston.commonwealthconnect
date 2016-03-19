package com.commonsware.cwac.loaderex;

import net.sqlcipher.database.SQLiteDatabase;

class SQLCipherCursorLoader$DeleteTask
  extends ContentChangingTask<Object, Void, Void>
{
  SQLCipherCursorLoader$DeleteTask(SQLCipherCursorLoader paramSQLCipherCursorLoader1, SQLCipherCursorLoader paramSQLCipherCursorLoader2)
  {
    super(paramSQLCipherCursorLoader2);
  }
  
  protected Void doInBackground(Object... paramVarArgs)
  {
    ((SQLiteDatabase)paramVarArgs[0]).delete((String)paramVarArgs[1], (String)paramVarArgs[2], (String[])paramVarArgs[3]);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.SQLCipherCursorLoader.DeleteTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */