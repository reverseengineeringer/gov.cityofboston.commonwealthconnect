package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.util.BitSet;

@GwtIncompatible("java.util.BitSet")
class CharMatcher$BitSetMatcher
  extends CharMatcher.FastMatcher
{
  private final BitSet table;
  
  private CharMatcher$BitSetMatcher(BitSet paramBitSet, String paramString)
  {
    super(paramString);
    paramString = paramBitSet;
    if (paramBitSet.length() + 64 < paramBitSet.size()) {
      paramString = (BitSet)paramBitSet.clone();
    }
    table = paramString;
  }
  
  public boolean matches(char paramChar)
  {
    return table.get(paramChar);
  }
  
  void setBits(BitSet paramBitSet)
  {
    paramBitSet.or(table);
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.CharMatcher.BitSetMatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */