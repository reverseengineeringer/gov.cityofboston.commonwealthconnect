package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;

@GwtIncompatible("serialization")
final class EmptyContiguousSet$SerializedForm<C extends Comparable>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final DiscreteDomain<C> domain;
  
  private EmptyContiguousSet$SerializedForm(DiscreteDomain<C> paramDiscreteDomain)
  {
    domain = paramDiscreteDomain;
  }
  
  private Object readResolve()
  {
    return new EmptyContiguousSet(domain);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.EmptyContiguousSet.SerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */