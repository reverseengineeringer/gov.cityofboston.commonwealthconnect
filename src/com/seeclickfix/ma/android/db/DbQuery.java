package com.seeclickfix.ma.android.db;

import android.content.Context;
import com.j256.ormlite.stmt.PreparedQuery;

public abstract interface DbQuery<T>
{
  public abstract PreparedQuery<T> getPreparedQuery(Context paramContext);
  
  public abstract String getRawQuery(Context paramContext);
  
  public abstract void setPreparedQuery(PreparedQuery<T> paramPreparedQuery);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DbQuery
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */