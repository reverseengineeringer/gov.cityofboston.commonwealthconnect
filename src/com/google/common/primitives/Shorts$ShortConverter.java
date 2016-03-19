package com.google.common.primitives;

import com.google.common.base.Converter;
import java.io.Serializable;

final class Shorts$ShortConverter
  extends Converter<String, Short>
  implements Serializable
{
  static final ShortConverter INSTANCE = new ShortConverter();
  private static final long serialVersionUID = 1L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  protected String doBackward(Short paramShort)
  {
    return paramShort.toString();
  }
  
  protected Short doForward(String paramString)
  {
    return Short.decode(paramString);
  }
  
  public String toString()
  {
    return "Shorts.stringConverter()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Shorts.ShortConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */