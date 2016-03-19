package com.google.common.collect;

import com.google.common.base.Equivalence;

class Interners$WeakInterner<E>
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

/* Location:
 * Qualified Name:     com.google.common.collect.Interners.WeakInterner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */