package com.google.common.collect;

import java.util.Map.Entry;

class ImmutableMultimap$1
  extends ImmutableMultimap<K, V>.Itr<Map.Entry<K, V>>
{
  ImmutableMultimap$1(ImmutableMultimap paramImmutableMultimap)
  {
    super(paramImmutableMultimap, null);
  }
  
  Map.Entry<K, V> output(K paramK, V paramV)
  {
    return Maps.immutableEntry(paramK, paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultimap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */