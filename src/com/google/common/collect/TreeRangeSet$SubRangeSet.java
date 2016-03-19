package com.google.common.collect;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

final class TreeRangeSet$SubRangeSet
  extends TreeRangeSet<C>
{
  private final Range<C> restriction;
  
  TreeRangeSet$SubRangeSet(Range<C> paramRange)
  {
    super(new TreeRangeSet.SubRangeSetRangesByLowerBound(Range.all(), localRange, rangesByLowerBound, null), null);
    restriction = localRange;
  }
  
  public void add(Range<C> paramRange)
  {
    Preconditions.checkArgument(restriction.encloses(paramRange), "Cannot add range %s to subRangeSet(%s)", new Object[] { paramRange, restriction });
    super.add(paramRange);
  }
  
  public void clear()
  {
    this$0.remove(restriction);
  }
  
  public boolean contains(C paramC)
  {
    return (restriction.contains(paramC)) && (this$0.contains(paramC));
  }
  
  public boolean encloses(Range<C> paramRange)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (!restriction.isEmpty())
    {
      bool1 = bool2;
      if (restriction.encloses(paramRange))
      {
        paramRange = TreeRangeSet.access$600(this$0, paramRange);
        bool1 = bool2;
        if (paramRange != null)
        {
          bool1 = bool2;
          if (!paramRange.intersection(restriction).isEmpty()) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  @Nullable
  public Range<C> rangeContaining(C paramC)
  {
    if (!restriction.contains(paramC)) {}
    do
    {
      return null;
      paramC = this$0.rangeContaining(paramC);
    } while (paramC == null);
    return paramC.intersection(restriction);
  }
  
  public void remove(Range<C> paramRange)
  {
    if (paramRange.isConnected(restriction)) {
      this$0.remove(paramRange.intersection(restriction));
    }
  }
  
  public RangeSet<C> subRangeSet(Range<C> paramRange)
  {
    if (paramRange.encloses(restriction)) {
      return this;
    }
    if (paramRange.isConnected(restriction)) {
      return new SubRangeSet(this, restriction.intersection(paramRange));
    }
    return ImmutableRangeSet.of();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeSet.SubRangeSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */