package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

class Tables$TransposeTable<C, R, V>
  extends AbstractTable<C, R, V>
{
  private static final Function<Table.Cell<?, ?, ?>, Table.Cell<?, ?, ?>> TRANSPOSE_CELL = new Function()
  {
    public Table.Cell<?, ?, ?> apply(Table.Cell<?, ?, ?> paramAnonymousCell)
    {
      return Tables.immutableCell(paramAnonymousCell.getColumnKey(), paramAnonymousCell.getRowKey(), paramAnonymousCell.getValue());
    }
  };
  final Table<R, C, V> original;
  
  Tables$TransposeTable(Table<R, C, V> paramTable)
  {
    original = ((Table)Preconditions.checkNotNull(paramTable));
  }
  
  Iterator<Table.Cell<C, R, V>> cellIterator()
  {
    return Iterators.transform(original.cellSet().iterator(), TRANSPOSE_CELL);
  }
  
  public void clear()
  {
    original.clear();
  }
  
  public Map<C, V> column(R paramR)
  {
    return original.row(paramR);
  }
  
  public Set<R> columnKeySet()
  {
    return original.rowKeySet();
  }
  
  public Map<R, Map<C, V>> columnMap()
  {
    return original.rowMap();
  }
  
  public boolean contains(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    return original.contains(paramObject2, paramObject1);
  }
  
  public boolean containsColumn(@Nullable Object paramObject)
  {
    return original.containsRow(paramObject);
  }
  
  public boolean containsRow(@Nullable Object paramObject)
  {
    return original.containsColumn(paramObject);
  }
  
  public boolean containsValue(@Nullable Object paramObject)
  {
    return original.containsValue(paramObject);
  }
  
  public V get(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    return (V)original.get(paramObject2, paramObject1);
  }
  
  public V put(C paramC, R paramR, V paramV)
  {
    return (V)original.put(paramR, paramC, paramV);
  }
  
  public void putAll(Table<? extends C, ? extends R, ? extends V> paramTable)
  {
    original.putAll(Tables.transpose(paramTable));
  }
  
  public V remove(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    return (V)original.remove(paramObject2, paramObject1);
  }
  
  public Map<R, V> row(C paramC)
  {
    return original.column(paramC);
  }
  
  public Set<C> rowKeySet()
  {
    return original.columnKeySet();
  }
  
  public Map<C, Map<R, V>> rowMap()
  {
    return original.columnMap();
  }
  
  public int size()
  {
    return original.size();
  }
  
  public Collection<V> values()
  {
    return original.values();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.TransposeTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */