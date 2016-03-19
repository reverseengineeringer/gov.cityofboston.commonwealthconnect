package com.google.common.collect;

import com.google.common.base.Supplier;
import java.util.LinkedList;
import java.util.List;

 enum MultimapBuilder$LinkedListSupplier
  implements Supplier<List<Object>>
{
  INSTANCE;
  
  private MultimapBuilder$LinkedListSupplier() {}
  
  public static <V> Supplier<List<V>> instance()
  {
    return INSTANCE;
  }
  
  public List<Object> get()
  {
    return new LinkedList();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.LinkedListSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */