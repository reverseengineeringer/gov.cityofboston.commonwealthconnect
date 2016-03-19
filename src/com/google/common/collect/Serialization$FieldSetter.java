package com.google.common.collect;

import java.lang.reflect.Field;

final class Serialization$FieldSetter<T>
{
  private final Field field;
  
  private Serialization$FieldSetter(Field paramField)
  {
    field = paramField;
    paramField.setAccessible(true);
  }
  
  void set(T paramT, int paramInt)
  {
    try
    {
      field.set(paramT, Integer.valueOf(paramInt));
      return;
    }
    catch (IllegalAccessException paramT)
    {
      throw new AssertionError(paramT);
    }
  }
  
  void set(T paramT, Object paramObject)
  {
    try
    {
      field.set(paramT, paramObject);
      return;
    }
    catch (IllegalAccessException paramT)
    {
      throw new AssertionError(paramT);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Serialization.FieldSetter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */