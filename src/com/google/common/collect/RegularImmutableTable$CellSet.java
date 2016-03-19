package com.google.common.collect;

import javax.annotation.Nullable;

final class RegularImmutableTable$CellSet
  extends ImmutableSet<Table.Cell<R, C, V>>
{
  private RegularImmutableTable$CellSet(RegularImmutableTable paramRegularImmutableTable) {}
  
  public boolean contains(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Table.Cell))
    {
      paramObject = (Table.Cell)paramObject;
      Object localObject = this$0.get(((Table.Cell)paramObject).getRowKey(), ((Table.Cell)paramObject).getColumnKey());
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
        return this$0.getCell(paramAnonymousInt);
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
    return this$0.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableTable.CellSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */