package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Collection;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class EmptyImmutableSet
  extends ImmutableSet<Object>
{
  static final EmptyImmutableSet INSTANCE = new EmptyImmutableSet();
  private static final long serialVersionUID = 0L;
  
  public ImmutableList<Object> asList()
  {
    return ImmutableList.of();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return false;
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return paramCollection.isEmpty();
  }
  
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    return paramInt;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Set)) {
      return ((Set)paramObject).isEmpty();
    }
    return false;
  }
  
  public final int hashCode()
  {
    return 0;
  }
  
  public boolean isEmpty()
  {
    return true;
  }
  
  boolean isHashCodeFast()
  {
    return true;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<Object> iterator()
  {
    return Iterators.emptyIterator();
  }
  
  Object readResolve()
  {
    return INSTANCE;
  }
  
  public int size()
  {
    return 0;
  }
  
  public String toString()
  {
    return "[]";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.EmptyImmutableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */