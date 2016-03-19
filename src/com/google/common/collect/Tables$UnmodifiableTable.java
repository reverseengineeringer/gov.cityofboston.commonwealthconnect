package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

class Tables$UnmodifiableTable<R, C, V>
  extends ForwardingTable<R, C, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Table<? extends R, ? extends C, ? extends V> delegate;
  
  Tables$UnmodifiableTable(Table<? extends R, ? extends C, ? extends V> paramTable)
  {
    delegate = ((Table)Preconditions.checkNotNull(paramTable));
  }
  
  public Set<Table.Cell<R, C, V>> cellSet()
  {
    return Collections.unmodifiableSet(super.cellSet());
  }
  
  public void clear()
  {
    throw new UnsupportedOperationException();
  }
  
  public Map<R, V> column(@Nullable C paramC)
  {
    return Collections.unmodifiableMap(super.column(paramC));
  }
  
  public Set<C> columnKeySet()
  {
    return Collections.unmodifiableSet(super.columnKeySet());
  }
  
  public Map<C, Map<R, V>> columnMap()
  {
    Function localFunction = Tables.access$000();
    return Collections.unmodifiableMap(Maps.transformValues(super.columnMap(), localFunction));
  }
  
  protected Table<R, C, V> delegate()
  {
    return delegate;
  }
  
  public V put(@Nullable R paramR, @Nullable C paramC, @Nullable V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public void putAll(Table<? extends R, ? extends C, ? extends V> paramTable)
  {
    throw new UnsupportedOperationException();
  }
  
  public V remove(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    throw new UnsupportedOperationException();
  }
  
  public Map<C, V> row(@Nullable R paramR)
  {
    return Collections.unmodifiableMap(super.row(paramR));
  }
  
  public Set<R> rowKeySet()
  {
    return Collections.unmodifiableSet(super.rowKeySet());
  }
  
  public Map<R, Map<C, V>> rowMap()
  {
    Function localFunction = Tables.access$000();
    return Collections.unmodifiableMap(Maps.transformValues(super.rowMap(), localFunction));
  }
  
  public Collection<V> values()
  {
    return Collections.unmodifiableCollection(super.values());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.UnmodifiableTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */