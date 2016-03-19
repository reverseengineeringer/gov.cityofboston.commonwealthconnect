package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@Beta
@GwtCompatible(emulated=true)
public final class ArrayTable<R, C, V>
  extends AbstractTable<R, C, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final V[][] array;
  private final ImmutableMap<C, Integer> columnKeyToIndex;
  private final ImmutableList<C> columnList;
  private transient ArrayTable<R, C, V>.ColumnMap columnMap;
  private final ImmutableMap<R, Integer> rowKeyToIndex;
  private final ImmutableList<R> rowList;
  private transient ArrayTable<R, C, V>.RowMap rowMap;
  
  private ArrayTable(ArrayTable<R, C, V> paramArrayTable)
  {
    rowList = rowList;
    columnList = columnList;
    rowKeyToIndex = rowKeyToIndex;
    columnKeyToIndex = columnKeyToIndex;
    Object[][] arrayOfObject = (Object[][])Array.newInstance(Object.class, new int[] { rowList.size(), columnList.size() });
    array = arrayOfObject;
    eraseAll();
    int i = 0;
    while (i < rowList.size())
    {
      System.arraycopy(array[i], 0, arrayOfObject[i], 0, array[i].length);
      i += 1;
    }
  }
  
  private ArrayTable(Table<R, C, V> paramTable)
  {
    this(paramTable.rowKeySet(), paramTable.columnKeySet());
    putAll(paramTable);
  }
  
  private ArrayTable(Iterable<? extends R> paramIterable, Iterable<? extends C> paramIterable1)
  {
    rowList = ImmutableList.copyOf(paramIterable);
    columnList = ImmutableList.copyOf(paramIterable1);
    if (!rowList.isEmpty())
    {
      bool1 = true;
      Preconditions.checkArgument(bool1);
      if (columnList.isEmpty()) {
        break label126;
      }
    }
    label126:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      Preconditions.checkArgument(bool1);
      rowKeyToIndex = index(rowList);
      columnKeyToIndex = index(columnList);
      array = ((Object[][])Array.newInstance(Object.class, new int[] { rowList.size(), columnList.size() }));
      eraseAll();
      return;
      bool1 = false;
      break;
    }
  }
  
  public static <R, C, V> ArrayTable<R, C, V> create(Table<R, C, V> paramTable)
  {
    if ((paramTable instanceof ArrayTable)) {
      return new ArrayTable((ArrayTable)paramTable);
    }
    return new ArrayTable(paramTable);
  }
  
  public static <R, C, V> ArrayTable<R, C, V> create(Iterable<? extends R> paramIterable, Iterable<? extends C> paramIterable1)
  {
    return new ArrayTable(paramIterable, paramIterable1);
  }
  
  private static <E> ImmutableMap<E, Integer> index(List<E> paramList)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int i = 0;
    while (i < paramList.size())
    {
      localBuilder.put(paramList.get(i), Integer.valueOf(i));
      i += 1;
    }
    return localBuilder.build();
  }
  
  public V at(int paramInt1, int paramInt2)
  {
    Preconditions.checkElementIndex(paramInt1, rowList.size());
    Preconditions.checkElementIndex(paramInt2, columnList.size());
    return (V)array[paramInt1][paramInt2];
  }
  
  Iterator<Table.Cell<R, C, V>> cellIterator()
  {
    new AbstractIndexedListIterator(size())
    {
      protected Table.Cell<R, C, V> get(final int paramAnonymousInt)
      {
        new Tables.AbstractCell()
        {
          final int columnIndex = paramAnonymousInt % columnList.size();
          final int rowIndex = paramAnonymousInt / columnList.size();
          
          public C getColumnKey()
          {
            return (C)columnList.get(columnIndex);
          }
          
          public R getRowKey()
          {
            return (R)rowList.get(rowIndex);
          }
          
          public V getValue()
          {
            return (V)at(rowIndex, columnIndex);
          }
        };
      }
    };
  }
  
  public Set<Table.Cell<R, C, V>> cellSet()
  {
    return super.cellSet();
  }
  
  @Deprecated
  public void clear()
  {
    throw new UnsupportedOperationException();
  }
  
  public Map<R, V> column(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    paramC = (Integer)columnKeyToIndex.get(paramC);
    if (paramC == null) {
      return ImmutableMap.of();
    }
    return new Column(paramC.intValue());
  }
  
  public ImmutableList<C> columnKeyList()
  {
    return columnList;
  }
  
  public ImmutableSet<C> columnKeySet()
  {
    return columnKeyToIndex.keySet();
  }
  
  public Map<C, Map<R, V>> columnMap()
  {
    ColumnMap localColumnMap2 = columnMap;
    ColumnMap localColumnMap1 = localColumnMap2;
    if (localColumnMap2 == null)
    {
      localColumnMap1 = new ColumnMap(null);
      columnMap = localColumnMap1;
    }
    return localColumnMap1;
  }
  
  public boolean contains(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    return (containsRow(paramObject1)) && (containsColumn(paramObject2));
  }
  
  public boolean containsColumn(@Nullable Object paramObject)
  {
    return columnKeyToIndex.containsKey(paramObject);
  }
  
  public boolean containsRow(@Nullable Object paramObject)
  {
    return rowKeyToIndex.containsKey(paramObject);
  }
  
  public boolean containsValue(@Nullable Object paramObject)
  {
    Object[][] arrayOfObject = array;
    int k = arrayOfObject.length;
    int i = 0;
    while (i < k)
    {
      Object[] arrayOfObject1 = arrayOfObject[i];
      int m = arrayOfObject1.length;
      int j = 0;
      while (j < m)
      {
        if (Objects.equal(paramObject, arrayOfObject1[j])) {
          return true;
        }
        j += 1;
      }
      i += 1;
    }
    return false;
  }
  
  public V erase(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    paramObject1 = (Integer)rowKeyToIndex.get(paramObject1);
    paramObject2 = (Integer)columnKeyToIndex.get(paramObject2);
    if ((paramObject1 == null) || (paramObject2 == null)) {
      return null;
    }
    return (V)set(((Integer)paramObject1).intValue(), ((Integer)paramObject2).intValue(), null);
  }
  
  public void eraseAll()
  {
    Object[][] arrayOfObject = array;
    int j = arrayOfObject.length;
    int i = 0;
    while (i < j)
    {
      Arrays.fill(arrayOfObject[i], null);
      i += 1;
    }
  }
  
  public V get(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    paramObject1 = (Integer)rowKeyToIndex.get(paramObject1);
    paramObject2 = (Integer)columnKeyToIndex.get(paramObject2);
    if ((paramObject1 == null) || (paramObject2 == null)) {
      return null;
    }
    return (V)at(((Integer)paramObject1).intValue(), ((Integer)paramObject2).intValue());
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  public V put(R paramR, C paramC, @Nullable V paramV)
  {
    Preconditions.checkNotNull(paramR);
    Preconditions.checkNotNull(paramC);
    Integer localInteger = (Integer)rowKeyToIndex.get(paramR);
    if (localInteger != null)
    {
      bool = true;
      Preconditions.checkArgument(bool, "Row %s not in %s", new Object[] { paramR, rowList });
      paramR = (Integer)columnKeyToIndex.get(paramC);
      if (paramR == null) {
        break label117;
      }
    }
    label117:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Column %s not in %s", new Object[] { paramC, columnList });
      return (V)set(localInteger.intValue(), paramR.intValue(), paramV);
      bool = false;
      break;
    }
  }
  
  public void putAll(Table<? extends R, ? extends C, ? extends V> paramTable)
  {
    super.putAll(paramTable);
  }
  
  @Deprecated
  public V remove(Object paramObject1, Object paramObject2)
  {
    throw new UnsupportedOperationException();
  }
  
  public Map<C, V> row(R paramR)
  {
    Preconditions.checkNotNull(paramR);
    paramR = (Integer)rowKeyToIndex.get(paramR);
    if (paramR == null) {
      return ImmutableMap.of();
    }
    return new Row(paramR.intValue());
  }
  
  public ImmutableList<R> rowKeyList()
  {
    return rowList;
  }
  
  public ImmutableSet<R> rowKeySet()
  {
    return rowKeyToIndex.keySet();
  }
  
  public Map<R, Map<C, V>> rowMap()
  {
    RowMap localRowMap2 = rowMap;
    RowMap localRowMap1 = localRowMap2;
    if (localRowMap2 == null)
    {
      localRowMap1 = new RowMap(null);
      rowMap = localRowMap1;
    }
    return localRowMap1;
  }
  
  public V set(int paramInt1, int paramInt2, @Nullable V paramV)
  {
    Preconditions.checkElementIndex(paramInt1, rowList.size());
    Preconditions.checkElementIndex(paramInt2, columnList.size());
    Object localObject = array[paramInt1][paramInt2];
    array[paramInt1][paramInt2] = paramV;
    return (V)localObject;
  }
  
  public int size()
  {
    return rowList.size() * columnList.size();
  }
  
  @GwtIncompatible("reflection")
  public V[][] toArray(Class<V> paramClass)
  {
    paramClass = (Object[][])Array.newInstance(paramClass, new int[] { rowList.size(), columnList.size() });
    int i = 0;
    while (i < rowList.size())
    {
      System.arraycopy(array[i], 0, paramClass[i], 0, array[i].length);
      i += 1;
    }
    return paramClass;
  }
  
  public Collection<V> values()
  {
    return super.values();
  }
  
  private static abstract class ArrayMap<K, V>
    extends Maps.ImprovedAbstractMap<K, V>
  {
    private final ImmutableMap<K, Integer> keyIndex;
    
    private ArrayMap(ImmutableMap<K, Integer> paramImmutableMap)
    {
      keyIndex = paramImmutableMap;
    }
    
    public void clear()
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean containsKey(@Nullable Object paramObject)
    {
      return keyIndex.containsKey(paramObject);
    }
    
    protected Set<Map.Entry<K, V>> createEntrySet()
    {
      new Maps.EntrySet()
      {
        public Iterator<Map.Entry<K, V>> iterator()
        {
          new AbstractIndexedListIterator(size())
          {
            protected Map.Entry<K, V> get(final int paramAnonymous2Int)
            {
              new AbstractMapEntry()
              {
                public K getKey()
                {
                  return (K)getKey(paramAnonymous2Int);
                }
                
                public V getValue()
                {
                  return (V)getValue(paramAnonymous2Int);
                }
                
                public V setValue(V paramAnonymous3V)
                {
                  return (V)setValue(paramAnonymous2Int, paramAnonymous3V);
                }
              };
            }
          };
        }
        
        Map<K, V> map()
        {
          return ArrayTable.ArrayMap.this;
        }
      };
    }
    
    public V get(@Nullable Object paramObject)
    {
      paramObject = (Integer)keyIndex.get(paramObject);
      if (paramObject == null) {
        return null;
      }
      return (V)getValue(((Integer)paramObject).intValue());
    }
    
    K getKey(int paramInt)
    {
      return (K)keyIndex.keySet().asList().get(paramInt);
    }
    
    abstract String getKeyRole();
    
    @Nullable
    abstract V getValue(int paramInt);
    
    public boolean isEmpty()
    {
      return keyIndex.isEmpty();
    }
    
    public Set<K> keySet()
    {
      return keyIndex.keySet();
    }
    
    public V put(K paramK, V paramV)
    {
      Integer localInteger = (Integer)keyIndex.get(paramK);
      if (localInteger == null) {
        throw new IllegalArgumentException(getKeyRole() + " " + paramK + " not in " + keyIndex.keySet());
      }
      return (V)setValue(localInteger.intValue(), paramV);
    }
    
    public V remove(Object paramObject)
    {
      throw new UnsupportedOperationException();
    }
    
    @Nullable
    abstract V setValue(int paramInt, V paramV);
    
    public int size()
    {
      return keyIndex.size();
    }
  }
  
  private class Column
    extends ArrayTable.ArrayMap<R, V>
  {
    final int columnIndex;
    
    Column(int paramInt)
    {
      super(null);
      columnIndex = paramInt;
    }
    
    String getKeyRole()
    {
      return "Row";
    }
    
    V getValue(int paramInt)
    {
      return (V)at(paramInt, columnIndex);
    }
    
    V setValue(int paramInt, V paramV)
    {
      return (V)set(paramInt, columnIndex, paramV);
    }
  }
  
  private class ColumnMap
    extends ArrayTable.ArrayMap<C, Map<R, V>>
  {
    private ColumnMap()
    {
      super(null);
    }
    
    String getKeyRole()
    {
      return "Column";
    }
    
    Map<R, V> getValue(int paramInt)
    {
      return new ArrayTable.Column(ArrayTable.this, paramInt);
    }
    
    public Map<R, V> put(C paramC, Map<R, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }
    
    Map<R, V> setValue(int paramInt, Map<R, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }
  }
  
  private class Row
    extends ArrayTable.ArrayMap<C, V>
  {
    final int rowIndex;
    
    Row(int paramInt)
    {
      super(null);
      rowIndex = paramInt;
    }
    
    String getKeyRole()
    {
      return "Column";
    }
    
    V getValue(int paramInt)
    {
      return (V)at(rowIndex, paramInt);
    }
    
    V setValue(int paramInt, V paramV)
    {
      return (V)set(rowIndex, paramInt, paramV);
    }
  }
  
  private class RowMap
    extends ArrayTable.ArrayMap<R, Map<C, V>>
  {
    private RowMap()
    {
      super(null);
    }
    
    String getKeyRole()
    {
      return "Row";
    }
    
    Map<C, V> getValue(int paramInt)
    {
      return new ArrayTable.Row(ArrayTable.this, paramInt);
    }
    
    public Map<C, V> put(R paramR, Map<C, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }
    
    Map<C, V> setValue(int paramInt, Map<C, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */