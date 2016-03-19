package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

class Multimaps$CustomSetMultimap<K, V>
  extends AbstractSetMultimap<K, V>
{
  @GwtIncompatible("not needed in emulated source")
  private static final long serialVersionUID = 0L;
  transient Supplier<? extends Set<V>> factory;
  
  Multimaps$CustomSetMultimap(Map<K, Collection<V>> paramMap, Supplier<? extends Set<V>> paramSupplier)
  {
    super(paramMap);
    factory = ((Supplier)Preconditions.checkNotNull(paramSupplier));
  }
  
  @GwtIncompatible("java.io.ObjectInputStream")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    factory = ((Supplier)paramObjectInputStream.readObject());
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
  
  protected Set<V> createCollection()
  {
    return (Set)factory.get();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.CustomSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */