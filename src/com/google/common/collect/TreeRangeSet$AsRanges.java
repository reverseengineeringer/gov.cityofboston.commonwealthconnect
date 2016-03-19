package com.google.common.collect;

import java.util.Collection;
import java.util.NavigableMap;
import java.util.Set;
import javax.annotation.Nullable;

final class TreeRangeSet$AsRanges
  extends ForwardingCollection<Range<C>>
  implements Set<Range<C>>
{
  TreeRangeSet$AsRanges(TreeRangeSet paramTreeRangeSet) {}
  
  protected Collection<Range<C>> delegate()
  {
    return this$0.rangesByLowerBound.values();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return Sets.equalsImpl(this, paramObject);
  }
  
  public int hashCode()
  {
    return Sets.hashCodeImpl(this);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeSet.AsRanges
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */