package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import javax.annotation.Nullable;

@Beta
@GwtCompatible(serializable=true)
public class TreeBasedTable<R, C, V>
  extends StandardRowSortedTable<R, C, V>
{
  private static final long serialVersionUID = 0L;
  private final Comparator<? super C> columnComparator;
  
  TreeBasedTable(Comparator<? super R> paramComparator, Comparator<? super C> paramComparator1)
  {
    super(new TreeMap(paramComparator), new Factory(paramComparator1));
    columnComparator = paramComparator1;
  }
  
  public static <R extends Comparable, C extends Comparable, V> TreeBasedTable<R, C, V> create()
  {
    return new TreeBasedTable(Ordering.natural(), Ordering.natural());
  }
  
  public static <R, C, V> TreeBasedTable<R, C, V> create(TreeBasedTable<R, C, ? extends V> paramTreeBasedTable)
  {
    TreeBasedTable localTreeBasedTable = new TreeBasedTable(paramTreeBasedTable.rowComparator(), paramTreeBasedTable.columnComparator());
    localTreeBasedTable.putAll(paramTreeBasedTable);
    return localTreeBasedTable;
  }
  
  public static <R, C, V> TreeBasedTable<R, C, V> create(Comparator<? super R> paramComparator, Comparator<? super C> paramComparator1)
  {
    Preconditions.checkNotNull(paramComparator);
    Preconditions.checkNotNull(paramComparator1);
    return new TreeBasedTable(paramComparator, paramComparator1);
  }
  
  public Comparator<? super C> columnComparator()
  {
    return columnComparator;
  }
  
  Iterator<C> createColumnKeyIterator()
  {
    final Comparator localComparator = columnComparator();
    new AbstractIterator()
    {
      public Iterator<C> apply(Map<C, V> paramAnonymousMap)
      {
        return paramAnonymousMap.keySet().iterator();
      }
    }
    {
      C lastValue;
      
      protected C computeNext()
      {
        if (val$merged.hasNext())
        {
          Object localObject = val$merged.next();
          if ((lastValue != null) && (localComparator.compare(localObject, lastValue) == 0)) {}
          for (int i = 1; i == 0; i = 0)
          {
            lastValue = localObject;
            return (C)lastValue;
          }
        }
        lastValue = null;
        return (C)endOfData();
      }
    };
  }
  
  public SortedMap<C, V> row(R paramR)
  {
    return new TreeRow(paramR);
  }
  
  public Comparator<? super R> rowComparator()
  {
    return rowKeySet().comparator();
  }
  
  public SortedSet<R> rowKeySet()
  {
    return super.rowKeySet();
  }
  
  public SortedMap<R, Map<C, V>> rowMap()
  {
    return super.rowMap();
  }
  
  private static class Factory<C, V>
    implements Supplier<TreeMap<C, V>>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final Comparator<? super C> comparator;
    
    Factory(Comparator<? super C> paramComparator)
    {
      comparator = paramComparator;
    }
    
    public TreeMap<C, V> get()
    {
      return new TreeMap(comparator);
    }
  }
  
  private class TreeRow
    extends StandardTable<R, C, V>.Row
    implements SortedMap<C, V>
  {
    @Nullable
    final C lowerBound;
    @Nullable
    final C upperBound;
    transient SortedMap<C, V> wholeRow;
    
    TreeRow()
    {
      this(localObject, null, null);
    }
    
    TreeRow(@Nullable C paramC1, @Nullable C paramC2)
    {
      super(paramC1);
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
      return columnComparator();
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
      return new TreeRow(TreeBasedTable.this, rowKey, lowerBound, paramC);
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
        backingMap.remove(rowKey);
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
        return new TreeRow(TreeBasedTable.this, rowKey, paramC1, paramC2);
      }
    }
    
    public SortedMap<C, V> tailMap(C paramC)
    {
      Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(paramC)));
      return new TreeRow(TreeBasedTable.this, rowKey, paramC, upperBound);
    }
    
    SortedMap<C, V> wholeRow()
    {
      if ((wholeRow == null) || ((wholeRow.isEmpty()) && (backingMap.containsKey(rowKey)))) {
        wholeRow = ((SortedMap)backingMap.get(rowKey));
      }
      return wholeRow;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeBasedTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */