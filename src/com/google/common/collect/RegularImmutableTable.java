package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nullable;

@GwtCompatible
abstract class RegularImmutableTable<R, C, V>
  extends ImmutableTable<R, C, V>
{
  static <R, C, V> RegularImmutableTable<R, C, V> forCells(Iterable<Table.Cell<R, C, V>> paramIterable)
  {
    return forCellsInternal(paramIterable, null, null);
  }
  
  static <R, C, V> RegularImmutableTable<R, C, V> forCells(List<Table.Cell<R, C, V>> paramList, @Nullable Comparator<? super R> paramComparator, @Nullable final Comparator<? super C> paramComparator1)
  {
    Preconditions.checkNotNull(paramList);
    if ((paramComparator != null) || (paramComparator1 != null)) {
      Collections.sort(paramList, new Comparator()
      {
        public int compare(Table.Cell<R, C, V> paramAnonymousCell1, Table.Cell<R, C, V> paramAnonymousCell2)
        {
          int j = 0;
          if (val$rowComparator == null) {}
          for (int i = 0; i != 0; i = val$rowComparator.compare(paramAnonymousCell1.getRowKey(), paramAnonymousCell2.getRowKey())) {
            return i;
          }
          if (paramComparator1 == null) {}
          for (i = j;; i = paramComparator1.compare(paramAnonymousCell1.getColumnKey(), paramAnonymousCell2.getColumnKey())) {
            return i;
          }
        }
      });
    }
    return forCellsInternal(paramList, paramComparator, paramComparator1);
  }
  
  private static final <R, C, V> RegularImmutableTable<R, C, V> forCellsInternal(Iterable<Table.Cell<R, C, V>> paramIterable, @Nullable Comparator<? super R> paramComparator, @Nullable Comparator<? super C> paramComparator1)
  {
    Object localObject = ImmutableSet.builder();
    ImmutableSet.Builder localBuilder = ImmutableSet.builder();
    ImmutableList localImmutableList = ImmutableList.copyOf(paramIterable);
    paramIterable = localImmutableList.iterator();
    while (paramIterable.hasNext())
    {
      Table.Cell localCell = (Table.Cell)paramIterable.next();
      ((ImmutableSet.Builder)localObject).add(localCell.getRowKey());
      localBuilder.add(localCell.getColumnKey());
    }
    localObject = ((ImmutableSet.Builder)localObject).build();
    paramIterable = (Iterable<Table.Cell<R, C, V>>)localObject;
    if (paramComparator != null)
    {
      paramIterable = Lists.newArrayList((Iterable)localObject);
      Collections.sort(paramIterable, paramComparator);
      paramIterable = ImmutableSet.copyOf(paramIterable);
    }
    localObject = localBuilder.build();
    paramComparator = (Comparator<? super R>)localObject;
    if (paramComparator1 != null)
    {
      paramComparator = Lists.newArrayList((Iterable)localObject);
      Collections.sort(paramComparator, paramComparator1);
      paramComparator = ImmutableSet.copyOf(paramComparator);
    }
    if (localImmutableList.size() > paramIterable.size() * paramComparator.size() / 2L) {
      return new DenseImmutableTable(localImmutableList, paramIterable, paramComparator);
    }
    return new SparseImmutableTable(localImmutableList, paramIterable, paramComparator);
  }
  
  final ImmutableSet<Table.Cell<R, C, V>> createCellSet()
  {
    if (isEmpty()) {
      return ImmutableSet.of();
    }
    return new CellSet(null);
  }
  
  final ImmutableCollection<V> createValues()
  {
    if (isEmpty()) {
      return ImmutableList.of();
    }
    return new Values(null);
  }
  
  abstract Table.Cell<R, C, V> getCell(int paramInt);
  
  abstract V getValue(int paramInt);
  
  private final class CellSet
    extends ImmutableSet<Table.Cell<R, C, V>>
  {
    private CellSet() {}
    
    public boolean contains(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof Table.Cell))
      {
        paramObject = (Table.Cell)paramObject;
        Object localObject = get(((Table.Cell)paramObject).getRowKey(), ((Table.Cell)paramObject).getColumnKey());
        bool1 = bool2;
        if (localObject != null)
        {
          bool1 = bool2;
          if (localObject.equals(((Table.Cell)paramObject).getValue())) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    ImmutableList<Table.Cell<R, C, V>> createAsList()
    {
      new ImmutableAsList()
      {
        ImmutableCollection<Table.Cell<R, C, V>> delegateCollection()
        {
          return RegularImmutableTable.CellSet.this;
        }
        
        public Table.Cell<R, C, V> get(int paramAnonymousInt)
        {
          return getCell(paramAnonymousInt);
        }
      };
    }
    
    boolean isPartialView()
    {
      return false;
    }
    
    public UnmodifiableIterator<Table.Cell<R, C, V>> iterator()
    {
      return asList().iterator();
    }
    
    public int size()
    {
      return RegularImmutableTable.this.size();
    }
  }
  
  private final class Values
    extends ImmutableList<V>
  {
    private Values() {}
    
    public V get(int paramInt)
    {
      return (V)getValue(paramInt);
    }
    
    boolean isPartialView()
    {
      return true;
    }
    
    public int size()
    {
      return RegularImmutableTable.this.size();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */