package com.google.common.primitives;

import com.google.common.base.Converter;
import java.io.Serializable;

final class Floats$FloatConverter
  extends Converter<String, Float>
  implements Serializable
{
  static final FloatConverter INSTANCE = new FloatConverter();
  private static final long serialVersionUID = 1L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  protected String doBackward(Float paramFloat)
  {
    return paramFloat.toString();
  }
  
  protected Float doForward(String paramString)
  {
    return Float.valueOf(paramString);
  }
  
  public String toString()
  {
    return "Floats.stringConverter()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Floats.FloatConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */