package com.google.common.io;

import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.collect.AbstractIterator;
import com.google.common.collect.ImmutableList;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;
import java.util.regex.Pattern;

class CharSource$CharSequenceCharSource
  extends CharSource
{
  private static final Splitter LINE_SPLITTER = Splitter.on(Pattern.compile("\r\n|\n|\r"));
  private final CharSequence seq;
  
  protected CharSource$CharSequenceCharSource(CharSequence paramCharSequence)
  {
    seq = ((CharSequence)Preconditions.checkNotNull(paramCharSequence));
  }
  
  private Iterable<String> lines()
  {
    new Iterable()
    {
      public Iterator<String> iterator()
      {
        new AbstractIterator()
        {
          Iterator<String> lines = CharSource.CharSequenceCharSource.LINE_SPLITTER.split(seq).iterator();
          
          protected String computeNext()
          {
            if (lines.hasNext())
            {
              String str = (String)lines.next();
              if ((lines.hasNext()) || (!str.isEmpty())) {
                return str;
              }
            }
            return (String)endOfData();
          }
        };
      }
    };
  }
  
  public boolean isEmpty()
  {
    return seq.length() == 0;
  }
  
  public Reader openStream()
  {
    return new CharSequenceReader(seq);
  }
  
  public String read()
  {
    return seq.toString();
  }
  
  public String readFirstLine()
  {
    Iterator localIterator = lines().iterator();
    if (localIterator.hasNext()) {
      return (String)localIterator.next();
    }
    return null;
  }
  
  public ImmutableList<String> readLines()
  {
    return ImmutableList.copyOf(lines());
  }
  
  public <T> T readLines(LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    Iterator localIterator = lines().iterator();
    while ((localIterator.hasNext()) && (paramLineProcessor.processLine((String)localIterator.next()))) {}
    return (T)paramLineProcessor.getResult();
  }
  
  public String toString()
  {
    return "CharSource.wrap(" + Ascii.truncate(seq, 30, "...") + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharSource.CharSequenceCharSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */