package com.google.common.io;

import com.google.common.base.Splitter;
import com.google.common.collect.AbstractIterator;
import java.util.Iterator;

class CharSource$CharSequenceCharSource$1
  implements Iterable<String>
{
  CharSource$CharSequenceCharSource$1(CharSource.CharSequenceCharSource paramCharSequenceCharSource) {}
  
  public Iterator<String> iterator()
  {
    new AbstractIterator()
    {
      Iterator<String> lines = CharSource.CharSequenceCharSource.access$200().split(CharSource.CharSequenceCharSource.access$100(this$0)).iterator();
      
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
}

/* Location:
 * Qualified Name:     com.google.common.io.CharSource.CharSequenceCharSource.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */