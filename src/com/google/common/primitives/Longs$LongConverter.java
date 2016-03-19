package com.google.common.primitives;

import com.google.common.base.Converter;
import java.io.Serializable;

final class Longs$LongConverter
  extends Converter<String, Long>
  implements Serializable
{
  static final LongConverter INSTANCE = new LongConverter();
  private static final long serialVersionUID = 1L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  protected String doBackward(Long paramLong)
  {
    return paramLong.toString();
  }
  
  protected Long doForward(String paramString)
  {
    return Long.decode(paramString);
  }
  
  public String toString()
  {
    return "Longs.stringConverter()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Longs.LongConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */