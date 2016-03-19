package com.google.common.base;

import javax.annotation.Nullable;

public final class Objects$ToStringHelper
{
  private final String className;
  private ValueHolder holderHead = new ValueHolder(null);
  private ValueHolder holderTail = holderHead;
  private boolean omitNullValues = false;
  
  private Objects$ToStringHelper(String paramString)
  {
    className = ((String)Preconditions.checkNotNull(paramString));
  }
  
  private ValueHolder addHolder()
  {
    ValueHolder localValueHolder = new ValueHolder(null);
    holderTail.next = localValueHolder;
    holderTail = localValueHolder;
    return localValueHolder;
  }
  
  private ToStringHelper addHolder(@Nullable Object paramObject)
  {
    addHoldervalue = paramObject;
    return this;
  }
  
  private ToStringHelper addHolder(String paramString, @Nullable Object paramObject)
  {
    ValueHolder localValueHolder = addHolder();
    value = paramObject;
    name = ((String)Preconditions.checkNotNull(paramString));
    return this;
  }
  
  public ToStringHelper add(String paramString, char paramChar)
  {
    return addHolder(paramString, String.valueOf(paramChar));
  }
  
  public ToStringHelper add(String paramString, double paramDouble)
  {
    return addHolder(paramString, String.valueOf(paramDouble));
  }
  
  public ToStringHelper add(String paramString, float paramFloat)
  {
    return addHolder(paramString, String.valueOf(paramFloat));
  }
  
  public ToStringHelper add(String paramString, int paramInt)
  {
    return addHolder(paramString, String.valueOf(paramInt));
  }
  
  public ToStringHelper add(String paramString, long paramLong)
  {
    return addHolder(paramString, String.valueOf(paramLong));
  }
  
  public ToStringHelper add(String paramString, @Nullable Object paramObject)
  {
    return addHolder(paramString, paramObject);
  }
  
  public ToStringHelper add(String paramString, boolean paramBoolean)
  {
    return addHolder(paramString, String.valueOf(paramBoolean));
  }
  
  public ToStringHelper addValue(char paramChar)
  {
    return addHolder(String.valueOf(paramChar));
  }
  
  public ToStringHelper addValue(double paramDouble)
  {
    return addHolder(String.valueOf(paramDouble));
  }
  
  public ToStringHelper addValue(float paramFloat)
  {
    return addHolder(String.valueOf(paramFloat));
  }
  
  public ToStringHelper addValue(int paramInt)
  {
    return addHolder(String.valueOf(paramInt));
  }
  
  public ToStringHelper addValue(long paramLong)
  {
    return addHolder(String.valueOf(paramLong));
  }
  
  public ToStringHelper addValue(@Nullable Object paramObject)
  {
    return addHolder(paramObject);
  }
  
  public ToStringHelper addValue(boolean paramBoolean)
  {
    return addHolder(String.valueOf(paramBoolean));
  }
  
  public ToStringHelper omitNullValues()
  {
    omitNullValues = true;
    return this;
  }
  
  public String toString()
  {
    boolean bool = omitNullValues;
    Object localObject1 = "";
    StringBuilder localStringBuilder = new StringBuilder(32).append(className).append('{');
    ValueHolder localValueHolder = holderHead.next;
    while (localValueHolder != null)
    {
      Object localObject2;
      if (bool)
      {
        localObject2 = localObject1;
        if (value == null) {}
      }
      else
      {
        localStringBuilder.append((String)localObject1);
        localObject2 = ", ";
        if (name != null) {
          localStringBuilder.append(name).append('=');
        }
        localStringBuilder.append(value);
      }
      localValueHolder = next;
      localObject1 = localObject2;
    }
    return '}';
  }
  
  private static final class ValueHolder
  {
    String name;
    ValueHolder next;
    Object value;
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Objects.ToStringHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */