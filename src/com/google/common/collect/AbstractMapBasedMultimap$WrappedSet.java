package com.google.common.collect;

import java.util.Collection;
import java.util.Set;
import javax.annotation.Nullable;

class AbstractMapBasedMultimap$WrappedSet
  extends AbstractMapBasedMultimap<K, V>.WrappedCollection
  implements Set<V>
{
  AbstractMapBasedMultimap$WrappedSet(@Nullable K paramK, Set<V> paramSet)
  {
    super(paramK, paramSet, localCollection, null);
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    boolean bool1;
    if (paramCollection.isEmpty()) {
      bool1 = false;
    }
    int i;
    boolean bool2;
    do
    {
      return bool1;
      i = size();
      bool2 = Sets.removeAllImpl((Set)delegate, paramCollection);
      bool1 = bool2;
    } while (!bool2);
    int j = delegate.size();
    AbstractMapBasedMultimap.access$212(this$0, j - i);
    removeIfEmpty();
    return bool2;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.WrappedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */