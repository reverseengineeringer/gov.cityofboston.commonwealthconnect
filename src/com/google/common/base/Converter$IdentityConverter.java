package com.google.common.base;

import java.io.Serializable;

final class Converter$IdentityConverter<T>
  extends Converter<T, T>
  implements Serializable
{
  static final IdentityConverter INSTANCE = new IdentityConverter();
  private static final long serialVersionUID = 0L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  public <S> Converter<T, S> andThen(Converter<T, S> paramConverter)
  {
    return (Converter)Preconditions.checkNotNull(paramConverter, "otherConverter");
  }
  
  protected T doBackward(T paramT)
  {
    return paramT;
  }
  
  protected T doForward(T paramT)
  {
    return paramT;
  }
  
  public IdentityConverter<T> reverse()
  {
    return this;
  }
  
  public String toString()
  {
    return "Converter.identity()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Converter.IdentityConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */