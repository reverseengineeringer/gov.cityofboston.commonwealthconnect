package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.Nullable;

class Multimaps$Keys$KeysEntrySet
  extends Multisets.EntrySet<K>
{
  Multimaps$Keys$KeysEntrySet(Multimaps.Keys paramKeys) {}
  
  public boolean contains(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Multiset.Entry))
    {
      paramObject = (Multiset.Entry)paramObject;
      Collection localCollection = (Collection)this$0.multimap.asMap().get(((Multiset.Entry)paramObject).getElement());
      bool1 = bool2;
      if (localCollection != null)
      {
        bool1 = bool2;
        if (localCollection.size() == ((Multiset.Entry)paramObject).getCount()) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public boolean isEmpty()
  {
    return this$0.multimap.isEmpty();
  }
  
  public Iterator<Multiset.Entry<K>> iterator()
  {
    return this$0.entryIterator();
  }
  
  Multiset<K> multiset()
  {
    return this$0;
  }
  
  public boolean remove(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Multiset.Entry))
    {
      paramObject = (Multiset.Entry)paramObject;
      Collection localCollection = (Collection)this$0.multimap.asMap().get(((Multiset.Entry)paramObject).getElement());
      if ((localCollection != null) && (localCollection.size() == ((Multiset.Entry)paramObject).getCount()))
      {
        localCollection.clear();
        return true;
      }
    }
    return false;
  }
  
  public int size()
  {
    return this$0.distinctElements();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.Keys.KeysEntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */