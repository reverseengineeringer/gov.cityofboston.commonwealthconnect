package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Collection;

class Multimaps$AsMap$EntrySet$1
  implements Function<K, Collection<V>>
{
  Multimaps$AsMap$EntrySet$1(Multimaps.AsMap.EntrySet paramEntrySet) {}
  
  public Collection<V> apply(K paramK)
  {
    return Multimaps.AsMap.access$200(this$1.this$0).get(paramK);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.AsMap.EntrySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */