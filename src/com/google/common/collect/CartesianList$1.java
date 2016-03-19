package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.List;

class CartesianList$1
  extends ImmutableList<E>
{
  CartesianList$1(CartesianList paramCartesianList, int paramInt) {}
  
  public E get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    int i = CartesianList.access$100(this$0, val$index, paramInt);
    return (E)((List)CartesianList.access$000(this$0).get(paramInt)).get(i);
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return CartesianList.access$000(this$0).size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.CartesianList.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */