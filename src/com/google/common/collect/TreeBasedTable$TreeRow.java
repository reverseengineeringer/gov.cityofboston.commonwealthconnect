package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.SortedMap;
import java.util.SortedSet;
import javax.annotation.Nullable;

class TreeBasedTable$TreeRow
  extends StandardTable<R, C, V>.Row
  implements SortedMap<C, V>
{
  @Nullable
  final C lowerBound;
  @Nullable
  final C upperBound;
  transient SortedMap<C, V> wholeRow;
  
  TreeBasedTable$TreeRow(R paramR)
  {
    this(paramR, localObject, null, null);
  }
  
  TreeBasedTable$TreeRow(R paramR, @Nullable C paramC1, @Nullable C paramC2)
  {
    super(paramR, paramC1);
    lowerBound = paramC2;
    Object localObject;
    upperBound = localObject;
    if ((paramC2 == null) || (localObject == null) || (compare(paramC2, localObject) <= 0)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      return;
    }
  }
  
  SortedMap<C, V> backingRowMap()
  {
    return (SortedMap)super.backingRowMap();
  }
  
  public Comparator<? super C> comparator()
  {
    return this$0.columnComparator();
  }
  
  int compare(Object paramObject1, Object paramObject2)
  {
    return comparator().compare(paramObject1, paramObject2);
  }
  
  SortedMap<C, V> computeBackingRowMap()
  {
    Object localObject2 = wholeRow();
    if (localObject2 != null)
    {
      Object localObject1 = localObject2;
      if (lowerBound != null) {
        localObject1 = ((SortedMap)localObject2).tailMap(lowerBound);
      }
      localObject2 = localObject1;
      if (upperBound != null) {
        localObject2 = ((SortedMap)localObject1).headMap(upperBound);
      }
      return (SortedMap<C, V>)localObject2;
    }
    return null;
  }
  
  public boolean containsKey(Object paramObject)
  {
    return (rangeContains(paramObject)) && (super.containsKey(paramObject));
  }
  
  public C firstKey()
  {
    if (backingRowMap() == null) {
      throw new NoSuchElementException();
    }
    return (C)backingRowMap().firstKey();
  }
  
  public SortedMap<C, V> headMap(C paramC)
  {
    Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(paramC)));
    return new TreeRow(this$0, rowKey, lowerBound, paramC);
  }
  
  public SortedSet<C> keySet()
  {
    return new Maps.SortedKeySet(this);
  }
  
  public C lastKey()
  {
    if (backingRowMap() == null) {
      throw new NoSuchElementException();
    }
    return (C)backingRowMap().lastKey();
  }
  
  void maintainEmptyInvariant()
  {
    if ((wholeRow() != null) && (wholeRow.isEmpty()))
    {
      this$0.backingMap.remove(rowKey);
      wholeRow = null;
      backingRowMap = null;
    }
  }
  
  public V put(C paramC, V paramV)
  {
    Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(paramC)));
    return (V)super.put(paramC, paramV);
  }
  
  boolean rangeContains(@Nullable Object paramObject)
  {
    return (paramObject != null) && ((lowerBound == null) || (compare(lowerBound, paramObject) <= 0)) && ((upperBound == null) || (compare(upperBound, paramObject) > 0));
  }
  
  public SortedMap<C, V> subMap(C paramC1, C paramC2)
  {
    if ((rangeContains(Preconditions.checkNotNull(paramC1))) && (rangeContains(Preconditions.checkNotNull(paramC2)))) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      return new TreeRow(this$0, rowKey, paramC1, paramC2);
    }
  }
  
  public SortedMap<C, V> tailMap(C paramC)
  {
    Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(paramC)));
    return new TreeRow(this$0, rowKey, paramC, upperBound);
  }
  
  SortedMap<C, V> wholeRow()
  {
    if ((wholeRow == null) || ((wholeRow.isEmpty()) && (this$0.backingMap.containsKey(rowKey)))) {
      wholeRow = ((SortedMap)this$0.backingMap.get(rowKey));
    }
    return wholeRow;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeBasedTable.TreeRow
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */