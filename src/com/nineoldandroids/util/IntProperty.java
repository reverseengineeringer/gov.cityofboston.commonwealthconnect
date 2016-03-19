package com.nineoldandroids.util;

public abstract class IntProperty<T>
  extends Property<T, Integer>
{
  public IntProperty(String paramString)
  {
    super(Integer.class, paramString);
  }
  
  public final void set(T paramT, Integer paramInteger)
  {
    set(paramT, Integer.valueOf(paramInteger.intValue()));
  }
  
  public abstract void setValue(T paramT, int paramInt);
}

/* Location:
 * Qualified Name:     com.nineoldandroids.util.IntProperty
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */