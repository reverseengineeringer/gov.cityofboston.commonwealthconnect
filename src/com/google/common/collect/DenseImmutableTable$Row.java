package com.google.common.collect;

final class DenseImmutableTable$Row
  extends DenseImmutableTable.ImmutableArrayMap<C, V>
{
  private final int rowIndex;
  
  DenseImmutableTable$Row(DenseImmutableTable paramDenseImmutableTable, int paramInt)
  {
    super(DenseImmutableTable.access$200(paramDenseImmutableTable)[paramInt]);
    rowIndex = paramInt;
  }
  
  V getValue(int paramInt)
  {
    return (V)DenseImmutableTable.access$400(this$0)[rowIndex][paramInt];
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  ImmutableMap<C, Integer> keyToIndex()
  {
    return DenseImmutableTable.access$300(this$0);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DenseImmutableTable.Row
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */