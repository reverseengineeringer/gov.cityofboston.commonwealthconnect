package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Collection;
import java.util.List;
import java.util.Map;

class Multimaps$CustomListMultimap<K, V>
  extends AbstractListMultimap<K, V>
{
  @GwtIncompatible("java serialization not supported")
  private static final long serialVersionUID = 0L;
  transient Supplier<? extends List<V>> factory;
  
  Multimaps$CustomListMultimap(Map<K, Collection<V>> paramMap, Supplier<? extends List<V>> paramSupplier)
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
  
  protected List<V> createCollection()
  {
    return (List)factory.get();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.CustomListMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */