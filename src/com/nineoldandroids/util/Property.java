package com.nineoldandroids.util;

public abstract class Property<T, V>
{
  private final String mName;
  private final Class<V> mType;
  
  public Property(Class<V> paramClass, String paramString)
  {
    mName = paramString;
    mType = paramClass;
  }
  
  public static <T, V> Property<T, V> of(Class<T> paramClass, Class<V> paramClass1, String paramString)
  {
    return new ReflectiveProperty(paramClass, paramClass1, paramString);
  }
  
  public abstract V get(T paramT);
  
  public String getName()
  {
    return mName;
  }
  
  public Class<V> getType()
  {
    return mType;
  }
  
  public boolean isReadOnly()
  {
    return false;
  }
  
  public void set(T paramT, V paramV)
  {
    throw new UnsupportedOperationException("Property " + getName() + " is read-only");
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.util.Property
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */