package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.lang.reflect.Array;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

@GwtCompatible
@Immutable
final class DenseImmutableTable<R, C, V>
  extends RegularImmutableTable<R, C, V>
{
  private final int[] columnCounts;
  private final ImmutableMap<C, Integer> columnKeyToIndex;
  private final ImmutableMap<C, Map<R, V>> columnMap;
  private final int[] iterationOrderColumn;
  private final int[] iterationOrderRow;
  private final int[] rowCounts;
  private final ImmutableMap<R, Integer> rowKeyToIndex;
  private final ImmutableMap<R, Map<C, V>> rowMap;
  private final V[][] values;
  
  DenseImmutableTable(ImmutableList<Table.Cell<R, C, V>> paramImmutableList, ImmutableSet<R> paramImmutableSet, ImmutableSet<C> paramImmutableSet1)
  {
    values = ((Object[][])Array.newInstance(Object.class, new int[] { paramImmutableSet.size(), paramImmutableSet1.size() }));
    rowKeyToIndex = makeIndex(paramImmutableSet);
    columnKeyToIndex = makeIndex(paramImmutableSet1);
    rowCounts = new int[rowKeyToIndex.size()];
    columnCounts = new int[columnKeyToIndex.size()];
    paramImmutableSet = new int[paramImmutableList.size()];
    paramImmutableSet1 = new int[paramImmutableList.size()];
    int i = 0;
    if (i < paramImmutableList.size())
    {
      Object localObject1 = (Table.Cell)paramImmutableList.get(i);
      Object localObject2 = ((Table.Cell)localObject1).getRowKey();
      Object localObject3 = ((Table.Cell)localObject1).getColumnKey();
      int j = ((Integer)rowKeyToIndex.get(localObject2)).intValue();
      int k = ((Integer)columnKeyToIndex.get(localObject3)).intValue();
      if (values[j][k] == null) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "duplicate key: (%s, %s)", new Object[] { localObject2, localObject3 });
        values[j][k] = ((Table.Cell)localObject1).getValue();
        localObject1 = rowCounts;
        localObject1[j] += 1;
        localObject1 = columnCounts;
        localObject1[k] += 1;
        paramImmutableSet[i] = j;
        paramImmutableSet1[i] = k;
        i += 1;
        break;
      }
    }
    iterationOrderRow = paramImmutableSet;
    iterationOrderColumn = paramImmutableSet1;
    rowMap = new RowMap(null);
    columnMap = new ColumnMap(null);
  }
  
  private static <E> ImmutableMap<E, Integer> makeIndex(ImmutableSet<E> paramImmutableSet)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int i = 0;
    paramImmutableSet = paramImmutableSet.iterator();
    while (paramImmutableSet.hasNext())
    {
      localBuilder.put(paramImmutableSet.next(), Integer.valueOf(i));
      i += 1;
    }
    return localBuilder.build();
  }
  
  public ImmutableMap<C, Map<R, V>> columnMap()
  {
    return columnMap;
  }
  
  public V get(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    paramObject1 = (Integer)rowKeyToIndex.get(paramObject1);
    paramObject2 = (Integer)columnKeyToIndex.get(paramObject2);
    if ((paramObject1 == null) || (paramObject2 == null)) {
      return null;
    }
    return (V)values[paramObject1.intValue()][paramObject2.intValue()];
  }
  
  Table.Cell<R, C, V> getCell(int paramInt)
  {
    int i = iterationOrderRow[paramInt];
    paramInt = iterationOrderColumn[paramInt];
    return cellOf(rowKeySet().asList().get(i), columnKeySet().asList().get(paramInt), values[i][paramInt]);
  }
  
  V getValue(int paramInt)
  {
    return (V)values[iterationOrderRow[paramInt]][iterationOrderColumn[paramInt]];
  }
  
  public ImmutableMap<R, Map<C, V>> rowMap()
  {
    return rowMap;
  }
  
  public int size()
  {
    return iterationOrderRow.length;
  }
  
  private final class Column
    extends DenseImmutableTable.ImmutableArrayMap<R, V>
  {
    private final int columnIndex;
    
    Column(int paramInt)
    {
      super();
      columnIndex = paramInt;
    }
    
    V getValue(int paramInt)
    {
      return (V)values[paramInt][columnIndex];
    }
    
    boolean isPartialView()
    {
      return true;
    }
    
    ImmutableMap<R, Integer> keyToIndex()
    {
      return rowKeyToIndex;
    }
  }
  
  private final class ColumnMap
    extends DenseImmutableTable.ImmutableArrayMap<C, Map<R, V>>
  {
    private ColumnMap()
    {
      super();
    }
    
    Map<R, V> getValue(int paramInt)
    {
      return new DenseImmutableTable.Column(DenseImmutableTable.this, paramInt);
    }
    
    boolean isPartialView()
    {
      return false;
    }
    
    ImmutableMap<C, Integer> keyToIndex()
    {
      return columnKeyToIndex;
    }
  }
  
  private static abstract class ImmutableArrayMap<K, V>
    extends ImmutableMap<K, V>
  {
    private final int size;
    
    ImmutableArrayMap(int paramInt)
    {
      size = paramInt;
    }
    
    private boolean isFull()
    {
      return size == keyToIndex().size();
    }
    
    ImmutableSet<Map.Entry<K, V>> createEntrySet()
    {
      new ImmutableMapEntrySet()
      {
        public UnmodifiableIterator<Map.Entry<K, V>> iterator()
        {
          new AbstractIterator()
          {
            private int index = -1;
            private final int maxIndex = keyToIndex().size();
            
            protected Map.Entry<K, V> computeNext()
            {
              for (index += 1; index < maxIndex; index += 1)
              {
                Object localObject = getValue(index);
                if (localObject != null) {
                  return Maps.immutableEntry(getKey(index), localObject);
                }
              }
              return (Map.Entry)endOfData();
            }
          };
        }
        
        ImmutableMap<K, V> map()
        {
          return DenseImmutableTable.ImmutableArrayMap.this;
        }
      };
    }
    
    ImmutableSet<K> createKeySet()
    {
      if (isFull()) {
        return keyToIndex().keySet();
      }
      return super.createKeySet();
    }
    
    public V get(@Nullable Object paramObject)
    {
      paramObject = (Integer)keyToIndex().get(paramObject);
      if (paramObject == null) {
        return null;
      }
      return (V)getValue(((Integer)paramObject).intValue());
    }
    
    K getKey(int paramInt)
    {
      return (K)keyToIndex().keySet().asList().get(paramInt);
    }
    
    @Nullable
    abstract V getValue(int paramInt);
    
    abstract ImmutableMap<K, Integer> keyToIndex();
    
    public int size()
    {
      return size;
    }
  }
  
  private final class Row
    extends DenseImmutableTable.ImmutableArrayMap<C, V>
  {
    private final int rowIndex;
    
    Row(int paramInt)
    {
      super();
      rowIndex = paramInt;
    }
    
    V getValue(int paramInt)
    {
      return (V)values[rowIndex][paramInt];
    }
    
    boolean isPartialView()
    {
      return true;
    }
    
    ImmutableMap<C, Integer> keyToIndex()
    {
      return columnKeyToIndex;
    }
  }
  
  private final class RowMap
    extends DenseImmutableTable.ImmutableArrayMap<R, Map<C, V>>
  {
    private RowMap()
    {
      super();
    }
    
    Map<C, V> getValue(int paramInt)
    {
      return new DenseImmutableTable.Row(DenseImmutableTable.this, paramInt);
    }
    
    boolean isPartialView()
    {
      return false;
    }
    
    ImmutableMap<R, Integer> keyToIndex()
    {
      return rowKeyToIndex;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DenseImmutableTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */