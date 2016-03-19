package com.google.common.collect;

final class TreeRangeSet$Complement
  extends TreeRangeSet<C>
{
  TreeRangeSet$Complement(TreeRangeSet paramTreeRangeSet)
  {
    super(new TreeRangeSet.ComplementRangesByLowerBound(rangesByLowerBound), null);
  }
  
  public void add(Range<C> paramRange)
  {
    this$0.remove(paramRange);
  }
  
  public RangeSet<C> complement()
  {
    return this$0;
  }
  
  public boolean contains(C paramC)
  {
    return !this$0.contains(paramC);
  }
  
  public void remove(Range<C> paramRange)
  {
    this$0.add(paramRange);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeSet.Complement
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */