package com.google.common.cache;

import com.google.common.base.Preconditions;

class CacheBuilderSpec$MaximumSizeParser
  extends CacheBuilderSpec.LongParser
{
  protected void parseLong(CacheBuilderSpec paramCacheBuilderSpec, long paramLong)
  {
    if (maximumSize == null)
    {
      bool = true;
      Preconditions.checkArgument(bool, "maximum size was already set to ", new Object[] { maximumSize });
      if (maximumWeight != null) {
        break label71;
      }
    }
    label71:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "maximum weight was already set to ", new Object[] { maximumWeight });
      maximumSize = Long.valueOf(paramLong);
      return;
      bool = false;
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.MaximumSizeParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */