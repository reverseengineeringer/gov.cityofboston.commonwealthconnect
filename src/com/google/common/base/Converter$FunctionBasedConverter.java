package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Converter$FunctionBasedConverter<A, B>
  extends Converter<A, B>
  implements Serializable
{
  private final Function<? super B, ? extends A> backwardFunction;
  private final Function<? super A, ? extends B> forwardFunction;
  
  private Converter$FunctionBasedConverter(Function<? super A, ? extends B> paramFunction, Function<? super B, ? extends A> paramFunction1)
  {
    forwardFunction = ((Function)Preconditions.checkNotNull(paramFunction));
    backwardFunction = ((Function)Preconditions.checkNotNull(paramFunction1));
  }
  
  protected A doBackward(B paramB)
  {
    return (A)backwardFunction.apply(paramB);
  }
  
  protected B doForward(A paramA)
  {
    return (B)forwardFunction.apply(paramA);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof FunctionBasedConverter))
    {
      paramObject = (FunctionBasedConverter)paramObject;
      bool1 = bool2;
      if (forwardFunction.equals(forwardFunction))
      {
        bool1 = bool2;
        if (backwardFunction.equals(backwardFunction)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return forwardFunction.hashCode() * 31 + backwardFunction.hashCode();
  }
  
  public String toString()
  {
    return "Converter.from(" + forwardFunction + ", " + backwardFunction + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Converter.FunctionBasedConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */