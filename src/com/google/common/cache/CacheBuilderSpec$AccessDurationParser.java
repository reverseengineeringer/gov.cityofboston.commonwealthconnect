package com.google.common.cache;

import com.google.common.base.Preconditions;
import java.util.concurrent.TimeUnit;

class CacheBuilderSpec$AccessDurationParser
  extends CacheBuilderSpec.DurationParser
{
  protected void parseDuration(CacheBuilderSpec paramCacheBuilderSpec, long paramLong, TimeUnit paramTimeUnit)
  {
    if (accessExpirationTimeUnit == null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "expireAfterAccess already set");
      accessExpirationDuration = paramLong;
      accessExpirationTimeUnit = paramTimeUnit;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.AccessDurationParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */