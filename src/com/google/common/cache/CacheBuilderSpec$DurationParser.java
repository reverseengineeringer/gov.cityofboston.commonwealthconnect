package com.google.common.cache;

import com.google.common.base.Preconditions;
import java.util.concurrent.TimeUnit;

abstract class CacheBuilderSpec$DurationParser
  implements CacheBuilderSpec.ValueParser
{
  public void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, String paramString2)
  {
    boolean bool;
    if ((paramString2 != null) && (!paramString2.isEmpty()))
    {
      bool = true;
      Preconditions.checkArgument(bool, "value of key %s omitted", new Object[] { paramString1 });
    }
    for (;;)
    {
      try
      {
        switch (paramString2.charAt(paramString2.length() - 1))
        {
        case 'd': 
          throw new IllegalArgumentException(String.format("key %s invalid format.  was %s, must end with one of [dDhHmMsS]", new Object[] { paramString1, paramString2 }));
        }
      }
      catch (NumberFormatException paramCacheBuilderSpec)
      {
        throw new IllegalArgumentException(String.format("key %s value set to %s, must be integer", new Object[] { paramString1, paramString2 }));
      }
      bool = false;
      break;
      TimeUnit localTimeUnit = TimeUnit.DAYS;
      for (;;)
      {
        parseDuration(paramCacheBuilderSpec, Long.parseLong(paramString2.substring(0, paramString2.length() - 1)), localTimeUnit);
        return;
        localTimeUnit = TimeUnit.HOURS;
        continue;
        localTimeUnit = TimeUnit.MINUTES;
        continue;
        localTimeUnit = TimeUnit.SECONDS;
      }
    }
  }
  
  protected abstract void parseDuration(CacheBuilderSpec paramCacheBuilderSpec, long paramLong, TimeUnit paramTimeUnit);
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.DurationParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */