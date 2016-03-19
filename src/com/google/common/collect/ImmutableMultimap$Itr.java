package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;

abstract class ImmutableMultimap$Itr<T>
  extends UnmodifiableIterator<T>
{
  K key = null;
  final Iterator<Map.Entry<K, Collection<V>>> mapIterator = this$0.asMap().entrySet().iterator();
  Iterator<V> valueIterator = Iterators.emptyIterator();
  
  private ImmutableMultimap$Itr(ImmutableMultimap paramImmutableMultimap) {}
  
  public boolean hasNext()
  {
    return (mapIterator.hasNext()) || (valueIterator.hasNext());
  }
  
  public T next()
  {
    if (!valueIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)mapIterator.next();
      key = localEntry.getKey();
      valueIterator = ((Collection)localEntry.getValue()).iterator();
    }
    return (T)output(key, valueIterator.next());
  }
  
  abstract T output(K paramK, V paramV);
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultimap.Itr
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */