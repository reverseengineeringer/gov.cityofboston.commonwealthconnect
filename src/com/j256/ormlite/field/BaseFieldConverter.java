package com.j256.ormlite.field;

import com.j256.ormlite.support.DatabaseResults;
import java.sql.SQLException;

public abstract class BaseFieldConverter
  implements FieldConverter
{
  public boolean isStreamType()
  {
    return false;
  }
  
  public Object javaToSqlArg(FieldType paramFieldType, Object paramObject)
    throws SQLException
  {
    return paramObject;
  }
  
  public Object resultToJava(FieldType paramFieldType, DatabaseResults paramDatabaseResults, int paramInt)
    throws SQLException
  {
    paramDatabaseResults = resultToSqlArg(paramFieldType, paramDatabaseResults, paramInt);
    if (paramDatabaseResults == null) {
      return null;
    }
    return sqlArgToJava(paramFieldType, paramDatabaseResults, paramInt);
  }
  
  public Object sqlArgToJava(FieldType paramFieldType, Object paramObject, int paramInt)
    throws SQLException
  {
    return paramObject;
  }
}

/* Location:
 * Qualified Name:     com.j256.ormlite.field.BaseFieldConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */