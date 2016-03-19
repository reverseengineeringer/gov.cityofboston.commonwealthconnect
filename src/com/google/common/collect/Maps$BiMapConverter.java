package com.google.common.collect;

import com.google.common.base.Converter;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import javax.annotation.Nullable;

final class Maps$BiMapConverter<A, B>
  extends Converter<A, B>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final BiMap<A, B> bimap;
  
  Maps$BiMapConverter(BiMap<A, B> paramBiMap)
  {
    bimap = ((BiMap)Preconditions.checkNotNull(paramBiMap));
  }
  
  private static <X, Y> Y convert(BiMap<X, Y> paramBiMap, X paramX)
  {
    paramBiMap = paramBiMap.get(paramX);
    if (paramBiMap != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "No non-null mapping present for input: %s", new Object[] { paramX });
      return paramBiMap;
    }
  }
  
  protected A doBackward(B paramB)
  {
    return (A)convert(bimap.inverse(), paramB);
  }
  
  protected B doForward(A paramA)
  {
    return (B)convert(bimap, paramA);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof BiMapConverter))
    {
      paramObject = (BiMapConverter)paramObject;
      return bimap.equals(bimap);
    }
    return false;
  }
  
  public int hashCode()
  {
    return bimap.hashCode();
  }
  
  public String toString()
  {
    return "Maps.asConverter(" + bimap + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.BiMapConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */