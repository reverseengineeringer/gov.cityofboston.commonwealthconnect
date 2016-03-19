package com.google.common.util.concurrent;

import com.google.common.base.Function;
import java.lang.reflect.Constructor;
import java.util.Arrays;
import java.util.List;

final class Futures$6
  implements Function<Constructor<?>, Boolean>
{
  public Boolean apply(Constructor<?> paramConstructor)
  {
    return Boolean.valueOf(Arrays.asList(paramConstructor.getParameterTypes()).contains(String.class));
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */