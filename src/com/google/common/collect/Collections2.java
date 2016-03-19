package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import com.google.common.math.IntMath;
import com.google.common.math.LongMath;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nullable;

@GwtCompatible
public final class Collections2
{
  static final Joiner STANDARD_JOINER = Joiner.on(", ").useForNull("null");
  
  static <T> Collection<T> cast(Iterable<T> paramIterable)
  {
    return (Collection)paramIterable;
  }
  
  static boolean containsAllImpl(Collection<?> paramCollection1, Collection<?> paramCollection2)
  {
    return Iterables.all(paramCollection2, Predicates.in(paramCollection1));
  }
  
  public static <E> Collection<E> filter(Collection<E> paramCollection, Predicate<? super E> paramPredicate)
  {
    if ((paramCollection instanceof FilteredCollection)) {
      return ((FilteredCollection)paramCollection).createCombined(paramPredicate);
    }
    return new FilteredCollection((Collection)Preconditions.checkNotNull(paramCollection), (Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  private static boolean isPermutation(List<?> paramList1, List<?> paramList2)
  {
    if (paramList1.size() != paramList2.size()) {
      return false;
    }
    return HashMultiset.create(paramList1).equals(HashMultiset.create(paramList2));
  }
  
  private static boolean isPositiveInt(long paramLong)
  {
    return (paramLong >= 0L) && (paramLong <= 2147483647L);
  }
  
  static StringBuilder newStringBuilderForCollection(int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "size");
    return new StringBuilder((int)Math.min(paramInt * 8L, 1073741824L));
  }
  
  @Beta
  public static <E extends Comparable<? super E>> Collection<List<E>> orderedPermutations(Iterable<E> paramIterable)
  {
    return orderedPermutations(paramIterable, Ordering.natural());
  }
  
  @Beta
  public static <E> Collection<List<E>> orderedPermutations(Iterable<E> paramIterable, Comparator<? super E> paramComparator)
  {
    return new OrderedPermutationCollection(paramIterable, paramComparator);
  }
  
  @Beta
  public static <E> Collection<List<E>> permutations(Collection<E> paramCollection)
  {
    return new PermutationCollection(ImmutableList.copyOf(paramCollection));
  }
  
  static boolean safeContains(Collection<?> paramCollection, @Nullable Object paramObject)
  {
    Preconditions.checkNotNull(paramCollection);
    try
    {
      boolean bool = paramCollection.contains(paramObject);
      return bool;
    }
    catch (ClassCastException paramCollection)
    {
      return false;
    }
    catch (NullPointerException paramCollection) {}
    return false;
  }
  
  static boolean safeRemove(Collection<?> paramCollection, @Nullable Object paramObject)
  {
    Preconditions.checkNotNull(paramCollection);
    try
    {
      boolean bool = paramCollection.remove(paramObject);
      return bool;
    }
    catch (ClassCastException paramCollection)
    {
      return false;
    }
    catch (NullPointerException paramCollection) {}
    return false;
  }
  
  static String toStringImpl(Collection<?> paramCollection)
  {
    StringBuilder localStringBuilder = newStringBuilderForCollection(paramCollection.size()).append('[');
    STANDARD_JOINER.appendTo(localStringBuilder, Iterables.transform(paramCollection, new Function()
    {
      public Object apply(Object paramAnonymousObject)
      {
        Object localObject = paramAnonymousObject;
        if (paramAnonymousObject == val$collection) {
          localObject = "(this Collection)";
        }
        return localObject;
      }
    }));
    return ']';
  }
  
  public static <F, T> Collection<T> transform(Collection<F> paramCollection, Function<? super F, T> paramFunction)
  {
    return new TransformedCollection(paramCollection, paramFunction);
  }
  
  static class FilteredCollection<E>
    extends AbstractCollection<E>
  {
    final Predicate<? super E> predicate;
    final Collection<E> unfiltered;
    
    FilteredCollection(Collection<E> paramCollection, Predicate<? super E> paramPredicate)
    {
      unfiltered = paramCollection;
      predicate = paramPredicate;
    }
    
    public boolean add(E paramE)
    {
      Preconditions.checkArgument(predicate.apply(paramE));
      return unfiltered.add(paramE);
    }
    
    public boolean addAll(Collection<? extends E> paramCollection)
    {
      Iterator localIterator = paramCollection.iterator();
      while (localIterator.hasNext())
      {
        Object localObject = localIterator.next();
        Preconditions.checkArgument(predicate.apply(localObject));
      }
      return unfiltered.addAll(paramCollection);
    }
    
    public void clear()
    {
      Iterables.removeIf(unfiltered, predicate);
    }
    
    public boolean contains(@Nullable Object paramObject)
    {
      if (Collections2.safeContains(unfiltered, paramObject)) {
        return predicate.apply(paramObject);
      }
      return false;
    }
    
    public boolean containsAll(Collection<?> paramCollection)
    {
      return Collections2.containsAllImpl(this, paramCollection);
    }
    
    FilteredCollection<E> createCombined(Predicate<? super E> paramPredicate)
    {
      return new FilteredCollection(unfiltered, Predicates.and(predicate, paramPredicate));
    }
    
    public boolean isEmpty()
    {
      return !Iterables.any(unfiltered, predicate);
    }
    
    public Iterator<E> iterator()
    {
      return Iterators.filter(unfiltered.iterator(), predicate);
    }
    
    public boolean remove(Object paramObject)
    {
      return (contains(paramObject)) && (unfiltered.remove(paramObject));
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      return Iterables.removeIf(unfiltered, Predicates.and(predicate, Predicates.in(paramCollection)));
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return Iterables.removeIf(unfiltered, Predicates.and(predicate, Predicates.not(Predicates.in(paramCollection))));
    }
    
    public int size()
    {
      return Iterators.size(iterator());
    }
    
    public Object[] toArray()
    {
      return Lists.newArrayList(iterator()).toArray();
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      return Lists.newArrayList(iterator()).toArray(paramArrayOfT);
    }
  }
  
  private static final class OrderedPermutationCollection<E>
    extends AbstractCollection<List<E>>
  {
    final Comparator<? super E> comparator;
    final ImmutableList<E> inputList;
    final int size;
    
    OrderedPermutationCollection(Iterable<E> paramIterable, Comparator<? super E> paramComparator)
    {
      inputList = Ordering.from(paramComparator).immutableSortedCopy(paramIterable);
      comparator = paramComparator;
      size = calculateSize(inputList, paramComparator);
    }
    
    private static <E> int calculateSize(List<E> paramList, Comparator<? super E> paramComparator)
    {
      long l2 = 1L;
      int j = 1;
      int i = 1;
      long l1;
      int k;
      if (j < paramList.size())
      {
        l1 = l2;
        k = i;
        if (paramComparator.compare(paramList.get(j - 1), paramList.get(j)) < 0)
        {
          l2 *= LongMath.binomial(j, i);
          k = 0;
          l1 = l2;
          if (Collections2.isPositiveInt(l2)) {}
        }
      }
      do
      {
        return Integer.MAX_VALUE;
        j += 1;
        i = k + 1;
        l2 = l1;
        break;
        l1 = l2 * LongMath.binomial(j, i);
      } while (!Collections2.isPositiveInt(l1));
      return (int)l1;
    }
    
    public boolean contains(@Nullable Object paramObject)
    {
      if ((paramObject instanceof List))
      {
        paramObject = (List)paramObject;
        return Collections2.isPermutation(inputList, (List)paramObject);
      }
      return false;
    }
    
    public boolean isEmpty()
    {
      return false;
    }
    
    public Iterator<List<E>> iterator()
    {
      return new Collections2.OrderedPermutationIterator(inputList, comparator);
    }
    
    public int size()
    {
      return size;
    }
    
    public String toString()
    {
      return "orderedPermutationCollection(" + inputList + ")";
    }
  }
  
  private static final class OrderedPermutationIterator<E>
    extends AbstractIterator<List<E>>
  {
    final Comparator<? super E> comparator;
    List<E> nextPermutation;
    
    OrderedPermutationIterator(List<E> paramList, Comparator<? super E> paramComparator)
    {
      nextPermutation = Lists.newArrayList(paramList);
      comparator = paramComparator;
    }
    
    void calculateNextPermutation()
    {
      int i = findNextJ();
      if (i == -1)
      {
        nextPermutation = null;
        return;
      }
      int j = findNextL(i);
      Collections.swap(nextPermutation, i, j);
      j = nextPermutation.size();
      Collections.reverse(nextPermutation.subList(i + 1, j));
    }
    
    protected List<E> computeNext()
    {
      if (nextPermutation == null) {
        return (List)endOfData();
      }
      ImmutableList localImmutableList = ImmutableList.copyOf(nextPermutation);
      calculateNextPermutation();
      return localImmutableList;
    }
    
    int findNextJ()
    {
      int i = nextPermutation.size() - 2;
      while (i >= 0)
      {
        if (comparator.compare(nextPermutation.get(i), nextPermutation.get(i + 1)) < 0) {
          return i;
        }
        i -= 1;
      }
      return -1;
    }
    
    int findNextL(int paramInt)
    {
      Object localObject = nextPermutation.get(paramInt);
      int i = nextPermutation.size() - 1;
      while (i > paramInt)
      {
        if (comparator.compare(localObject, nextPermutation.get(i)) < 0) {
          return i;
        }
        i -= 1;
      }
      throw new AssertionError("this statement should be unreachable");
    }
  }
  
  private static final class PermutationCollection<E>
    extends AbstractCollection<List<E>>
  {
    final ImmutableList<E> inputList;
    
    PermutationCollection(ImmutableList<E> paramImmutableList)
    {
      inputList = paramImmutableList;
    }
    
    public boolean contains(@Nullable Object paramObject)
    {
      if ((paramObject instanceof List))
      {
        paramObject = (List)paramObject;
        return Collections2.isPermutation(inputList, (List)paramObject);
      }
      return false;
    }
    
    public boolean isEmpty()
    {
      return false;
    }
    
    public Iterator<List<E>> iterator()
    {
      return new Collections2.PermutationIterator(inputList);
    }
    
    public int size()
    {
      return IntMath.factorial(inputList.size());
    }
    
    public String toString()
    {
      return "permutations(" + inputList + ")";
    }
  }
  
  private static class PermutationIterator<E>
    extends AbstractIterator<List<E>>
  {
    final int[] c;
    int j;
    final List<E> list;
    final int[] o;
    
    PermutationIterator(List<E> paramList)
    {
      list = new ArrayList(paramList);
      int i = paramList.size();
      c = new int[i];
      o = new int[i];
      Arrays.fill(c, 0);
      Arrays.fill(o, 1);
      j = Integer.MAX_VALUE;
    }
    
    void calculateNextPermutation()
    {
      j = (list.size() - 1);
      int i = 0;
      if (j == -1) {
        return;
      }
      int k;
      for (;;)
      {
        k = c[j] + o[j];
        if (k < 0)
        {
          switchDirection();
        }
        else
        {
          if (k != j + 1) {
            break label85;
          }
          if (j == 0) {
            break;
          }
          i += 1;
          switchDirection();
        }
      }
      label85:
      Collections.swap(list, j - c[j] + i, j - k + i);
      c[j] = k;
    }
    
    protected List<E> computeNext()
    {
      if (j <= 0) {
        return (List)endOfData();
      }
      ImmutableList localImmutableList = ImmutableList.copyOf(list);
      calculateNextPermutation();
      return localImmutableList;
    }
    
    void switchDirection()
    {
      o[j] = (-o[j]);
      j -= 1;
    }
  }
  
  static class TransformedCollection<F, T>
    extends AbstractCollection<T>
  {
    final Collection<F> fromCollection;
    final Function<? super F, ? extends T> function;
    
    TransformedCollection(Collection<F> paramCollection, Function<? super F, ? extends T> paramFunction)
    {
      fromCollection = ((Collection)Preconditions.checkNotNull(paramCollection));
      function = ((Function)Preconditions.checkNotNull(paramFunction));
    }
    
    public void clear()
    {
      fromCollection.clear();
    }
    
    public boolean isEmpty()
    {
      return fromCollection.isEmpty();
    }
    
    public Iterator<T> iterator()
    {
      return Iterators.transform(fromCollection.iterator(), function);
    }
    
    public int size()
    {
      return fromCollection.size();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Collections2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */