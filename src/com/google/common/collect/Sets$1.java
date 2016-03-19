package com.google.common.collect;

import java.util.Iterator;
import java.util.Set;

final class Sets$1
  extends Sets.SetView<E>
{
  Sets$1(Set paramSet1, Set paramSet2, Set paramSet3)
  {
    super(null);
  }
  
  public boolean contains(Object paramObject)
  {
    return (val$set1.contains(paramObject)) || (val$set2.contains(paramObject));
  }
  
  public <S extends Set<E>> S copyInto(S paramS)
  {
    paramS.addAll(val$set1);
    paramS.addAll(val$set2);
    return paramS;
  }
  
  public ImmutableSet<E> immutableCopy()
  {
    return new ImmutableSet.Builder().addAll(val$set1).addAll(val$set2).build();
  }
  
  public boolean isEmpty()
  {
    return (val$set1.isEmpty()) && (val$set2.isEmpty());
  }
  
  public Iterator<E> iterator()
  {
    return Iterators.unmodifiableIterator(Iterators.concat(val$set1.iterator(), val$set2minus1.iterator()));
  }
  
  public int size()
  {
    return val$set1.size() + val$set2minus1.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */