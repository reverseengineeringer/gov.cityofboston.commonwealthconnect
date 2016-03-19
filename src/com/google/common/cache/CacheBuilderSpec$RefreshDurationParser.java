package com.google.common.cache;

import com.google.common.base.Preconditions;
import java.util.concurrent.TimeUnit;

class CacheBuilderSpec$RefreshDurationParser
  extends CacheBuilderSpec.DurationParser
{
  protected void parseDuration(CacheBuilderSpec paramCacheBuilderSpec, long paramLong, TimeUnit paramTimeUnit)
  {
    if (refreshTimeUnit == null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "refreshAfterWrite already set");
      refreshDuration = paramLong;
      refreshTimeUnit = paramTimeUnit;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.RefreshDurationParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */