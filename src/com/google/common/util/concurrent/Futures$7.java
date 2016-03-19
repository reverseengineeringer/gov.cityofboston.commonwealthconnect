package com.google.common.util.concurrent;

import com.google.common.base.Optional;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

final class Futures$7
  implements Futures.FutureCombiner<V, List<V>>
{
  public List<V> combine(List<Optional<V>> paramList)
  {
    ArrayList localArrayList = Lists.newArrayList();
    Iterator localIterator = paramList.iterator();
    if (localIterator.hasNext())
    {
      paramList = (Optional)localIterator.next();
      if (paramList != null) {}
      for (paramList = paramList.orNull();; paramList = null)
      {
        localArrayList.add(paramList);
        break;
      }
    }
    return Collections.unmodifiableList(localArrayList);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */