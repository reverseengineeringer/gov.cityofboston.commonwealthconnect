package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Objects;
import com.google.common.base.Objects.ToStringHelper;
import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public final class CacheStats
{
  private final long evictionCount;
  private final long hitCount;
  private final long loadExceptionCount;
  private final long loadSuccessCount;
  private final long missCount;
  private final long totalLoadTime;
  
  public CacheStats(long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6)
  {
    if (paramLong1 >= 0L)
    {
      bool = true;
      Preconditions.checkArgument(bool);
      if (paramLong2 < 0L) {
        break label133;
      }
      bool = true;
      label27:
      Preconditions.checkArgument(bool);
      if (paramLong3 < 0L) {
        break label139;
      }
      bool = true;
      label42:
      Preconditions.checkArgument(bool);
      if (paramLong4 < 0L) {
        break label145;
      }
      bool = true;
      label57:
      Preconditions.checkArgument(bool);
      if (paramLong5 < 0L) {
        break label151;
      }
      bool = true;
      label72:
      Preconditions.checkArgument(bool);
      if (paramLong6 < 0L) {
        break label157;
      }
    }
    label133:
    label139:
    label145:
    label151:
    label157:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      hitCount = paramLong1;
      missCount = paramLong2;
      loadSuccessCount = paramLong3;
      loadExceptionCount = paramLong4;
      totalLoadTime = paramLong5;
      evictionCount = paramLong6;
      return;
      bool = false;
      break;
      bool = false;
      break label27;
      bool = false;
      break label42;
      bool = false;
      break label57;
      bool = false;
      break label72;
    }
  }
  
  public double averageLoadPenalty()
  {
    long l = loadSuccessCount + loadExceptionCount;
    if (l == 0L) {
      return 0.0D;
    }
    return totalLoadTime / l;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof CacheStats))
    {
      paramObject = (CacheStats)paramObject;
      bool1 = bool2;
      if (hitCount == hitCount)
      {
        bool1 = bool2;
        if (missCount == missCount)
        {
          bool1 = bool2;
          if (loadSuccessCount == loadSuccessCount)
          {
            bool1 = bool2;
            if (loadExceptionCount == loadExceptionCount)
            {
              bool1 = bool2;
              if (totalLoadTime == totalLoadTime)
              {
                bool1 = bool2;
                if (evictionCount == evictionCount) {
                  bool1 = true;
                }
              }
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public long evictionCount()
  {
    return evictionCount;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { Long.valueOf(hitCount), Long.valueOf(missCount), Long.valueOf(loadSuccessCount), Long.valueOf(loadExceptionCount), Long.valueOf(totalLoadTime), Long.valueOf(evictionCount) });
  }
  
  public long hitCount()
  {
    return hitCount;
  }
  
  public double hitRate()
  {
    long l = requestCount();
    if (l == 0L) {
      return 1.0D;
    }
    return hitCount / l;
  }
  
  public long loadCount()
  {
    return loadSuccessCount + loadExceptionCount;
  }
  
  public long loadExceptionCount()
  {
    return loadExceptionCount;
  }
  
  public double loadExceptionRate()
  {
    long l = loadSuccessCount + loadExceptionCount;
    if (l == 0L) {
      return 0.0D;
    }
    return loadExceptionCount / l;
  }
  
  public long loadSuccessCount()
  {
    return loadSuccessCount;
  }
  
  public CacheStats minus(CacheStats paramCacheStats)
  {
    return new CacheStats(Math.max(0L, hitCount - hitCount), Math.max(0L, missCount - missCount), Math.max(0L, loadSuccessCount - loadSuccessCount), Math.max(0L, loadExceptionCount - loadExceptionCount), Math.max(0L, totalLoadTime - totalLoadTime), Math.max(0L, evictionCount - evictionCount));
  }
  
  public long missCount()
  {
    return missCount;
  }
  
  public double missRate()
  {
    long l = requestCount();
    if (l == 0L) {
      return 0.0D;
    }
    return missCount / l;
  }
  
  public CacheStats plus(CacheStats paramCacheStats)
  {
    return new CacheStats(hitCount + hitCount, missCount + missCount, loadSuccessCount + loadSuccessCount, loadExceptionCount + loadExceptionCount, totalLoadTime + totalLoadTime, evictionCount + evictionCount);
  }
  
  public long requestCount()
  {
    return hitCount + missCount;
  }
  
  public String toString()
  {
    return Objects.toStringHelper(this).add("hitCount", hitCount).add("missCount", missCount).add("loadSuccessCount", loadSuccessCount).add("loadExceptionCount", loadExceptionCount).add("totalLoadTime", totalLoadTime).add("evictionCount", evictionCount).toString();
  }
  
  public long totalLoadTime()
  {
    return totalLoadTime;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheStats
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */