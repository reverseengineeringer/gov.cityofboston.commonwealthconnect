package com.google.common.base;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public final class Defaults
{
  private static final Map<Class<?>, Object> DEFAULTS;
  
  static
  {
    HashMap localHashMap = new HashMap();
    put(localHashMap, Boolean.TYPE, Boolean.valueOf(false));
    put(localHashMap, Character.TYPE, Character.valueOf('\000'));
    put(localHashMap, Byte.TYPE, Byte.valueOf((byte)0));
    put(localHashMap, Short.TYPE, Short.valueOf((short)0));
    put(localHashMap, Integer.TYPE, Integer.valueOf(0));
    put(localHashMap, Long.TYPE, Long.valueOf(0L));
    put(localHashMap, Float.TYPE, Float.valueOf(0.0F));
    put(localHashMap, Double.TYPE, Double.valueOf(0.0D));
    DEFAULTS = Collections.unmodifiableMap(localHashMap);
  }
  
  public static <T> T defaultValue(Class<T> paramClass)
  {
    return (T)DEFAULTS.get(Preconditions.checkNotNull(paramClass));
  }
  
  private static <T> void put(Map<Class<?>, Object> paramMap, Class<T> paramClass, T paramT)
  {
    paramMap.put(paramClass, paramT);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Defaults
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */