package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Set;

public class ImmutableRangeSet$Builder<C extends Comparable<?>>
{
  private final RangeSet<C> rangeSet = TreeRangeSet.create();
  
  public Builder<C> add(Range<C> paramRange)
  {
    if (paramRange.isEmpty()) {
      throw new IllegalArgumentException("range must not be empty, but was " + paramRange);
    }
    if (!rangeSet.complement().encloses(paramRange))
    {
      Iterator localIterator = rangeSet.asRanges().iterator();
      if (localIterator.hasNext())
      {
        Range localRange = (Range)localIterator.next();
        if ((!localRange.isConnected(paramRange)) || (localRange.intersection(paramRange).isEmpty())) {}
        for (boolean bool = true;; bool = false)
        {
          Preconditions.checkArgument(bool, "Ranges may not overlap, but received %s and %s", new Object[] { localRange, paramRange });
          break;
        }
      }
      throw new AssertionError("should have thrown an IAE above");
    }
    rangeSet.add(paramRange);
    return this;
  }
  
  public Builder<C> addAll(RangeSet<C> paramRangeSet)
  {
    paramRangeSet = paramRangeSet.asRanges().iterator();
    while (paramRangeSet.hasNext()) {
      add((Range)paramRangeSet.next());
    }
    return this;
  }
  
  public ImmutableRangeSet<C> build()
  {
    return ImmutableRangeSet.copyOf(rangeSet);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeSet.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */