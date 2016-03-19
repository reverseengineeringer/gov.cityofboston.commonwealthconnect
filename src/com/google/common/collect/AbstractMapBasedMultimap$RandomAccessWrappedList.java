package com.google.common.collect;

import java.util.List;
import java.util.RandomAccess;
import javax.annotation.Nullable;

class AbstractMapBasedMultimap$RandomAccessWrappedList
  extends AbstractMapBasedMultimap<K, V>.WrappedList
  implements RandomAccess
{
  AbstractMapBasedMultimap$RandomAccessWrappedList(@Nullable K paramK, List<V> paramList, @Nullable AbstractMapBasedMultimap<K, V>.WrappedCollection paramAbstractMapBasedMultimap)
  {
    super(paramK, paramList, paramAbstractMapBasedMultimap, localWrappedCollection);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.RandomAccessWrappedList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */