package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Function;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.SortedSet;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
public abstract class FluentIterable<E>
  implements Iterable<E>
{
  private final Iterable<E> iterable;
  
  protected FluentIterable()
  {
    iterable = this;
  }
  
  FluentIterable(Iterable<E> paramIterable)
  {
    iterable = ((Iterable)Preconditions.checkNotNull(paramIterable));
  }
  
  @Deprecated
  public static <E> FluentIterable<E> from(FluentIterable<E> paramFluentIterable)
  {
    return (FluentIterable)Preconditions.checkNotNull(paramFluentIterable);
  }
  
  public static <E> FluentIterable<E> from(final Iterable<E> paramIterable)
  {
    if ((paramIterable instanceof FluentIterable)) {
      return (FluentIterable)paramIterable;
    }
    new FluentIterable(paramIterable)
    {
      public Iterator<E> iterator()
      {
        return paramIterable.iterator();
      }
    };
  }
  
  public final boolean allMatch(Predicate<? super E> paramPredicate)
  {
    return Iterables.all(iterable, paramPredicate);
  }
  
  public final boolean anyMatch(Predicate<? super E> paramPredicate)
  {
    return Iterables.any(iterable, paramPredicate);
  }
  
  public final boolean contains(@Nullable Object paramObject)
  {
    return Iterables.contains(iterable, paramObject);
  }
  
  public final <C extends Collection<? super E>> C copyInto(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    if ((iterable instanceof Collection)) {
      paramC.addAll(Collections2.cast(iterable));
    }
    for (;;)
    {
      return paramC;
      Iterator localIterator = iterable.iterator();
      while (localIterator.hasNext()) {
        paramC.add(localIterator.next());
      }
    }
  }
  
  @CheckReturnValue
  public final FluentIterable<E> cycle()
  {
    return from(Iterables.cycle(iterable));
  }
  
  @CheckReturnValue
  public final FluentIterable<E> filter(Predicate<? super E> paramPredicate)
  {
    return from(Iterables.filter(iterable, paramPredicate));
  }
  
  @CheckReturnValue
  @GwtIncompatible("Class.isInstance")
  public final <T> FluentIterable<T> filter(Class<T> paramClass)
  {
    return from(Iterables.filter(iterable, paramClass));
  }
  
  public final Optional<E> first()
  {
    Iterator localIterator = iterable.iterator();
    if (localIterator.hasNext()) {
      return Optional.of(localIterator.next());
    }
    return Optional.absent();
  }
  
  public final Optional<E> firstMatch(Predicate<? super E> paramPredicate)
  {
    return Iterables.tryFind(iterable, paramPredicate);
  }
  
  public final E get(int paramInt)
  {
    return (E)Iterables.get(iterable, paramInt);
  }
  
  public final <K> ImmutableListMultimap<K, E> index(Function<? super E, K> paramFunction)
  {
    return Multimaps.index(iterable, paramFunction);
  }
  
  public final boolean isEmpty()
  {
    return !iterable.iterator().hasNext();
  }
  
  public final Optional<E> last()
  {
    if ((iterable instanceof List))
    {
      localObject1 = (List)iterable;
      if (((List)localObject1).isEmpty()) {
        return Optional.absent();
      }
      return Optional.of(((List)localObject1).get(((List)localObject1).size() - 1));
    }
    Object localObject1 = iterable.iterator();
    if (!((Iterator)localObject1).hasNext()) {
      return Optional.absent();
    }
    if ((iterable instanceof SortedSet)) {
      return Optional.of(((SortedSet)iterable).last());
    }
    Object localObject2;
    do
    {
      localObject2 = ((Iterator)localObject1).next();
    } while (((Iterator)localObject1).hasNext());
    return Optional.of(localObject2);
  }
  
  @CheckReturnValue
  public final FluentIterable<E> limit(int paramInt)
  {
    return from(Iterables.limit(iterable, paramInt));
  }
  
  public final int size()
  {
    return Iterables.size(iterable);
  }
  
  @CheckReturnValue
  public final FluentIterable<E> skip(int paramInt)
  {
    return from(Iterables.skip(iterable, paramInt));
  }
  
  @GwtIncompatible("Array.newArray(Class, int)")
  public final E[] toArray(Class<E> paramClass)
  {
    return Iterables.toArray(iterable, paramClass);
  }
  
  public final ImmutableList<E> toList()
  {
    return ImmutableList.copyOf(iterable);
  }
  
  public final <V> ImmutableMap<E, V> toMap(Function<? super E, V> paramFunction)
  {
    return Maps.toMap(iterable, paramFunction);
  }
  
  public final ImmutableSet<E> toSet()
  {
    return ImmutableSet.copyOf(iterable);
  }
  
  @Beta
  public final ImmutableList<E> toSortedList(Comparator<? super E> paramComparator)
  {
    return Ordering.from(paramComparator).immutableSortedCopy(iterable);
  }
  
  public final ImmutableSortedSet<E> toSortedSet(Comparator<? super E> paramComparator)
  {
    return ImmutableSortedSet.copyOf(paramComparator, iterable);
  }
  
  public String toString()
  {
    return Iterables.toString(iterable);
  }
  
  public final <T> FluentIterable<T> transform(Function<? super E, T> paramFunction)
  {
    return from(Iterables.transform(iterable, paramFunction));
  }
  
  public <T> FluentIterable<T> transformAndConcat(Function<? super E, ? extends Iterable<? extends T>> paramFunction)
  {
    return from(Iterables.concat(transform(paramFunction)));
  }
  
  public final <K> ImmutableMap<K, E> uniqueIndex(Function<? super E, K> paramFunction)
  {
    return Maps.uniqueIndex(iterable, paramFunction);
  }
  
  private static class FromIterableFunction<E>
    implements Function<Iterable<E>, FluentIterable<E>>
  {
    public FluentIterable<E> apply(Iterable<E> paramIterable)
    {
      return FluentIterable.from(paramIterable);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FluentIterable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */