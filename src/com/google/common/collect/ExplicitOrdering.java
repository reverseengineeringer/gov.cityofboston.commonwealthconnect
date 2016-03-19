package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
final class ExplicitOrdering<T>
  extends Ordering<T>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final ImmutableMap<T, Integer> rankMap;
  
  ExplicitOrdering(ImmutableMap<T, Integer> paramImmutableMap)
  {
    rankMap = paramImmutableMap;
  }
  
  ExplicitOrdering(List<T> paramList)
  {
    this(buildRankMap(paramList));
  }
  
  private static <T> ImmutableMap<T, Integer> buildRankMap(List<T> paramList)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int i = 0;
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      localBuilder.put(paramList.next(), Integer.valueOf(i));
      i += 1;
    }
    return localBuilder.build();
  }
  
  private int rank(T paramT)
  {
    Integer localInteger = (Integer)rankMap.get(paramT);
    if (localInteger == null) {
      throw new Ordering.IncomparableValueException(paramT);
    }
    return localInteger.intValue();
  }
  
  public int compare(T paramT1, T paramT2)
  {
    return rank(paramT1) - rank(paramT2);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof ExplicitOrdering))
    {
      paramObject = (ExplicitOrdering)paramObject;
      return rankMap.equals(rankMap);
    }
    return false;
  }
  
  public int hashCode()
  {
    return rankMap.hashCode();
  }
  
  public String toString()
  {
    return "Ordering.explicit(" + rankMap.keySet() + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ExplicitOrdering
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */