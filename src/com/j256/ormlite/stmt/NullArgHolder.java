package com.j256.ormlite.stmt;

import com.j256.ormlite.field.FieldType;
import com.j256.ormlite.field.SqlType;

public class NullArgHolder
  implements ArgumentHolder
{
  public String getColumnName()
  {
    return "null-holder";
  }
  
  public FieldType getFieldType()
  {
    return null;
  }
  
  public Object getSqlArgValue()
  {
    return null;
  }
  
  public SqlType getSqlType()
  {
    return SqlType.STRING;
  }
  
  public void setMetaInfo(FieldType paramFieldType) {}
  
  public void setMetaInfo(String paramString) {}
  
  public void setMetaInfo(String paramString, FieldType paramFieldType) {}
  
  public void setValue(Object paramObject)
  {
    throw new UnsupportedOperationException("Cannot set null on " + getClass());
  }
}

/* Location:
 * Qualified Name:     com.j256.ormlite.stmt.NullArgHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */