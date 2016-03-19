package com.google.common.collect;

final class DenseImmutableTable$Column
  extends DenseImmutableTable.ImmutableArrayMap<R, V>
{
  private final int columnIndex;
  
  DenseImmutableTable$Column(DenseImmutableTable paramDenseImmutableTable, int paramInt)
  {
    super(DenseImmutableTable.access$500(paramDenseImmutableTable)[paramInt]);
    columnIndex = paramInt;
  }
  
  V getValue(int paramInt)
  {
    return (V)DenseImmutableTable.access$400(this$0)[paramInt][columnIndex];
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  ImmutableMap<R, Integer> keyToIndex()
  {
    return DenseImmutableTable.access$600(this$0);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DenseImmutableTable.Column
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */