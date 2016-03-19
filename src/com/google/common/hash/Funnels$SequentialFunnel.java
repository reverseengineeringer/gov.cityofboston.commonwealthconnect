package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Iterator;
import javax.annotation.Nullable;

class Funnels$SequentialFunnel<E>
  implements Funnel<Iterable<? extends E>>, Serializable
{
  private final Funnel<E> elementFunnel;
  
  Funnels$SequentialFunnel(Funnel<E> paramFunnel)
  {
    elementFunnel = ((Funnel)Preconditions.checkNotNull(paramFunnel));
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof SequentialFunnel))
    {
      paramObject = (SequentialFunnel)paramObject;
      return elementFunnel.equals(elementFunnel);
    }
    return false;
  }
  
  public void funnel(Iterable<? extends E> paramIterable, PrimitiveSink paramPrimitiveSink)
  {
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext())
    {
      Object localObject = paramIterable.next();
      elementFunnel.funnel(localObject, paramPrimitiveSink);
    }
  }
  
  public int hashCode()
  {
    return SequentialFunnel.class.hashCode() ^ elementFunnel.hashCode();
  }
  
  public String toString()
  {
    return "Funnels.sequentialFunnel(" + elementFunnel + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.SequentialFunnel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */