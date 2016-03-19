package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;

@Beta
@GwtCompatible
public abstract class Escaper
{
  private final Function<String, String> asFunction = new Function()
  {
    public String apply(String paramAnonymousString)
    {
      return escape(paramAnonymousString);
    }
  };
  
  public final Function<String, String> asFunction()
  {
    return asFunction;
  }
  
  public abstract String escape(String paramString);
}

/* Location:
 * Qualified Name:     com.google.common.escape.Escaper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */