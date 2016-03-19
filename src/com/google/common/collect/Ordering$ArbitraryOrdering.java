package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Function;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

@VisibleForTesting
class Ordering$ArbitraryOrdering
  extends Ordering<Object>
{
  private Map<Object, Integer> uids = Platform.tryWeakKeys(new MapMaker()).makeComputingMap(new Function()
  {
    final AtomicInteger counter = new AtomicInteger(0);
    
    public Integer apply(Object paramAnonymousObject)
    {
      return Integer.valueOf(counter.getAndIncrement());
    }
  });
  
  public int compare(Object paramObject1, Object paramObject2)
  {
    int j = -1;
    if (paramObject1 == paramObject2) {
      i = 0;
    }
    int k;
    int m;
    do
    {
      do
      {
        return i;
        i = j;
      } while (paramObject1 == null);
      if (paramObject2 == null) {
        return 1;
      }
      k = identityHashCode(paramObject1);
      m = identityHashCode(paramObject2);
      if (k == m) {
        break;
      }
      i = j;
    } while (k < m);
    return 1;
    int i = ((Integer)uids.get(paramObject1)).compareTo((Integer)uids.get(paramObject2));
    if (i == 0) {
      throw new AssertionError();
    }
    return i;
  }
  
  int identityHashCode(Object paramObject)
  {
    return System.identityHashCode(paramObject);
  }
  
  public String toString()
  {
    return "Ordering.arbitrary()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Ordering.ArbitraryOrdering
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */