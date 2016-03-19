package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.AbstractSequentialList;
import java.util.Collection;
import java.util.Collections;
import java.util.ConcurrentModificationException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public class LinkedListMultimap<K, V>
  extends AbstractMultimap<K, V>
  implements ListMultimap<K, V>, Serializable
{
  @GwtIncompatible("java serialization not supported")
  private static final long serialVersionUID = 0L;
  private transient Node<K, V> head;
  private transient Map<K, KeyList<K, V>> keyToKeyList;
  private transient int modCount;
  private transient int size;
  private transient Node<K, V> tail;
  
  LinkedListMultimap()
  {
    keyToKeyList = Maps.newHashMap();
  }
  
  private LinkedListMultimap(int paramInt)
  {
    keyToKeyList = new HashMap(paramInt);
  }
  
  private LinkedListMultimap(Multimap<? extends K, ? extends V> paramMultimap)
  {
    this(paramMultimap.keySet().size());
    putAll(paramMultimap);
  }
  
  private Node<K, V> addNode(@Nullable K paramK, @Nullable V paramV, @Nullable Node<K, V> paramNode)
  {
    paramV = new Node(paramK, paramV);
    if (head == null)
    {
      tail = paramV;
      head = paramV;
      keyToKeyList.put(paramK, new KeyList(paramV));
      modCount += 1;
    }
    for (;;)
    {
      size += 1;
      return paramV;
      if (paramNode != null) {
        break;
      }
      tail.next = paramV;
      previous = tail;
      tail = paramV;
      paramNode = (KeyList)keyToKeyList.get(paramK);
      if (paramNode == null)
      {
        keyToKeyList.put(paramK, new KeyList(paramV));
        modCount += 1;
      }
      else
      {
        count += 1;
        paramK = tail;
        nextSibling = paramV;
        previousSibling = paramK;
        tail = paramV;
      }
    }
    KeyList localKeyList = (KeyList)keyToKeyList.get(paramK);
    count += 1;
    previous = previous;
    previousSibling = previousSibling;
    next = paramNode;
    nextSibling = paramNode;
    if (previousSibling == null)
    {
      keyToKeyList.get(paramK)).head = paramV;
      label253:
      if (previous != null) {
        break label289;
      }
      head = paramV;
    }
    for (;;)
    {
      previous = paramV;
      previousSibling = paramV;
      break;
      previousSibling.nextSibling = paramV;
      break label253;
      label289:
      previous.next = paramV;
    }
  }
  
  private static void checkElement(@Nullable Object paramObject)
  {
    if (paramObject == null) {
      throw new NoSuchElementException();
    }
  }
  
  public static <K, V> LinkedListMultimap<K, V> create()
  {
    return new LinkedListMultimap();
  }
  
  public static <K, V> LinkedListMultimap<K, V> create(int paramInt)
  {
    return new LinkedListMultimap(paramInt);
  }
  
  public static <K, V> LinkedListMultimap<K, V> create(Multimap<? extends K, ? extends V> paramMultimap)
  {
    return new LinkedListMultimap(paramMultimap);
  }
  
  private List<V> getCopy(@Nullable Object paramObject)
  {
    return Collections.unmodifiableList(Lists.newArrayList(new ValueForKeyIterator(paramObject)));
  }
  
  @GwtIncompatible("java.io.ObjectInputStream")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    keyToKeyList = Maps.newLinkedHashMap();
    int j = paramObjectInputStream.readInt();
    int i = 0;
    while (i < j)
    {
      put(paramObjectInputStream.readObject(), paramObjectInputStream.readObject());
      i += 1;
    }
  }
  
  private void removeAllNodes(@Nullable Object paramObject)
  {
    Iterators.clear(new ValueForKeyIterator(paramObject));
  }
  
  private void removeNode(Node<K, V> paramNode)
  {
    if (previous != null)
    {
      previous.next = next;
      if (next == null) {
        break label102;
      }
      next.previous = previous;
      label36:
      if ((previousSibling != null) || (nextSibling != null)) {
        break label113;
      }
      keyToKeyList.remove(key)).count = 0;
      modCount += 1;
    }
    for (;;)
    {
      size -= 1;
      return;
      head = next;
      break;
      label102:
      tail = previous;
      break label36;
      label113:
      KeyList localKeyList = (KeyList)keyToKeyList.get(key);
      count -= 1;
      if (previousSibling == null) {
        head = nextSibling;
      }
      for (;;)
      {
        if (nextSibling != null) {
          break label187;
        }
        tail = previousSibling;
        break;
        previousSibling.nextSibling = nextSibling;
      }
      label187:
      nextSibling.previousSibling = previousSibling;
    }
  }
  
  @GwtIncompatible("java.io.ObjectOutputStream")
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    paramObjectOutputStream.writeInt(size());
    Iterator localIterator = entries().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      paramObjectOutputStream.writeObject(localEntry.getKey());
      paramObjectOutputStream.writeObject(localEntry.getValue());
    }
  }
  
  public void clear()
  {
    head = null;
    tail = null;
    keyToKeyList.clear();
    size = 0;
    modCount += 1;
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return keyToKeyList.containsKey(paramObject);
  }
  
  public boolean containsValue(@Nullable Object paramObject)
  {
    return values().contains(paramObject);
  }
  
  Map<K, Collection<V>> createAsMap()
  {
    return new Multimaps.AsMap(this);
  }
  
  List<Map.Entry<K, V>> createEntries()
  {
    new AbstractSequentialList()
    {
      public ListIterator<Map.Entry<K, V>> listIterator(int paramAnonymousInt)
      {
        return new LinkedListMultimap.NodeIterator(LinkedListMultimap.this, paramAnonymousInt);
      }
      
      public int size()
      {
        return size;
      }
    };
  }
  
  Set<K> createKeySet()
  {
    new Sets.ImprovedAbstractSet()
    {
      public boolean contains(Object paramAnonymousObject)
      {
        return containsKey(paramAnonymousObject);
      }
      
      public Iterator<K> iterator()
      {
        return new LinkedListMultimap.DistinctKeyIterator(LinkedListMultimap.this, null);
      }
      
      public boolean remove(Object paramAnonymousObject)
      {
        return !removeAll(paramAnonymousObject).isEmpty();
      }
      
      public int size()
      {
        return keyToKeyList.size();
      }
    };
  }
  
  List<V> createValues()
  {
    new AbstractSequentialList()
    {
      public ListIterator<V> listIterator(int paramAnonymousInt)
      {
        final LinkedListMultimap.NodeIterator localNodeIterator = new LinkedListMultimap.NodeIterator(LinkedListMultimap.this, paramAnonymousInt);
        new TransformedListIterator(localNodeIterator)
        {
          public void set(V paramAnonymous2V)
          {
            localNodeIterator.setValue(paramAnonymous2V);
          }
          
          V transform(Map.Entry<K, V> paramAnonymous2Entry)
          {
            return (V)paramAnonymous2Entry.getValue();
          }
        };
      }
      
      public int size()
      {
        return size;
      }
    };
  }
  
  public List<Map.Entry<K, V>> entries()
  {
    return (List)super.entries();
  }
  
  Iterator<Map.Entry<K, V>> entryIterator()
  {
    throw new AssertionError("should never be called");
  }
  
  public List<V> get(@Nullable final K paramK)
  {
    new AbstractSequentialList()
    {
      public ListIterator<V> listIterator(int paramAnonymousInt)
      {
        return new LinkedListMultimap.ValueForKeyIterator(LinkedListMultimap.this, paramK, paramAnonymousInt);
      }
      
      public int size()
      {
        LinkedListMultimap.KeyList localKeyList = (LinkedListMultimap.KeyList)keyToKeyList.get(paramK);
        if (localKeyList == null) {
          return 0;
        }
        return count;
      }
    };
  }
  
  public boolean isEmpty()
  {
    return head == null;
  }
  
  public boolean put(@Nullable K paramK, @Nullable V paramV)
  {
    addNode(paramK, paramV, null);
    return true;
  }
  
  public List<V> removeAll(@Nullable Object paramObject)
  {
    List localList = getCopy(paramObject);
    removeAllNodes(paramObject);
    return localList;
  }
  
  public List<V> replaceValues(@Nullable K paramK, Iterable<? extends V> paramIterable)
  {
    List localList = getCopy(paramK);
    paramK = new ValueForKeyIterator(paramK);
    paramIterable = paramIterable.iterator();
    while ((paramK.hasNext()) && (paramIterable.hasNext()))
    {
      paramK.next();
      paramK.set(paramIterable.next());
    }
    while (paramK.hasNext())
    {
      paramK.next();
      paramK.remove();
    }
    while (paramIterable.hasNext()) {
      paramK.add(paramIterable.next());
    }
    return localList;
  }
  
  public int size()
  {
    return size;
  }
  
  public List<V> values()
  {
    return (List)super.values();
  }
  
  private class DistinctKeyIterator
    implements Iterator<K>
  {
    LinkedListMultimap.Node<K, V> current;
    int expectedModCount = modCount;
    LinkedListMultimap.Node<K, V> next = head;
    final Set<K> seenKeys = Sets.newHashSetWithExpectedSize(keySet().size());
    
    private DistinctKeyIterator() {}
    
    private void checkForConcurrentModification()
    {
      if (modCount != expectedModCount) {
        throw new ConcurrentModificationException();
      }
    }
    
    public boolean hasNext()
    {
      checkForConcurrentModification();
      return next != null;
    }
    
    public K next()
    {
      checkForConcurrentModification();
      LinkedListMultimap.checkElement(next);
      current = next;
      seenKeys.add(current.key);
      do
      {
        next = next.next;
      } while ((next != null) && (!seenKeys.add(next.key)));
      return (K)current.key;
    }
    
    public void remove()
    {
      checkForConcurrentModification();
      if (current != null) {}
      for (boolean bool = true;; bool = false)
      {
        CollectPreconditions.checkRemove(bool);
        LinkedListMultimap.this.removeAllNodes(current.key);
        current = null;
        expectedModCount = modCount;
        return;
      }
    }
  }
  
  private static class KeyList<K, V>
  {
    int count;
    LinkedListMultimap.Node<K, V> head;
    LinkedListMultimap.Node<K, V> tail;
    
    KeyList(LinkedListMultimap.Node<K, V> paramNode)
    {
      head = paramNode;
      tail = paramNode;
      previousSibling = null;
      nextSibling = null;
      count = 1;
    }
  }
  
  private static final class Node<K, V>
    extends AbstractMapEntry<K, V>
  {
    final K key;
    Node<K, V> next;
    Node<K, V> nextSibling;
    Node<K, V> previous;
    Node<K, V> previousSibling;
    V value;
    
    Node(@Nullable K paramK, @Nullable V paramV)
    {
      key = paramK;
      value = paramV;
    }
    
    public K getKey()
    {
      return (K)key;
    }
    
    public V getValue()
    {
      return (V)value;
    }
    
    public V setValue(@Nullable V paramV)
    {
      Object localObject = value;
      value = paramV;
      return (V)localObject;
    }
  }
  
  private class NodeIterator
    implements ListIterator<Map.Entry<K, V>>
  {
    LinkedListMultimap.Node<K, V> current;
    int expectedModCount = modCount;
    LinkedListMultimap.Node<K, V> next;
    int nextIndex;
    LinkedListMultimap.Node<K, V> previous;
    
    NodeIterator(int paramInt)
    {
      int i = size();
      Preconditions.checkPositionIndex(paramInt, i);
      if (paramInt >= i / 2)
      {
        previous = tail;
        nextIndex = i;
        while (paramInt < i)
        {
          previous();
          paramInt += 1;
        }
      }
      next = head;
      while (paramInt > 0)
      {
        next();
        paramInt -= 1;
      }
      current = null;
    }
    
    private void checkForConcurrentModification()
    {
      if (modCount != expectedModCount) {
        throw new ConcurrentModificationException();
      }
    }
    
    public void add(Map.Entry<K, V> paramEntry)
    {
      throw new UnsupportedOperationException();
    }
    
    public boolean hasNext()
    {
      checkForConcurrentModification();
      return next != null;
    }
    
    public boolean hasPrevious()
    {
      checkForConcurrentModification();
      return previous != null;
    }
    
    public LinkedListMultimap.Node<K, V> next()
    {
      checkForConcurrentModification();
      LinkedListMultimap.checkElement(next);
      LinkedListMultimap.Node localNode = next;
      current = localNode;
      previous = localNode;
      next = next.next;
      nextIndex += 1;
      return current;
    }
    
    public int nextIndex()
    {
      return nextIndex;
    }
    
    public LinkedListMultimap.Node<K, V> previous()
    {
      checkForConcurrentModification();
      LinkedListMultimap.checkElement(previous);
      LinkedListMultimap.Node localNode = previous;
      current = localNode;
      next = localNode;
      previous = previous.previous;
      nextIndex -= 1;
      return current;
    }
    
    public int previousIndex()
    {
      return nextIndex - 1;
    }
    
    public void remove()
    {
      checkForConcurrentModification();
      boolean bool;
      if (current != null)
      {
        bool = true;
        CollectPreconditions.checkRemove(bool);
        if (current == next) {
          break label82;
        }
        previous = current.previous;
        nextIndex -= 1;
      }
      for (;;)
      {
        LinkedListMultimap.this.removeNode(current);
        current = null;
        expectedModCount = modCount;
        return;
        bool = false;
        break;
        label82:
        next = current.next;
      }
    }
    
    public void set(Map.Entry<K, V> paramEntry)
    {
      throw new UnsupportedOperationException();
    }
    
    void setValue(V paramV)
    {
      if (current != null) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkState(bool);
        current.value = paramV;
        return;
      }
    }
  }
  
  private class ValueForKeyIterator
    implements ListIterator<V>
  {
    LinkedListMultimap.Node<K, V> current;
    final Object key;
    LinkedListMultimap.Node<K, V> next;
    int nextIndex;
    LinkedListMultimap.Node<K, V> previous;
    
    ValueForKeyIterator(Object paramObject)
    {
      key = paramObject;
      this$1 = (LinkedListMultimap.KeyList)keyToKeyList.get(paramObject);
      if (LinkedListMultimap.this == null) {}
      for (this$1 = null;; this$1 = head)
      {
        next = LinkedListMultimap.this;
        return;
      }
    }
    
    public ValueForKeyIterator(Object paramObject, int paramInt)
    {
      this$1 = (LinkedListMultimap.KeyList)keyToKeyList.get(paramObject);
      int i;
      if (LinkedListMultimap.this == null)
      {
        i = 0;
        Preconditions.checkPositionIndex(paramInt, i);
        if (paramInt < i / 2) {
          break label97;
        }
        if (LinkedListMultimap.this != null) {
          break label89;
        }
      }
      label89:
      for (this$1 = null;; this$1 = tail)
      {
        previous = LinkedListMultimap.this;
        nextIndex = i;
        while (paramInt < i)
        {
          previous();
          paramInt += 1;
        }
        i = count;
        break;
      }
      label97:
      if (LinkedListMultimap.this == null) {}
      for (this$1 = null;; this$1 = head)
      {
        next = LinkedListMultimap.this;
        while (paramInt > 0)
        {
          next();
          paramInt -= 1;
        }
      }
      key = paramObject;
      current = null;
    }
    
    public void add(V paramV)
    {
      previous = LinkedListMultimap.this.addNode(key, paramV, next);
      nextIndex += 1;
      current = null;
    }
    
    public boolean hasNext()
    {
      return next != null;
    }
    
    public boolean hasPrevious()
    {
      return previous != null;
    }
    
    public V next()
    {
      LinkedListMultimap.checkElement(next);
      LinkedListMultimap.Node localNode = next;
      current = localNode;
      previous = localNode;
      next = next.nextSibling;
      nextIndex += 1;
      return (V)current.value;
    }
    
    public int nextIndex()
    {
      return nextIndex;
    }
    
    public V previous()
    {
      LinkedListMultimap.checkElement(previous);
      LinkedListMultimap.Node localNode = previous;
      current = localNode;
      next = localNode;
      previous = previous.previousSibling;
      nextIndex -= 1;
      return (V)current.value;
    }
    
    public int previousIndex()
    {
      return nextIndex - 1;
    }
    
    public void remove()
    {
      boolean bool;
      if (current != null)
      {
        bool = true;
        CollectPreconditions.checkRemove(bool);
        if (current == next) {
          break label67;
        }
        previous = current.previousSibling;
        nextIndex -= 1;
      }
      for (;;)
      {
        LinkedListMultimap.this.removeNode(current);
        current = null;
        return;
        bool = false;
        break;
        label67:
        next = current.nextSibling;
      }
    }
    
    public void set(V paramV)
    {
      if (current != null) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkState(bool);
        current.value = paramV;
        return;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */