package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.PriorityQueue;
import java.util.Queue;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
public final class Iterators
{
  static final UnmodifiableListIterator<Object> EMPTY_LIST_ITERATOR = new UnmodifiableListIterator()
  {
    public boolean hasNext()
    {
      return false;
    }
    
    public boolean hasPrevious()
    {
      return false;
    }
    
    public Object next()
    {
      throw new NoSuchElementException();
    }
    
    public int nextIndex()
    {
      return 0;
    }
    
    public Object previous()
    {
      throw new NoSuchElementException();
    }
    
    public int previousIndex()
    {
      return -1;
    }
  };
  private static final Iterator<Object> EMPTY_MODIFIABLE_ITERATOR = new Iterator()
  {
    public boolean hasNext()
    {
      return false;
    }
    
    public Object next()
    {
      throw new NoSuchElementException();
    }
    
    public void remove()
    {
      CollectPreconditions.checkRemove(false);
    }
  };
  
  public static <T> boolean addAll(Collection<T> paramCollection, Iterator<? extends T> paramIterator)
  {
    Preconditions.checkNotNull(paramCollection);
    Preconditions.checkNotNull(paramIterator);
    boolean bool = false;
    while (paramIterator.hasNext()) {
      bool |= paramCollection.add(paramIterator.next());
    }
    return bool;
  }
  
  public static int advance(Iterator<?> paramIterator, int paramInt)
  {
    Preconditions.checkNotNull(paramIterator);
    if (paramInt >= 0) {}
    int i;
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "numberToAdvance must be nonnegative");
      i = 0;
      while ((i < paramInt) && (paramIterator.hasNext()))
      {
        paramIterator.next();
        i += 1;
      }
    }
    return i;
  }
  
  public static <T> boolean all(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramPredicate);
    while (paramIterator.hasNext()) {
      if (!paramPredicate.apply(paramIterator.next())) {
        return false;
      }
    }
    return true;
  }
  
  public static <T> boolean any(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    return indexOf(paramIterator, paramPredicate) != -1;
  }
  
  public static <T> Enumeration<T> asEnumeration(Iterator<T> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    new Enumeration()
    {
      public boolean hasMoreElements()
      {
        return val$iterator.hasNext();
      }
      
      public T nextElement()
      {
        return (T)val$iterator.next();
      }
    };
  }
  
  static <T> ListIterator<T> cast(Iterator<T> paramIterator)
  {
    return (ListIterator)paramIterator;
  }
  
  static void checkNonnegative(int paramInt)
  {
    if (paramInt < 0) {
      throw new IndexOutOfBoundsException("position (" + paramInt + ") must not be negative");
    }
  }
  
  static void clear(Iterator<?> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    while (paramIterator.hasNext())
    {
      paramIterator.next();
      paramIterator.remove();
    }
  }
  
  public static <T> Iterator<T> concat(Iterator<? extends Iterator<? extends T>> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    new Iterator()
    {
      Iterator<? extends T> current = Iterators.emptyIterator();
      Iterator<? extends T> removeFrom;
      
      public boolean hasNext()
      {
        boolean bool;
        for (;;)
        {
          bool = ((Iterator)Preconditions.checkNotNull(current)).hasNext();
          if ((bool) || (!val$inputs.hasNext())) {
            break;
          }
          current = ((Iterator)val$inputs.next());
        }
        return bool;
      }
      
      public T next()
      {
        if (!hasNext()) {
          throw new NoSuchElementException();
        }
        removeFrom = current;
        return (T)current.next();
      }
      
      public void remove()
      {
        if (removeFrom != null) {}
        for (boolean bool = true;; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          removeFrom.remove();
          removeFrom = null;
          return;
        }
      }
    };
  }
  
  public static <T> Iterator<T> concat(Iterator<? extends T> paramIterator1, Iterator<? extends T> paramIterator2)
  {
    return concat(ImmutableList.of(paramIterator1, paramIterator2).iterator());
  }
  
  public static <T> Iterator<T> concat(Iterator<? extends T> paramIterator1, Iterator<? extends T> paramIterator2, Iterator<? extends T> paramIterator3)
  {
    return concat(ImmutableList.of(paramIterator1, paramIterator2, paramIterator3).iterator());
  }
  
  public static <T> Iterator<T> concat(Iterator<? extends T> paramIterator1, Iterator<? extends T> paramIterator2, Iterator<? extends T> paramIterator3, Iterator<? extends T> paramIterator4)
  {
    return concat(ImmutableList.of(paramIterator1, paramIterator2, paramIterator3, paramIterator4).iterator());
  }
  
  public static <T> Iterator<T> concat(Iterator<? extends T>... paramVarArgs)
  {
    return concat(ImmutableList.copyOf(paramVarArgs).iterator());
  }
  
  public static <T> Iterator<T> consumingIterator(Iterator<T> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    new UnmodifiableIterator()
    {
      public boolean hasNext()
      {
        return val$iterator.hasNext();
      }
      
      public T next()
      {
        Object localObject = val$iterator.next();
        val$iterator.remove();
        return (T)localObject;
      }
      
      public String toString()
      {
        return "Iterators.consumingIterator(...)";
      }
    };
  }
  
  public static boolean contains(Iterator<?> paramIterator, @Nullable Object paramObject)
  {
    return any(paramIterator, Predicates.equalTo(paramObject));
  }
  
  public static <T> Iterator<T> cycle(Iterable<T> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable);
    new Iterator()
    {
      Iterator<T> iterator = Iterators.emptyIterator();
      Iterator<T> removeFrom;
      
      public boolean hasNext()
      {
        if (!iterator.hasNext()) {
          iterator = val$iterable.iterator();
        }
        return iterator.hasNext();
      }
      
      public T next()
      {
        if (!hasNext()) {
          throw new NoSuchElementException();
        }
        removeFrom = iterator;
        return (T)iterator.next();
      }
      
      public void remove()
      {
        if (removeFrom != null) {}
        for (boolean bool = true;; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          removeFrom.remove();
          removeFrom = null;
          return;
        }
      }
    };
  }
  
  public static <T> Iterator<T> cycle(T... paramVarArgs)
  {
    return cycle(Lists.newArrayList(paramVarArgs));
  }
  
  public static boolean elementsEqual(Iterator<?> paramIterator1, Iterator<?> paramIterator2)
  {
    if (paramIterator1.hasNext()) {
      if (paramIterator2.hasNext()) {}
    }
    while (paramIterator2.hasNext())
    {
      return false;
      if (Objects.equal(paramIterator1.next(), paramIterator2.next())) {
        break;
      }
      return false;
    }
    return true;
  }
  
  public static <T> UnmodifiableIterator<T> emptyIterator()
  {
    return emptyListIterator();
  }
  
  static <T> UnmodifiableListIterator<T> emptyListIterator()
  {
    return EMPTY_LIST_ITERATOR;
  }
  
  static <T> Iterator<T> emptyModifiableIterator()
  {
    return EMPTY_MODIFIABLE_ITERATOR;
  }
  
  public static <T> UnmodifiableIterator<T> filter(Iterator<T> paramIterator, final Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramIterator);
    Preconditions.checkNotNull(paramPredicate);
    new AbstractIterator()
    {
      protected T computeNext()
      {
        while (val$unfiltered.hasNext())
        {
          Object localObject = val$unfiltered.next();
          if (paramPredicate.apply(localObject)) {
            return (T)localObject;
          }
        }
        return (T)endOfData();
      }
    };
  }
  
  @GwtIncompatible("Class.isInstance")
  public static <T> UnmodifiableIterator<T> filter(Iterator<?> paramIterator, Class<T> paramClass)
  {
    return filter(paramIterator, Predicates.instanceOf(paramClass));
  }
  
  public static <T> T find(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    return (T)filter(paramIterator, paramPredicate).next();
  }
  
  @Nullable
  public static <T> T find(Iterator<? extends T> paramIterator, Predicate<? super T> paramPredicate, @Nullable T paramT)
  {
    return (T)getNext(filter(paramIterator, paramPredicate), paramT);
  }
  
  public static <T> UnmodifiableIterator<T> forArray(T... paramVarArgs)
  {
    return forArray(paramVarArgs, 0, paramVarArgs.length, 0);
  }
  
  static <T> UnmodifiableListIterator<T> forArray(final T[] paramArrayOfT, final int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt2 >= 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfT.length);
      Preconditions.checkPositionIndex(paramInt3, paramInt2);
      if (paramInt2 != 0) {
        break;
      }
      return emptyListIterator();
    }
    new AbstractIndexedListIterator(paramInt2, paramInt3)
    {
      protected T get(int paramAnonymousInt)
      {
        return (T)paramArrayOfT[(paramInt1 + paramAnonymousInt)];
      }
    };
  }
  
  public static <T> UnmodifiableIterator<T> forEnumeration(Enumeration<T> paramEnumeration)
  {
    Preconditions.checkNotNull(paramEnumeration);
    new UnmodifiableIterator()
    {
      public boolean hasNext()
      {
        return val$enumeration.hasMoreElements();
      }
      
      public T next()
      {
        return (T)val$enumeration.nextElement();
      }
    };
  }
  
  public static int frequency(Iterator<?> paramIterator, @Nullable Object paramObject)
  {
    return size(filter(paramIterator, Predicates.equalTo(paramObject)));
  }
  
  public static <T> T get(Iterator<T> paramIterator, int paramInt)
  {
    checkNonnegative(paramInt);
    int i = advance(paramIterator, paramInt);
    if (!paramIterator.hasNext()) {
      throw new IndexOutOfBoundsException("position (" + paramInt + ") must be less than the number of elements that remained (" + i + ")");
    }
    return (T)paramIterator.next();
  }
  
  @Nullable
  public static <T> T get(Iterator<? extends T> paramIterator, int paramInt, @Nullable T paramT)
  {
    checkNonnegative(paramInt);
    advance(paramIterator, paramInt);
    return (T)getNext(paramIterator, paramT);
  }
  
  public static <T> T getLast(Iterator<T> paramIterator)
  {
    Object localObject;
    do
    {
      localObject = paramIterator.next();
    } while (paramIterator.hasNext());
    return (T)localObject;
  }
  
  @Nullable
  public static <T> T getLast(Iterator<? extends T> paramIterator, @Nullable T paramT)
  {
    if (paramIterator.hasNext()) {
      paramT = getLast(paramIterator);
    }
    return paramT;
  }
  
  @Nullable
  public static <T> T getNext(Iterator<? extends T> paramIterator, @Nullable T paramT)
  {
    if (paramIterator.hasNext()) {
      paramT = paramIterator.next();
    }
    return paramT;
  }
  
  public static <T> T getOnlyElement(Iterator<T> paramIterator)
  {
    Object localObject = paramIterator.next();
    if (!paramIterator.hasNext()) {
      return (T)localObject;
    }
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("expected one element but was: <" + localObject);
    int i = 0;
    while ((i < 4) && (paramIterator.hasNext()))
    {
      localStringBuilder.append(", " + paramIterator.next());
      i += 1;
    }
    if (paramIterator.hasNext()) {
      localStringBuilder.append(", ...");
    }
    localStringBuilder.append('>');
    throw new IllegalArgumentException(localStringBuilder.toString());
  }
  
  @Nullable
  public static <T> T getOnlyElement(Iterator<? extends T> paramIterator, @Nullable T paramT)
  {
    if (paramIterator.hasNext()) {
      paramT = getOnlyElement(paramIterator);
    }
    return paramT;
  }
  
  public static <T> int indexOf(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramPredicate, "predicate");
    int i = 0;
    while (paramIterator.hasNext())
    {
      if (paramPredicate.apply(paramIterator.next())) {
        return i;
      }
      i += 1;
    }
    return -1;
  }
  
  public static <T> Iterator<T> limit(final Iterator<T> paramIterator, int paramInt)
  {
    Preconditions.checkNotNull(paramIterator);
    if (paramInt >= 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "limit is negative");
      new Iterator()
      {
        private int count;
        
        public boolean hasNext()
        {
          return (count < val$limitSize) && (paramIterator.hasNext());
        }
        
        public T next()
        {
          if (!hasNext()) {
            throw new NoSuchElementException();
          }
          count += 1;
          return (T)paramIterator.next();
        }
        
        public void remove()
        {
          paramIterator.remove();
        }
      };
    }
  }
  
  @Beta
  public static <T> UnmodifiableIterator<T> mergeSorted(Iterable<? extends Iterator<? extends T>> paramIterable, Comparator<? super T> paramComparator)
  {
    Preconditions.checkNotNull(paramIterable, "iterators");
    Preconditions.checkNotNull(paramComparator, "comparator");
    return new MergingIterator(paramIterable, paramComparator);
  }
  
  public static <T> UnmodifiableIterator<List<T>> paddedPartition(Iterator<T> paramIterator, int paramInt)
  {
    return partitionImpl(paramIterator, paramInt, true);
  }
  
  public static <T> UnmodifiableIterator<List<T>> partition(Iterator<T> paramIterator, int paramInt)
  {
    return partitionImpl(paramIterator, paramInt, false);
  }
  
  private static <T> UnmodifiableIterator<List<T>> partitionImpl(Iterator<T> paramIterator, final int paramInt, final boolean paramBoolean)
  {
    Preconditions.checkNotNull(paramIterator);
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      new UnmodifiableIterator()
      {
        public boolean hasNext()
        {
          return val$iterator.hasNext();
        }
        
        public List<T> next()
        {
          if (!hasNext()) {
            throw new NoSuchElementException();
          }
          Object localObject = new Object[paramInt];
          int i = 0;
          while ((i < paramInt) && (val$iterator.hasNext()))
          {
            localObject[i] = val$iterator.next();
            i += 1;
          }
          int j = i;
          while (j < paramInt)
          {
            localObject[j] = null;
            j += 1;
          }
          localObject = Collections.unmodifiableList(Arrays.asList((Object[])localObject));
          if ((paramBoolean) || (i == paramInt)) {
            return (List<T>)localObject;
          }
          return ((List)localObject).subList(0, i);
        }
      };
    }
  }
  
  @Deprecated
  public static <T> PeekingIterator<T> peekingIterator(PeekingIterator<T> paramPeekingIterator)
  {
    return (PeekingIterator)Preconditions.checkNotNull(paramPeekingIterator);
  }
  
  public static <T> PeekingIterator<T> peekingIterator(Iterator<? extends T> paramIterator)
  {
    if ((paramIterator instanceof PeekingImpl)) {
      return (PeekingImpl)paramIterator;
    }
    return new PeekingImpl(paramIterator);
  }
  
  @Nullable
  static <T> T pollNext(Iterator<T> paramIterator)
  {
    if (paramIterator.hasNext())
    {
      Object localObject = paramIterator.next();
      paramIterator.remove();
      return (T)localObject;
    }
    return null;
  }
  
  public static boolean removeAll(Iterator<?> paramIterator, Collection<?> paramCollection)
  {
    return removeIf(paramIterator, Predicates.in(paramCollection));
  }
  
  public static <T> boolean removeIf(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    Preconditions.checkNotNull(paramPredicate);
    boolean bool = false;
    while (paramIterator.hasNext()) {
      if (paramPredicate.apply(paramIterator.next()))
      {
        paramIterator.remove();
        bool = true;
      }
    }
    return bool;
  }
  
  public static boolean retainAll(Iterator<?> paramIterator, Collection<?> paramCollection)
  {
    return removeIf(paramIterator, Predicates.not(Predicates.in(paramCollection)));
  }
  
  public static <T> UnmodifiableIterator<T> singletonIterator(@Nullable T paramT)
  {
    new UnmodifiableIterator()
    {
      boolean done;
      
      public boolean hasNext()
      {
        return !done;
      }
      
      public T next()
      {
        if (done) {
          throw new NoSuchElementException();
        }
        done = true;
        return (T)val$value;
      }
    };
  }
  
  public static int size(Iterator<?> paramIterator)
  {
    int i = 0;
    while (paramIterator.hasNext())
    {
      paramIterator.next();
      i += 1;
    }
    return i;
  }
  
  @GwtIncompatible("Array.newInstance(Class, int)")
  public static <T> T[] toArray(Iterator<? extends T> paramIterator, Class<T> paramClass)
  {
    return Iterables.toArray(Lists.newArrayList(paramIterator), paramClass);
  }
  
  public static String toString(Iterator<?> paramIterator)
  {
    return ']';
  }
  
  public static <F, T> Iterator<T> transform(Iterator<F> paramIterator, final Function<? super F, ? extends T> paramFunction)
  {
    Preconditions.checkNotNull(paramFunction);
    new TransformedIterator(paramIterator)
    {
      T transform(F paramAnonymousF)
      {
        return (T)paramFunction.apply(paramAnonymousF);
      }
    };
  }
  
  public static <T> Optional<T> tryFind(Iterator<T> paramIterator, Predicate<? super T> paramPredicate)
  {
    paramIterator = filter(paramIterator, paramPredicate);
    if (paramIterator.hasNext()) {
      return Optional.of(paramIterator.next());
    }
    return Optional.absent();
  }
  
  @Deprecated
  public static <T> UnmodifiableIterator<T> unmodifiableIterator(UnmodifiableIterator<T> paramUnmodifiableIterator)
  {
    return (UnmodifiableIterator)Preconditions.checkNotNull(paramUnmodifiableIterator);
  }
  
  public static <T> UnmodifiableIterator<T> unmodifiableIterator(Iterator<T> paramIterator)
  {
    Preconditions.checkNotNull(paramIterator);
    if ((paramIterator instanceof UnmodifiableIterator)) {
      return (UnmodifiableIterator)paramIterator;
    }
    new UnmodifiableIterator()
    {
      public boolean hasNext()
      {
        return val$iterator.hasNext();
      }
      
      public T next()
      {
        return (T)val$iterator.next();
      }
    };
  }
  
  private static class MergingIterator<T>
    extends UnmodifiableIterator<T>
  {
    final Queue<PeekingIterator<T>> queue;
    
    public MergingIterator(Iterable<? extends Iterator<? extends T>> paramIterable, final Comparator<? super T> paramComparator)
    {
      queue = new PriorityQueue(2, new Comparator()
      {
        public int compare(PeekingIterator<T> paramAnonymousPeekingIterator1, PeekingIterator<T> paramAnonymousPeekingIterator2)
        {
          return paramComparator.compare(paramAnonymousPeekingIterator1.peek(), paramAnonymousPeekingIterator2.peek());
        }
      });
      paramIterable = paramIterable.iterator();
      while (paramIterable.hasNext())
      {
        paramComparator = (Iterator)paramIterable.next();
        if (paramComparator.hasNext()) {
          queue.add(Iterators.peekingIterator(paramComparator));
        }
      }
    }
    
    public boolean hasNext()
    {
      return !queue.isEmpty();
    }
    
    public T next()
    {
      PeekingIterator localPeekingIterator = (PeekingIterator)queue.remove();
      Object localObject = localPeekingIterator.next();
      if (localPeekingIterator.hasNext()) {
        queue.add(localPeekingIterator);
      }
      return (T)localObject;
    }
  }
  
  private static class PeekingImpl<E>
    implements PeekingIterator<E>
  {
    private boolean hasPeeked;
    private final Iterator<? extends E> iterator;
    private E peekedElement;
    
    public PeekingImpl(Iterator<? extends E> paramIterator)
    {
      iterator = ((Iterator)Preconditions.checkNotNull(paramIterator));
    }
    
    public boolean hasNext()
    {
      return (hasPeeked) || (iterator.hasNext());
    }
    
    public E next()
    {
      if (!hasPeeked) {
        return (E)iterator.next();
      }
      Object localObject = peekedElement;
      hasPeeked = false;
      peekedElement = null;
      return (E)localObject;
    }
    
    public E peek()
    {
      if (!hasPeeked)
      {
        peekedElement = iterator.next();
        hasPeeked = true;
      }
      return (E)peekedElement;
    }
    
    public void remove()
    {
      if (!hasPeeked) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkState(bool, "Can't remove after you've peeked at next");
        iterator.remove();
        return;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterators
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */