package com.google.common.collect;

import java.util.NoSuchElementException;

final class Cut$BelowAll
  extends Cut<Comparable<?>>
{
  private static final BelowAll INSTANCE = new BelowAll();
  private static final long serialVersionUID = 0L;
  
  private Cut$BelowAll()
  {
    super(null);
  }
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  Cut<Comparable<?>> canonical(DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    try
    {
      paramDiscreteDomain = Cut.belowValue(paramDiscreteDomain.minValue());
      return paramDiscreteDomain;
    }
    catch (NoSuchElementException paramDiscreteDomain) {}
    return this;
  }
  
  public int compareTo(Cut<Comparable<?>> paramCut)
  {
    if (paramCut == this) {
      return 0;
    }
    return -1;
  }
  
  void describeAsLowerBound(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append("(-∞");
  }
  
  void describeAsUpperBound(StringBuilder paramStringBuilder)
  {
    throw new AssertionError();
  }
  
  Comparable<?> endpoint()
  {
    throw new IllegalStateException("range unbounded on this side");
  }
  
  Comparable<?> greatestValueBelow(DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    throw new AssertionError();
  }
  
  boolean isLessThan(Comparable<?> paramComparable)
  {
    return true;
  }
  
  Comparable<?> leastValueAbove(DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    return paramDiscreteDomain.minValue();
  }
  
  public String toString()
  {
    return "-∞";
  }
  
  BoundType typeAsLowerBound()
  {
    throw new IllegalStateException();
  }
  
  BoundType typeAsUpperBound()
  {
    throw new AssertionError("this statement should be unreachable");
  }
  
  Cut<Comparable<?>> withLowerBoundType(BoundType paramBoundType, DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    throw new IllegalStateException();
  }
  
  Cut<Comparable<?>> withUpperBoundType(BoundType paramBoundType, DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    throw new AssertionError("this statement should be unreachable");
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Cut.BelowAll
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */