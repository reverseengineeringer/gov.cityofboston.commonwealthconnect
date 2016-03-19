package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import com.google.common.primitives.Ints;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nullable;

public final class ConcurrentHashMultiset<E>
  extends AbstractMultiset<E>
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  private final transient ConcurrentMap<E, AtomicInteger> countMap;
  private transient ConcurrentHashMultiset<E>.EntrySet entrySet;
  
  @VisibleForTesting
  ConcurrentHashMultiset(ConcurrentMap<E, AtomicInteger> paramConcurrentMap)
  {
    Preconditions.checkArgument(paramConcurrentMap.isEmpty());
    countMap = paramConcurrentMap;
  }
  
  public static <E> ConcurrentHashMultiset<E> create()
  {
    return new ConcurrentHashMultiset(new ConcurrentHashMap());
  }
  
  @Beta
  public static <E> ConcurrentHashMultiset<E> create(MapMaker paramMapMaker)
  {
    return new ConcurrentHashMultiset(paramMapMaker.makeMap());
  }
  
  public static <E> ConcurrentHashMultiset<E> create(Iterable<? extends E> paramIterable)
  {
    ConcurrentHashMultiset localConcurrentHashMultiset = create();
    Iterables.addAll(localConcurrentHashMultiset, paramIterable);
    return localConcurrentHashMultiset;
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    paramObjectInputStream = (ConcurrentMap)paramObjectInputStream.readObject();
    FieldSettersHolder.COUNT_MAP_FIELD_SETTER.set(this, paramObjectInputStream);
  }
  
  private List<E> snapshot()
  {
    ArrayList localArrayList = Lists.newArrayListWithExpectedSize(size());
    Iterator localIterator = entrySet().iterator();
    while (localIterator.hasNext())
    {
      Multiset.Entry localEntry = (Multiset.Entry)localIterator.next();
      Object localObject = localEntry.getElement();
      int i = localEntry.getCount();
      while (i > 0)
      {
        localArrayList.add(localObject);
        i -= 1;
      }
    }
    return localArrayList;
  }
  
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    paramObjectOutputStream.writeObject(countMap);
  }
  
  public int add(E paramE, int paramInt)
  {
    int j = 0;
    Preconditions.checkNotNull(paramE);
    int i;
    if (paramInt == 0)
    {
      i = count(paramE);
      return i;
    }
    boolean bool;
    if (paramInt > 0)
    {
      bool = true;
      label27:
      Preconditions.checkArgument(bool, "Invalid occurrences: %s", new Object[] { Integer.valueOf(paramInt) });
    }
    AtomicInteger localAtomicInteger2;
    AtomicInteger localAtomicInteger1;
    do
    {
      localAtomicInteger2 = (AtomicInteger)Maps.safeGet(countMap, paramE);
      localAtomicInteger1 = localAtomicInteger2;
      if (localAtomicInteger2 == null)
      {
        localAtomicInteger1 = (AtomicInteger)countMap.putIfAbsent(paramE, new AtomicInteger(paramInt));
        i = j;
        if (localAtomicInteger1 == null) {
          break;
        }
      }
      for (;;)
      {
        i = localAtomicInteger1.get();
        if (i == 0) {
          break;
        }
        try
        {
          bool = localAtomicInteger1.compareAndSet(i, IntMath.checkedAdd(i, paramInt));
          if (bool) {
            return i;
          }
        }
        catch (ArithmeticException paramE)
        {
          throw new IllegalArgumentException("Overflow adding " + paramInt + " occurrences to a count of " + i);
        }
      }
      bool = false;
      break label27;
      localAtomicInteger2 = new AtomicInteger(paramInt);
      i = j;
      if (countMap.putIfAbsent(paramE, localAtomicInteger2) == null) {
        break;
      }
    } while (!countMap.replace(paramE, localAtomicInteger1, localAtomicInteger2));
    return 0;
  }
  
  public void clear()
  {
    countMap.clear();
  }
  
  public int count(@Nullable Object paramObject)
  {
    paramObject = (AtomicInteger)Maps.safeGet(countMap, paramObject);
    if (paramObject == null) {
      return 0;
    }
    return ((AtomicInteger)paramObject).get();
  }
  
  Set<E> createElementSet()
  {
    new ForwardingSet()
    {
      public boolean contains(@Nullable Object paramAnonymousObject)
      {
        return (paramAnonymousObject != null) && (Collections2.safeContains(val$delegate, paramAnonymousObject));
      }
      
      public boolean containsAll(Collection<?> paramAnonymousCollection)
      {
        return standardContainsAll(paramAnonymousCollection);
      }
      
      protected Set<E> delegate()
      {
        return val$delegate;
      }
      
      public boolean remove(Object paramAnonymousObject)
      {
        return (paramAnonymousObject != null) && (Collections2.safeRemove(val$delegate, paramAnonymousObject));
      }
      
      public boolean removeAll(Collection<?> paramAnonymousCollection)
      {
        return standardRemoveAll(paramAnonymousCollection);
      }
    };
  }
  
  int distinctElements()
  {
    return countMap.size();
  }
  
  Iterator<Multiset.Entry<E>> entryIterator()
  {
    new ForwardingIterator()
    {
      private Iterator<Map.Entry<E, AtomicInteger>> mapEntries = countMap.entrySet().iterator();
      
      protected Multiset.Entry<E> computeNext()
      {
        Map.Entry localEntry;
        int i;
        do
        {
          if (!mapEntries.hasNext()) {
            return (Multiset.Entry)endOfData();
          }
          localEntry = (Map.Entry)mapEntries.next();
          i = ((AtomicInteger)localEntry.getValue()).get();
        } while (i == 0);
        return Multisets.immutableEntry(localEntry.getKey(), i);
      }
    }
    {
      private Multiset.Entry<E> last;
      
      protected Iterator<Multiset.Entry<E>> delegate()
      {
        return val$readOnlyIterator;
      }
      
      public Multiset.Entry<E> next()
      {
        last = ((Multiset.Entry)super.next());
        return last;
      }
      
      public void remove()
      {
        if (last != null) {}
        for (boolean bool = true;; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          setCount(last.getElement(), 0);
          last = null;
          return;
        }
      }
    };
  }
  
  public Set<Multiset.Entry<E>> entrySet()
  {
    EntrySet localEntrySet2 = entrySet;
    EntrySet localEntrySet1 = localEntrySet2;
    if (localEntrySet2 == null)
    {
      localEntrySet1 = new EntrySet(null);
      entrySet = localEntrySet1;
    }
    return localEntrySet1;
  }
  
  public boolean isEmpty()
  {
    return countMap.isEmpty();
  }
  
  public int remove(@Nullable Object paramObject, int paramInt)
  {
    int j = 0;
    int i;
    if (paramInt == 0)
    {
      i = count(paramObject);
      return i;
    }
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Invalid occurrences: %s", new Object[] { Integer.valueOf(paramInt) });
      AtomicInteger localAtomicInteger = (AtomicInteger)Maps.safeGet(countMap, paramObject);
      i = j;
      if (localAtomicInteger == null) {
        break;
      }
      int k;
      do
      {
        k = localAtomicInteger.get();
        i = j;
        if (k == 0) {
          break;
        }
        i = Math.max(0, k - paramInt);
      } while (!localAtomicInteger.compareAndSet(k, i));
      if (i == 0) {
        countMap.remove(paramObject, localAtomicInteger);
      }
      return k;
    }
  }
  
  public boolean removeExactly(@Nullable Object paramObject, int paramInt)
  {
    if (paramInt == 0) {}
    AtomicInteger localAtomicInteger;
    int j;
    do
    {
      return true;
      if (paramInt > 0) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "Invalid occurrences: %s", new Object[] { Integer.valueOf(paramInt) });
        localAtomicInteger = (AtomicInteger)Maps.safeGet(countMap, paramObject);
        if (localAtomicInteger != null) {
          break;
        }
        return false;
      }
      int i;
      do
      {
        i = localAtomicInteger.get();
        if (i < paramInt) {
          return false;
        }
        j = i - paramInt;
      } while (!localAtomicInteger.compareAndSet(i, j));
    } while (j != 0);
    countMap.remove(paramObject, localAtomicInteger);
    return true;
  }
  
  public int setCount(E paramE, int paramInt)
  {
    Preconditions.checkNotNull(paramE);
    CollectPreconditions.checkNonnegative(paramInt, "count");
    AtomicInteger localAtomicInteger2 = (AtomicInteger)Maps.safeGet(countMap, paramE);
    AtomicInteger localAtomicInteger1 = localAtomicInteger2;
    int i;
    if (localAtomicInteger2 == null) {
      if (paramInt == 0) {
        i = 0;
      }
    }
    int j;
    do
    {
      return i;
      localAtomicInteger2 = (AtomicInteger)countMap.putIfAbsent(paramE, new AtomicInteger(paramInt));
      localAtomicInteger1 = localAtomicInteger2;
      if (localAtomicInteger2 == null) {
        return 0;
      }
      do
      {
        j = localAtomicInteger1.get();
        if (j == 0)
        {
          if (paramInt == 0) {
            return 0;
          }
          localAtomicInteger2 = new AtomicInteger(paramInt);
          if ((countMap.putIfAbsent(paramE, localAtomicInteger2) != null) && (!countMap.replace(paramE, localAtomicInteger1, localAtomicInteger2))) {
            break;
          }
          return 0;
        }
      } while (!localAtomicInteger1.compareAndSet(j, paramInt));
      i = j;
    } while (paramInt != 0);
    countMap.remove(paramE, localAtomicInteger1);
    return j;
  }
  
  public boolean setCount(E paramE, int paramInt1, int paramInt2)
  {
    boolean bool1 = false;
    boolean bool2 = true;
    Preconditions.checkNotNull(paramE);
    CollectPreconditions.checkNonnegative(paramInt1, "oldCount");
    CollectPreconditions.checkNonnegative(paramInt2, "newCount");
    AtomicInteger localAtomicInteger1 = (AtomicInteger)Maps.safeGet(countMap, paramE);
    if (localAtomicInteger1 == null) {
      if (paramInt1 != 0) {
        bool1 = false;
      }
    }
    do
    {
      do
      {
        do
        {
          return bool1;
          bool1 = bool2;
        } while (paramInt2 == 0);
        bool1 = bool2;
      } while (countMap.putIfAbsent(paramE, new AtomicInteger(paramInt2)) == null);
      return false;
      int i = localAtomicInteger1.get();
      if (i != paramInt1) {
        break;
      }
      if (i == 0)
      {
        if (paramInt2 == 0)
        {
          countMap.remove(paramE, localAtomicInteger1);
          return true;
        }
        AtomicInteger localAtomicInteger2 = new AtomicInteger(paramInt2);
        if ((countMap.putIfAbsent(paramE, localAtomicInteger2) == null) || (countMap.replace(paramE, localAtomicInteger1, localAtomicInteger2))) {
          bool1 = true;
        }
        return bool1;
      }
      if (!localAtomicInteger1.compareAndSet(i, paramInt2)) {
        break;
      }
      bool1 = bool2;
    } while (paramInt2 != 0);
    countMap.remove(paramE, localAtomicInteger1);
    return true;
    return false;
  }
  
  public int size()
  {
    long l = 0L;
    Iterator localIterator = countMap.values().iterator();
    while (localIterator.hasNext()) {
      l += ((AtomicInteger)localIterator.next()).get();
    }
    return Ints.saturatedCast(l);
  }
  
  public Object[] toArray()
  {
    return snapshot().toArray();
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    return snapshot().toArray(paramArrayOfT);
  }
  
  private class EntrySet
    extends AbstractMultiset<E>.EntrySet
  {
    private EntrySet()
    {
      super();
    }
    
    private List<Multiset.Entry<E>> snapshot()
    {
      ArrayList localArrayList = Lists.newArrayListWithExpectedSize(size());
      Iterators.addAll(localArrayList, iterator());
      return localArrayList;
    }
    
    ConcurrentHashMultiset<E> multiset()
    {
      return ConcurrentHashMultiset.this;
    }
    
    public Object[] toArray()
    {
      return snapshot().toArray();
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      return snapshot().toArray(paramArrayOfT);
    }
  }
  
  private static class FieldSettersHolder
  {
    static final Serialization.FieldSetter<ConcurrentHashMultiset> COUNT_MAP_FIELD_SETTER = Serialization.getFieldSetter(ConcurrentHashMultiset.class, "countMap");
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ConcurrentHashMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */