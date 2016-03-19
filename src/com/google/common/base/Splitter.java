package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.CheckReturnValue;

@GwtCompatible(emulated=true)
public final class Splitter
{
  private final int limit;
  private final boolean omitEmptyStrings;
  private final Strategy strategy;
  private final CharMatcher trimmer;
  
  private Splitter(Strategy paramStrategy)
  {
    this(paramStrategy, false, CharMatcher.NONE, Integer.MAX_VALUE);
  }
  
  private Splitter(Strategy paramStrategy, boolean paramBoolean, CharMatcher paramCharMatcher, int paramInt)
  {
    strategy = paramStrategy;
    omitEmptyStrings = paramBoolean;
    trimmer = paramCharMatcher;
    limit = paramInt;
  }
  
  public static Splitter fixedLength(int paramInt)
  {
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "The length may not be less than 1");
      new Splitter(new Strategy()
      {
        public Splitter.SplittingIterator iterator(Splitter paramAnonymousSplitter, CharSequence paramAnonymousCharSequence)
        {
          new Splitter.SplittingIterator(paramAnonymousSplitter, paramAnonymousCharSequence)
          {
            public int separatorEnd(int paramAnonymous2Int)
            {
              return paramAnonymous2Int;
            }
            
            public int separatorStart(int paramAnonymous2Int)
            {
              paramAnonymous2Int += val$length;
              if (paramAnonymous2Int < toSplit.length()) {
                return paramAnonymous2Int;
              }
              return -1;
            }
          };
        }
      });
    }
  }
  
  public static Splitter on(char paramChar)
  {
    return on(CharMatcher.is(paramChar));
  }
  
  public static Splitter on(CharMatcher paramCharMatcher)
  {
    Preconditions.checkNotNull(paramCharMatcher);
    new Splitter(new Strategy()
    {
      public Splitter.SplittingIterator iterator(Splitter paramAnonymousSplitter, CharSequence paramAnonymousCharSequence)
      {
        new Splitter.SplittingIterator(paramAnonymousSplitter, paramAnonymousCharSequence)
        {
          int separatorEnd(int paramAnonymous2Int)
          {
            return paramAnonymous2Int + 1;
          }
          
          int separatorStart(int paramAnonymous2Int)
          {
            return val$separatorMatcher.indexIn(toSplit, paramAnonymous2Int);
          }
        };
      }
    });
  }
  
  public static Splitter on(String paramString)
  {
    if (paramString.length() != 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "The separator may not be the empty string.");
      new Splitter(new Strategy()
      {
        public Splitter.SplittingIterator iterator(Splitter paramAnonymousSplitter, CharSequence paramAnonymousCharSequence)
        {
          new Splitter.SplittingIterator(paramAnonymousSplitter, paramAnonymousCharSequence)
          {
            public int separatorEnd(int paramAnonymous2Int)
            {
              return val$separator.length() + paramAnonymous2Int;
            }
            
            public int separatorStart(int paramAnonymous2Int)
            {
              int k = val$separator.length();
              int m = toSplit.length();
              if (paramAnonymous2Int <= m - k)
              {
                int i = 0;
                for (;;)
                {
                  j = paramAnonymous2Int;
                  if (i >= k) {
                    return j;
                  }
                  if (toSplit.charAt(i + paramAnonymous2Int) != val$separator.charAt(i))
                  {
                    paramAnonymous2Int += 1;
                    break;
                  }
                  i += 1;
                }
              }
              int j = -1;
              return j;
            }
          };
        }
      });
    }
  }
  
  @GwtIncompatible("java.util.regex")
  public static Splitter on(Pattern paramPattern)
  {
    Preconditions.checkNotNull(paramPattern);
    if (!paramPattern.matcher("").matches()) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "The pattern may not match the empty string: %s", new Object[] { paramPattern });
      new Splitter(new Strategy()
      {
        public Splitter.SplittingIterator iterator(Splitter paramAnonymousSplitter, CharSequence paramAnonymousCharSequence)
        {
          new Splitter.SplittingIterator(paramAnonymousSplitter, paramAnonymousCharSequence)
          {
            public int separatorEnd(int paramAnonymous2Int)
            {
              return val$matcher.end();
            }
            
            public int separatorStart(int paramAnonymous2Int)
            {
              if (val$matcher.find(paramAnonymous2Int)) {
                return val$matcher.start();
              }
              return -1;
            }
          };
        }
      });
    }
  }
  
  @GwtIncompatible("java.util.regex")
  public static Splitter onPattern(String paramString)
  {
    return on(Pattern.compile(paramString));
  }
  
  private Iterator<String> splittingIterator(CharSequence paramCharSequence)
  {
    return strategy.iterator(this, paramCharSequence);
  }
  
  @CheckReturnValue
  public Splitter limit(int paramInt)
  {
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "must be greater than zero: %s", new Object[] { Integer.valueOf(paramInt) });
      return new Splitter(strategy, omitEmptyStrings, trimmer, paramInt);
    }
  }
  
  @CheckReturnValue
  public Splitter omitEmptyStrings()
  {
    return new Splitter(strategy, true, trimmer, limit);
  }
  
  public Iterable<String> split(final CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    new Iterable()
    {
      public Iterator<String> iterator()
      {
        return Splitter.this.splittingIterator(paramCharSequence);
      }
      
      public String toString()
      {
        return ']';
      }
    };
  }
  
  @Beta
  public List<String> splitToList(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    paramCharSequence = splittingIterator(paramCharSequence);
    ArrayList localArrayList = new ArrayList();
    while (paramCharSequence.hasNext()) {
      localArrayList.add(paramCharSequence.next());
    }
    return Collections.unmodifiableList(localArrayList);
  }
  
  @CheckReturnValue
  public Splitter trimResults()
  {
    return trimResults(CharMatcher.WHITESPACE);
  }
  
  @CheckReturnValue
  public Splitter trimResults(CharMatcher paramCharMatcher)
  {
    Preconditions.checkNotNull(paramCharMatcher);
    return new Splitter(strategy, omitEmptyStrings, paramCharMatcher, limit);
  }
  
  @CheckReturnValue
  @Beta
  public MapSplitter withKeyValueSeparator(char paramChar)
  {
    return withKeyValueSeparator(on(paramChar));
  }
  
  @CheckReturnValue
  @Beta
  public MapSplitter withKeyValueSeparator(Splitter paramSplitter)
  {
    return new MapSplitter(this, paramSplitter, null);
  }
  
  @CheckReturnValue
  @Beta
  public MapSplitter withKeyValueSeparator(String paramString)
  {
    return withKeyValueSeparator(on(paramString));
  }
  
  @Beta
  public static final class MapSplitter
  {
    private static final String INVALID_ENTRY_MESSAGE = "Chunk [%s] is not a valid entry";
    private final Splitter entrySplitter;
    private final Splitter outerSplitter;
    
    private MapSplitter(Splitter paramSplitter1, Splitter paramSplitter2)
    {
      outerSplitter = paramSplitter1;
      entrySplitter = ((Splitter)Preconditions.checkNotNull(paramSplitter2));
    }
    
    public Map<String, String> split(CharSequence paramCharSequence)
    {
      LinkedHashMap localLinkedHashMap = new LinkedHashMap();
      paramCharSequence = outerSplitter.split(paramCharSequence).iterator();
      if (paramCharSequence.hasNext())
      {
        String str1 = (String)paramCharSequence.next();
        Iterator localIterator = entrySplitter.splittingIterator(str1);
        Preconditions.checkArgument(localIterator.hasNext(), "Chunk [%s] is not a valid entry", new Object[] { str1 });
        String str2 = (String)localIterator.next();
        if (!localLinkedHashMap.containsKey(str2))
        {
          bool = true;
          label99:
          Preconditions.checkArgument(bool, "Duplicate key [%s] found.", new Object[] { str2 });
          Preconditions.checkArgument(localIterator.hasNext(), "Chunk [%s] is not a valid entry", new Object[] { str1 });
          localLinkedHashMap.put(str2, (String)localIterator.next());
          if (localIterator.hasNext()) {
            break label189;
          }
        }
        label189:
        for (boolean bool = true;; bool = false)
        {
          Preconditions.checkArgument(bool, "Chunk [%s] is not a valid entry", new Object[] { str1 });
          break;
          bool = false;
          break label99;
        }
      }
      return Collections.unmodifiableMap(localLinkedHashMap);
    }
  }
  
  private static abstract class SplittingIterator
    extends AbstractIterator<String>
  {
    int limit;
    int offset = 0;
    final boolean omitEmptyStrings;
    final CharSequence toSplit;
    final CharMatcher trimmer;
    
    protected SplittingIterator(Splitter paramSplitter, CharSequence paramCharSequence)
    {
      trimmer = trimmer;
      omitEmptyStrings = omitEmptyStrings;
      limit = limit;
      toSplit = paramCharSequence;
    }
    
    protected String computeNext()
    {
      int i = offset;
      while (offset != -1)
      {
        int k = i;
        int m = separatorStart(offset);
        int j;
        if (m == -1) {
          j = toSplit.length();
        }
        for (offset = -1;; offset = separatorEnd(m))
        {
          if (offset != i) {
            break label104;
          }
          offset += 1;
          if (offset < toSplit.length()) {
            break;
          }
          offset = -1;
          break;
          j = m;
        }
        for (;;)
        {
          label104:
          i = j;
          if (k >= j) {
            break;
          }
          i = j;
          if (!trimmer.matches(toSplit.charAt(k))) {
            break;
          }
          k += 1;
        }
        while ((i > k) && (trimmer.matches(toSplit.charAt(i - 1)))) {
          i -= 1;
        }
        if ((omitEmptyStrings) && (k == i))
        {
          i = offset;
        }
        else
        {
          if (limit == 1)
          {
            i = toSplit.length();
            offset = -1;
            for (;;)
            {
              j = i;
              if (i <= k) {
                break;
              }
              j = i;
              if (!trimmer.matches(toSplit.charAt(i - 1))) {
                break;
              }
              i -= 1;
            }
          }
          limit -= 1;
          j = i;
          return toSplit.subSequence(k, j).toString();
        }
      }
      return (String)endOfData();
    }
    
    abstract int separatorEnd(int paramInt);
    
    abstract int separatorStart(int paramInt);
  }
  
  private static abstract interface Strategy
  {
    public abstract Iterator<String> iterator(Splitter paramSplitter, CharSequence paramCharSequence);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Splitter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */