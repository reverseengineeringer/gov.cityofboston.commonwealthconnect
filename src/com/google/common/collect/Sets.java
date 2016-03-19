package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.io.Serializable;
import java.util.AbstractSet;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.NavigableSet;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
public final class Sets
{
  public static <B> Set<List<B>> cartesianProduct(List<? extends Set<? extends B>> paramList)
  {
    return CartesianSet.create(paramList);
  }
  
  public static <B> Set<List<B>> cartesianProduct(Set<? extends B>... paramVarArgs)
  {
    return cartesianProduct(Arrays.asList(paramVarArgs));
  }
  
  public static <E extends Enum<E>> EnumSet<E> complementOf(Collection<E> paramCollection)
  {
    if ((paramCollection instanceof EnumSet)) {
      return EnumSet.complementOf((EnumSet)paramCollection);
    }
    if (!paramCollection.isEmpty()) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "collection is empty; use the other version of this method");
      return makeComplementByHand(paramCollection, ((Enum)paramCollection.iterator().next()).getDeclaringClass());
    }
  }
  
  public static <E extends Enum<E>> EnumSet<E> complementOf(Collection<E> paramCollection, Class<E> paramClass)
  {
    Preconditions.checkNotNull(paramCollection);
    if ((paramCollection instanceof EnumSet)) {
      return EnumSet.complementOf((EnumSet)paramCollection);
    }
    return makeComplementByHand(paramCollection, paramClass);
  }
  
  public static <E> SetView<E> difference(Set<E> paramSet, final Set<?> paramSet1)
  {
    Preconditions.checkNotNull(paramSet, "set1");
    Preconditions.checkNotNull(paramSet1, "set2");
    new SetView(paramSet)
    {
      public boolean contains(Object paramAnonymousObject)
      {
        return (val$set1.contains(paramAnonymousObject)) && (!paramSet1.contains(paramAnonymousObject));
      }
      
      public boolean isEmpty()
      {
        return paramSet1.containsAll(val$set1);
      }
      
      public Iterator<E> iterator()
      {
        return Iterators.filter(val$set1.iterator(), val$notInSet2);
      }
      
      public int size()
      {
        return Iterators.size(iterator());
      }
    };
  }
  
  static boolean equalsImpl(Set<?> paramSet, @Nullable Object paramObject)
  {
    boolean bool2 = true;
    boolean bool1 = false;
    if (paramSet == paramObject) {
      bool1 = true;
    }
    while (!(paramObject instanceof Set)) {
      return bool1;
    }
    paramObject = (Set)paramObject;
    try
    {
      if (paramSet.size() == ((Set)paramObject).size())
      {
        bool1 = paramSet.containsAll((Collection)paramObject);
        if (!bool1) {}
      }
      for (bool1 = bool2;; bool1 = false) {
        return bool1;
      }
      return false;
    }
    catch (NullPointerException paramSet)
    {
      return false;
    }
    catch (ClassCastException paramSet) {}
  }
  
  @GwtIncompatible("NavigableSet")
  public static <E> NavigableSet<E> filter(NavigableSet<E> paramNavigableSet, Predicate<? super E> paramPredicate)
  {
    if ((paramNavigableSet instanceof FilteredSet))
    {
      paramNavigableSet = (FilteredSet)paramNavigableSet;
      paramPredicate = Predicates.and(predicate, paramPredicate);
      return new FilteredNavigableSet((NavigableSet)unfiltered, paramPredicate);
    }
    return new FilteredNavigableSet((NavigableSet)Preconditions.checkNotNull(paramNavigableSet), (Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  public static <E> Set<E> filter(Set<E> paramSet, Predicate<? super E> paramPredicate)
  {
    if ((paramSet instanceof SortedSet)) {
      return filter((SortedSet)paramSet, paramPredicate);
    }
    if ((paramSet instanceof FilteredSet))
    {
      paramSet = (FilteredSet)paramSet;
      paramPredicate = Predicates.and(predicate, paramPredicate);
      return new FilteredSet((Set)unfiltered, paramPredicate);
    }
    return new FilteredSet((Set)Preconditions.checkNotNull(paramSet), (Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  public static <E> SortedSet<E> filter(SortedSet<E> paramSortedSet, Predicate<? super E> paramPredicate)
  {
    return Platform.setsFilterSortedSet(paramSortedSet, paramPredicate);
  }
  
  static <E> SortedSet<E> filterSortedIgnoreNavigable(SortedSet<E> paramSortedSet, Predicate<? super E> paramPredicate)
  {
    if ((paramSortedSet instanceof FilteredSet))
    {
      paramSortedSet = (FilteredSet)paramSortedSet;
      paramPredicate = Predicates.and(predicate, paramPredicate);
      return new FilteredSortedSet((SortedSet)unfiltered, paramPredicate);
    }
    return new FilteredSortedSet((SortedSet)Preconditions.checkNotNull(paramSortedSet), (Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  static int hashCodeImpl(Set<?> paramSet)
  {
    int i = 0;
    paramSet = paramSet.iterator();
    if (paramSet.hasNext())
    {
      Object localObject = paramSet.next();
      if (localObject != null) {}
      for (int j = localObject.hashCode();; j = 0)
      {
        i = i + j ^ 0xFFFFFFFF ^ 0xFFFFFFFF;
        break;
      }
    }
    return i;
  }
  
  @GwtCompatible(serializable=true)
  public static <E extends Enum<E>> ImmutableSet<E> immutableEnumSet(E paramE, E... paramVarArgs)
  {
    return ImmutableEnumSet.asImmutable(EnumSet.of(paramE, paramVarArgs));
  }
  
  @GwtCompatible(serializable=true)
  public static <E extends Enum<E>> ImmutableSet<E> immutableEnumSet(Iterable<E> paramIterable)
  {
    if ((paramIterable instanceof ImmutableEnumSet)) {
      return (ImmutableEnumSet)paramIterable;
    }
    if ((paramIterable instanceof Collection))
    {
      paramIterable = (Collection)paramIterable;
      if (paramIterable.isEmpty()) {
        return ImmutableSet.of();
      }
      return ImmutableEnumSet.asImmutable(EnumSet.copyOf(paramIterable));
    }
    paramIterable = paramIterable.iterator();
    if (paramIterable.hasNext())
    {
      EnumSet localEnumSet = EnumSet.of((Enum)paramIterable.next());
      Iterators.addAll(localEnumSet, paramIterable);
      return ImmutableEnumSet.asImmutable(localEnumSet);
    }
    return ImmutableSet.of();
  }
  
  public static <E> SetView<E> intersection(Set<E> paramSet, final Set<?> paramSet1)
  {
    Preconditions.checkNotNull(paramSet, "set1");
    Preconditions.checkNotNull(paramSet1, "set2");
    new SetView(paramSet)
    {
      public boolean contains(Object paramAnonymousObject)
      {
        return (val$set1.contains(paramAnonymousObject)) && (paramSet1.contains(paramAnonymousObject));
      }
      
      public boolean containsAll(Collection<?> paramAnonymousCollection)
      {
        return (val$set1.containsAll(paramAnonymousCollection)) && (paramSet1.containsAll(paramAnonymousCollection));
      }
      
      public boolean isEmpty()
      {
        return !iterator().hasNext();
      }
      
      public Iterator<E> iterator()
      {
        return Iterators.filter(val$set1.iterator(), val$inSet2);
      }
      
      public int size()
      {
        return Iterators.size(iterator());
      }
    };
  }
  
  private static <E extends Enum<E>> EnumSet<E> makeComplementByHand(Collection<E> paramCollection, Class<E> paramClass)
  {
    paramClass = EnumSet.allOf(paramClass);
    paramClass.removeAll(paramCollection);
    return paramClass;
  }
  
  public static <E> Set<E> newConcurrentHashSet()
  {
    return newSetFromMap(new ConcurrentHashMap());
  }
  
  public static <E> Set<E> newConcurrentHashSet(Iterable<? extends E> paramIterable)
  {
    Set localSet = newConcurrentHashSet();
    Iterables.addAll(localSet, paramIterable);
    return localSet;
  }
  
  @GwtIncompatible("CopyOnWriteArraySet")
  public static <E> CopyOnWriteArraySet<E> newCopyOnWriteArraySet()
  {
    return new CopyOnWriteArraySet();
  }
  
  @GwtIncompatible("CopyOnWriteArraySet")
  public static <E> CopyOnWriteArraySet<E> newCopyOnWriteArraySet(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection)) {}
    for (paramIterable = Collections2.cast(paramIterable);; paramIterable = Lists.newArrayList(paramIterable)) {
      return new CopyOnWriteArraySet(paramIterable);
    }
  }
  
  public static <E extends Enum<E>> EnumSet<E> newEnumSet(Iterable<E> paramIterable, Class<E> paramClass)
  {
    paramClass = EnumSet.noneOf(paramClass);
    Iterables.addAll(paramClass, paramIterable);
    return paramClass;
  }
  
  public static <E> HashSet<E> newHashSet()
  {
    return new HashSet();
  }
  
  public static <E> HashSet<E> newHashSet(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection)) {
      return new HashSet(Collections2.cast(paramIterable));
    }
    return newHashSet(paramIterable.iterator());
  }
  
  public static <E> HashSet<E> newHashSet(Iterator<? extends E> paramIterator)
  {
    HashSet localHashSet = newHashSet();
    Iterators.addAll(localHashSet, paramIterator);
    return localHashSet;
  }
  
  public static <E> HashSet<E> newHashSet(E... paramVarArgs)
  {
    HashSet localHashSet = newHashSetWithExpectedSize(paramVarArgs.length);
    Collections.addAll(localHashSet, paramVarArgs);
    return localHashSet;
  }
  
  public static <E> HashSet<E> newHashSetWithExpectedSize(int paramInt)
  {
    return new HashSet(Maps.capacity(paramInt));
  }
  
  public static <E> Set<E> newIdentityHashSet()
  {
    return newSetFromMap(Maps.newIdentityHashMap());
  }
  
  public static <E> LinkedHashSet<E> newLinkedHashSet()
  {
    return new LinkedHashSet();
  }
  
  public static <E> LinkedHashSet<E> newLinkedHashSet(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection)) {
      return new LinkedHashSet(Collections2.cast(paramIterable));
    }
    LinkedHashSet localLinkedHashSet = newLinkedHashSet();
    Iterables.addAll(localLinkedHashSet, paramIterable);
    return localLinkedHashSet;
  }
  
  public static <E> LinkedHashSet<E> newLinkedHashSetWithExpectedSize(int paramInt)
  {
    return new LinkedHashSet(Maps.capacity(paramInt));
  }
  
  public static <E> Set<E> newSetFromMap(Map<E, Boolean> paramMap)
  {
    return Platform.newSetFromMap(paramMap);
  }
  
  public static <E extends Comparable> TreeSet<E> newTreeSet()
  {
    return new TreeSet();
  }
  
  public static <E extends Comparable> TreeSet<E> newTreeSet(Iterable<? extends E> paramIterable)
  {
    TreeSet localTreeSet = newTreeSet();
    Iterables.addAll(localTreeSet, paramIterable);
    return localTreeSet;
  }
  
  public static <E> TreeSet<E> newTreeSet(Comparator<? super E> paramComparator)
  {
    return new TreeSet((Comparator)Preconditions.checkNotNull(paramComparator));
  }
  
  @GwtCompatible(serializable=false)
  public static <E> Set<Set<E>> powerSet(Set<E> paramSet)
  {
    return new PowerSet(paramSet);
  }
  
  static boolean removeAllImpl(Set<?> paramSet, Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    Object localObject = paramCollection;
    if ((paramCollection instanceof Multiset)) {
      localObject = ((Multiset)paramCollection).elementSet();
    }
    if (((localObject instanceof Set)) && (((Collection)localObject).size() > paramSet.size())) {
      return Iterators.removeAll(paramSet.iterator(), (Collection)localObject);
    }
    return removeAllImpl(paramSet, ((Collection)localObject).iterator());
  }
  
  static boolean removeAllImpl(Set<?> paramSet, Iterator<?> paramIterator)
  {
    boolean bool = false;
    while (paramIterator.hasNext()) {
      bool |= paramSet.remove(paramIterator.next());
    }
    return bool;
  }
  
  public static <E> SetView<E> symmetricDifference(Set<? extends E> paramSet1, Set<? extends E> paramSet2)
  {
    Preconditions.checkNotNull(paramSet1, "set1");
    Preconditions.checkNotNull(paramSet2, "set2");
    return difference(union(paramSet1, paramSet2), intersection(paramSet1, paramSet2));
  }
  
  @GwtIncompatible("NavigableSet")
  public static <E> NavigableSet<E> synchronizedNavigableSet(NavigableSet<E> paramNavigableSet)
  {
    return Synchronized.navigableSet(paramNavigableSet);
  }
  
  public static <E> SetView<E> union(Set<? extends E> paramSet1, final Set<? extends E> paramSet2)
  {
    Preconditions.checkNotNull(paramSet1, "set1");
    Preconditions.checkNotNull(paramSet2, "set2");
    new SetView(paramSet1)
    {
      public boolean contains(Object paramAnonymousObject)
      {
        return (val$set1.contains(paramAnonymousObject)) || (paramSet2.contains(paramAnonymousObject));
      }
      
      public <S extends Set<E>> S copyInto(S paramAnonymousS)
      {
        paramAnonymousS.addAll(val$set1);
        paramAnonymousS.addAll(paramSet2);
        return paramAnonymousS;
      }
      
      public ImmutableSet<E> immutableCopy()
      {
        return new ImmutableSet.Builder().addAll(val$set1).addAll(paramSet2).build();
      }
      
      public boolean isEmpty()
      {
        return (val$set1.isEmpty()) && (paramSet2.isEmpty());
      }
      
      public Iterator<E> iterator()
      {
        return Iterators.unmodifiableIterator(Iterators.concat(val$set1.iterator(), val$set2minus1.iterator()));
      }
      
      public int size()
      {
        return val$set1.size() + val$set2minus1.size();
      }
    };
  }
  
  @GwtIncompatible("NavigableSet")
  public static <E> NavigableSet<E> unmodifiableNavigableSet(NavigableSet<E> paramNavigableSet)
  {
    if (((paramNavigableSet instanceof ImmutableSortedSet)) || ((paramNavigableSet instanceof UnmodifiableNavigableSet))) {
      return paramNavigableSet;
    }
    return new UnmodifiableNavigableSet(paramNavigableSet);
  }
  
  private static final class CartesianSet<E>
    extends ForwardingCollection<List<E>>
    implements Set<List<E>>
  {
    private final transient ImmutableList<ImmutableSet<E>> axes;
    private final transient CartesianList<E> delegate;
    
    private CartesianSet(ImmutableList<ImmutableSet<E>> paramImmutableList, CartesianList<E> paramCartesianList)
    {
      axes = paramImmutableList;
      delegate = paramCartesianList;
    }
    
    static <E> Set<List<E>> create(List<? extends Set<? extends E>> paramList)
    {
      ImmutableList.Builder localBuilder = new ImmutableList.Builder(paramList.size());
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        ImmutableSet localImmutableSet = ImmutableSet.copyOf((Set)paramList.next());
        if (localImmutableSet.isEmpty()) {
          return ImmutableSet.of();
        }
        localBuilder.add(localImmutableSet);
      }
      paramList = localBuilder.build();
      new CartesianSet(paramList, new CartesianList(new ImmutableList()
      {
        public List<E> get(int paramAnonymousInt)
        {
          return ((ImmutableSet)val$axes.get(paramAnonymousInt)).asList();
        }
        
        boolean isPartialView()
        {
          return true;
        }
        
        public int size()
        {
          return val$axes.size();
        }
      }));
    }
    
    protected Collection<List<E>> delegate()
    {
      return delegate;
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof CartesianSet))
      {
        paramObject = (CartesianSet)paramObject;
        return axes.equals(axes);
      }
      return super.equals(paramObject);
    }
    
    public int hashCode()
    {
      int i = size() - 1;
      int j = 0;
      while (j < axes.size())
      {
        i = i * 31 ^ 0xFFFFFFFF ^ 0xFFFFFFFF;
        j += 1;
      }
      j = 1;
      Iterator localIterator = axes.iterator();
      while (localIterator.hasNext())
      {
        Set localSet = (Set)localIterator.next();
        j = j * 31 + size() / localSet.size() * localSet.hashCode() ^ 0xFFFFFFFF ^ 0xFFFFFFFF;
      }
      return j + i ^ 0xFFFFFFFF ^ 0xFFFFFFFF;
    }
  }
  
  @GwtIncompatible("NavigableSet")
  static class DescendingSet<E>
    extends ForwardingNavigableSet<E>
  {
    private final NavigableSet<E> forward;
    
    DescendingSet(NavigableSet<E> paramNavigableSet)
    {
      forward = paramNavigableSet;
    }
    
    private static <T> Ordering<T> reverse(Comparator<T> paramComparator)
    {
      return Ordering.from(paramComparator).reverse();
    }
    
    public E ceiling(E paramE)
    {
      return (E)forward.floor(paramE);
    }
    
    public Comparator<? super E> comparator()
    {
      Comparator localComparator = forward.comparator();
      if (localComparator == null) {
        return Ordering.natural().reverse();
      }
      return reverse(localComparator);
    }
    
    protected NavigableSet<E> delegate()
    {
      return forward;
    }
    
    public Iterator<E> descendingIterator()
    {
      return forward.iterator();
    }
    
    public NavigableSet<E> descendingSet()
    {
      return forward;
    }
    
    public E first()
    {
      return (E)forward.last();
    }
    
    public E floor(E paramE)
    {
      return (E)forward.ceiling(paramE);
    }
    
    public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
    {
      return forward.tailSet(paramE, paramBoolean).descendingSet();
    }
    
    public SortedSet<E> headSet(E paramE)
    {
      return standardHeadSet(paramE);
    }
    
    public E higher(E paramE)
    {
      return (E)forward.lower(paramE);
    }
    
    public Iterator<E> iterator()
    {
      return forward.descendingIterator();
    }
    
    public E last()
    {
      return (E)forward.first();
    }
    
    public E lower(E paramE)
    {
      return (E)forward.higher(paramE);
    }
    
    public E pollFirst()
    {
      return (E)forward.pollLast();
    }
    
    public E pollLast()
    {
      return (E)forward.pollFirst();
    }
    
    public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
    {
      return forward.subSet(paramE2, paramBoolean2, paramE1, paramBoolean1).descendingSet();
    }
    
    public SortedSet<E> subSet(E paramE1, E paramE2)
    {
      return standardSubSet(paramE1, paramE2);
    }
    
    public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
    {
      return forward.headSet(paramE, paramBoolean).descendingSet();
    }
    
    public SortedSet<E> tailSet(E paramE)
    {
      return standardTailSet(paramE);
    }
    
    public Object[] toArray()
    {
      return standardToArray();
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      return standardToArray(paramArrayOfT);
    }
    
    public String toString()
    {
      return standardToString();
    }
  }
  
  @GwtIncompatible("NavigableSet")
  private static class FilteredNavigableSet<E>
    extends Sets.FilteredSortedSet<E>
    implements NavigableSet<E>
  {
    FilteredNavigableSet(NavigableSet<E> paramNavigableSet, Predicate<? super E> paramPredicate)
    {
      super(paramPredicate);
    }
    
    public E ceiling(E paramE)
    {
      return (E)Iterables.getFirst(tailSet(paramE, true), null);
    }
    
    public Iterator<E> descendingIterator()
    {
      return Iterators.filter(unfiltered().descendingIterator(), predicate);
    }
    
    public NavigableSet<E> descendingSet()
    {
      return Sets.filter(unfiltered().descendingSet(), predicate);
    }
    
    @Nullable
    public E floor(E paramE)
    {
      return (E)Iterators.getNext(headSet(paramE, true).descendingIterator(), null);
    }
    
    public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
    {
      return Sets.filter(unfiltered().headSet(paramE, paramBoolean), predicate);
    }
    
    public E higher(E paramE)
    {
      return (E)Iterables.getFirst(tailSet(paramE, false), null);
    }
    
    public E last()
    {
      return (E)descendingIterator().next();
    }
    
    @Nullable
    public E lower(E paramE)
    {
      return (E)Iterators.getNext(headSet(paramE, false).descendingIterator(), null);
    }
    
    public E pollFirst()
    {
      return (E)Iterables.removeFirstMatching(unfiltered(), predicate);
    }
    
    public E pollLast()
    {
      return (E)Iterables.removeFirstMatching(unfiltered().descendingSet(), predicate);
    }
    
    public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
    {
      return Sets.filter(unfiltered().subSet(paramE1, paramBoolean1, paramE2, paramBoolean2), predicate);
    }
    
    public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
    {
      return Sets.filter(unfiltered().tailSet(paramE, paramBoolean), predicate);
    }
    
    NavigableSet<E> unfiltered()
    {
      return (NavigableSet)unfiltered;
    }
  }
  
  private static class FilteredSet<E>
    extends Collections2.FilteredCollection<E>
    implements Set<E>
  {
    FilteredSet(Set<E> paramSet, Predicate<? super E> paramPredicate)
    {
      super(paramPredicate);
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      return Sets.equalsImpl(this, paramObject);
    }
    
    public int hashCode()
    {
      return Sets.hashCodeImpl(this);
    }
  }
  
  private static class FilteredSortedSet<E>
    extends Sets.FilteredSet<E>
    implements SortedSet<E>
  {
    FilteredSortedSet(SortedSet<E> paramSortedSet, Predicate<? super E> paramPredicate)
    {
      super(paramPredicate);
    }
    
    public Comparator<? super E> comparator()
    {
      return ((SortedSet)unfiltered).comparator();
    }
    
    public E first()
    {
      return (E)iterator().next();
    }
    
    public SortedSet<E> headSet(E paramE)
    {
      return new FilteredSortedSet(((SortedSet)unfiltered).headSet(paramE), predicate);
    }
    
    public E last()
    {
      Object localObject;
      for (SortedSet localSortedSet = (SortedSet)unfiltered;; localSortedSet = localSortedSet.headSet(localObject))
      {
        localObject = localSortedSet.last();
        if (predicate.apply(localObject)) {
          return (E)localObject;
        }
      }
    }
    
    public SortedSet<E> subSet(E paramE1, E paramE2)
    {
      return new FilteredSortedSet(((SortedSet)unfiltered).subSet(paramE1, paramE2), predicate);
    }
    
    public SortedSet<E> tailSet(E paramE)
    {
      return new FilteredSortedSet(((SortedSet)unfiltered).tailSet(paramE), predicate);
    }
  }
  
  static abstract class ImprovedAbstractSet<E>
    extends AbstractSet<E>
  {
    public boolean removeAll(Collection<?> paramCollection)
    {
      return Sets.removeAllImpl(this, paramCollection);
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return super.retainAll((Collection)Preconditions.checkNotNull(paramCollection));
    }
  }
  
  private static final class PowerSet<E>
    extends AbstractSet<Set<E>>
  {
    final ImmutableMap<E, Integer> inputSet;
    
    PowerSet(Set<E> paramSet)
    {
      ImmutableMap.Builder localBuilder = ImmutableMap.builder();
      int i = 0;
      paramSet = ((Set)Preconditions.checkNotNull(paramSet)).iterator();
      while (paramSet.hasNext())
      {
        localBuilder.put(paramSet.next(), Integer.valueOf(i));
        i += 1;
      }
      inputSet = localBuilder.build();
      if (inputSet.size() <= 30) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "Too many elements to create power set: %s > 30", new Object[] { Integer.valueOf(inputSet.size()) });
        return;
      }
    }
    
    public boolean contains(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Set))
      {
        paramObject = (Set)paramObject;
        return inputSet.keySet().containsAll((Collection)paramObject);
      }
      return false;
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof PowerSet))
      {
        paramObject = (PowerSet)paramObject;
        return inputSet.equals(inputSet);
      }
      return super.equals(paramObject);
    }
    
    public int hashCode()
    {
      return inputSet.keySet().hashCode() << inputSet.size() - 1;
    }
    
    public boolean isEmpty()
    {
      return false;
    }
    
    public Iterator<Set<E>> iterator()
    {
      new AbstractIndexedListIterator(size())
      {
        protected Set<E> get(int paramAnonymousInt)
        {
          return new Sets.SubSet(inputSet, paramAnonymousInt);
        }
      };
    }
    
    public int size()
    {
      return 1 << inputSet.size();
    }
    
    public String toString()
    {
      return "powerSet(" + inputSet + ")";
    }
  }
  
  public static abstract class SetView<E>
    extends AbstractSet<E>
  {
    public <S extends Set<E>> S copyInto(S paramS)
    {
      paramS.addAll(this);
      return paramS;
    }
    
    public ImmutableSet<E> immutableCopy()
    {
      return ImmutableSet.copyOf(this);
    }
  }
  
  private static final class SubSet<E>
    extends AbstractSet<E>
  {
    private final ImmutableMap<E, Integer> inputSet;
    private final int mask;
    
    SubSet(ImmutableMap<E, Integer> paramImmutableMap, int paramInt)
    {
      inputSet = paramImmutableMap;
      mask = paramInt;
    }
    
    public boolean contains(@Nullable Object paramObject)
    {
      paramObject = (Integer)inputSet.get(paramObject);
      return (paramObject != null) && ((mask & 1 << ((Integer)paramObject).intValue()) != 0);
    }
    
    public Iterator<E> iterator()
    {
      new UnmodifiableIterator()
      {
        final ImmutableList<E> elements = inputSet.keySet().asList();
        int remainingSetBits = mask;
        
        public boolean hasNext()
        {
          return remainingSetBits != 0;
        }
        
        public E next()
        {
          int i = Integer.numberOfTrailingZeros(remainingSetBits);
          if (i == 32) {
            throw new NoSuchElementException();
          }
          remainingSetBits &= (1 << i ^ 0xFFFFFFFF);
          return (E)elements.get(i);
        }
      };
    }
    
    public int size()
    {
      return Integer.bitCount(mask);
    }
  }
  
  @GwtIncompatible("NavigableSet")
  static final class UnmodifiableNavigableSet<E>
    extends ForwardingSortedSet<E>
    implements NavigableSet<E>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final NavigableSet<E> delegate;
    private transient UnmodifiableNavigableSet<E> descendingSet;
    
    UnmodifiableNavigableSet(NavigableSet<E> paramNavigableSet)
    {
      delegate = ((NavigableSet)Preconditions.checkNotNull(paramNavigableSet));
    }
    
    public E ceiling(E paramE)
    {
      return (E)delegate.ceiling(paramE);
    }
    
    protected SortedSet<E> delegate()
    {
      return Collections.unmodifiableSortedSet(delegate);
    }
    
    public Iterator<E> descendingIterator()
    {
      return Iterators.unmodifiableIterator(delegate.descendingIterator());
    }
    
    public NavigableSet<E> descendingSet()
    {
      UnmodifiableNavigableSet localUnmodifiableNavigableSet2 = descendingSet;
      UnmodifiableNavigableSet localUnmodifiableNavigableSet1 = localUnmodifiableNavigableSet2;
      if (localUnmodifiableNavigableSet2 == null)
      {
        localUnmodifiableNavigableSet1 = new UnmodifiableNavigableSet(delegate.descendingSet());
        descendingSet = localUnmodifiableNavigableSet1;
        descendingSet = this;
      }
      return localUnmodifiableNavigableSet1;
    }
    
    public E floor(E paramE)
    {
      return (E)delegate.floor(paramE);
    }
    
    public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
    {
      return Sets.unmodifiableNavigableSet(delegate.headSet(paramE, paramBoolean));
    }
    
    public E higher(E paramE)
    {
      return (E)delegate.higher(paramE);
    }
    
    public E lower(E paramE)
    {
      return (E)delegate.lower(paramE);
    }
    
    public E pollFirst()
    {
      throw new UnsupportedOperationException();
    }
    
    public E pollLast()
    {
      throw new UnsupportedOperationException();
    }
    
    public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
    {
      return Sets.unmodifiableNavigableSet(delegate.subSet(paramE1, paramBoolean1, paramE2, paramBoolean2));
    }
    
    public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
    {
      return Sets.unmodifiableNavigableSet(delegate.tailSet(paramE, paramBoolean));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */