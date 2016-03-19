package com.google.common.collect;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

class LinkedHashMultimap$ValueSet$1
  implements Iterator<V>
{
  int expectedModCount = LinkedHashMultimap.ValueSet.access$100(this$1);
  LinkedHashMultimap.ValueSetLink<K, V> nextEntry = LinkedHashMultimap.ValueSet.access$000(this$1);
  LinkedHashMultimap.ValueEntry<K, V> toRemove;
  
  LinkedHashMultimap$ValueSet$1(LinkedHashMultimap.ValueSet paramValueSet) {}
  
  private void checkForComodification()
  {
    if (LinkedHashMultimap.ValueSet.access$100(this$1) != expectedModCount) {
      throw new ConcurrentModificationException();
    }
  }
  
  public boolean hasNext()
  {
    checkForComodification();
    return nextEntry != this$1;
  }
  
  public V next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    LinkedHashMultimap.ValueEntry localValueEntry = (LinkedHashMultimap.ValueEntry)nextEntry;
    Object localObject = localValueEntry.getValue();
    toRemove = localValueEntry;
    nextEntry = localValueEntry.getSuccessorInValueSet();
    return (V)localObject;
  }
  
  public void remove()
  {
    checkForComodification();
    if (toRemove != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      this$1.remove(toRemove.getValue());
      expectedModCount = LinkedHashMultimap.ValueSet.access$100(this$1);
      toRemove = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedHashMultimap.ValueSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */