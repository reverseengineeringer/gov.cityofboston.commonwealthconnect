package com.nineoldandroids.util;

public abstract class FloatProperty<T>
  extends Property<T, Float>
{
  public FloatProperty(String paramString)
  {
    super(Float.class, paramString);
  }
  
  public final void set(T paramT, Float paramFloat)
  {
    setValue(paramT, paramFloat.floatValue());
  }
  
  public abstract void setValue(T paramT, float paramFloat);
}

/* Location:
 * Qualified Name:     com.nineoldandroids.util.FloatProperty
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */