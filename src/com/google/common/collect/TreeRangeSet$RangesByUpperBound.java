package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import javax.annotation.Nullable;

@VisibleForTesting
final class TreeRangeSet$RangesByUpperBound<C extends Comparable<?>>
  extends AbstractNavigableMap<Cut<C>, Range<C>>
{
  private final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
  private final Range<Cut<C>> upperBoundWindow;
  
  TreeRangeSet$RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
  {
    rangesByLowerBound = paramNavigableMap;
    upperBoundWindow = Range.all();
  }
  
  private TreeRangeSet$RangesByUpperBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap, Range<Cut<C>> paramRange)
  {
    rangesByLowerBound = paramNavigableMap;
    upperBoundWindow = paramRange;
  }
  
  private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
  {
    if (paramRange.isConnected(upperBoundWindow)) {
      return new RangesByUpperBound(rangesByLowerBound, paramRange.intersection(upperBoundWindow));
    }
    return ImmutableSortedMap.of();
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
    if (upperBoundWindow.hasUpperBound()) {}
    for (final Object localObject = rangesByLowerBound.headMap(upperBoundWindow.upperEndpoint(), false).descendingMap().values();; localObject = rangesByLowerBound.descendingMap().values())
    {
      localObject = Iterators.peekingIterator(((Collection)localObject).iterator());
      if ((((PeekingIterator)localObject).hasNext()) && (upperBoundWindow.upperBound.isLessThan(peekupperBound))) {
        ((PeekingIterator)localObject).next();
      }
      new AbstractIterator()
      {
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if (!localObject.hasNext()) {
            return (Map.Entry)endOfData();
          }
          Range localRange = (Range)localObject.next();
          if (upperBoundWindow.lowerBound.isLessThan(upperBound)) {
            return Maps.immutableEntry(upperBound, localRange);
          }
          return (Map.Entry)endOfData();
        }
      };
    }
  }
  
  Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
  {
    final Object localObject;
    if (!upperBoundWindow.hasLowerBound()) {
      localObject = rangesByLowerBound.values().iterator();
    }
    for (;;)
    {
      new AbstractIterator()
      {
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if (!localObject.hasNext()) {
            return (Map.Entry)endOfData();
          }
          Range localRange = (Range)localObject.next();
          if (upperBoundWindow.upperBound.isLessThan(upperBound)) {
            return (Map.Entry)endOfData();
          }
          return Maps.immutableEntry(upperBound, localRange);
        }
      };
      localObject = rangesByLowerBound.lowerEntry(upperBoundWindow.lowerEndpoint());
      if (localObject == null) {
        localObject = rangesByLowerBound.values().iterator();
      } else if (upperBoundWindow.lowerBound.isLessThan(getValueupperBound)) {
        localObject = rangesByLowerBound.tailMap(((Map.Entry)localObject).getKey(), true).values().iterator();
      } else {
        localObject = rangesByLowerBound.tailMap(upperBoundWindow.lowerEndpoint(), true).values().iterator();
      }
    }
  }
  
  public Range<C> get(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Cut)) {
      try
      {
        paramObject = (Cut)paramObject;
        if (!upperBoundWindow.contains((Comparable)paramObject)) {
          return null;
        }
        Map.Entry localEntry = rangesByLowerBound.lowerEntry(paramObject);
        if ((localEntry != null) && (getValueupperBound.equals(paramObject)))
        {
          paramObject = (Range)localEntry.getValue();
          return (Range<C>)paramObject;
        }
      }
      catch (ClassCastException paramObject)
      {
        return null;
      }
    }
    return null;
  }
  
  public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
  {
    return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
  }
  
  public boolean isEmpty()
  {
    if (upperBoundWindow.equals(Range.all())) {
      return rangesByLowerBound.isEmpty();
    }
    return !entryIterator().hasNext();
  }
  
  public int size()
  {
    if (upperBoundWindow.equals(Range.all())) {
      return rangesByLowerBound.size();
    }
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
 * Qualified Name:     com.google.common.collect.TreeRangeSet.RangesByUpperBound
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */