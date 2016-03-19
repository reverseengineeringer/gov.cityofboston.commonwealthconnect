package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Collection;
import java.util.EnumSet;

@GwtCompatible(emulated=true, serializable=true)
final class ImmutableEnumSet<E extends Enum<E>>
  extends ImmutableSet<E>
{
  private final transient EnumSet<E> delegate;
  private transient int hashCode;
  
  private ImmutableEnumSet(EnumSet<E> paramEnumSet)
  {
    delegate = paramEnumSet;
  }
  
  static <E extends Enum<E>> ImmutableSet<E> asImmutable(EnumSet<E> paramEnumSet)
  {
    switch (paramEnumSet.size())
    {
    default: 
      return new ImmutableEnumSet(paramEnumSet);
    case 0: 
      return ImmutableSet.of();
    }
    return ImmutableSet.of(Iterables.getOnlyElement(paramEnumSet));
  }
  
  public boolean contains(Object paramObject)
  {
    return delegate.contains(paramObject);
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return delegate.containsAll(paramCollection);
  }
  
  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (delegate.equals(paramObject));
  }
  
  public int hashCode()
  {
    int j = hashCode;
    int i = j;
    if (j == 0)
    {
      i = delegate.hashCode();
      hashCode = i;
    }
    return i;
  }
  
  public boolean isEmpty()
  {
    return delegate.isEmpty();
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return Iterators.unmodifiableIterator(delegate.iterator());
  }
  
  public int size()
  {
    return delegate.size();
  }
  
  public String toString()
  {
    return delegate.toString();
  }
  
  Object writeReplace()
  {
    return new EnumSerializedForm(delegate);
  }
  
  private static class EnumSerializedForm<E extends Enum<E>>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final EnumSet<E> delegate;
    
    EnumSerializedForm(EnumSet<E> paramEnumSet)
    {
      delegate = paramEnumSet;
    }
    
    Object readResolve()
    {
      return new ImmutableEnumSet(delegate.clone(), null);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableEnumSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */