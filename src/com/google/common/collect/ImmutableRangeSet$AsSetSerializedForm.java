package com.google.common.collect;

import java.io.Serializable;

class ImmutableRangeSet$AsSetSerializedForm<C extends Comparable>
  implements Serializable
{
  private final DiscreteDomain<C> domain;
  private final ImmutableList<Range<C>> ranges;
  
  ImmutableRangeSet$AsSetSerializedForm(ImmutableList<Range<C>> paramImmutableList, DiscreteDomain<C> paramDiscreteDomain)
  {
    ranges = paramImmutableList;
    domain = paramDiscreteDomain;
  }
  
  Object readResolve()
  {
    return new ImmutableRangeSet(ranges).asSet(domain);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeSet.AsSetSerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */