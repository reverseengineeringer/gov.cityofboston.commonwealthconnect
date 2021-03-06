package com.google.common.cache;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

class CacheBuilderSpec$KeyStrengthParser
  implements CacheBuilderSpec.ValueParser
{
  private final LocalCache.Strength strength;
  
  public CacheBuilderSpec$KeyStrengthParser(LocalCache.Strength paramStrength)
  {
    strength = paramStrength;
  }
  
  public void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, @Nullable String paramString2)
  {
    if (paramString2 == null)
    {
      bool = true;
      Preconditions.checkArgument(bool, "key %s does not take values", new Object[] { paramString1 });
      if (keyStrength != null) {
        break label69;
      }
    }
    label69:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "%s was already set to %s", new Object[] { paramString1, keyStrength });
      keyStrength = strength;
      return;
      bool = false;
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.KeyStrengthParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */