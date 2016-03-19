package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Equivalence;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.concurrent.ConcurrentMap;

@Beta
public final class Interners
{
  public static <E> Function<E, E> asFunction(Interner<E> paramInterner)
  {
    return new InternerFunction((Interner)Preconditions.checkNotNull(paramInterner));
  }
  
  public static <E> Interner<E> newStrongInterner()
  {
    new Interner()
    {
      public E intern(E paramAnonymousE)
      {
        Object localObject = val$map.putIfAbsent(Preconditions.checkNotNull(paramAnonymousE), paramAnonymousE);
        if (localObject == null) {
          return paramAnonymousE;
        }
        return (E)localObject;
      }
    };
  }
  
  @GwtIncompatible("java.lang.ref.WeakReference")
  public static <E> Interner<E> newWeakInterner()
  {
    return new WeakInterner(null);
  }
  
  private static class InternerFunction<E>
    implements Function<E, E>
  {
    private final Interner<E> interner;
    
    public InternerFunction(Interner<E> paramInterner)
    {
      interner = paramInterner;
    }
    
    public E apply(E paramE)
    {
      return (E)interner.intern(paramE);
    }
    
    public boolean equals(Object paramObject)
    {
      if ((paramObject instanceof InternerFunction))
      {
        paramObject = (InternerFunction)paramObject;
        return interner.equals(interner);
      }
      return false;
    }
    
    public int hashCode()
    {
      return interner.hashCode();
    }
  }
  
  private static class WeakInterner<E>
    implements Interner<E>
  {
    private final MapMakerInternalMap<E, Dummy> map = new MapMaker().weakKeys().keyEquivalence(Equivalence.equals()).makeCustomMap();
    
    public E intern(E paramE)
    {
      do
      {
        Object localObject = map.getEntry(paramE);
        if (localObject != null)
        {
          localObject = ((MapMakerInternalMap.ReferenceEntry)localObject).getKey();
          if (localObject != null) {
            return (E)localObject;
          }
        }
      } while ((Dummy)map.putIfAbsent(paramE, Dummy.VALUE) != null);
      return paramE;
    }
    
    private static enum Dummy
    {
      VALUE;
      
      private Dummy() {}
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Interners
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */