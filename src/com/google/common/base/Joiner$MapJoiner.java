package com.google.common.base;

import com.google.common.annotations.Beta;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.CheckReturnValue;

public final class Joiner$MapJoiner
{
  private final Joiner joiner;
  private final String keyValueSeparator;
  
  private Joiner$MapJoiner(Joiner paramJoiner, String paramString)
  {
    joiner = paramJoiner;
    keyValueSeparator = ((String)Preconditions.checkNotNull(paramString));
  }
  
  @Beta
  public <A extends Appendable> A appendTo(A paramA, Iterable<? extends Map.Entry<?, ?>> paramIterable)
    throws IOException
  {
    return appendTo(paramA, paramIterable.iterator());
  }
  
  @Beta
  public <A extends Appendable> A appendTo(A paramA, Iterator<? extends Map.Entry<?, ?>> paramIterator)
    throws IOException
  {
    Preconditions.checkNotNull(paramA);
    if (paramIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramIterator.next();
      paramA.append(joiner.toString(localEntry.getKey()));
      paramA.append(keyValueSeparator);
      paramA.append(joiner.toString(localEntry.getValue()));
      while (paramIterator.hasNext())
      {
        paramA.append(Joiner.access$100(joiner));
        localEntry = (Map.Entry)paramIterator.next();
        paramA.append(joiner.toString(localEntry.getKey()));
        paramA.append(keyValueSeparator);
        paramA.append(joiner.toString(localEntry.getValue()));
      }
    }
    return paramA;
  }
  
  public <A extends Appendable> A appendTo(A paramA, Map<?, ?> paramMap)
    throws IOException
  {
    return appendTo(paramA, paramMap.entrySet());
  }
  
  @Beta
  public StringBuilder appendTo(StringBuilder paramStringBuilder, Iterable<? extends Map.Entry<?, ?>> paramIterable)
  {
    return appendTo(paramStringBuilder, paramIterable.iterator());
  }
  
  @Beta
  public StringBuilder appendTo(StringBuilder paramStringBuilder, Iterator<? extends Map.Entry<?, ?>> paramIterator)
  {
    try
    {
      appendTo(paramStringBuilder, paramIterator);
      return paramStringBuilder;
    }
    catch (IOException paramStringBuilder)
    {
      throw new AssertionError(paramStringBuilder);
    }
  }
  
  public StringBuilder appendTo(StringBuilder paramStringBuilder, Map<?, ?> paramMap)
  {
    return appendTo(paramStringBuilder, paramMap.entrySet());
  }
  
  @Beta
  public String join(Iterable<? extends Map.Entry<?, ?>> paramIterable)
  {
    return join(paramIterable.iterator());
  }
  
  @Beta
  public String join(Iterator<? extends Map.Entry<?, ?>> paramIterator)
  {
    return appendTo(new StringBuilder(), paramIterator).toString();
  }
  
  public String join(Map<?, ?> paramMap)
  {
    return join(paramMap.entrySet());
  }
  
  @CheckReturnValue
  public MapJoiner useForNull(String paramString)
  {
    return new MapJoiner(joiner.useForNull(paramString), keyValueSeparator);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Joiner.MapJoiner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */