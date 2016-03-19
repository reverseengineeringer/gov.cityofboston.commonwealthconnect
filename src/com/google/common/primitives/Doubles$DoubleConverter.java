package com.google.common.primitives;

import com.google.common.base.Converter;
import java.io.Serializable;

final class Doubles$DoubleConverter
  extends Converter<String, Double>
  implements Serializable
{
  static final DoubleConverter INSTANCE = new DoubleConverter();
  private static final long serialVersionUID = 1L;
  
  private Object readResolve()
  {
    return INSTANCE;
  }
  
  protected String doBackward(Double paramDouble)
  {
    return paramDouble.toString();
  }
  
  protected Double doForward(String paramString)
  {
    return Double.valueOf(paramString);
  }
  
  public String toString()
  {
    return "Doubles.stringConverter()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Doubles.DoubleConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */