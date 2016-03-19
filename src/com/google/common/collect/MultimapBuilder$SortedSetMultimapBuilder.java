package com.google.common.collect;

public abstract class MultimapBuilder$SortedSetMultimapBuilder<K0, V0>
  extends MultimapBuilder.SetMultimapBuilder<K0, V0>
{
  public abstract <K extends K0, V extends V0> SortedSetMultimap<K, V> build();
  
  public <K extends K0, V extends V0> SortedSetMultimap<K, V> build(Multimap<? extends K, ? extends V> paramMultimap)
  {
    return (SortedSetMultimap)super.build(paramMultimap);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.SortedSetMultimapBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */