package com.google.common.base;

import java.util.AbstractList;

final class Joiner$3
  extends AbstractList<Object>
{
  Joiner$3(Object[] paramArrayOfObject, Object paramObject1, Object paramObject2) {}
  
  public Object get(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return val$rest[(paramInt - 2)];
    case 0: 
      return val$first;
    }
    return val$second;
  }
  
  public int size()
  {
    return val$rest.length + 2;
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Joiner.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */