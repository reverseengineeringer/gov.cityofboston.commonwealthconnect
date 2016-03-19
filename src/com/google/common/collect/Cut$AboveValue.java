package com.google.common.collect;

import com.google.common.base.Preconditions;

final class Cut$AboveValue<C extends Comparable>
  extends Cut<C>
{
  private static final long serialVersionUID = 0L;
  
  Cut$AboveValue(C paramC)
  {
    super((Comparable)Preconditions.checkNotNull(paramC));
  }
  
  Cut<C> canonical(DiscreteDomain<C> paramDiscreteDomain)
  {
    paramDiscreteDomain = leastValueAbove(paramDiscreteDomain);
    if (paramDiscreteDomain != null) {
      return belowValue(paramDiscreteDomain);
    }
    return Cut.aboveAll();
  }
  
  void describeAsLowerBound(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append('(').append(endpoint);
  }
  
  void describeAsUpperBound(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(endpoint).append(']');
  }
  
  C greatestValueBelow(DiscreteDomain<C> paramDiscreteDomain)
  {
    return endpoint;
  }
  
  public int hashCode()
  {
    return endpoint.hashCode() ^ 0xFFFFFFFF;
  }
  
  boolean isLessThan(C paramC)
  {
    return Range.compareOrThrow(endpoint, paramC) < 0;
  }
  
  C leastValueAbove(DiscreteDomain<C> paramDiscreteDomain)
  {
    return paramDiscreteDomain.next(endpoint);
  }
  
  public String toString()
  {
    return "/" + endpoint + "\\";
  }
  
  BoundType typeAsLowerBound()
  {
    return BoundType.OPEN;
  }
  
  BoundType typeAsUpperBound()
  {
    return BoundType.CLOSED;
  }
  
  Cut<C> withLowerBoundType(BoundType paramBoundType, DiscreteDomain<C> paramDiscreteDomain)
  {
    Object localObject = this;
    switch (Cut.1.$SwitchMap$com$google$common$collect$BoundType[paramBoundType.ordinal()])
    {
    default: 
      throw new AssertionError();
    case 1: 
      paramBoundType = paramDiscreteDomain.next(endpoint);
      if (paramBoundType != null) {
        break;
      }
    }
    for (paramBoundType = Cut.belowAll();; paramBoundType = belowValue(paramBoundType))
    {
      localObject = paramBoundType;
      return (Cut<C>)localObject;
    }
  }
  
  Cut<C> withUpperBoundType(BoundType paramBoundType, DiscreteDomain<C> paramDiscreteDomain)
  {
    switch (Cut.1.$SwitchMap$com$google$common$collect$BoundType[paramBoundType.ordinal()])
    {
    default: 
      throw new AssertionError();
    case 2: 
      paramBoundType = paramDiscreteDomain.next(endpoint);
      if (paramBoundType == null) {
        return Cut.aboveAll();
      }
      return belowValue(paramBoundType);
    }
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Cut.AboveValue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */