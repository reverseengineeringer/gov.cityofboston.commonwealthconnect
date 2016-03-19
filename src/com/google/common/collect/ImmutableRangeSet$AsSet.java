package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.primitives.Ints;
import java.util.Iterator;
import javax.annotation.Nullable;

final class ImmutableRangeSet$AsSet
  extends ImmutableSortedSet<C>
{
  private final DiscreteDomain<C> domain;
  private transient Integer size;
  
  ImmutableRangeSet$AsSet(DiscreteDomain<C> paramDiscreteDomain)
  {
    super(Ordering.natural());
    DiscreteDomain localDiscreteDomain;
    domain = localDiscreteDomain;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if (paramObject == null) {
      return false;
    }
    try
    {
      paramObject = (Comparable)paramObject;
      boolean bool = this$0.contains((Comparable)paramObject);
      return bool;
    }
    catch (ClassCastException paramObject) {}
    return false;
  }
  
  @GwtIncompatible("NavigableSet")
  public UnmodifiableIterator<C> descendingIterator()
  {
    new AbstractIterator()
    {
      Iterator<C> elemItr = Iterators.emptyIterator();
      final Iterator<Range<C>> rangeItr = ImmutableRangeSet.access$000(this$0).reverse().iterator();
      
      protected C computeNext()
      {
        while (!elemItr.hasNext()) {
          if (rangeItr.hasNext()) {
            elemItr = ContiguousSet.create((Range)rangeItr.next(), domain).descendingIterator();
          } else {
            return (Comparable)endOfData();
          }
        }
        return (Comparable)elemItr.next();
      }
    };
  }
  
  ImmutableSortedSet<C> headSetImpl(C paramC, boolean paramBoolean)
  {
    return subSet(Range.upTo(paramC, BoundType.forBoolean(paramBoolean)));
  }
  
  int indexOf(Object paramObject)
  {
    if (contains(paramObject))
    {
      paramObject = (Comparable)paramObject;
      long l = 0L;
      Iterator localIterator = ImmutableRangeSet.access$000(this$0).iterator();
      while (localIterator.hasNext())
      {
        Range localRange = (Range)localIterator.next();
        if (localRange.contains((Comparable)paramObject)) {
          return Ints.saturatedCast(ContiguousSet.create(localRange, domain).indexOf(paramObject) + l);
        }
        l += ContiguousSet.create(localRange, domain).size();
      }
      throw new AssertionError("impossible");
    }
    return -1;
  }
  
  boolean isPartialView()
  {
    return ImmutableRangeSet.access$000(this$0).isPartialView();
  }
  
  public UnmodifiableIterator<C> iterator()
  {
    new AbstractIterator()
    {
      Iterator<C> elemItr = Iterators.emptyIterator();
      final Iterator<Range<C>> rangeItr = ImmutableRangeSet.access$000(this$0).iterator();
      
      protected C computeNext()
      {
        while (!elemItr.hasNext()) {
          if (rangeItr.hasNext()) {
            elemItr = ContiguousSet.create((Range)rangeItr.next(), domain).iterator();
          } else {
            return (Comparable)endOfData();
          }
        }
        return (Comparable)elemItr.next();
      }
    };
  }
  
  public int size()
  {
    Integer localInteger = size;
    Object localObject = localInteger;
    if (localInteger == null)
    {
      long l1 = 0L;
      localObject = ImmutableRangeSet.access$000(this$0).iterator();
      long l2;
      do
      {
        l2 = l1;
        if (!((Iterator)localObject).hasNext()) {
          break;
        }
        l2 = l1 + ContiguousSet.create((Range)((Iterator)localObject).next(), domain).size();
        l1 = l2;
      } while (l2 < 2147483647L);
      localObject = Integer.valueOf(Ints.saturatedCast(l2));
      size = ((Integer)localObject);
    }
    return ((Integer)localObject).intValue();
  }
  
  ImmutableSortedSet<C> subSet(Range<C> paramRange)
  {
    return this$0.subRangeSet(paramRange).asSet(domain);
  }
  
  ImmutableSortedSet<C> subSetImpl(C paramC1, boolean paramBoolean1, C paramC2, boolean paramBoolean2)
  {
    if ((!paramBoolean1) && (!paramBoolean2) && (Range.compareOrThrow(paramC1, paramC2) == 0)) {
      return ImmutableSortedSet.of();
    }
    return subSet(Range.range(paramC1, BoundType.forBoolean(paramBoolean1), paramC2, BoundType.forBoolean(paramBoolean2)));
  }
  
  ImmutableSortedSet<C> tailSetImpl(C paramC, boolean paramBoolean)
  {
    return subSet(Range.downTo(paramC, BoundType.forBoolean(paramBoolean)));
  }
  
  public String toString()
  {
    return ImmutableRangeSet.access$000(this$0).toString();
  }
  
  Object writeReplace()
  {
    return new ImmutableRangeSet.AsSetSerializedForm(ImmutableRangeSet.access$000(this$0), domain);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableRangeSet.AsSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */