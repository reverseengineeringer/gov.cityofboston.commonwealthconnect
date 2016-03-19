package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

@GwtCompatible(emulated=true, serializable=true)
abstract class ImmutableAsList<E>
  extends ImmutableList<E>
{
  @GwtIncompatible("serialization")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws InvalidObjectException
  {
    throw new InvalidObjectException("Use SerializedForm");
  }
  
  public boolean contains(Object paramObject)
  {
    return delegateCollection().contains(paramObject);
  }
  
  abstract ImmutableCollection<E> delegateCollection();
  
  public boolean isEmpty()
  {
    return delegateCollection().isEmpty();
  }
  
  boolean isPartialView()
  {
    return delegateCollection().isPartialView();
  }
  
  public int size()
  {
    return delegateCollection().size();
  }
  
  @GwtIncompatible("serialization")
  Object writeReplace()
  {
    return new SerializedForm(delegateCollection());
  }
  
  @GwtIncompatible("serialization")
  static class SerializedForm
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final ImmutableCollection<?> collection;
    
    SerializedForm(ImmutableCollection<?> paramImmutableCollection)
    {
      collection = paramImmutableCollection;
    }
    
    Object readResolve()
    {
      return collection.asList();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */