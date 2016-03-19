package com.google.common.cache;

import com.google.common.base.Preconditions;

class CacheBuilderSpec$MaximumWeightParser
  extends CacheBuilderSpec.LongParser
{
  protected void parseLong(CacheBuilderSpec paramCacheBuilderSpec, long paramLong)
  {
    if (maximumWeight == null)
    {
      bool = true;
      Preconditions.checkArgument(bool, "maximum weight was already set to ", new Object[] { maximumWeight });
      if (maximumSize != null) {
        break label71;
      }
    }
    label71:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "maximum size was already set to ", new Object[] { maximumSize });
      maximumWeight = Long.valueOf(paramLong);
      return;
      bool = false;
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.MaximumWeightParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */