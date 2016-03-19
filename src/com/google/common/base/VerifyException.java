package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public class VerifyException
  extends RuntimeException
{
  public VerifyException() {}
  
  public VerifyException(@Nullable String paramString)
  {
    super(paramString);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.VerifyException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */