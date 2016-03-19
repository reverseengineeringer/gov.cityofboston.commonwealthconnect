package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import javax.annotation.Nullable;

@GwtCompatible
public final class Tables
{
  private static final Function<? extends Map<?, ?>, ? extends Map<?, ?>> UNMODIFIABLE_WRAPPER = new Function()
  {
    public Map<Object, Object> apply(Map<Object, Object> paramAnonymousMap)
    {
      return Collections.unmodifiableMap(paramAnonymousMap);
    }
  };
  
  static boolean equalsImpl(Table<?, ?, ?> paramTable, @Nullable Object paramObject)
  {
    if (paramObject == paramTable) {
      return true;
    }
    if ((paramObject instanceof Table))
    {
      paramObject = (Table)paramObject;
      return paramTable.cellSet().equals(((Table)paramObject).cellSet());
    }
    return false;
  }
  
  public static <R, C, V> Table.Cell<R, C, V> immutableCell(@Nullable R paramR, @Nullable C paramC, @Nullable V paramV)
  {
    return new ImmutableCell(paramR, paramC, paramV);
  }
  
  @Beta
  public static <R, C, V> Table<R, C, V> newCustomTable(Map<R, Map<C, V>> paramMap, Supplier<? extends Map<C, V>> paramSupplier)
  {
    Preconditions.checkArgument(paramMap.isEmpty());
    Preconditions.checkNotNull(paramSupplier);
    return new StandardTable(paramMap, paramSupplier);
  }
  
  @Beta
  public static <R, C, V1, V2> Table<R, C, V2> transformValues(Table<R, C, V1> paramTable, Function<? super V1, V2> paramFunction)
  {
    return new TransformedTable(paramTable, paramFunction);
  }
  
  public static <R, C, V> Table<C, R, V> transpose(Table<R, C, V> paramTable)
  {
    if ((paramTable instanceof TransposeTable)) {
      return original;
    }
    return new TransposeTable(paramTable);
  }
  
  @Beta
  public static <R, C, V> RowSortedTable<R, C, V> unmodifiableRowSortedTable(RowSortedTable<R, ? extends C, ? extends V> paramRowSortedTable)
  {
    return new UnmodifiableRowSortedMap(paramRowSortedTable);
  }
  
  public static <R, C, V> Table<R, C, V> unmodifiableTable(Table<? extends R, ? extends C, ? extends V> paramTable)
  {
    return new UnmodifiableTable(paramTable);
  }
  
  private static <K, V> Function<Map<K, V>, Map<K, V>> unmodifiableWrapper()
  {
    return UNMODIFIABLE_WRAPPER;
  }
  
  static abstract class AbstractCell<R, C, V>
    implements Table.Cell<R, C, V>
  {
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {}
      do
      {
        return true;
        if (!(paramObject instanceof Table.Cell)) {
          break;
        }
        paramObject = (Table.Cell)paramObject;
      } while ((Objects.equal(getRowKey(), ((Table.Cell)paramObject).getRowKey())) && (Objects.equal(getColumnKey(), ((Table.Cell)paramObject).getColumnKey())) && (Objects.equal(getValue(), ((Table.Cell)paramObject).getValue())));
      return false;
      return false;
    }
    
    public int hashCode()
    {
      return Objects.hashCode(new Object[] { getRowKey(), getColumnKey(), getValue() });
    }
    
    public String toString()
    {
      return "(" + getRowKey() + "," + getColumnKey() + ")=" + getValue();
    }
  }
  
  static final class ImmutableCell<R, C, V>
    extends Tables.AbstractCell<R, C, V>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    private final C columnKey;
    private final R rowKey;
    private final V value;
    
    ImmutableCell(@Nullable R paramR, @Nullable C paramC, @Nullable V paramV)
    {
      rowKey = paramR;
      columnKey = paramC;
      value = paramV;
    }
    
    public C getColumnKey()
    {
      return (C)columnKey;
    }
    
    public R getRowKey()
    {
      return (R)rowKey;
    }
    
    public V getValue()
    {
      return (V)value;
    }
  }
  
  private static class TransformedTable<R, C, V1, V2>
    extends AbstractTable<R, C, V2>
  {
    final Table<R, C, V1> fromTable;
    final Function<? super V1, V2> function;
    
    TransformedTable(Table<R, C, V1> paramTable, Function<? super V1, V2> paramFunction)
    {
      fromTable = ((Table)Preconditions.checkNotNull(paramTable));
      function = ((Function)Preconditions.checkNotNull(paramFunction));
    }
    
    Function<Table.Cell<R, C, V1>, Table.Cell<R, C, V2>> cellFunction()
    {
      new Function()
      {
        public Table.Cell<R, C, V2> apply(Table.Cell<R, C, V1> paramAnonymousCell)
        {
          return Tables.immutableCell(paramAnonymousCell.getRowKey(), paramAnonymousCell.getColumnKey(), function.apply(paramAnonymousCell.getValue()));
        }
      };
    }
    
    Iterator<Table.Cell<R, C, V2>> cellIterator()
    {
      return Iterators.transform(fromTable.cellSet().iterator(), cellFunction());
    }
    
    public void clear()
    {
      fromTable.clear();
    }
    
    public Map<R, V2> column(C paramC)
    {
      return Maps.transformValues(fromTable.column(paramC), function);
    }
    
    public Set<C> columnKeySet()
    {
      return fromTable.columnKeySet();
    }
    
    public Map<C, Map<R, V2>> columnMap()
    {
      Function local3 = new Function()
      {
        public Map<R, V2> apply(Map<R, V1> paramAnonymousMap)
        {
          return Maps.transformValues(paramAnonymousMap, function);
        }
      };
      return Maps.transformValues(fromTable.columnMap(), local3);
    }
    
    public boolean contains(Object paramObject1, Object paramObject2)
    {
      return fromTable.contains(paramObject1, paramObject2);
    }
    
    Collection<V2> createValues()
    {
      return Collections2.transform(fromTable.values(), function);
    }
    
    public V2 get(Object paramObject1, Object paramObject2)
    {
      if (contains(paramObject1, paramObject2)) {
        return (V2)function.apply(fromTable.get(paramObject1, paramObject2));
      }
      return null;
    }
    
    public V2 put(R paramR, C paramC, V2 paramV2)
    {
      throw new UnsupportedOperationException();
    }
    
    public void putAll(Table<? extends R, ? extends C, ? extends V2> paramTable)
    {
      throw new UnsupportedOperationException();
    }
    
    public V2 remove(Object paramObject1, Object paramObject2)
    {
      if (contains(paramObject1, paramObject2)) {
        return (V2)function.apply(fromTable.remove(paramObject1, paramObject2));
      }
      return null;
    }
    
    public Map<C, V2> row(R paramR)
    {
      return Maps.transformValues(fromTable.row(paramR), function);
    }
    
    public Set<R> rowKeySet()
    {
      return fromTable.rowKeySet();
    }
    
    public Map<R, Map<C, V2>> rowMap()
    {
      Function local2 = new Function()
      {
        public Map<C, V2> apply(Map<C, V1> paramAnonymousMap)
        {
          return Maps.transformValues(paramAnonymousMap, function);
        }
      };
      return Maps.transformValues(fromTable.rowMap(), local2);
    }
    
    public int size()
    {
      return fromTable.size();
    }
  }
  
  private static class TransposeTable<C, R, V>
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
    
    TransposeTable(Table<R, C, V> paramTable)
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
  
  static final class UnmodifiableRowSortedMap<R, C, V>
    extends Tables.UnmodifiableTable<R, C, V>
    implements RowSortedTable<R, C, V>
  {
    private static final long serialVersionUID = 0L;
    
    public UnmodifiableRowSortedMap(RowSortedTable<R, ? extends C, ? extends V> paramRowSortedTable)
    {
      super();
    }
    
    protected RowSortedTable<R, C, V> delegate()
    {
      return (RowSortedTable)super.delegate();
    }
    
    public SortedSet<R> rowKeySet()
    {
      return Collections.unmodifiableSortedSet(delegate().rowKeySet());
    }
    
    public SortedMap<R, Map<C, V>> rowMap()
    {
      Function localFunction = Tables.access$000();
      return Collections.unmodifiableSortedMap(Maps.transformValues(delegate().rowMap(), localFunction));
    }
  }
  
  private static class UnmodifiableTable<R, C, V>
    extends ForwardingTable<R, C, V>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final Table<? extends R, ? extends C, ? extends V> delegate;
    
    UnmodifiableTable(Table<? extends R, ? extends C, ? extends V> paramTable)
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
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */