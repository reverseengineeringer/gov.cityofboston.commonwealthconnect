package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Converter$ConverterComposition<A, B, C>
  extends Converter<A, C>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Converter<A, B> first;
  final Converter<B, C> second;
  
  Converter$ConverterComposition(Converter<A, B> paramConverter, Converter<B, C> paramConverter1)
  {
    first = paramConverter;
    second = paramConverter1;
  }
  
  @Nullable
  A correctedDoBackward(@Nullable C paramC)
  {
    return (A)first.correctedDoBackward(second.correctedDoBackward(paramC));
  }
  
  @Nullable
  C correctedDoForward(@Nullable A paramA)
  {
    return (C)second.correctedDoForward(first.correctedDoForward(paramA));
  }
  
  protected A doBackward(C paramC)
  {
    throw new AssertionError();
  }
  
  protected C doForward(A paramA)
  {
    throw new AssertionError();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof ConverterComposition))
    {
      paramObject = (ConverterComposition)paramObject;
      bool1 = bool2;
      if (first.equals(first))
      {
        bool1 = bool2;
        if (second.equals(second)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return first.hashCode() * 31 + second.hashCode();
  }
  
  public String toString()
  {
    return first + ".andThen(" + second + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Converter.ConverterComposition
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */