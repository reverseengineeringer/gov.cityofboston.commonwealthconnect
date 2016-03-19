package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

final class Sets$PowerSet<E>
  extends AbstractSet<Set<E>>
{
  final ImmutableMap<E, Integer> inputSet;
  
  Sets$PowerSet(Set<E> paramSet)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int i = 0;
    paramSet = ((Set)Preconditions.checkNotNull(paramSet)).iterator();
    while (paramSet.hasNext())
    {
      localBuilder.put(paramSet.next(), Integer.valueOf(i));
      i += 1;
    }
    inputSet = localBuilder.build();
    if (inputSet.size() <= 30) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Too many elements to create power set: %s > 30", new Object[] { Integer.valueOf(inputSet.size()) });
      return;
    }
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Set))
    {
      paramObject = (Set)paramObject;
      return inputSet.keySet().containsAll((Collection)paramObject);
    }
    return false;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof PowerSet))
    {
      paramObject = (PowerSet)paramObject;
      return inputSet.equals(inputSet);
    }
    return super.equals(paramObject);
  }
  
  public int hashCode()
  {
    return inputSet.keySet().hashCode() << inputSet.size() - 1;
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  public Iterator<Set<E>> iterator()
  {
    new AbstractIndexedListIterator(size())
    {
      protected Set<E> get(int paramAnonymousInt)
      {
        return new Sets.SubSet(inputSet, paramAnonymousInt);
      }
    };
  }
  
  public int size()
  {
    return 1 << inputSet.size();
  }
  
  public String toString()
  {
    return "powerSet(" + inputSet + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.PowerSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */