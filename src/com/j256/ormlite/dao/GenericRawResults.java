package com.j256.ormlite.dao;

import java.sql.SQLException;
import java.util.List;

public abstract interface GenericRawResults<T>
  extends CloseableWrappedIterable<T>
{
  public abstract void close()
    throws SQLException;
  
  public abstract String[] getColumnNames();
  
  public abstract T getFirstResult()
    throws SQLException;
  
  public abstract int getNumberColumns();
  
  public abstract List<T> getResults()
    throws SQLException;
}

/* Location:
 * Qualified Name:     com.j256.ormlite.dao.GenericRawResults
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */