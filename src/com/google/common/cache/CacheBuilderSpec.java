package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import com.google.common.base.Objects.ToStringHelper;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;

@Beta
public final class CacheBuilderSpec
{
  private static final Splitter KEYS_SPLITTER = Splitter.on(',').trimResults();
  private static final Splitter KEY_VALUE_SPLITTER = Splitter.on('=').trimResults();
  private static final ImmutableMap<String, ValueParser> VALUE_PARSERS = ImmutableMap.builder().put("initialCapacity", new InitialCapacityParser()).put("maximumSize", new MaximumSizeParser()).put("maximumWeight", new MaximumWeightParser()).put("concurrencyLevel", new ConcurrencyLevelParser()).put("weakKeys", new KeyStrengthParser(LocalCache.Strength.WEAK)).put("softValues", new ValueStrengthParser(LocalCache.Strength.SOFT)).put("weakValues", new ValueStrengthParser(LocalCache.Strength.WEAK)).put("recordStats", new RecordStatsParser()).put("expireAfterAccess", new AccessDurationParser()).put("expireAfterWrite", new WriteDurationParser()).put("refreshAfterWrite", new RefreshDurationParser()).put("refreshInterval", new RefreshDurationParser()).build();
  @VisibleForTesting
  long accessExpirationDuration;
  @VisibleForTesting
  TimeUnit accessExpirationTimeUnit;
  @VisibleForTesting
  Integer concurrencyLevel;
  @VisibleForTesting
  Integer initialCapacity;
  @VisibleForTesting
  LocalCache.Strength keyStrength;
  @VisibleForTesting
  Long maximumSize;
  @VisibleForTesting
  Long maximumWeight;
  @VisibleForTesting
  Boolean recordStats;
  @VisibleForTesting
  long refreshDuration;
  @VisibleForTesting
  TimeUnit refreshTimeUnit;
  private final String specification;
  @VisibleForTesting
  LocalCache.Strength valueStrength;
  @VisibleForTesting
  long writeExpirationDuration;
  @VisibleForTesting
  TimeUnit writeExpirationTimeUnit;
  
  private CacheBuilderSpec(String paramString)
  {
    specification = paramString;
  }
  
  public static CacheBuilderSpec disableCaching()
  {
    return parse("maximumSize=0");
  }
  
  @Nullable
  private static Long durationInNanos(long paramLong, @Nullable TimeUnit paramTimeUnit)
  {
    if (paramTimeUnit == null) {
      return null;
    }
    return Long.valueOf(paramTimeUnit.toNanos(paramLong));
  }
  
  public static CacheBuilderSpec parse(String paramString)
  {
    CacheBuilderSpec localCacheBuilderSpec = new CacheBuilderSpec(paramString);
    if (!paramString.isEmpty())
    {
      Iterator localIterator = KEYS_SPLITTER.split(paramString).iterator();
      if (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        paramString = ImmutableList.copyOf(KEY_VALUE_SPLITTER.split(str));
        boolean bool;
        label72:
        label90:
        ValueParser localValueParser;
        if (!paramString.isEmpty())
        {
          bool = true;
          Preconditions.checkArgument(bool, "blank key-value pair");
          if (paramString.size() > 2) {
            break label183;
          }
          bool = true;
          Preconditions.checkArgument(bool, "key-value pair %s with more than one equals sign", new Object[] { str });
          str = (String)paramString.get(0);
          localValueParser = (ValueParser)VALUE_PARSERS.get(str);
          if (localValueParser == null) {
            break label188;
          }
          bool = true;
          label137:
          Preconditions.checkArgument(bool, "unknown key %s", new Object[] { str });
          if (paramString.size() != 1) {
            break label193;
          }
        }
        label183:
        label188:
        label193:
        for (paramString = null;; paramString = (String)paramString.get(1))
        {
          localValueParser.parse(localCacheBuilderSpec, str, paramString);
          break;
          bool = false;
          break label72;
          bool = false;
          break label90;
          bool = false;
          break label137;
        }
      }
    }
    return localCacheBuilderSpec;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof CacheBuilderSpec)) {
        return false;
      }
      paramObject = (CacheBuilderSpec)paramObject;
    } while ((Objects.equal(initialCapacity, initialCapacity)) && (Objects.equal(maximumSize, maximumSize)) && (Objects.equal(maximumWeight, maximumWeight)) && (Objects.equal(concurrencyLevel, concurrencyLevel)) && (Objects.equal(keyStrength, keyStrength)) && (Objects.equal(valueStrength, valueStrength)) && (Objects.equal(recordStats, recordStats)) && (Objects.equal(durationInNanos(writeExpirationDuration, writeExpirationTimeUnit), durationInNanos(writeExpirationDuration, writeExpirationTimeUnit))) && (Objects.equal(durationInNanos(accessExpirationDuration, accessExpirationTimeUnit), durationInNanos(accessExpirationDuration, accessExpirationTimeUnit))) && (Objects.equal(durationInNanos(refreshDuration, refreshTimeUnit), durationInNanos(refreshDuration, refreshTimeUnit))));
    return false;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { initialCapacity, maximumSize, maximumWeight, concurrencyLevel, keyStrength, valueStrength, recordStats, durationInNanos(writeExpirationDuration, writeExpirationTimeUnit), durationInNanos(accessExpirationDuration, accessExpirationTimeUnit), durationInNanos(refreshDuration, refreshTimeUnit) });
  }
  
  CacheBuilder<Object, Object> toCacheBuilder()
  {
    CacheBuilder localCacheBuilder = CacheBuilder.newBuilder();
    if (initialCapacity != null) {
      localCacheBuilder.initialCapacity(initialCapacity.intValue());
    }
    if (maximumSize != null) {
      localCacheBuilder.maximumSize(maximumSize.longValue());
    }
    if (maximumWeight != null) {
      localCacheBuilder.maximumWeight(maximumWeight.longValue());
    }
    if (concurrencyLevel != null) {
      localCacheBuilder.concurrencyLevel(concurrencyLevel.intValue());
    }
    if (keyStrength != null)
    {
      switch (keyStrength)
      {
      default: 
        throw new AssertionError();
      }
      localCacheBuilder.weakKeys();
    }
    if (valueStrength != null) {
      switch (valueStrength)
      {
      default: 
        throw new AssertionError();
      case ???: 
        localCacheBuilder.softValues();
      }
    }
    for (;;)
    {
      if ((recordStats != null) && (recordStats.booleanValue())) {
        localCacheBuilder.recordStats();
      }
      if (writeExpirationTimeUnit != null) {
        localCacheBuilder.expireAfterWrite(writeExpirationDuration, writeExpirationTimeUnit);
      }
      if (accessExpirationTimeUnit != null) {
        localCacheBuilder.expireAfterAccess(accessExpirationDuration, accessExpirationTimeUnit);
      }
      if (refreshTimeUnit != null) {
        localCacheBuilder.refreshAfterWrite(refreshDuration, refreshTimeUnit);
      }
      return localCacheBuilder;
      localCacheBuilder.weakValues();
    }
  }
  
  public String toParsableString()
  {
    return specification;
  }
  
  public String toString()
  {
    return Objects.toStringHelper(this).addValue(toParsableString()).toString();
  }
  
  static class AccessDurationParser
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
  
  static class ConcurrencyLevelParser
    extends CacheBuilderSpec.IntegerParser
  {
    protected void parseInteger(CacheBuilderSpec paramCacheBuilderSpec, int paramInt)
    {
      if (concurrencyLevel == null) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "concurrency level was already set to ", new Object[] { concurrencyLevel });
        concurrencyLevel = Integer.valueOf(paramInt);
        return;
      }
    }
  }
  
  static abstract class DurationParser
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
  
  static class InitialCapacityParser
    extends CacheBuilderSpec.IntegerParser
  {
    protected void parseInteger(CacheBuilderSpec paramCacheBuilderSpec, int paramInt)
    {
      if (initialCapacity == null) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "initial capacity was already set to ", new Object[] { initialCapacity });
        initialCapacity = Integer.valueOf(paramInt);
        return;
      }
    }
  }
  
  static abstract class IntegerParser
    implements CacheBuilderSpec.ValueParser
  {
    public void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, String paramString2)
    {
      if ((paramString2 != null) && (!paramString2.isEmpty())) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "value of key %s omitted", new Object[] { paramString1 });
        try
        {
          parseInteger(paramCacheBuilderSpec, Integer.parseInt(paramString2));
          return;
        }
        catch (NumberFormatException paramCacheBuilderSpec)
        {
          throw new IllegalArgumentException(String.format("key %s value set to %s, must be integer", new Object[] { paramString1, paramString2 }), paramCacheBuilderSpec);
        }
      }
    }
    
    protected abstract void parseInteger(CacheBuilderSpec paramCacheBuilderSpec, int paramInt);
  }
  
  static class KeyStrengthParser
    implements CacheBuilderSpec.ValueParser
  {
    private final LocalCache.Strength strength;
    
    public KeyStrengthParser(LocalCache.Strength paramStrength)
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
  
  static abstract class LongParser
    implements CacheBuilderSpec.ValueParser
  {
    public void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, String paramString2)
    {
      if ((paramString2 != null) && (!paramString2.isEmpty())) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "value of key %s omitted", new Object[] { paramString1 });
        try
        {
          parseLong(paramCacheBuilderSpec, Long.parseLong(paramString2));
          return;
        }
        catch (NumberFormatException paramCacheBuilderSpec)
        {
          throw new IllegalArgumentException(String.format("key %s value set to %s, must be integer", new Object[] { paramString1, paramString2 }), paramCacheBuilderSpec);
        }
      }
    }
    
    protected abstract void parseLong(CacheBuilderSpec paramCacheBuilderSpec, long paramLong);
  }
  
  static class MaximumSizeParser
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
  
  static class MaximumWeightParser
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
  
  static class RecordStatsParser
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
  
  static class RefreshDurationParser
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
  
  private static abstract interface ValueParser
  {
    public abstract void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, @Nullable String paramString2);
  }
  
  static class ValueStrengthParser
    implements CacheBuilderSpec.ValueParser
  {
    private final LocalCache.Strength strength;
    
    public ValueStrengthParser(LocalCache.Strength paramStrength)
    {
      strength = paramStrength;
    }
    
    public void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, @Nullable String paramString2)
    {
      if (paramString2 == null)
      {
        bool = true;
        Preconditions.checkArgument(bool, "key %s does not take values", new Object[] { paramString1 });
        if (valueStrength != null) {
          break label69;
        }
      }
      label69:
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "%s was already set to %s", new Object[] { paramString1, valueStrength });
        valueStrength = strength;
        return;
        bool = false;
        break;
      }
    }
  }
  
  static class WriteDurationParser
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
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */