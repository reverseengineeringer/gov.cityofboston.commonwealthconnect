package com.google.common.collect;

public abstract class MultimapBuilder$ListMultimapBuilder<K0, V0>
  extends MultimapBuilder<K0, V0>
{
  MultimapBuilder$ListMultimapBuilder()
  {
    super(null);
  }
  
  public abstract <K extends K0, V extends V0> ListMultimap<K, V> build();
  
  public <K extends K0, V extends V0> ListMultimap<K, V> build(Multimap<? extends K, ? extends V> paramMultimap)
  {
    return (ListMultimap)super.build(paramMultimap);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.ListMultimapBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */