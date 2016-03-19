package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class Tables$TransformedTable<R, C, V1, V2>
  extends AbstractTable<R, C, V2>
{
  final Table<R, C, V1> fromTable;
  final Function<? super V1, V2> function;
  
  Tables$TransformedTable(Table<R, C, V1> paramTable, Function<? super V1, V2> paramFunction)
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

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.TransformedTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */