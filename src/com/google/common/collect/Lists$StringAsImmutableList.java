package com.google.common.collect;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

final class Lists$StringAsImmutableList
  extends ImmutableList<Character>
{
  private final String string;
  
  Lists$StringAsImmutableList(String paramString)
  {
    string = paramString;
  }
  
  public Character get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Character.valueOf(string.charAt(paramInt));
  }
  
  public int indexOf(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Character)) {
      return string.indexOf(((Character)paramObject).charValue());
    }
    return -1;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public int lastIndexOf(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Character)) {
      return string.lastIndexOf(((Character)paramObject).charValue());
    }
    return -1;
  }
  
  public int size()
  {
    return string.length();
  }
  
  public ImmutableList<Character> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    return Lists.charactersOf(string.substring(paramInt1, paramInt2));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.StringAsImmutableList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */