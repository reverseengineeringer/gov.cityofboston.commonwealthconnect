package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Converter$ReverseConverter<A, B>
  extends Converter<B, A>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Converter<A, B> original;
  
  Converter$ReverseConverter(Converter<A, B> paramConverter)
  {
    original = paramConverter;
  }
  
  @Nullable
  B correctedDoBackward(@Nullable A paramA)
  {
    return (B)original.correctedDoForward(paramA);
  }
  
  @Nullable
  A correctedDoForward(@Nullable B paramB)
  {
    return (A)original.correctedDoBackward(paramB);
  }
  
  protected B doBackward(A paramA)
  {
    throw new AssertionError();
  }
  
  protected A doForward(B paramB)
  {
    throw new AssertionError();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof ReverseConverter))
    {
      paramObject = (ReverseConverter)paramObject;
      return original.equals(original);
    }
    return false;
  }
  
  public int hashCode()
  {
    return original.hashCode() ^ 0xFFFFFFFF;
  }
  
  public Converter<A, B> reverse()
  {
    return original;
  }
  
  public String toString()
  {
    return original + ".reverse()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Converter.ReverseConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */