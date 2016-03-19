package com.google.common.cache;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

class CacheBuilderSpec$RecordStatsParser
  implements CacheBuilderSpec.ValueParser
{
  public void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, @Nullable String paramString2)
  {
    boolean bool2 = false;
    if (paramString2 == null) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      Preconditions.checkArgument(bool1, "recordStats does not take values");
      bool1 = bool2;
      if (recordStats == null) {
        bool1 = true;
      }
      Preconditions.checkArgument(bool1, "recordStats already set");
      recordStats = Boolean.valueOf(true);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.RecordStatsParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */