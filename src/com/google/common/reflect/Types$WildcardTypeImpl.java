package com.google.common.reflect;

import com.google.common.collect.ImmutableList;
import java.io.Serializable;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Iterator;

final class Types$WildcardTypeImpl
  implements WildcardType, Serializable
{
  private static final long serialVersionUID = 0L;
  private final ImmutableList<Type> lowerBounds;
  private final ImmutableList<Type> upperBounds;
  
  Types$WildcardTypeImpl(Type[] paramArrayOfType1, Type[] paramArrayOfType2)
  {
    Types.access$200(paramArrayOfType1, "lower bound for wildcard");
    Types.access$200(paramArrayOfType2, "upper bound for wildcard");
    lowerBounds = Types.JavaVersion.CURRENT.usedInGenericType(paramArrayOfType1);
    upperBounds = Types.JavaVersion.CURRENT.usedInGenericType(paramArrayOfType2);
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof WildcardType))
    {
      paramObject = (WildcardType)paramObject;
      bool1 = bool2;
      if (lowerBounds.equals(Arrays.asList(((WildcardType)paramObject).getLowerBounds())))
      {
        bool1 = bool2;
        if (upperBounds.equals(Arrays.asList(((WildcardType)paramObject).getUpperBounds()))) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public Type[] getLowerBounds()
  {
    return Types.access$300(lowerBounds);
  }
  
  public Type[] getUpperBounds()
  {
    return Types.access$300(upperBounds);
  }
  
  public int hashCode()
  {
    return lowerBounds.hashCode() ^ upperBounds.hashCode();
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("?");
    Iterator localIterator = lowerBounds.iterator();
    Type localType;
    while (localIterator.hasNext())
    {
      localType = (Type)localIterator.next();
      localStringBuilder.append(" super ").append(Types.toString(localType));
    }
    localIterator = Types.access$600(upperBounds).iterator();
    while (localIterator.hasNext())
    {
      localType = (Type)localIterator.next();
      localStringBuilder.append(" extends ").append(Types.toString(localType));
    }
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.WildcardTypeImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */