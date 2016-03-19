package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.AbstractList;

final class Lists$CharSequenceAsList
  extends AbstractList<Character>
{
  private final CharSequence sequence;
  
  Lists$CharSequenceAsList(CharSequence paramCharSequence)
  {
    sequence = paramCharSequence;
  }
  
  public Character get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Character.valueOf(sequence.charAt(paramInt));
  }
  
  public int size()
  {
    return sequence.length();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.CharSequenceAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */