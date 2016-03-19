package com.google.common.io;

import com.google.common.base.Ascii;
import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.Arrays;

final class BaseEncoding$Alphabet
  extends CharMatcher
{
  final int bitsPerChar;
  final int bytesPerChunk;
  private final char[] chars;
  final int charsPerChunk;
  private final byte[] decodabet;
  final int mask;
  private final String name;
  private final boolean[] validPadding;
  
  BaseEncoding$Alphabet(String paramString, char[] paramArrayOfChar)
  {
    name = ((String)Preconditions.checkNotNull(paramString));
    chars = ((char[])Preconditions.checkNotNull(paramArrayOfChar));
    for (;;)
    {
      try
      {
        bitsPerChar = IntMath.log2(paramArrayOfChar.length, RoundingMode.UNNECESSARY);
        i = Math.min(8, Integer.lowestOneBit(bitsPerChar));
        charsPerChunk = (8 / i);
        bytesPerChunk = (bitsPerChar / i);
        mask = (paramArrayOfChar.length - 1);
        paramString = new byte[''];
        Arrays.fill(paramString, (byte)-1);
        i = 0;
        if (i >= paramArrayOfChar.length) {
          break;
        }
        char c = paramArrayOfChar[i];
        Preconditions.checkArgument(CharMatcher.ASCII.matches(c), "Non-ASCII character: %s", new Object[] { Character.valueOf(c) });
        boolean bool;
        if (paramString[c] == -1)
        {
          bool = true;
          Preconditions.checkArgument(bool, "Duplicate character: %s", new Object[] { Character.valueOf(c) });
          paramString[c] = ((byte)i);
          i += 1;
        }
        else
        {
          bool = false;
        }
      }
      catch (ArithmeticException paramString)
      {
        throw new IllegalArgumentException("Illegal alphabet length " + paramArrayOfChar.length, paramString);
      }
    }
    decodabet = paramString;
    paramString = new boolean[charsPerChunk];
    int i = 0;
    while (i < bytesPerChunk)
    {
      paramString[IntMath.divide(i * 8, bitsPerChar, RoundingMode.CEILING)] = 1;
      i += 1;
    }
    validPadding = paramString;
  }
  
  private boolean hasLowerCase()
  {
    char[] arrayOfChar = chars;
    int j = arrayOfChar.length;
    int i = 0;
    while (i < j)
    {
      if (Ascii.isLowerCase(arrayOfChar[i])) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private boolean hasUpperCase()
  {
    char[] arrayOfChar = chars;
    int j = arrayOfChar.length;
    int i = 0;
    while (i < j)
    {
      if (Ascii.isUpperCase(arrayOfChar[i])) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  int decode(char paramChar)
    throws IOException
  {
    if ((paramChar > '') || (decodabet[paramChar] == -1)) {
      throw new BaseEncoding.DecodingException("Unrecognized character: " + paramChar);
    }
    return decodabet[paramChar];
  }
  
  char encode(int paramInt)
  {
    return chars[paramInt];
  }
  
  boolean isValidPaddingStartPosition(int paramInt)
  {
    return validPadding[(paramInt % charsPerChunk)];
  }
  
  Alphabet lowerCase()
  {
    if (!hasUpperCase()) {
      return this;
    }
    if (!hasLowerCase()) {}
    char[] arrayOfChar;
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "Cannot call lowerCase() on a mixed-case alphabet");
      arrayOfChar = new char[chars.length];
      int i = 0;
      while (i < chars.length)
      {
        arrayOfChar[i] = Ascii.toLowerCase(chars[i]);
        i += 1;
      }
    }
    return new Alphabet(name + ".lowerCase()", arrayOfChar);
  }
  
  public boolean matches(char paramChar)
  {
    return (CharMatcher.ASCII.matches(paramChar)) && (decodabet[paramChar] != -1);
  }
  
  public String toString()
  {
    return name;
  }
  
  Alphabet upperCase()
  {
    if (!hasLowerCase()) {
      return this;
    }
    if (!hasUpperCase()) {}
    char[] arrayOfChar;
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "Cannot call upperCase() on a mixed-case alphabet");
      arrayOfChar = new char[chars.length];
      int i = 0;
      while (i < chars.length)
      {
        arrayOfChar[i] = Ascii.toUpperCase(chars[i]);
        i += 1;
      }
    }
    return new Alphabet(name + ".upperCase()", arrayOfChar);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding.Alphabet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */