package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;

@GwtIncompatible("serialization")
final class RegularContiguousSet$SerializedForm<C extends Comparable>
  implements Serializable
{
  final DiscreteDomain<C> domain;
  final Range<C> range;
  
  private RegularContiguousSet$SerializedForm(Range<C> paramRange, DiscreteDomain<C> paramDiscreteDomain)
  {
    range = paramRange;
    domain = paramDiscreteDomain;
  }
  
  private Object readResolve()
  {
    return new RegularContiguousSet(range, domain);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularContiguousSet.SerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */