package com.google.common.primitives;

import com.google.common.base.Converter;
import java.io.Serializable;

final class Ints$IntConverter
  extends Converter<String, Integer>
  implements Serializable
{
  static final IntConverter INSTANCE = new IntConverter();
  private static final long serialVersionUID = 1L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  protected String doBackward(Integer paramInteger)
  {
    return paramInteger.toString();
  }
  
  protected Integer doForward(String paramString)
  {
    return Integer.decode(paramString);
  }
  
  public String toString()
  {
    return "Ints.stringConverter()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Ints.IntConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */