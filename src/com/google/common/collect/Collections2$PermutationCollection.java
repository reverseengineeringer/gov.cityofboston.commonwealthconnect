package com.google.common.collect;

import com.google.common.math.IntMath;
import java.util.AbstractCollection;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nullable;

final class Collections2$PermutationCollection<E>
  extends AbstractCollection<List<E>>
{
  final ImmutableList<E> inputList;
  
  Collections2$PermutationCollection(ImmutableList<E> paramImmutableList)
  {
    inputList = paramImmutableList;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if ((paramObject instanceof List))
    {
      paramObject = (List)paramObject;
      return Collections2.access$100(inputList, (List)paramObject);
    }
    return false;
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  public Iterator<List<E>> iterator()
  {
    return new Collections2.PermutationIterator(inputList);
  }
  
  public int size()
  {
    return IntMath.factorial(inputList.size());
  }
  
  public String toString()
  {
    return "permutations(" + inputList + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Collections2.PermutationCollection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */