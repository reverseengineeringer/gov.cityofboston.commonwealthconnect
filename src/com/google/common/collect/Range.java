package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.io.Serializable;
import java.util.Comparator;
import java.util.Iterator;
import java.util.SortedSet;
import javax.annotation.Nullable;

@GwtCompatible
public final class Range<C extends Comparable>
  implements Predicate<C>, Serializable
{
  private static final Range<Comparable> ALL = new Range(Cut.belowAll(), Cut.aboveAll());
  private static final Function<Range, Cut> LOWER_BOUND_FN = new Function()
  {
    public Cut apply(Range paramAnonymousRange)
    {
      return lowerBound;
    }
  };
  static final Ordering<Range<?>> RANGE_LEX_ORDERING;
  private static final Function<Range, Cut> UPPER_BOUND_FN = new Function()
  {
    public Cut apply(Range paramAnonymousRange)
    {
      return upperBound;
    }
  };
  private static final long serialVersionUID = 0L;
  final Cut<C> lowerBound;
  final Cut<C> upperBound;
  
  static
  {
    RANGE_LEX_ORDERING = new Ordering()
    {
      public int compare(Range<?> paramAnonymousRange1, Range<?> paramAnonymousRange2)
      {
        return ComparisonChain.start().compare(lowerBound, lowerBound).compare(upperBound, upperBound).result();
      }
    };
  }
  
  private Range(Cut<C> paramCut1, Cut<C> paramCut2)
  {
    if ((paramCut1.compareTo(paramCut2) > 0) || (paramCut1 == Cut.aboveAll()) || (paramCut2 == Cut.belowAll())) {
      throw new IllegalArgumentException("Invalid range: " + toString(paramCut1, paramCut2));
    }
    lowerBound = ((Cut)Preconditions.checkNotNull(paramCut1));
    upperBound = ((Cut)Preconditions.checkNotNull(paramCut2));
  }
  
  public static <C extends Comparable<?>> Range<C> all()
  {
    return ALL;
  }
  
  public static <C extends Comparable<?>> Range<C> atLeast(C paramC)
  {
    return create(Cut.belowValue(paramC), Cut.aboveAll());
  }
  
  public static <C extends Comparable<?>> Range<C> atMost(C paramC)
  {
    return create(Cut.belowAll(), Cut.aboveValue(paramC));
  }
  
  private static <T> SortedSet<T> cast(Iterable<T> paramIterable)
  {
    return (SortedSet)paramIterable;
  }
  
  public static <C extends Comparable<?>> Range<C> closed(C paramC1, C paramC2)
  {
    return create(Cut.belowValue(paramC1), Cut.aboveValue(paramC2));
  }
  
  public static <C extends Comparable<?>> Range<C> closedOpen(C paramC1, C paramC2)
  {
    return create(Cut.belowValue(paramC1), Cut.belowValue(paramC2));
  }
  
  static int compareOrThrow(Comparable paramComparable1, Comparable paramComparable2)
  {
    return paramComparable1.compareTo(paramComparable2);
  }
  
  static <C extends Comparable<?>> Range<C> create(Cut<C> paramCut1, Cut<C> paramCut2)
  {
    return new Range(paramCut1, paramCut2);
  }
  
  public static <C extends Comparable<?>> Range<C> downTo(C paramC, BoundType paramBoundType)
  {
    switch (paramBoundType)
    {
    default: 
      throw new AssertionError();
    case ???: 
      return greaterThan(paramC);
    }
    return atLeast(paramC);
  }
  
  public static <C extends Comparable<?>> Range<C> encloseAll(Iterable<C> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable);
    if ((paramIterable instanceof ContiguousSet)) {
      return ((ContiguousSet)paramIterable).range();
    }
    Iterator localIterator = paramIterable.iterator();
    Comparable localComparable1 = (Comparable)Preconditions.checkNotNull(localIterator.next());
    Comparable localComparable2;
    for (paramIterable = localComparable1; localIterator.hasNext(); paramIterable = (Comparable)Ordering.natural().max(paramIterable, localComparable2))
    {
      localComparable2 = (Comparable)Preconditions.checkNotNull(localIterator.next());
      localComparable1 = (Comparable)Ordering.natural().min(localComparable1, localComparable2);
    }
    return closed(localComparable1, paramIterable);
  }
  
  public static <C extends Comparable<?>> Range<C> greaterThan(C paramC)
  {
    return create(Cut.aboveValue(paramC), Cut.aboveAll());
  }
  
  public static <C extends Comparable<?>> Range<C> lessThan(C paramC)
  {
    return create(Cut.belowAll(), Cut.belowValue(paramC));
  }
  
  static <C extends Comparable<?>> Function<Range<C>, Cut<C>> lowerBoundFn()
  {
    return LOWER_BOUND_FN;
  }
  
  public static <C extends Comparable<?>> Range<C> open(C paramC1, C paramC2)
  {
    return create(Cut.aboveValue(paramC1), Cut.belowValue(paramC2));
  }
  
  public static <C extends Comparable<?>> Range<C> openClosed(C paramC1, C paramC2)
  {
    return create(Cut.aboveValue(paramC1), Cut.aboveValue(paramC2));
  }
  
  public static <C extends Comparable<?>> Range<C> range(C paramC1, BoundType paramBoundType1, C paramC2, BoundType paramBoundType2)
  {
    Preconditions.checkNotNull(paramBoundType1);
    Preconditions.checkNotNull(paramBoundType2);
    if (paramBoundType1 == BoundType.OPEN)
    {
      paramC1 = Cut.aboveValue(paramC1);
      if (paramBoundType2 != BoundType.OPEN) {
        break label48;
      }
    }
    label48:
    for (paramBoundType1 = Cut.belowValue(paramC2);; paramBoundType1 = Cut.aboveValue(paramC2))
    {
      return create(paramC1, paramBoundType1);
      paramC1 = Cut.belowValue(paramC1);
      break;
    }
  }
  
  public static <C extends Comparable<?>> Range<C> singleton(C paramC)
  {
    return closed(paramC, paramC);
  }
  
  private static String toString(Cut<?> paramCut1, Cut<?> paramCut2)
  {
    StringBuilder localStringBuilder = new StringBuilder(16);
    paramCut1.describeAsLowerBound(localStringBuilder);
    localStringBuilder.append('‥');
    paramCut2.describeAsUpperBound(localStringBuilder);
    return localStringBuilder.toString();
  }
  
  public static <C extends Comparable<?>> Range<C> upTo(C paramC, BoundType paramBoundType)
  {
    switch (paramBoundType)
    {
    default: 
      throw new AssertionError();
    case ???: 
      return lessThan(paramC);
    }
    return atMost(paramC);
  }
  
  static <C extends Comparable<?>> Function<Range<C>, Cut<C>> upperBoundFn()
  {
    return UPPER_BOUND_FN;
  }
  
  @Deprecated
  public boolean apply(C paramC)
  {
    return contains(paramC);
  }
  
  public Range<C> canonical(DiscreteDomain<C> paramDiscreteDomain)
  {
    Preconditions.checkNotNull(paramDiscreteDomain);
    Cut localCut = lowerBound.canonical(paramDiscreteDomain);
    paramDiscreteDomain = upperBound.canonical(paramDiscreteDomain);
    if ((localCut == lowerBound) && (paramDiscreteDomain == upperBound)) {
      return this;
    }
    return create(localCut, paramDiscreteDomain);
  }
  
  public boolean contains(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    return (lowerBound.isLessThan(paramC)) && (!upperBound.isLessThan(paramC));
  }
  
  public boolean containsAll(Iterable<? extends C> paramIterable)
  {
    if (Iterables.isEmpty(paramIterable)) {}
    do
    {
      while (!paramIterable.hasNext())
      {
        return true;
        if ((paramIterable instanceof SortedSet))
        {
          SortedSet localSortedSet = cast(paramIterable);
          Comparator localComparator = localSortedSet.comparator();
          if ((Ordering.natural().equals(localComparator)) || (localComparator == null))
          {
            if ((contains((Comparable)localSortedSet.first())) && (contains((Comparable)localSortedSet.last()))) {}
            for (boolean bool = true;; bool = false) {
              return bool;
            }
          }
        }
        paramIterable = paramIterable.iterator();
      }
    } while (contains((Comparable)paramIterable.next()));
    return false;
  }
  
  public boolean encloses(Range<C> paramRange)
  {
    return (lowerBound.compareTo(lowerBound) <= 0) && (upperBound.compareTo(upperBound) >= 0);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Range))
    {
      paramObject = (Range)paramObject;
      bool1 = bool2;
      if (lowerBound.equals(lowerBound))
      {
        bool1 = bool2;
        if (upperBound.equals(upperBound)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public boolean hasLowerBound()
  {
    return lowerBound != Cut.belowAll();
  }
  
  public boolean hasUpperBound()
  {
    return upperBound != Cut.aboveAll();
  }
  
  public int hashCode()
  {
    return lowerBound.hashCode() * 31 + upperBound.hashCode();
  }
  
  public Range<C> intersection(Range<C> paramRange)
  {
    int i = lowerBound.compareTo(lowerBound);
    int j = upperBound.compareTo(upperBound);
    if ((i >= 0) && (j <= 0)) {
      return this;
    }
    if ((i <= 0) && (j >= 0)) {
      return paramRange;
    }
    Cut localCut;
    if (i >= 0)
    {
      localCut = lowerBound;
      if (j > 0) {
        break label79;
      }
    }
    label79:
    for (paramRange = upperBound;; paramRange = upperBound)
    {
      return create(localCut, paramRange);
      localCut = lowerBound;
      break;
    }
  }
  
  public boolean isConnected(Range<C> paramRange)
  {
    return (lowerBound.compareTo(upperBound) <= 0) && (lowerBound.compareTo(upperBound) <= 0);
  }
  
  public boolean isEmpty()
  {
    return lowerBound.equals(upperBound);
  }
  
  public BoundType lowerBoundType()
  {
    return lowerBound.typeAsLowerBound();
  }
  
  public C lowerEndpoint()
  {
    return lowerBound.endpoint();
  }
  
  Object readResolve()
  {
    Range localRange = this;
    if (equals(ALL)) {
      localRange = all();
    }
    return localRange;
  }
  
  public Range<C> span(Range<C> paramRange)
  {
    int i = lowerBound.compareTo(lowerBound);
    int j = upperBound.compareTo(upperBound);
    if ((i <= 0) && (j >= 0)) {
      return this;
    }
    if ((i >= 0) && (j <= 0)) {
      return paramRange;
    }
    Cut localCut;
    if (i <= 0)
    {
      localCut = lowerBound;
      if (j < 0) {
        break label79;
      }
    }
    label79:
    for (paramRange = upperBound;; paramRange = upperBound)
    {
      return create(localCut, paramRange);
      localCut = lowerBound;
      break;
    }
  }
  
  public String toString()
  {
    return toString(lowerBound, upperBound);
  }
  
  public BoundType upperBoundType()
  {
    return upperBound.typeAsUpperBound();
  }
  
  public C upperEndpoint()
  {
    return upperBound.endpoint();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Range
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */