package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class AbstractBiMap$KeySet
  extends ForwardingSet<K>
{
  private AbstractBiMap$KeySet(AbstractBiMap paramAbstractBiMap) {}
  
  public void clear()
  {
    this$0.clear();
  }
  
  protected Set<K> delegate()
  {
    return AbstractBiMap.access$200(this$0).keySet();
  }
  
  public Iterator<K> iterator()
  {
    return Maps.keyIterator(this$0.entrySet().iterator());
  }
  
  public boolean remove(Object paramObject)
  {
    if (!contains(paramObject)) {
      return false;
    }
    AbstractBiMap.access$300(this$0, paramObject);
    return true;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return standardRemoveAll(paramCollection);
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return standardRetainAll(paramCollection);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractBiMap.KeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */