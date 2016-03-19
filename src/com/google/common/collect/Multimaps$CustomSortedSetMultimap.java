package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Collection;
import java.util.Comparator;
import java.util.Map;
import java.util.SortedSet;

class Multimaps$CustomSortedSetMultimap<K, V>
  extends AbstractSortedSetMultimap<K, V>
{
  @GwtIncompatible("not needed in emulated source")
  private static final long serialVersionUID = 0L;
  transient Supplier<? extends SortedSet<V>> factory;
  transient Comparator<? super V> valueComparator;
  
  Multimaps$CustomSortedSetMultimap(Map<K, Collection<V>> paramMap, Supplier<? extends SortedSet<V>> paramSupplier)
  {
    super(paramMap);
    factory = ((Supplier)Preconditions.checkNotNull(paramSupplier));
    valueComparator = ((SortedSet)paramSupplier.get()).comparator();
  }
  
  @GwtIncompatible("java.io.ObjectInputStream")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    factory = ((Supplier)paramObjectInputStream.readObject());
    valueComparator = ((SortedSet)factory.get()).comparator();
    setMap((Map)paramObjectInputStream.readObject());
  }
  
  @GwtIncompatible("java.io.ObjectOutputStream")
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    paramObjectOutputStream.writeObject(factory);
    paramObjectOutputStream.writeObject(backingMap());
  }
  
  protected SortedSet<V> createCollection()
  {
    return (SortedSet)factory.get();
  }
  
  public Comparator<? super V> valueComparator()
  {
    return valueComparator;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.CustomSortedSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */