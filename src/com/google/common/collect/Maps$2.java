package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Iterator;
import java.util.Map.Entry;

final class Maps$2
  extends TransformedIterator<K, Map.Entry<K, V>>
{
  Maps$2(Iterator paramIterator, Function paramFunction)
  {
    super(paramIterator);
  }
  
  Map.Entry<K, V> transform(K paramK)
  {
    return Maps.immutableEntry(paramK, val$function.apply(paramK));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */