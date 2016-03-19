package com.google.common.collect;

final class Cut$AboveAll
  extends Cut<Comparable<?>>
{
  private static final AboveAll INSTANCE = new AboveAll();
  private static final long serialVersionUID = 0L;
  
  private Cut$AboveAll()
  {
    super(null);
  }
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  public int compareTo(Cut<Comparable<?>> paramCut)
  {
    if (paramCut == this) {
      return 0;
    }
    return 1;
  }
  
  void describeAsLowerBound(StringBuilder paramStringBuilder)
  {
    throw new AssertionError();
  }
  
  void describeAsUpperBound(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append("+∞)");
  }
  
  Comparable<?> endpoint()
  {
    throw new IllegalStateException("range unbounded on this side");
  }
  
  Comparable<?> greatestValueBelow(DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    return paramDiscreteDomain.maxValue();
  }
  
  boolean isLessThan(Comparable<?> paramComparable)
  {
    return false;
  }
  
  Comparable<?> leastValueAbove(DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    throw new AssertionError();
  }
  
  public String toString()
  {
    return "+∞";
  }
  
  BoundType typeAsLowerBound()
  {
    throw new AssertionError("this statement should be unreachable");
  }
  
  BoundType typeAsUpperBound()
  {
    throw new IllegalStateException();
  }
  
  Cut<Comparable<?>> withLowerBoundType(BoundType paramBoundType, DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    throw new AssertionError("this statement should be unreachable");
  }
  
  Cut<Comparable<?>> withUpperBoundType(BoundType paramBoundType, DiscreteDomain<Comparable<?>> paramDiscreteDomain)
  {
    throw new IllegalStateException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Cut.AboveAll
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */