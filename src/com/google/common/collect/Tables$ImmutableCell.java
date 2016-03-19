package com.google.common.collect;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Tables$ImmutableCell<R, C, V>
  extends Tables.AbstractCell<R, C, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final C columnKey;
  private final R rowKey;
  private final V value;
  
  Tables$ImmutableCell(@Nullable R paramR, @Nullable C paramC, @Nullable V paramV)
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

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.ImmutableCell
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */