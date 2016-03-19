package com.google.common.collect;

public abstract class MultimapBuilder$SetMultimapBuilder<K0, V0>
  extends MultimapBuilder<K0, V0>
{
  MultimapBuilder$SetMultimapBuilder()
  {
    super(null);
  }
  
  public abstract <K extends K0, V extends V0> SetMultimap<K, V> build();
  
  public <K extends K0, V extends V0> SetMultimap<K, V> build(Multimap<? extends K, ? extends V> paramMultimap)
  {
    return (SetMultimap)super.build(paramMultimap);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.SetMultimapBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */