package com.google.common.base;

import java.util.Arrays;

class CharMatcher$RangesMatcher
  extends CharMatcher
{
  private final char[] rangeEnds;
  private final char[] rangeStarts;
  
  CharMatcher$RangesMatcher(String paramString, char[] paramArrayOfChar1, char[] paramArrayOfChar2)
  {
    super(paramString);
    rangeStarts = paramArrayOfChar1;
    rangeEnds = paramArrayOfChar2;
    int i;
    if (paramArrayOfChar1.length == paramArrayOfChar2.length)
    {
      bool = true;
      Preconditions.checkArgument(bool);
      i = 0;
      label33:
      if (i >= paramArrayOfChar1.length) {
        return;
      }
      if (paramArrayOfChar1[i] > paramArrayOfChar2[i]) {
        break label104;
      }
      bool = true;
      label54:
      Preconditions.checkArgument(bool);
      if (i + 1 < paramArrayOfChar1.length) {
        if (paramArrayOfChar2[i] >= paramArrayOfChar1[(i + 1)]) {
          break label110;
        }
      }
    }
    label104:
    label110:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      i += 1;
      break label33;
      bool = false;
      break;
      bool = false;
      break label54;
    }
  }
  
  public boolean matches(char paramChar)
  {
    int i = Arrays.binarySearch(rangeStarts, paramChar);
    if (i >= 0) {}
    do
    {
      return true;
      i = (i ^ 0xFFFFFFFF) - 1;
    } while ((i >= 0) && (paramChar <= rangeEnds[i]));
    return false;
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.RangesMatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */