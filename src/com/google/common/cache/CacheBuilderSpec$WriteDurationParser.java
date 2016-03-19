package com.google.common.cache;

import com.google.common.base.Preconditions;
import java.util.concurrent.TimeUnit;

class CacheBuilderSpec$WriteDurationParser
  extends CacheBuilderSpec.DurationParser
{
  protected void parseDuration(CacheBuilderSpec paramCacheBuilderSpec, long paramLong, TimeUnit paramTimeUnit)
  {
    if (writeExpirationTimeUnit == null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "expireAfterWrite already set");
      writeExpirationDuration = paramLong;
      writeExpirationTimeUnit = paramTimeUnit;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.WriteDurationParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */