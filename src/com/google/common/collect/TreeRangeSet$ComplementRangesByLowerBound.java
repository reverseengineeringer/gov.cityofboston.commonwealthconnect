package com.google.common.collect;

import com.google.common.base.Objects;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import javax.annotation.Nullable;

final class TreeRangeSet$ComplementRangesByLowerBound<C extends Comparable<?>>
  extends AbstractNavigableMap<Cut<C>, Range<C>>
{
  private final Range<Cut<C>> complementLowerBoundWindow;
  private final NavigableMap<Cut<C>, Range<C>> positiveRangesByLowerBound;
  private final NavigableMap<Cut<C>, Range<C>> positiveRangesByUpperBound;
  
  TreeRangeSet$ComplementRangesByLowerBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
  {
    this(paramNavigableMap, Range.all());
  }
  
  private TreeRangeSet$ComplementRangesByLowerBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap, Range<Cut<C>> paramRange)
  {
    positiveRangesByLowerBound = paramNavigableMap;
    positiveRangesByUpperBound = new TreeRangeSet.RangesByUpperBound(paramNavigableMap);
    complementLowerBoundWindow = paramRange;
  }
  
  private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
  {
    if (!complementLowerBoundWindow.isConnected(paramRange)) {
      return ImmutableSortedMap.of();
    }
    paramRange = paramRange.intersection(complementLowerBoundWindow);
    return new ComplementRangesByLowerBound(positiveRangesByLowerBound, paramRange);
  }
  
  public Comparator<? super Cut<C>> comparator()
  {
    return Ordering.natural();
  }
  
  public boolean containsKey(Object paramObject)
  {
    return get(paramObject) != null;
  }
  
  Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
  {
    Cut localCut;
    boolean bool;
    label46:
    final PeekingIterator localPeekingIterator;
    if (complementLowerBoundWindow.hasUpperBound())
    {
      localCut = (Cut)complementLowerBoundWindow.upperEndpoint();
      if ((!complementLowerBoundWindow.hasUpperBound()) || (complementLowerBoundWindow.upperBoundType() != BoundType.CLOSED)) {
        break label143;
      }
      bool = true;
      localPeekingIterator = Iterators.peekingIterator(positiveRangesByUpperBound.headMap(localCut, bool).descendingMap().values().iterator());
      if (!localPeekingIterator.hasNext()) {
        break label176;
      }
      if (peekupperBound != Cut.aboveAll()) {
        break label148;
      }
      localCut = nextlowerBound;
    }
    for (;;)
    {
      new AbstractIterator()
      {
        Cut<C> nextComplementRangeUpperBound = val$firstComplementRangeUpperBound;
        
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if (nextComplementRangeUpperBound == Cut.belowAll()) {
            return (Map.Entry)endOfData();
          }
          Range localRange1;
          if (localPeekingIterator.hasNext())
          {
            localRange1 = (Range)localPeekingIterator.next();
            Range localRange2 = Range.create(upperBound, nextComplementRangeUpperBound);
            nextComplementRangeUpperBound = lowerBound;
            if (complementLowerBoundWindow.lowerBound.isLessThan(lowerBound)) {
              return Maps.immutableEntry(lowerBound, localRange2);
            }
          }
          else if (complementLowerBoundWindow.lowerBound.isLessThan(Cut.belowAll()))
          {
            localRange1 = Range.create(Cut.belowAll(), nextComplementRangeUpperBound);
            nextComplementRangeUpperBound = Cut.belowAll();
            return Maps.immutableEntry(Cut.belowAll(), localRange1);
          }
          return (Map.Entry)endOfData();
        }
      };
      localCut = Cut.aboveAll();
      break;
      label143:
      bool = false;
      break label46;
      label148:
      localCut = (Cut)positiveRangesByLowerBound.higherKey(peekupperBound);
      continue;
      label176:
      if ((!complementLowerBoundWindow.contains(Cut.belowAll())) || (positiveRangesByLowerBound.containsKey(Cut.belowAll()))) {
        return Iterators.emptyIterator();
      }
      localCut = (Cut)positiveRangesByLowerBound.higherKey(Cut.belowAll());
    }
  }
  
  Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
  {
    final Object localObject2;
    boolean bool;
    if (complementLowerBoundWindow.hasLowerBound())
    {
      localObject1 = positiveRangesByUpperBound;
      localObject2 = complementLowerBoundWindow.lowerEndpoint();
      if (complementLowerBoundWindow.lowerBoundType() == BoundType.CLOSED)
      {
        bool = true;
        localObject1 = ((NavigableMap)localObject1).tailMap(localObject2, bool).values();
        label52:
        localObject2 = Iterators.peekingIterator(((Collection)localObject1).iterator());
        if ((!complementLowerBoundWindow.contains(Cut.belowAll())) || ((((PeekingIterator)localObject2).hasNext()) && (peeklowerBound == Cut.belowAll()))) {
          break label135;
        }
      }
    }
    for (final Object localObject1 = Cut.belowAll();; localObject1 = nextupperBound)
    {
      new AbstractIterator()
      {
        Cut<C> nextComplementRangeLowerBound = localObject1;
        
        protected Map.Entry<Cut<C>, Range<C>> computeNext()
        {
          if ((complementLowerBoundWindow.upperBound.isLessThan(nextComplementRangeLowerBound)) || (nextComplementRangeLowerBound == Cut.aboveAll())) {
            return (Map.Entry)endOfData();
          }
          Range localRange2;
          Range localRange1;
          if (localObject2.hasNext())
          {
            localRange2 = (Range)localObject2.next();
            localRange1 = Range.create(nextComplementRangeLowerBound, lowerBound);
          }
          for (nextComplementRangeLowerBound = upperBound;; nextComplementRangeLowerBound = Cut.aboveAll())
          {
            return Maps.immutableEntry(lowerBound, localRange1);
            localRange1 = Range.create(nextComplementRangeLowerBound, Cut.aboveAll());
          }
        }
      };
      bool = false;
      break;
      localObject1 = positiveRangesByUpperBound.values();
      break label52;
      label135:
      if (!((PeekingIterator)localObject2).hasNext()) {
        break label160;
      }
    }
    label160:
    return Iterators.emptyIterator();
  }
  
  @Nullable
  public Range<C> get(Object paramObject)
  {
    if ((paramObject instanceof Cut)) {
      try
      {
        paramObject = (Cut)paramObject;
        Map.Entry localEntry = tailMap((Cut)paramObject, true).firstEntry();
        if ((localEntry != null) && (((Cut)localEntry.getKey()).equals(paramObject)))
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
 * Qualified Name:     com.google.common.collect.TreeRangeSet.ComplementRangesByLowerBound
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */