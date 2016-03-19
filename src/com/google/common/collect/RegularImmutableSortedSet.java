package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
final class RegularImmutableSortedSet<E>
  extends ImmutableSortedSet<E>
{
  private final transient ImmutableList<E> elements;
  
  RegularImmutableSortedSet(ImmutableList<E> paramImmutableList, Comparator<? super E> paramComparator)
  {
    super(paramComparator);
    elements = paramImmutableList;
    if (!paramImmutableList.isEmpty()) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      return;
    }
  }
  
  private int unsafeBinarySearch(Object paramObject)
    throws ClassCastException
  {
    return Collections.binarySearch(elements, paramObject, unsafeComparator());
  }
  
  public E ceiling(E paramE)
  {
    int i = tailIndex(paramE, true);
    if (i == size()) {
      return null;
    }
    return (E)elements.get(i);
  }
  
  public boolean contains(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramObject != null) {}
    try
    {
      int i = unsafeBinarySearch(paramObject);
      bool1 = bool2;
      if (i >= 0) {
        bool1 = true;
      }
      return bool1;
    }
    catch (ClassCastException paramObject) {}
    return false;
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    boolean bool2 = true;
    Object localObject = paramCollection;
    if ((paramCollection instanceof Multiset)) {
      localObject = ((Multiset)paramCollection).elementSet();
    }
    boolean bool1;
    if ((!SortedIterables.hasSameComparator(comparator(), (Iterable)localObject)) || (((Collection)localObject).size() <= 1)) {
      bool1 = super.containsAll((Collection)localObject);
    }
    for (;;)
    {
      return bool1;
      PeekingIterator localPeekingIterator = Iterators.peekingIterator(iterator());
      localObject = ((Collection)localObject).iterator();
      paramCollection = ((Iterator)localObject).next();
      try
      {
        for (;;)
        {
          if (localPeekingIterator.hasNext())
          {
            int i = unsafeCompare(localPeekingIterator.peek(), paramCollection);
            if (i < 0)
            {
              localPeekingIterator.next();
            }
            else
            {
              if (i == 0)
              {
                bool1 = bool2;
                if (!((Iterator)localObject).hasNext()) {
                  break;
                }
                paramCollection = ((Iterator)localObject).next();
                continue;
              }
              if (i > 0) {
                return false;
              }
            }
          }
        }
      }
      catch (ClassCastException paramCollection)
      {
        return false;
        return false;
      }
      catch (NullPointerException paramCollection) {}
    }
    return false;
  }
  
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    return elements.copyIntoArray(paramArrayOfObject, paramInt);
  }
  
  ImmutableList<E> createAsList()
  {
    return new ImmutableSortedAsList(this, elements);
  }
  
  ImmutableSortedSet<E> createDescendingSet()
  {
    return new RegularImmutableSortedSet(elements.reverse(), Ordering.from(comparator).reverse());
  }
  
  @GwtIncompatible("NavigableSet")
  public UnmodifiableIterator<E> descendingIterator()
  {
    return elements.reverse().iterator();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof Set)) {
        return false;
      }
      paramObject = (Set)paramObject;
      if (size() != ((Set)paramObject).size()) {
        return false;
      }
      if (SortedIterables.hasSameComparator(comparator, (Iterable)paramObject))
      {
        paramObject = ((Set)paramObject).iterator();
        try
        {
          UnmodifiableIterator localUnmodifiableIterator = iterator();
          int i;
          do
          {
            if (!localUnmodifiableIterator.hasNext()) {
              break;
            }
            Object localObject1 = localUnmodifiableIterator.next();
            Object localObject2 = ((Iterator)paramObject).next();
            if (localObject2 == null) {
              break label102;
            }
            i = unsafeCompare(localObject1, localObject2);
          } while (i == 0);
          label102:
          return false;
        }
        catch (ClassCastException paramObject)
        {
          return false;
        }
        catch (NoSuchElementException paramObject)
        {
          return false;
        }
      }
    }
    return containsAll((Collection)paramObject);
  }
  
  public E first()
  {
    return (E)elements.get(0);
  }
  
  public E floor(E paramE)
  {
    int i = headIndex(paramE, true) - 1;
    if (i == -1) {
      return null;
    }
    return (E)elements.get(i);
  }
  
  ImmutableSortedSet<E> getSubSet(int paramInt1, int paramInt2)
  {
    if ((paramInt1 == 0) && (paramInt2 == size())) {
      return this;
    }
    if (paramInt1 < paramInt2) {
      return new RegularImmutableSortedSet(elements.subList(paramInt1, paramInt2), comparator);
    }
    return emptySet(comparator);
  }
  
  int headIndex(E paramE, boolean paramBoolean)
  {
    ImmutableList localImmutableList = elements;
    Object localObject = Preconditions.checkNotNull(paramE);
    Comparator localComparator = comparator();
    if (paramBoolean) {}
    for (paramE = SortedLists.KeyPresentBehavior.FIRST_AFTER;; paramE = SortedLists.KeyPresentBehavior.FIRST_PRESENT) {
      return SortedLists.binarySearch(localImmutableList, localObject, localComparator, paramE, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
    }
  }
  
  ImmutableSortedSet<E> headSetImpl(E paramE, boolean paramBoolean)
  {
    return getSubSet(0, headIndex(paramE, paramBoolean));
  }
  
  public E higher(E paramE)
  {
    int i = tailIndex(paramE, false);
    if (i == size()) {
      return null;
    }
    return (E)elements.get(i);
  }
  
  int indexOf(@Nullable Object paramObject)
  {
    if (paramObject == null) {
      return -1;
    }
    for (;;)
    {
      try
      {
        i = SortedLists.binarySearch(elements, paramObject, unsafeComparator(), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.INVERTED_INSERTION_INDEX);
        if (i >= 0) {
          return i;
        }
      }
      catch (ClassCastException paramObject)
      {
        return -1;
      }
      int i = -1;
    }
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  boolean isPartialView()
  {
    return elements.isPartialView();
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return elements.iterator();
  }
  
  public E last()
  {
    return (E)elements.get(size() - 1);
  }
  
  public E lower(E paramE)
  {
    int i = headIndex(paramE, false) - 1;
    if (i == -1) {
      return null;
    }
    return (E)elements.get(i);
  }
  
  public int size()
  {
    return elements.size();
  }
  
  ImmutableSortedSet<E> subSetImpl(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return tailSetImpl(paramE1, paramBoolean1).headSetImpl(paramE2, paramBoolean2);
  }
  
  int tailIndex(E paramE, boolean paramBoolean)
  {
    ImmutableList localImmutableList = elements;
    Object localObject = Preconditions.checkNotNull(paramE);
    Comparator localComparator = comparator();
    if (paramBoolean) {}
    for (paramE = SortedLists.KeyPresentBehavior.FIRST_PRESENT;; paramE = SortedLists.KeyPresentBehavior.FIRST_AFTER) {
      return SortedLists.binarySearch(localImmutableList, localObject, localComparator, paramE, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
    }
  }
  
  ImmutableSortedSet<E> tailSetImpl(E paramE, boolean paramBoolean)
  {
    return getSubSet(tailIndex(paramE, paramBoolean), size());
  }
  
  Comparator<Object> unsafeComparator()
  {
    return comparator;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableSortedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */