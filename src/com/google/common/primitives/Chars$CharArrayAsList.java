package com.google.common.primitives;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Collections;
import java.util.List;
import java.util.RandomAccess;

@GwtCompatible
class Chars$CharArrayAsList
  extends AbstractList<Character>
  implements RandomAccess, Serializable
{
  private static final long serialVersionUID = 0L;
  final char[] array;
  final int end;
  final int start;
  
  Chars$CharArrayAsList(char[] paramArrayOfChar)
  {
    this(paramArrayOfChar, 0, paramArrayOfChar.length);
  }
  
  Chars$CharArrayAsList(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    array = paramArrayOfChar;
    start = paramInt1;
    end = paramInt2;
  }
  
  public boolean contains(Object paramObject)
  {
    return ((paramObject instanceof Character)) && (Chars.access$000(array, ((Character)paramObject).charValue(), start, end) != -1);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    for (;;)
    {
      return true;
      if (!(paramObject instanceof CharArrayAsList)) {
        break;
      }
      paramObject = (CharArrayAsList)paramObject;
      int j = size();
      if (((CharArrayAsList)paramObject).size() != j) {
        return false;
      }
      int i = 0;
      while (i < j)
      {
        if (array[(start + i)] != array[(start + i)]) {
          return false;
        }
        i += 1;
      }
    }
    return super.equals(paramObject);
  }
  
  public Character get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return Character.valueOf(array[(start + paramInt)]);
  }
  
  public int hashCode()
  {
    int j = 1;
    int i = start;
    while (i < end)
    {
      j = j * 31 + Chars.hashCode(array[i]);
      i += 1;
    }
    return j;
  }
  
  public int indexOf(Object paramObject)
  {
    if ((paramObject instanceof Character))
    {
      int i = Chars.access$000(array, ((Character)paramObject).charValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  public int lastIndexOf(Object paramObject)
  {
    if ((paramObject instanceof Character))
    {
      int i = Chars.access$100(array, ((Character)paramObject).charValue(), start, end);
      if (i >= 0) {
        return i - start;
      }
    }
    return -1;
  }
  
  public Character set(int paramInt, Character paramCharacter)
  {
    Preconditions.checkElementIndex(paramInt, size());
    char c = array[(start + paramInt)];
    array[(start + paramInt)] = ((Character)Preconditions.checkNotNull(paramCharacter)).charValue();
    return Character.valueOf(c);
  }
  
  public int size()
  {
    return end - start;
  }
  
  public List<Character> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    if (paramInt1 == paramInt2) {
      return Collections.emptyList();
    }
    return new CharArrayAsList(array, start + paramInt1, start + paramInt2);
  }
  
  char[] toCharArray()
  {
    int i = size();
    char[] arrayOfChar = new char[i];
    System.arraycopy(array, start, arrayOfChar, 0, i);
    return arrayOfChar;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(size() * 3);
    localStringBuilder.append('[').append(array[start]);
    int i = start + 1;
    while (i < end)
    {
      localStringBuilder.append(", ").append(array[i]);
      i += 1;
    }
    return ']';
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.Chars.CharArrayAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */