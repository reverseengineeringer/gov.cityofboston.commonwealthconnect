package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import javax.annotation.Nullable;

final class TreeRangeSet$SubRangeSetRangesByLowerBound<C extends Comparable<?>>
  extends AbstractNavigableMap<Cut<C>, Range<C>>
{
  private final Range<Cut<C>> lowerBoundWindow;
  private final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
  private final NavigableMap<Cut<C>, Range<C>> rangesByUpperBound;
  private final Range<C> restriction;
  
  private TreeRangeSet$SubRangeSetRangesByLowerBound(Range<Cut<C>> paramRange, Range<C> paramRange1, NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
  {
    lowerBoundWindow = ((Range)Preconditions.checkNotNull(paramRange));
    restriction = ((Range)Preconditions.checkNotNull(paramRange1));
    rangesByLowerBound = ((NavigableMap)Preconditions.checkNotNull(paramNavigableMap));
    rangesByUpperBound = new TreeRangeSet.RangesByUpperBound(paramNavigableMap);
  }
  
  private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
  {
    if (!paramRange.isConnected(lowerBoundWindow)) {
      return ImmutableSortedMap.of();
    }
    return new SubRangeSetRangesByLowerBound(lowerBoundWindow.intersection(paramRange), restriction, rangesByLowerBound);
  }
  
  public Comparator<? super Cut<C>> comparator()
  {
    return Ordering.natural();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return get(paramObject) != null;
  }
  
  Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
  {
    if (restriction.isEmpty()) {
      return Iterators.emptyIterator();
    }
    Cut localCut = (Cut)Ordering.natural().min(lowerBoundWindow.upperBound, Cut.belowValue(restriction.upperBound));
    NavigableMap localNavigableMap = rangesByLowerBound;
    Comparable localComparable = localCut.endpoint();
    if (localCut.typeAsUpperBound() == BoundType.CLOSED) {}
    for (boolean bool = true;; bool = false) {
      new AbstractIterator()
      {
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if (!val$completeRangeItr.hasNext()) {
            return (Map.Entry)endOfData();
          }
          Range localRange = (Range)val$completeRangeItr.next();
          if (restriction.lowerBound.compareTo(upperBound) >= 0) {
            return (Map.Entry)endOfData();
          }
          localRange = localRange.intersection(restriction);
          if (lowerBoundWindow.contains(lowerBound)) {
            return Maps.immutableEntry(lowerBound, localRange);
          }
          return (Map.Entry)endOfData();
        }
      };
    }
  }
  
  Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
  {
    boolean bool = false;
    if (restriction.isEmpty()) {
      return Iterators.emptyIterator();
    }
    if (lowerBoundWindow.upperBound.isLessThan(restriction.lowerBound)) {
      return Iterators.emptyIterator();
    }
    if (lowerBoundWindow.lowerBound.isLessThan(restriction.lowerBound)) {}
    Comparable localComparable;
    for (final Object localObject = rangesByUpperBound.tailMap(restriction.lowerBound, false).values().iterator();; localObject = ((NavigableMap)localObject).tailMap(localComparable, bool).values().iterator())
    {
      new AbstractIterator()
      {
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if (!localObject.hasNext()) {
            return (Map.Entry)endOfData();
          }
          Range localRange = (Range)localObject.next();
          if (val$upperBoundOnLowerBounds.isLessThan(lowerBound)) {
            return (Map.Entry)endOfData();
          }
          localRange = localRange.intersection(restriction);
          return Maps.immutableEntry(lowerBound, localRange);
        }
      };
      localObject = rangesByLowerBound;
      localComparable = lowerBoundWindow.lowerBound.endpoint();
      if (lowerBoundWindow.lowerBoundType() == BoundType.CLOSED) {
        bool = true;
      }
    }
  }
  
  @Nullable
  public Range<C> get(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Cut)) {
      try
      {
        paramObject = (Cut)paramObject;
        if ((lowerBoundWindow.contains((Comparable)paramObject)) && (((Cut)paramObject).compareTo(restriction.lowerBound) >= 0))
        {
          if (((Cut)paramObject).compareTo(restriction.upperBound) >= 0) {
            return null;
          }
          if (((Cut)paramObject).equals(restriction.lowerBound))
          {
            paramObject = (Range)Maps.valueOrNull(rangesByLowerBound.floorEntry(paramObject));
            if ((paramObject != null) && (upperBound.compareTo(restriction.lowerBound) > 0)) {
              return ((Range)paramObject).intersection(restriction);
            }
          }
          else
          {
            paramObject = (Range)rangesByLowerBound.get(paramObject);
            if (paramObject != null)
            {
              paramObject = ((Range)paramObject).intersection(restriction);
              return (Range<C>)paramObject;
            }
          }
        }
      }
      catch (ClassCastException paramObject) {}
    }
    return null;
  }
  
  public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
  {
    return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
  }
  
  public int size()
  {
    return Iterators.size(entryIterator());
  }
  
  public NavigableMap<Cut<C>, Range<C>> subMap(Cut<C> paramCut1, boolean paramBoolean1, Cut<C> paramCut2, boolean paramBoolean2)
  {
    return subMap(Range.range(paramCut1, BoundType.forBoolean(paramBoolean1), paramCut2, BoundType.forBoolean(paramBoolean2)));
  }
  
  public NavigableMap<Cut<C>, Range<C>> tailMap(Cut<C> paramCut, boolean paramBoolean)
  {
    return subMap(Range.downTo(paramCut, BoundType.forBoolean(paramBoolean)));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeRangeSet.SubRangeSetRangesByLowerBound
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */