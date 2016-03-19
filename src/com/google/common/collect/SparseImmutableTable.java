package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.concurrent.Immutable;

@GwtCompatible
@Immutable
final class SparseImmutableTable<R, C, V>
  extends RegularImmutableTable<R, C, V>
{
  private final ImmutableMap<C, Map<R, V>> columnMap;
  private final int[] iterationOrderColumn;
  private final int[] iterationOrderRow;
  private final ImmutableMap<R, Map<C, V>> rowMap;
  
  SparseImmutableTable(ImmutableList<Table.Cell<R, C, V>> paramImmutableList, ImmutableSet<R> paramImmutableSet, ImmutableSet<C> paramImmutableSet1)
  {
    HashMap localHashMap = Maps.newHashMap();
    Object localObject1 = Maps.newLinkedHashMap();
    paramImmutableSet = paramImmutableSet.iterator();
    while (paramImmutableSet.hasNext())
    {
      localObject2 = paramImmutableSet.next();
      localHashMap.put(localObject2, Integer.valueOf(((Map)localObject1).size()));
      ((Map)localObject1).put(localObject2, new LinkedHashMap());
    }
    paramImmutableSet = Maps.newLinkedHashMap();
    paramImmutableSet1 = paramImmutableSet1.iterator();
    while (paramImmutableSet1.hasNext()) {
      paramImmutableSet.put(paramImmutableSet1.next(), new LinkedHashMap());
    }
    paramImmutableSet1 = new int[paramImmutableList.size()];
    Object localObject2 = new int[paramImmutableList.size()];
    int i = 0;
    while (i < paramImmutableList.size())
    {
      Object localObject5 = (Table.Cell)paramImmutableList.get(i);
      Object localObject3 = ((Table.Cell)localObject5).getRowKey();
      Object localObject4 = ((Table.Cell)localObject5).getColumnKey();
      localObject5 = ((Table.Cell)localObject5).getValue();
      paramImmutableSet1[i] = ((Integer)localHashMap.get(localObject3)).intValue();
      Object localObject6 = (Map)((Map)localObject1).get(localObject3);
      localObject2[i] = ((Map)localObject6).size();
      localObject6 = ((Map)localObject6).put(localObject4, localObject5);
      if (localObject6 != null) {
        throw new IllegalArgumentException("Duplicate value for row=" + localObject3 + ", column=" + localObject4 + ": " + localObject5 + ", " + localObject6);
      }
      ((Map)paramImmutableSet.get(localObject4)).put(localObject3, localObject5);
      i += 1;
    }
    iterationOrderRow = paramImmutableSet1;
    iterationOrderColumn = ((int[])localObject2);
    paramImmutableList = ImmutableMap.builder();
    paramImmutableSet1 = ((Map)localObject1).entrySet().iterator();
    while (paramImmutableSet1.hasNext())
    {
      localObject1 = (Map.Entry)paramImmutableSet1.next();
      paramImmutableList.put(((Map.Entry)localObject1).getKey(), ImmutableMap.copyOf((Map)((Map.Entry)localObject1).getValue()));
    }
    rowMap = paramImmutableList.build();
    paramImmutableList = ImmutableMap.builder();
    paramImmutableSet = paramImmutableSet.entrySet().iterator();
    while (paramImmutableSet.hasNext())
    {
      paramImmutableSet1 = (Map.Entry)paramImmutableSet.next();
      paramImmutableList.put(paramImmutableSet1.getKey(), ImmutableMap.copyOf((Map)paramImmutableSet1.getValue()));
    }
    columnMap = paramImmutableList.build();
  }
  
  public ImmutableMap<C, Map<R, V>> columnMap()
  {
    return columnMap;
  }
  
  Table.Cell<R, C, V> getCell(int paramInt)
  {
    int i = iterationOrderRow[paramInt];
    Map.Entry localEntry = (Map.Entry)rowMap.entrySet().asList().get(i);
    Object localObject = (ImmutableMap)localEntry.getValue();
    paramInt = iterationOrderColumn[paramInt];
    localObject = (Map.Entry)((ImmutableMap)localObject).entrySet().asList().get(paramInt);
    return cellOf(localEntry.getKey(), ((Map.Entry)localObject).getKey(), ((Map.Entry)localObject).getValue());
  }
  
  V getValue(int paramInt)
  {
    int i = iterationOrderRow[paramInt];
    ImmutableMap localImmutableMap = (ImmutableMap)rowMap.values().asList().get(i);
    paramInt = iterationOrderColumn[paramInt];
    return (V)localImmutableMap.values().asList().get(paramInt);
  }
  
  public ImmutableMap<R, Map<C, V>> rowMap()
  {
    return rowMap;
  }
  
  public int size()
  {
    return iterationOrderRow.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.SparseImmutableTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */