package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

@Beta
public final class MinMaxPriorityQueue$Builder<B>
{
  private static final int UNSET_EXPECTED_SIZE = -1;
  private final Comparator<B> comparator;
  private int expectedSize = -1;
  private int maximumSize = Integer.MAX_VALUE;
  
  private MinMaxPriorityQueue$Builder(Comparator<B> paramComparator)
  {
    comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
  }
  
  private <T extends B> Ordering<T> ordering()
  {
    return Ordering.from(comparator);
  }
  
  public <T extends B> MinMaxPriorityQueue<T> create()
  {
    return create(Collections.emptySet());
  }
  
  public <T extends B> MinMaxPriorityQueue<T> create(Iterable<? extends T> paramIterable)
  {
    MinMaxPriorityQueue localMinMaxPriorityQueue = new MinMaxPriorityQueue(this, MinMaxPriorityQueue.initialQueueSize(expectedSize, maximumSize, paramIterable), null);
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext()) {
      localMinMaxPriorityQueue.offer(paramIterable.next());
    }
    return localMinMaxPriorityQueue;
  }
  
  public Builder<B> expectedSize(int paramInt)
  {
    if (paramInt >= 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      expectedSize = paramInt;
      return this;
    }
  }
  
  public Builder<B> maximumSize(int paramInt)
  {
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      maximumSize = paramInt;
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MinMaxPriorityQueue.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */