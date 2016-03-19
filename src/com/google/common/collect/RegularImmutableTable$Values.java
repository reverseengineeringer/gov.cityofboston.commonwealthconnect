package com.google.common.collect;

final class RegularImmutableTable$Values
  extends ImmutableList<V>
{
  private RegularImmutableTable$Values(RegularImmutableTable paramRegularImmutableTable) {}
  
  public V get(int paramInt)
  {
    return (V)this$0.getValue(paramInt);
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return this$0.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableTable.Values
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */