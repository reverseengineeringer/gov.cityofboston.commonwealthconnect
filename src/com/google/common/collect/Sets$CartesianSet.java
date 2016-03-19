package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.annotation.Nullable;

final class Sets$CartesianSet<E>
  extends ForwardingCollection<List<E>>
  implements Set<List<E>>
{
  private final transient ImmutableList<ImmutableSet<E>> axes;
  private final transient CartesianList<E> delegate;
  
  private Sets$CartesianSet(ImmutableList<ImmutableSet<E>> paramImmutableList, CartesianList<E> paramCartesianList)
  {
    axes = paramImmutableList;
    delegate = paramCartesianList;
  }
  
  static <E> Set<List<E>> create(List<? extends Set<? extends E>> paramList)
  {
    ImmutableList.Builder localBuilder = new ImmutableList.Builder(paramList.size());
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      ImmutableSet localImmutableSet = ImmutableSet.copyOf((Set)paramList.next());
      if (localImmutableSet.isEmpty()) {
        return ImmutableSet.of();
      }
      localBuilder.add(localImmutableSet);
    }
    paramList = localBuilder.build();
    new CartesianSet(paramList, new CartesianList(new ImmutableList()
    {
      public List<E> get(int paramAnonymousInt)
      {
        return ((ImmutableSet)val$axes.get(paramAnonymousInt)).asList();
      }
      
      boolean isPartialView()
      {
        return true;
      }
      
      public int size()
      {
        return val$axes.size();
      }
    }));
  }
  
  protected Collection<List<E>> delegate()
  {
    return delegate;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof CartesianSet))
    {
      paramObject = (CartesianSet)paramObject;
      return axes.equals(axes);
    }
    return super.equals(paramObject);
  }
  
  public int hashCode()
  {
    int i = size() - 1;
    int j = 0;
    while (j < axes.size())
    {
      i = i * 31 ^ 0xFFFFFFFF ^ 0xFFFFFFFF;
      j += 1;
    }
    j = 1;
    Iterator localIterator = axes.iterator();
    while (localIterator.hasNext())
    {
      Set localSet = (Set)localIterator.next();
      j = j * 31 + size() / localSet.size() * localSet.hashCode() ^ 0xFFFFFFFF ^ 0xFFFFFFFF;
    }
    return j + i ^ 0xFFFFFFFF ^ 0xFFFFFFFF;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.CartesianSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */