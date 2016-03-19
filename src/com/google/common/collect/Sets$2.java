package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

final class Sets$2
  extends Sets.SetView<E>
{
  Sets$2(Set paramSet1, Predicate paramPredicate, Set paramSet2)
  {
    super(null);
  }
  
  public boolean contains(Object paramObject)
  {
    return (val$set1.contains(paramObject)) && (val$set2.contains(paramObject));
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return (val$set1.containsAll(paramCollection)) && (val$set2.containsAll(paramCollection));
  }
  
  public boolean isEmpty()
  {
    return !iterator().hasNext();
  }
  
  public Iterator<E> iterator()
  {
    return Iterators.filter(val$set1.iterator(), val$inSet2);
  }
  
  public int size()
  {
    return Iterators.size(iterator());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */