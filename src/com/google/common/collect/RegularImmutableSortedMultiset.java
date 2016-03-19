package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import javax.annotation.Nullable;

final class RegularImmutableSortedMultiset<E>
  extends ImmutableSortedMultiset<E>
{
  private final transient int[] counts;
  private final transient long[] cumulativeCounts;
  private final transient RegularImmutableSortedSet<E> elementSet;
  private final transient int length;
  private final transient int offset;
  
  RegularImmutableSortedMultiset(RegularImmutableSortedSet<E> paramRegularImmutableSortedSet, int[] paramArrayOfInt, long[] paramArrayOfLong, int paramInt1, int paramInt2)
  {
    elementSet = paramRegularImmutableSortedSet;
    counts = paramArrayOfInt;
    cumulativeCounts = paramArrayOfLong;
    offset = paramInt1;
    length = paramInt2;
  }
  
  public int count(@Nullable Object paramObject)
  {
    int i = elementSet.indexOf(paramObject);
    if (i == -1) {
      return 0;
    }
    return counts[(offset + i)];
  }
  
  public ImmutableSortedSet<E> elementSet()
  {
    return elementSet;
  }
  
  public Multiset.Entry<E> firstEntry()
  {
    return getEntry(0);
  }
  
  Multiset.Entry<E> getEntry(int paramInt)
  {
    return Multisets.immutableEntry(elementSet.asList().get(paramInt), counts[(offset + paramInt)]);
  }
  
  ImmutableSortedMultiset<E> getSubMultiset(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, length);
    Object localObject;
    if (paramInt1 == paramInt2) {
      localObject = emptyMultiset(comparator());
    }
    do
    {
      return (ImmutableSortedMultiset<E>)localObject;
      if (paramInt1 != 0) {
        break;
      }
      localObject = this;
    } while (paramInt2 == length);
    return new RegularImmutableSortedMultiset((RegularImmutableSortedSet)elementSet.getSubSet(paramInt1, paramInt2), counts, cumulativeCounts, offset + paramInt1, paramInt2 - paramInt1);
  }
  
  public ImmutableSortedMultiset<E> headMultiset(E paramE, BoundType paramBoundType)
  {
    RegularImmutableSortedSet localRegularImmutableSortedSet = elementSet;
    if (Preconditions.checkNotNull(paramBoundType) == BoundType.CLOSED) {}
    for (boolean bool = true;; bool = false) {
      return getSubMultiset(0, localRegularImmutableSortedSet.headIndex(paramE, bool));
    }
  }
  
  boolean isPartialView()
  {
    return (offset > 0) || (length < counts.length);
  }
  
  public Multiset.Entry<E> lastEntry()
  {
    return getEntry(length - 1);
  }
  
  public int size()
  {
    return Ints.saturatedCast(cumulativeCounts[(offset + length)] - cumulativeCounts[offset]);
  }
  
  public ImmutableSortedMultiset<E> tailMultiset(E paramE, BoundType paramBoundType)
  {
    RegularImmutableSortedSet localRegularImmutableSortedSet = elementSet;
    if (Preconditions.checkNotNull(paramBoundType) == BoundType.CLOSED) {}
    for (boolean bool = true;; bool = false) {
      return getSubMultiset(localRegularImmutableSortedSet.tailIndex(paramE, bool), length);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableSortedMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */