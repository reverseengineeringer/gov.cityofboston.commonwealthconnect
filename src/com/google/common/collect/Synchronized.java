package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Collection;
import java.util.Comparator;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Queue;
import java.util.RandomAccess;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
final class Synchronized
{
  static <K, V> BiMap<K, V> biMap(BiMap<K, V> paramBiMap, @Nullable Object paramObject)
  {
    if (((paramBiMap instanceof SynchronizedBiMap)) || ((paramBiMap instanceof ImmutableBiMap))) {
      return paramBiMap;
    }
    return new SynchronizedBiMap(paramBiMap, paramObject, null, null);
  }
  
  private static <E> Collection<E> collection(Collection<E> paramCollection, @Nullable Object paramObject)
  {
    return new SynchronizedCollection(paramCollection, paramObject, null);
  }
  
  @GwtIncompatible("Deque")
  static <E> Deque<E> deque(Deque<E> paramDeque, @Nullable Object paramObject)
  {
    return new SynchronizedDeque(paramDeque, paramObject);
  }
  
  private static <E> List<E> list(List<E> paramList, @Nullable Object paramObject)
  {
    if ((paramList instanceof RandomAccess)) {
      return new SynchronizedRandomAccessList(paramList, paramObject);
    }
    return new SynchronizedList(paramList, paramObject);
  }
  
  static <K, V> ListMultimap<K, V> listMultimap(ListMultimap<K, V> paramListMultimap, @Nullable Object paramObject)
  {
    if (((paramListMultimap instanceof SynchronizedListMultimap)) || ((paramListMultimap instanceof ImmutableListMultimap))) {
      return paramListMultimap;
    }
    return new SynchronizedListMultimap(paramListMultimap, paramObject);
  }
  
  @VisibleForTesting
  static <K, V> Map<K, V> map(Map<K, V> paramMap, @Nullable Object paramObject)
  {
    return new SynchronizedMap(paramMap, paramObject);
  }
  
  static <K, V> Multimap<K, V> multimap(Multimap<K, V> paramMultimap, @Nullable Object paramObject)
  {
    if (((paramMultimap instanceof SynchronizedMultimap)) || ((paramMultimap instanceof ImmutableMultimap))) {
      return paramMultimap;
    }
    return new SynchronizedMultimap(paramMultimap, paramObject);
  }
  
  static <E> Multiset<E> multiset(Multiset<E> paramMultiset, @Nullable Object paramObject)
  {
    if (((paramMultiset instanceof SynchronizedMultiset)) || ((paramMultiset instanceof ImmutableMultiset))) {
      return paramMultiset;
    }
    return new SynchronizedMultiset(paramMultiset, paramObject);
  }
  
  @GwtIncompatible("NavigableMap")
  static <K, V> NavigableMap<K, V> navigableMap(NavigableMap<K, V> paramNavigableMap)
  {
    return navigableMap(paramNavigableMap, null);
  }
  
  @GwtIncompatible("NavigableMap")
  static <K, V> NavigableMap<K, V> navigableMap(NavigableMap<K, V> paramNavigableMap, @Nullable Object paramObject)
  {
    return new SynchronizedNavigableMap(paramNavigableMap, paramObject);
  }
  
  @GwtIncompatible("NavigableSet")
  static <E> NavigableSet<E> navigableSet(NavigableSet<E> paramNavigableSet)
  {
    return navigableSet(paramNavigableSet, null);
  }
  
  @GwtIncompatible("NavigableSet")
  static <E> NavigableSet<E> navigableSet(NavigableSet<E> paramNavigableSet, @Nullable Object paramObject)
  {
    return new SynchronizedNavigableSet(paramNavigableSet, paramObject);
  }
  
  @GwtIncompatible("works but is needed only for NavigableMap")
  private static <K, V> Map.Entry<K, V> nullableSynchronizedEntry(@Nullable Map.Entry<K, V> paramEntry, @Nullable Object paramObject)
  {
    if (paramEntry == null) {
      return null;
    }
    return new SynchronizedEntry(paramEntry, paramObject);
  }
  
  static <E> Queue<E> queue(Queue<E> paramQueue, @Nullable Object paramObject)
  {
    if ((paramQueue instanceof SynchronizedQueue)) {
      return paramQueue;
    }
    return new SynchronizedQueue(paramQueue, paramObject);
  }
  
  @VisibleForTesting
  static <E> Set<E> set(Set<E> paramSet, @Nullable Object paramObject)
  {
    return new SynchronizedSet(paramSet, paramObject);
  }
  
  static <K, V> SetMultimap<K, V> setMultimap(SetMultimap<K, V> paramSetMultimap, @Nullable Object paramObject)
  {
    if (((paramSetMultimap instanceof SynchronizedSetMultimap)) || ((paramSetMultimap instanceof ImmutableSetMultimap))) {
      return paramSetMultimap;
    }
    return new SynchronizedSetMultimap(paramSetMultimap, paramObject);
  }
  
  static <K, V> SortedMap<K, V> sortedMap(SortedMap<K, V> paramSortedMap, @Nullable Object paramObject)
  {
    return new SynchronizedSortedMap(paramSortedMap, paramObject);
  }
  
  private static <E> SortedSet<E> sortedSet(SortedSet<E> paramSortedSet, @Nullable Object paramObject)
  {
    return new SynchronizedSortedSet(paramSortedSet, paramObject);
  }
  
  static <K, V> SortedSetMultimap<K, V> sortedSetMultimap(SortedSetMultimap<K, V> paramSortedSetMultimap, @Nullable Object paramObject)
  {
    if ((paramSortedSetMultimap instanceof SynchronizedSortedSetMultimap)) {
      return paramSortedSetMultimap;
    }
    return new SynchronizedSortedSetMultimap(paramSortedSetMultimap, paramObject);
  }
  
  private static <E> Collection<E> typePreservingCollection(Collection<E> paramCollection, @Nullable Object paramObject)
  {
    if ((paramCollection instanceof SortedSet)) {
      return sortedSet((SortedSet)paramCollection, paramObject);
    }
    if ((paramCollection instanceof Set)) {
      return set((Set)paramCollection, paramObject);
    }
    if ((paramCollection instanceof List)) {
      return list((List)paramCollection, paramObject);
    }
    return collection(paramCollection, paramObject);
  }
  
  private static <E> Set<E> typePreservingSet(Set<E> paramSet, @Nullable Object paramObject)
  {
    if ((paramSet instanceof SortedSet)) {
      return sortedSet((SortedSet)paramSet, paramObject);
    }
    return set(paramSet, paramObject);
  }
  
  private static class SynchronizedAsMap<K, V>
    extends Synchronized.SynchronizedMap<K, Collection<V>>
  {
    private static final long serialVersionUID = 0L;
    transient Set<Map.Entry<K, Collection<V>>> asMapEntrySet;
    transient Collection<Collection<V>> asMapValues;
    
    SynchronizedAsMap(Map<K, Collection<V>> paramMap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public boolean containsValue(Object paramObject)
    {
      return values().contains(paramObject);
    }
    
    public Set<Map.Entry<K, Collection<V>>> entrySet()
    {
      synchronized (mutex)
      {
        if (asMapEntrySet == null) {
          asMapEntrySet = new Synchronized.SynchronizedAsMapEntries(delegate().entrySet(), mutex);
        }
        Set localSet = asMapEntrySet;
        return localSet;
      }
    }
    
    public Collection<V> get(Object paramObject)
    {
      synchronized (mutex)
      {
        paramObject = (Collection)super.get(paramObject);
        if (paramObject == null)
        {
          paramObject = null;
          return (Collection<V>)paramObject;
        }
        paramObject = Synchronized.typePreservingCollection((Collection)paramObject, mutex);
      }
    }
    
    public Collection<Collection<V>> values()
    {
      synchronized (mutex)
      {
        if (asMapValues == null) {
          asMapValues = new Synchronized.SynchronizedAsMapValues(delegate().values(), mutex);
        }
        Collection localCollection = asMapValues;
        return localCollection;
      }
    }
  }
  
  private static class SynchronizedAsMapEntries<K, V>
    extends Synchronized.SynchronizedSet<Map.Entry<K, Collection<V>>>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedAsMapEntries(Set<Map.Entry<K, Collection<V>>> paramSet, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public boolean contains(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = Maps.containsEntryImpl(delegate(), paramObject);
        return bool;
      }
    }
    
    public boolean containsAll(Collection<?> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = Collections2.containsAllImpl(delegate(), paramCollection);
        return bool;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {
        return true;
      }
      synchronized (mutex)
      {
        boolean bool = Sets.equalsImpl(delegate(), paramObject);
        return bool;
      }
    }
    
    public Iterator<Map.Entry<K, Collection<V>>> iterator()
    {
      new ForwardingIterator()
      {
        protected Iterator<Map.Entry<K, Collection<V>>> delegate()
        {
          return val$iterator;
        }
        
        public Map.Entry<K, Collection<V>> next()
        {
          new ForwardingMapEntry()
          {
            protected Map.Entry<K, Collection<V>> delegate()
            {
              return val$entry;
            }
            
            public Collection<V> getValue()
            {
              return Synchronized.typePreservingCollection((Collection)val$entry.getValue(), mutex);
            }
          };
        }
      };
    }
    
    public boolean remove(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = Maps.removeEntryImpl(delegate(), paramObject);
        return bool;
      }
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = Iterators.removeAll(delegate().iterator(), paramCollection);
        return bool;
      }
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = Iterators.retainAll(delegate().iterator(), paramCollection);
        return bool;
      }
    }
    
    public Object[] toArray()
    {
      synchronized (mutex)
      {
        Object[] arrayOfObject = ObjectArrays.toArrayImpl(delegate());
        return arrayOfObject;
      }
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      synchronized (mutex)
      {
        paramArrayOfT = ObjectArrays.toArrayImpl(delegate(), paramArrayOfT);
        return paramArrayOfT;
      }
    }
  }
  
  private static class SynchronizedAsMapValues<V>
    extends Synchronized.SynchronizedCollection<Collection<V>>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedAsMapValues(Collection<Collection<V>> paramCollection, @Nullable Object paramObject)
    {
      super(paramObject, null);
    }
    
    public Iterator<Collection<V>> iterator()
    {
      new ForwardingIterator()
      {
        protected Iterator<Collection<V>> delegate()
        {
          return val$iterator;
        }
        
        public Collection<V> next()
        {
          return Synchronized.typePreservingCollection((Collection)super.next(), mutex);
        }
      };
    }
  }
  
  @VisibleForTesting
  static class SynchronizedBiMap<K, V>
    extends Synchronized.SynchronizedMap<K, V>
    implements BiMap<K, V>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private transient BiMap<V, K> inverse;
    private transient Set<V> valueSet;
    
    private SynchronizedBiMap(BiMap<K, V> paramBiMap, @Nullable Object paramObject, @Nullable BiMap<V, K> paramBiMap1)
    {
      super(paramObject);
      inverse = paramBiMap1;
    }
    
    BiMap<K, V> delegate()
    {
      return (BiMap)super.delegate();
    }
    
    public V forcePut(K paramK, V paramV)
    {
      synchronized (mutex)
      {
        paramK = delegate().forcePut(paramK, paramV);
        return paramK;
      }
    }
    
    public BiMap<V, K> inverse()
    {
      synchronized (mutex)
      {
        if (inverse == null) {
          inverse = new SynchronizedBiMap(delegate().inverse(), mutex, this);
        }
        BiMap localBiMap = inverse;
        return localBiMap;
      }
    }
    
    public Set<V> values()
    {
      synchronized (mutex)
      {
        if (valueSet == null) {
          valueSet = Synchronized.set(delegate().values(), mutex);
        }
        Set localSet = valueSet;
        return localSet;
      }
    }
  }
  
  @VisibleForTesting
  static class SynchronizedCollection<E>
    extends Synchronized.SynchronizedObject
    implements Collection<E>
  {
    private static final long serialVersionUID = 0L;
    
    private SynchronizedCollection(Collection<E> paramCollection, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public boolean add(E paramE)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().add(paramE);
        return bool;
      }
    }
    
    public boolean addAll(Collection<? extends E> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().addAll(paramCollection);
        return bool;
      }
    }
    
    public void clear()
    {
      synchronized (mutex)
      {
        delegate().clear();
        return;
      }
    }
    
    public boolean contains(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().contains(paramObject);
        return bool;
      }
    }
    
    public boolean containsAll(Collection<?> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().containsAll(paramCollection);
        return bool;
      }
    }
    
    Collection<E> delegate()
    {
      return (Collection)super.delegate();
    }
    
    public boolean isEmpty()
    {
      synchronized (mutex)
      {
        boolean bool = delegate().isEmpty();
        return bool;
      }
    }
    
    public Iterator<E> iterator()
    {
      return delegate().iterator();
    }
    
    public boolean remove(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().remove(paramObject);
        return bool;
      }
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().removeAll(paramCollection);
        return bool;
      }
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().retainAll(paramCollection);
        return bool;
      }
    }
    
    public int size()
    {
      synchronized (mutex)
      {
        int i = delegate().size();
        return i;
      }
    }
    
    public Object[] toArray()
    {
      synchronized (mutex)
      {
        Object[] arrayOfObject = delegate().toArray();
        return arrayOfObject;
      }
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      synchronized (mutex)
      {
        paramArrayOfT = delegate().toArray(paramArrayOfT);
        return paramArrayOfT;
      }
    }
  }
  
  @GwtIncompatible("Deque")
  private static final class SynchronizedDeque<E>
    extends Synchronized.SynchronizedQueue<E>
    implements Deque<E>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedDeque(Deque<E> paramDeque, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public void addFirst(E paramE)
    {
      synchronized (mutex)
      {
        delegate().addFirst(paramE);
        return;
      }
    }
    
    public void addLast(E paramE)
    {
      synchronized (mutex)
      {
        delegate().addLast(paramE);
        return;
      }
    }
    
    Deque<E> delegate()
    {
      return (Deque)super.delegate();
    }
    
    public Iterator<E> descendingIterator()
    {
      synchronized (mutex)
      {
        Iterator localIterator = delegate().descendingIterator();
        return localIterator;
      }
    }
    
    public E getFirst()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().getFirst();
        return (E)localObject2;
      }
    }
    
    public E getLast()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().getLast();
        return (E)localObject2;
      }
    }
    
    public boolean offerFirst(E paramE)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().offerFirst(paramE);
        return bool;
      }
    }
    
    public boolean offerLast(E paramE)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().offerLast(paramE);
        return bool;
      }
    }
    
    public E peekFirst()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().peekFirst();
        return (E)localObject2;
      }
    }
    
    public E peekLast()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().peekLast();
        return (E)localObject2;
      }
    }
    
    public E pollFirst()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().pollFirst();
        return (E)localObject2;
      }
    }
    
    public E pollLast()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().pollLast();
        return (E)localObject2;
      }
    }
    
    public E pop()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().pop();
        return (E)localObject2;
      }
    }
    
    public void push(E paramE)
    {
      synchronized (mutex)
      {
        delegate().push(paramE);
        return;
      }
    }
    
    public E removeFirst()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().removeFirst();
        return (E)localObject2;
      }
    }
    
    public boolean removeFirstOccurrence(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().removeFirstOccurrence(paramObject);
        return bool;
      }
    }
    
    public E removeLast()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().removeLast();
        return (E)localObject2;
      }
    }
    
    public boolean removeLastOccurrence(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().removeLastOccurrence(paramObject);
        return bool;
      }
    }
  }
  
  @GwtIncompatible("works but is needed only for NavigableMap")
  private static class SynchronizedEntry<K, V>
    extends Synchronized.SynchronizedObject
    implements Map.Entry<K, V>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedEntry(Map.Entry<K, V> paramEntry, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    Map.Entry<K, V> delegate()
    {
      return (Map.Entry)super.delegate();
    }
    
    public boolean equals(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().equals(paramObject);
        return bool;
      }
    }
    
    public K getKey()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().getKey();
        return (K)localObject2;
      }
    }
    
    public V getValue()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().getValue();
        return (V)localObject2;
      }
    }
    
    public int hashCode()
    {
      synchronized (mutex)
      {
        int i = delegate().hashCode();
        return i;
      }
    }
    
    public V setValue(V paramV)
    {
      synchronized (mutex)
      {
        paramV = delegate().setValue(paramV);
        return paramV;
      }
    }
  }
  
  private static class SynchronizedList<E>
    extends Synchronized.SynchronizedCollection<E>
    implements List<E>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedList(List<E> paramList, @Nullable Object paramObject)
    {
      super(paramObject, null);
    }
    
    public void add(int paramInt, E paramE)
    {
      synchronized (mutex)
      {
        delegate().add(paramInt, paramE);
        return;
      }
    }
    
    public boolean addAll(int paramInt, Collection<? extends E> paramCollection)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().addAll(paramInt, paramCollection);
        return bool;
      }
    }
    
    List<E> delegate()
    {
      return (List)super.delegate();
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {
        return true;
      }
      synchronized (mutex)
      {
        boolean bool = delegate().equals(paramObject);
        return bool;
      }
    }
    
    public E get(int paramInt)
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().get(paramInt);
        return (E)localObject2;
      }
    }
    
    public int hashCode()
    {
      synchronized (mutex)
      {
        int i = delegate().hashCode();
        return i;
      }
    }
    
    public int indexOf(Object paramObject)
    {
      synchronized (mutex)
      {
        int i = delegate().indexOf(paramObject);
        return i;
      }
    }
    
    public int lastIndexOf(Object paramObject)
    {
      synchronized (mutex)
      {
        int i = delegate().lastIndexOf(paramObject);
        return i;
      }
    }
    
    public ListIterator<E> listIterator()
    {
      return delegate().listIterator();
    }
    
    public ListIterator<E> listIterator(int paramInt)
    {
      return delegate().listIterator(paramInt);
    }
    
    public E remove(int paramInt)
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().remove(paramInt);
        return (E)localObject2;
      }
    }
    
    public E set(int paramInt, E paramE)
    {
      synchronized (mutex)
      {
        paramE = delegate().set(paramInt, paramE);
        return paramE;
      }
    }
    
    public List<E> subList(int paramInt1, int paramInt2)
    {
      synchronized (mutex)
      {
        List localList = Synchronized.list(delegate().subList(paramInt1, paramInt2), mutex);
        return localList;
      }
    }
  }
  
  private static class SynchronizedListMultimap<K, V>
    extends Synchronized.SynchronizedMultimap<K, V>
    implements ListMultimap<K, V>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedListMultimap(ListMultimap<K, V> paramListMultimap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    ListMultimap<K, V> delegate()
    {
      return (ListMultimap)super.delegate();
    }
    
    public List<V> get(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.list(delegate().get(paramK), mutex);
        return paramK;
      }
    }
    
    public List<V> removeAll(Object paramObject)
    {
      synchronized (mutex)
      {
        paramObject = delegate().removeAll(paramObject);
        return (List<V>)paramObject;
      }
    }
    
    public List<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
    {
      synchronized (mutex)
      {
        paramK = delegate().replaceValues(paramK, paramIterable);
        return paramK;
      }
    }
  }
  
  private static class SynchronizedMap<K, V>
    extends Synchronized.SynchronizedObject
    implements Map<K, V>
  {
    private static final long serialVersionUID = 0L;
    transient Set<Map.Entry<K, V>> entrySet;
    transient Set<K> keySet;
    transient Collection<V> values;
    
    SynchronizedMap(Map<K, V> paramMap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public void clear()
    {
      synchronized (mutex)
      {
        delegate().clear();
        return;
      }
    }
    
    public boolean containsKey(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().containsKey(paramObject);
        return bool;
      }
    }
    
    public boolean containsValue(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().containsValue(paramObject);
        return bool;
      }
    }
    
    Map<K, V> delegate()
    {
      return (Map)super.delegate();
    }
    
    public Set<Map.Entry<K, V>> entrySet()
    {
      synchronized (mutex)
      {
        if (entrySet == null) {
          entrySet = Synchronized.set(delegate().entrySet(), mutex);
        }
        Set localSet = entrySet;
        return localSet;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {
        return true;
      }
      synchronized (mutex)
      {
        boolean bool = delegate().equals(paramObject);
        return bool;
      }
    }
    
    public V get(Object paramObject)
    {
      synchronized (mutex)
      {
        paramObject = delegate().get(paramObject);
        return (V)paramObject;
      }
    }
    
    public int hashCode()
    {
      synchronized (mutex)
      {
        int i = delegate().hashCode();
        return i;
      }
    }
    
    public boolean isEmpty()
    {
      synchronized (mutex)
      {
        boolean bool = delegate().isEmpty();
        return bool;
      }
    }
    
    public Set<K> keySet()
    {
      synchronized (mutex)
      {
        if (keySet == null) {
          keySet = Synchronized.set(delegate().keySet(), mutex);
        }
        Set localSet = keySet;
        return localSet;
      }
    }
    
    public V put(K paramK, V paramV)
    {
      synchronized (mutex)
      {
        paramK = delegate().put(paramK, paramV);
        return paramK;
      }
    }
    
    public void putAll(Map<? extends K, ? extends V> paramMap)
    {
      synchronized (mutex)
      {
        delegate().putAll(paramMap);
        return;
      }
    }
    
    public V remove(Object paramObject)
    {
      synchronized (mutex)
      {
        paramObject = delegate().remove(paramObject);
        return (V)paramObject;
      }
    }
    
    public int size()
    {
      synchronized (mutex)
      {
        int i = delegate().size();
        return i;
      }
    }
    
    public Collection<V> values()
    {
      synchronized (mutex)
      {
        if (values == null) {
          values = Synchronized.collection(delegate().values(), mutex);
        }
        Collection localCollection = values;
        return localCollection;
      }
    }
  }
  
  private static class SynchronizedMultimap<K, V>
    extends Synchronized.SynchronizedObject
    implements Multimap<K, V>
  {
    private static final long serialVersionUID = 0L;
    transient Map<K, Collection<V>> asMap;
    transient Collection<Map.Entry<K, V>> entries;
    transient Set<K> keySet;
    transient Multiset<K> keys;
    transient Collection<V> valuesCollection;
    
    SynchronizedMultimap(Multimap<K, V> paramMultimap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public Map<K, Collection<V>> asMap()
    {
      synchronized (mutex)
      {
        if (asMap == null) {
          asMap = new Synchronized.SynchronizedAsMap(delegate().asMap(), mutex);
        }
        Map localMap = asMap;
        return localMap;
      }
    }
    
    public void clear()
    {
      synchronized (mutex)
      {
        delegate().clear();
        return;
      }
    }
    
    public boolean containsEntry(Object paramObject1, Object paramObject2)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().containsEntry(paramObject1, paramObject2);
        return bool;
      }
    }
    
    public boolean containsKey(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().containsKey(paramObject);
        return bool;
      }
    }
    
    public boolean containsValue(Object paramObject)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().containsValue(paramObject);
        return bool;
      }
    }
    
    Multimap<K, V> delegate()
    {
      return (Multimap)super.delegate();
    }
    
    public Collection<Map.Entry<K, V>> entries()
    {
      synchronized (mutex)
      {
        if (entries == null) {
          entries = Synchronized.typePreservingCollection(delegate().entries(), mutex);
        }
        Collection localCollection = entries;
        return localCollection;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {
        return true;
      }
      synchronized (mutex)
      {
        boolean bool = delegate().equals(paramObject);
        return bool;
      }
    }
    
    public Collection<V> get(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.typePreservingCollection(delegate().get(paramK), mutex);
        return paramK;
      }
    }
    
    public int hashCode()
    {
      synchronized (mutex)
      {
        int i = delegate().hashCode();
        return i;
      }
    }
    
    public boolean isEmpty()
    {
      synchronized (mutex)
      {
        boolean bool = delegate().isEmpty();
        return bool;
      }
    }
    
    public Set<K> keySet()
    {
      synchronized (mutex)
      {
        if (keySet == null) {
          keySet = Synchronized.typePreservingSet(delegate().keySet(), mutex);
        }
        Set localSet = keySet;
        return localSet;
      }
    }
    
    public Multiset<K> keys()
    {
      synchronized (mutex)
      {
        if (keys == null) {
          keys = Synchronized.multiset(delegate().keys(), mutex);
        }
        Multiset localMultiset = keys;
        return localMultiset;
      }
    }
    
    public boolean put(K paramK, V paramV)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().put(paramK, paramV);
        return bool;
      }
    }
    
    public boolean putAll(Multimap<? extends K, ? extends V> paramMultimap)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().putAll(paramMultimap);
        return bool;
      }
    }
    
    public boolean putAll(K paramK, Iterable<? extends V> paramIterable)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().putAll(paramK, paramIterable);
        return bool;
      }
    }
    
    public boolean remove(Object paramObject1, Object paramObject2)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().remove(paramObject1, paramObject2);
        return bool;
      }
    }
    
    public Collection<V> removeAll(Object paramObject)
    {
      synchronized (mutex)
      {
        paramObject = delegate().removeAll(paramObject);
        return (Collection<V>)paramObject;
      }
    }
    
    public Collection<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
    {
      synchronized (mutex)
      {
        paramK = delegate().replaceValues(paramK, paramIterable);
        return paramK;
      }
    }
    
    public int size()
    {
      synchronized (mutex)
      {
        int i = delegate().size();
        return i;
      }
    }
    
    public Collection<V> values()
    {
      synchronized (mutex)
      {
        if (valuesCollection == null) {
          valuesCollection = Synchronized.collection(delegate().values(), mutex);
        }
        Collection localCollection = valuesCollection;
        return localCollection;
      }
    }
  }
  
  private static class SynchronizedMultiset<E>
    extends Synchronized.SynchronizedCollection<E>
    implements Multiset<E>
  {
    private static final long serialVersionUID = 0L;
    transient Set<E> elementSet;
    transient Set<Multiset.Entry<E>> entrySet;
    
    SynchronizedMultiset(Multiset<E> paramMultiset, @Nullable Object paramObject)
    {
      super(paramObject, null);
    }
    
    public int add(E paramE, int paramInt)
    {
      synchronized (mutex)
      {
        paramInt = delegate().add(paramE, paramInt);
        return paramInt;
      }
    }
    
    public int count(Object paramObject)
    {
      synchronized (mutex)
      {
        int i = delegate().count(paramObject);
        return i;
      }
    }
    
    Multiset<E> delegate()
    {
      return (Multiset)super.delegate();
    }
    
    public Set<E> elementSet()
    {
      synchronized (mutex)
      {
        if (elementSet == null) {
          elementSet = Synchronized.typePreservingSet(delegate().elementSet(), mutex);
        }
        Set localSet = elementSet;
        return localSet;
      }
    }
    
    public Set<Multiset.Entry<E>> entrySet()
    {
      synchronized (mutex)
      {
        if (entrySet == null) {
          entrySet = Synchronized.typePreservingSet(delegate().entrySet(), mutex);
        }
        Set localSet = entrySet;
        return localSet;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {
        return true;
      }
      synchronized (mutex)
      {
        boolean bool = delegate().equals(paramObject);
        return bool;
      }
    }
    
    public int hashCode()
    {
      synchronized (mutex)
      {
        int i = delegate().hashCode();
        return i;
      }
    }
    
    public int remove(Object paramObject, int paramInt)
    {
      synchronized (mutex)
      {
        paramInt = delegate().remove(paramObject, paramInt);
        return paramInt;
      }
    }
    
    public int setCount(E paramE, int paramInt)
    {
      synchronized (mutex)
      {
        paramInt = delegate().setCount(paramE, paramInt);
        return paramInt;
      }
    }
    
    public boolean setCount(E paramE, int paramInt1, int paramInt2)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().setCount(paramE, paramInt1, paramInt2);
        return bool;
      }
    }
  }
  
  @GwtIncompatible("NavigableMap")
  @VisibleForTesting
  static class SynchronizedNavigableMap<K, V>
    extends Synchronized.SynchronizedSortedMap<K, V>
    implements NavigableMap<K, V>
  {
    private static final long serialVersionUID = 0L;
    transient NavigableSet<K> descendingKeySet;
    transient NavigableMap<K, V> descendingMap;
    transient NavigableSet<K> navigableKeySet;
    
    SynchronizedNavigableMap(NavigableMap<K, V> paramNavigableMap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public Map.Entry<K, V> ceilingEntry(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.nullableSynchronizedEntry(delegate().ceilingEntry(paramK), mutex);
        return paramK;
      }
    }
    
    public K ceilingKey(K paramK)
    {
      synchronized (mutex)
      {
        paramK = delegate().ceilingKey(paramK);
        return paramK;
      }
    }
    
    NavigableMap<K, V> delegate()
    {
      return (NavigableMap)super.delegate();
    }
    
    public NavigableSet<K> descendingKeySet()
    {
      synchronized (mutex)
      {
        if (descendingKeySet == null)
        {
          localNavigableSet = Synchronized.navigableSet(delegate().descendingKeySet(), mutex);
          descendingKeySet = localNavigableSet;
          return localNavigableSet;
        }
        NavigableSet localNavigableSet = descendingKeySet;
        return localNavigableSet;
      }
    }
    
    public NavigableMap<K, V> descendingMap()
    {
      synchronized (mutex)
      {
        if (descendingMap == null)
        {
          localNavigableMap = Synchronized.navigableMap(delegate().descendingMap(), mutex);
          descendingMap = localNavigableMap;
          return localNavigableMap;
        }
        NavigableMap localNavigableMap = descendingMap;
        return localNavigableMap;
      }
    }
    
    public Map.Entry<K, V> firstEntry()
    {
      synchronized (mutex)
      {
        Map.Entry localEntry = Synchronized.nullableSynchronizedEntry(delegate().firstEntry(), mutex);
        return localEntry;
      }
    }
    
    public Map.Entry<K, V> floorEntry(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.nullableSynchronizedEntry(delegate().floorEntry(paramK), mutex);
        return paramK;
      }
    }
    
    public K floorKey(K paramK)
    {
      synchronized (mutex)
      {
        paramK = delegate().floorKey(paramK);
        return paramK;
      }
    }
    
    public NavigableMap<K, V> headMap(K paramK, boolean paramBoolean)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.navigableMap(delegate().headMap(paramK, paramBoolean), mutex);
        return paramK;
      }
    }
    
    public SortedMap<K, V> headMap(K paramK)
    {
      return headMap(paramK, false);
    }
    
    public Map.Entry<K, V> higherEntry(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.nullableSynchronizedEntry(delegate().higherEntry(paramK), mutex);
        return paramK;
      }
    }
    
    public K higherKey(K paramK)
    {
      synchronized (mutex)
      {
        paramK = delegate().higherKey(paramK);
        return paramK;
      }
    }
    
    public Set<K> keySet()
    {
      return navigableKeySet();
    }
    
    public Map.Entry<K, V> lastEntry()
    {
      synchronized (mutex)
      {
        Map.Entry localEntry = Synchronized.nullableSynchronizedEntry(delegate().lastEntry(), mutex);
        return localEntry;
      }
    }
    
    public Map.Entry<K, V> lowerEntry(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.nullableSynchronizedEntry(delegate().lowerEntry(paramK), mutex);
        return paramK;
      }
    }
    
    public K lowerKey(K paramK)
    {
      synchronized (mutex)
      {
        paramK = delegate().lowerKey(paramK);
        return paramK;
      }
    }
    
    public NavigableSet<K> navigableKeySet()
    {
      synchronized (mutex)
      {
        if (navigableKeySet == null)
        {
          localNavigableSet = Synchronized.navigableSet(delegate().navigableKeySet(), mutex);
          navigableKeySet = localNavigableSet;
          return localNavigableSet;
        }
        NavigableSet localNavigableSet = navigableKeySet;
        return localNavigableSet;
      }
    }
    
    public Map.Entry<K, V> pollFirstEntry()
    {
      synchronized (mutex)
      {
        Map.Entry localEntry = Synchronized.nullableSynchronizedEntry(delegate().pollFirstEntry(), mutex);
        return localEntry;
      }
    }
    
    public Map.Entry<K, V> pollLastEntry()
    {
      synchronized (mutex)
      {
        Map.Entry localEntry = Synchronized.nullableSynchronizedEntry(delegate().pollLastEntry(), mutex);
        return localEntry;
      }
    }
    
    public NavigableMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
    {
      synchronized (mutex)
      {
        paramK1 = Synchronized.navigableMap(delegate().subMap(paramK1, paramBoolean1, paramK2, paramBoolean2), mutex);
        return paramK1;
      }
    }
    
    public SortedMap<K, V> subMap(K paramK1, K paramK2)
    {
      return subMap(paramK1, true, paramK2, false);
    }
    
    public NavigableMap<K, V> tailMap(K paramK, boolean paramBoolean)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.navigableMap(delegate().tailMap(paramK, paramBoolean), mutex);
        return paramK;
      }
    }
    
    public SortedMap<K, V> tailMap(K paramK)
    {
      return tailMap(paramK, true);
    }
  }
  
  @GwtIncompatible("NavigableSet")
  @VisibleForTesting
  static class SynchronizedNavigableSet<E>
    extends Synchronized.SynchronizedSortedSet<E>
    implements NavigableSet<E>
  {
    private static final long serialVersionUID = 0L;
    transient NavigableSet<E> descendingSet;
    
    SynchronizedNavigableSet(NavigableSet<E> paramNavigableSet, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public E ceiling(E paramE)
    {
      synchronized (mutex)
      {
        paramE = delegate().ceiling(paramE);
        return paramE;
      }
    }
    
    NavigableSet<E> delegate()
    {
      return (NavigableSet)super.delegate();
    }
    
    public Iterator<E> descendingIterator()
    {
      return delegate().descendingIterator();
    }
    
    public NavigableSet<E> descendingSet()
    {
      synchronized (mutex)
      {
        if (descendingSet == null)
        {
          localNavigableSet = Synchronized.navigableSet(delegate().descendingSet(), mutex);
          descendingSet = localNavigableSet;
          return localNavigableSet;
        }
        NavigableSet localNavigableSet = descendingSet;
        return localNavigableSet;
      }
    }
    
    public E floor(E paramE)
    {
      synchronized (mutex)
      {
        paramE = delegate().floor(paramE);
        return paramE;
      }
    }
    
    public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
    {
      synchronized (mutex)
      {
        paramE = Synchronized.navigableSet(delegate().headSet(paramE, paramBoolean), mutex);
        return paramE;
      }
    }
    
    public SortedSet<E> headSet(E paramE)
    {
      return headSet(paramE, false);
    }
    
    public E higher(E paramE)
    {
      synchronized (mutex)
      {
        paramE = delegate().higher(paramE);
        return paramE;
      }
    }
    
    public E lower(E paramE)
    {
      synchronized (mutex)
      {
        paramE = delegate().lower(paramE);
        return paramE;
      }
    }
    
    public E pollFirst()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().pollFirst();
        return (E)localObject2;
      }
    }
    
    public E pollLast()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().pollLast();
        return (E)localObject2;
      }
    }
    
    public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
    {
      synchronized (mutex)
      {
        paramE1 = Synchronized.navigableSet(delegate().subSet(paramE1, paramBoolean1, paramE2, paramBoolean2), mutex);
        return paramE1;
      }
    }
    
    public SortedSet<E> subSet(E paramE1, E paramE2)
    {
      return subSet(paramE1, true, paramE2, false);
    }
    
    public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
    {
      synchronized (mutex)
      {
        paramE = Synchronized.navigableSet(delegate().tailSet(paramE, paramBoolean), mutex);
        return paramE;
      }
    }
    
    public SortedSet<E> tailSet(E paramE)
    {
      return tailSet(paramE, true);
    }
  }
  
  static class SynchronizedObject
    implements Serializable
  {
    @GwtIncompatible("not needed in emulated source")
    private static final long serialVersionUID = 0L;
    final Object delegate;
    final Object mutex;
    
    SynchronizedObject(Object paramObject1, @Nullable Object paramObject2)
    {
      delegate = Preconditions.checkNotNull(paramObject1);
      paramObject1 = paramObject2;
      if (paramObject2 == null) {
        paramObject1 = this;
      }
      mutex = paramObject1;
    }
    
    @GwtIncompatible("java.io.ObjectOutputStream")
    private void writeObject(ObjectOutputStream paramObjectOutputStream)
      throws IOException
    {
      synchronized (mutex)
      {
        paramObjectOutputStream.defaultWriteObject();
        return;
      }
    }
    
    Object delegate()
    {
      return delegate;
    }
    
    public String toString()
    {
      synchronized (mutex)
      {
        String str = delegate.toString();
        return str;
      }
    }
  }
  
  private static class SynchronizedQueue<E>
    extends Synchronized.SynchronizedCollection<E>
    implements Queue<E>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedQueue(Queue<E> paramQueue, @Nullable Object paramObject)
    {
      super(paramObject, null);
    }
    
    Queue<E> delegate()
    {
      return (Queue)super.delegate();
    }
    
    public E element()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().element();
        return (E)localObject2;
      }
    }
    
    public boolean offer(E paramE)
    {
      synchronized (mutex)
      {
        boolean bool = delegate().offer(paramE);
        return bool;
      }
    }
    
    public E peek()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().peek();
        return (E)localObject2;
      }
    }
    
    public E poll()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().poll();
        return (E)localObject2;
      }
    }
    
    public E remove()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().remove();
        return (E)localObject2;
      }
    }
  }
  
  private static class SynchronizedRandomAccessList<E>
    extends Synchronized.SynchronizedList<E>
    implements RandomAccess
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedRandomAccessList(List<E> paramList, @Nullable Object paramObject)
    {
      super(paramObject);
    }
  }
  
  static class SynchronizedSet<E>
    extends Synchronized.SynchronizedCollection<E>
    implements Set<E>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedSet(Set<E> paramSet, @Nullable Object paramObject)
    {
      super(paramObject, null);
    }
    
    Set<E> delegate()
    {
      return (Set)super.delegate();
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == this) {
        return true;
      }
      synchronized (mutex)
      {
        boolean bool = delegate().equals(paramObject);
        return bool;
      }
    }
    
    public int hashCode()
    {
      synchronized (mutex)
      {
        int i = delegate().hashCode();
        return i;
      }
    }
  }
  
  private static class SynchronizedSetMultimap<K, V>
    extends Synchronized.SynchronizedMultimap<K, V>
    implements SetMultimap<K, V>
  {
    private static final long serialVersionUID = 0L;
    transient Set<Map.Entry<K, V>> entrySet;
    
    SynchronizedSetMultimap(SetMultimap<K, V> paramSetMultimap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    SetMultimap<K, V> delegate()
    {
      return (SetMultimap)super.delegate();
    }
    
    public Set<Map.Entry<K, V>> entries()
    {
      synchronized (mutex)
      {
        if (entrySet == null) {
          entrySet = Synchronized.set(delegate().entries(), mutex);
        }
        Set localSet = entrySet;
        return localSet;
      }
    }
    
    public Set<V> get(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.set(delegate().get(paramK), mutex);
        return paramK;
      }
    }
    
    public Set<V> removeAll(Object paramObject)
    {
      synchronized (mutex)
      {
        paramObject = delegate().removeAll(paramObject);
        return (Set<V>)paramObject;
      }
    }
    
    public Set<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
    {
      synchronized (mutex)
      {
        paramK = delegate().replaceValues(paramK, paramIterable);
        return paramK;
      }
    }
  }
  
  static class SynchronizedSortedMap<K, V>
    extends Synchronized.SynchronizedMap<K, V>
    implements SortedMap<K, V>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedSortedMap(SortedMap<K, V> paramSortedMap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public Comparator<? super K> comparator()
    {
      synchronized (mutex)
      {
        Comparator localComparator = delegate().comparator();
        return localComparator;
      }
    }
    
    SortedMap<K, V> delegate()
    {
      return (SortedMap)super.delegate();
    }
    
    public K firstKey()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().firstKey();
        return (K)localObject2;
      }
    }
    
    public SortedMap<K, V> headMap(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.sortedMap(delegate().headMap(paramK), mutex);
        return paramK;
      }
    }
    
    public K lastKey()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().lastKey();
        return (K)localObject2;
      }
    }
    
    public SortedMap<K, V> subMap(K paramK1, K paramK2)
    {
      synchronized (mutex)
      {
        paramK1 = Synchronized.sortedMap(delegate().subMap(paramK1, paramK2), mutex);
        return paramK1;
      }
    }
    
    public SortedMap<K, V> tailMap(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.sortedMap(delegate().tailMap(paramK), mutex);
        return paramK;
      }
    }
  }
  
  static class SynchronizedSortedSet<E>
    extends Synchronized.SynchronizedSet<E>
    implements SortedSet<E>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedSortedSet(SortedSet<E> paramSortedSet, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    public Comparator<? super E> comparator()
    {
      synchronized (mutex)
      {
        Comparator localComparator = delegate().comparator();
        return localComparator;
      }
    }
    
    SortedSet<E> delegate()
    {
      return (SortedSet)super.delegate();
    }
    
    public E first()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().first();
        return (E)localObject2;
      }
    }
    
    public SortedSet<E> headSet(E paramE)
    {
      synchronized (mutex)
      {
        paramE = Synchronized.sortedSet(delegate().headSet(paramE), mutex);
        return paramE;
      }
    }
    
    public E last()
    {
      synchronized (mutex)
      {
        Object localObject2 = delegate().last();
        return (E)localObject2;
      }
    }
    
    public SortedSet<E> subSet(E paramE1, E paramE2)
    {
      synchronized (mutex)
      {
        paramE1 = Synchronized.sortedSet(delegate().subSet(paramE1, paramE2), mutex);
        return paramE1;
      }
    }
    
    public SortedSet<E> tailSet(E paramE)
    {
      synchronized (mutex)
      {
        paramE = Synchronized.sortedSet(delegate().tailSet(paramE), mutex);
        return paramE;
      }
    }
  }
  
  private static class SynchronizedSortedSetMultimap<K, V>
    extends Synchronized.SynchronizedSetMultimap<K, V>
    implements SortedSetMultimap<K, V>
  {
    private static final long serialVersionUID = 0L;
    
    SynchronizedSortedSetMultimap(SortedSetMultimap<K, V> paramSortedSetMultimap, @Nullable Object paramObject)
    {
      super(paramObject);
    }
    
    SortedSetMultimap<K, V> delegate()
    {
      return (SortedSetMultimap)super.delegate();
    }
    
    public SortedSet<V> get(K paramK)
    {
      synchronized (mutex)
      {
        paramK = Synchronized.sortedSet(delegate().get(paramK), mutex);
        return paramK;
      }
    }
    
    public SortedSet<V> removeAll(Object paramObject)
    {
      synchronized (mutex)
      {
        paramObject = delegate().removeAll(paramObject);
        return (SortedSet<V>)paramObject;
      }
    }
    
    public SortedSet<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
    {
      synchronized (mutex)
      {
        paramK = delegate().replaceValues(paramK, paramIterable);
        return paramK;
      }
    }
    
    public Comparator<? super V> valueComparator()
    {
      synchronized (mutex)
      {
        Comparator localComparator = delegate().valueComparator();
        return localComparator;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */