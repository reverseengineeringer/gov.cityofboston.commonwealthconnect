package com.google.common.base;

abstract class Splitter$SplittingIterator
  extends AbstractIterator<String>
{
  int limit;
  int offset = 0;
  final boolean omitEmptyStrings;
  final CharSequence toSplit;
  final CharMatcher trimmer;
  
  protected Splitter$SplittingIterator(Splitter paramSplitter, CharSequence paramCharSequence)
  {
    trimmer = Splitter.access$200(paramSplitter);
    omitEmptyStrings = Splitter.access$300(paramSplitter);
    limit = Splitter.access$400(paramSplitter);
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

/* Location:
 * Qualified Name:     com.google.common.base.Splitter.SplittingIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */