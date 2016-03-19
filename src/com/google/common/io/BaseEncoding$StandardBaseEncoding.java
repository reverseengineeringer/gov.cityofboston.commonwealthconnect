package com.google.common.io;

import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.math.RoundingMode;
import javax.annotation.Nullable;

final class BaseEncoding$StandardBaseEncoding
  extends BaseEncoding
{
  private final BaseEncoding.Alphabet alphabet;
  private transient BaseEncoding lowerCase;
  @Nullable
  private final Character paddingChar;
  private transient BaseEncoding upperCase;
  
  BaseEncoding$StandardBaseEncoding(BaseEncoding.Alphabet paramAlphabet, @Nullable Character paramCharacter)
  {
    alphabet = ((BaseEncoding.Alphabet)Preconditions.checkNotNull(paramAlphabet));
    if ((paramCharacter == null) || (!paramAlphabet.matches(paramCharacter.charValue()))) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Padding character %s was already in alphabet", new Object[] { paramCharacter });
      paddingChar = paramCharacter;
      return;
    }
  }
  
  BaseEncoding$StandardBaseEncoding(String paramString1, String paramString2, @Nullable Character paramCharacter)
  {
    this(new BaseEncoding.Alphabet(paramString1, paramString2.toCharArray()), paramCharacter);
  }
  
  GwtWorkarounds.ByteInput decodingStream(final GwtWorkarounds.CharInput paramCharInput)
  {
    Preconditions.checkNotNull(paramCharInput);
    new GwtWorkarounds.ByteInput()
    {
      int bitBuffer = 0;
      int bitBufferLength = 0;
      boolean hitPadding = false;
      final CharMatcher paddingMatcher = padding();
      int readChars = 0;
      
      public void close()
        throws IOException
      {
        paramCharInput.close();
      }
      
      public int read()
        throws IOException
      {
        int j = -1;
        do
        {
          char c;
          for (;;)
          {
            i = paramCharInput.read();
            if (i == -1)
            {
              i = j;
              if (hitPadding) {
                return i;
              }
              i = j;
              if (alphabet.isValidPaddingStartPosition(readChars)) {
                return i;
              }
              throw new BaseEncoding.DecodingException("Invalid input length " + readChars);
            }
            readChars += 1;
            c = (char)i;
            if (!paddingMatcher.matches(c)) {
              break;
            }
            if ((!hitPadding) && ((readChars == 1) || (!alphabet.isValidPaddingStartPosition(readChars - 1)))) {
              throw new BaseEncoding.DecodingException("Padding cannot start at index " + readChars);
            }
            hitPadding = true;
          }
          if (hitPadding) {
            throw new BaseEncoding.DecodingException("Expected padding character but found '" + c + "' at index " + readChars);
          }
          bitBuffer <<= alphabet.bitsPerChar;
          bitBuffer |= alphabet.decode(c);
          bitBufferLength += alphabet.bitsPerChar;
        } while (bitBufferLength < 8);
        bitBufferLength -= 8;
        int i = bitBuffer >> bitBufferLength & 0xFF;
        return i;
      }
    };
  }
  
  GwtWorkarounds.ByteOutput encodingStream(final GwtWorkarounds.CharOutput paramCharOutput)
  {
    Preconditions.checkNotNull(paramCharOutput);
    new GwtWorkarounds.ByteOutput()
    {
      int bitBuffer = 0;
      int bitBufferLength = 0;
      int writtenChars = 0;
      
      public void close()
        throws IOException
      {
        if (bitBufferLength > 0)
        {
          int i = bitBuffer;
          int j = alphabet.bitsPerChar;
          int k = bitBufferLength;
          int m = alphabet.mask;
          paramCharOutput.write(alphabet.encode(i << j - k & m));
          writtenChars += 1;
          if (paddingChar != null) {
            while (writtenChars % alphabet.charsPerChunk != 0)
            {
              paramCharOutput.write(paddingChar.charValue());
              writtenChars += 1;
            }
          }
        }
        paramCharOutput.close();
      }
      
      public void flush()
        throws IOException
      {
        paramCharOutput.flush();
      }
      
      public void write(byte paramAnonymousByte)
        throws IOException
      {
        bitBuffer <<= 8;
        bitBuffer |= paramAnonymousByte & 0xFF;
        for (bitBufferLength += 8; bitBufferLength >= alphabet.bitsPerChar; bitBufferLength -= alphabet.bitsPerChar)
        {
          paramAnonymousByte = bitBuffer;
          int i = bitBufferLength;
          int j = alphabet.bitsPerChar;
          int k = alphabet.mask;
          paramCharOutput.write(alphabet.encode(paramAnonymousByte >> i - j & k));
          writtenChars += 1;
        }
      }
    };
  }
  
  public BaseEncoding lowerCase()
  {
    BaseEncoding localBaseEncoding = lowerCase;
    Object localObject = localBaseEncoding;
    if (localBaseEncoding == null)
    {
      localObject = alphabet.lowerCase();
      if (localObject != alphabet) {
        break label36;
      }
    }
    label36:
    for (localObject = this;; localObject = new StandardBaseEncoding((BaseEncoding.Alphabet)localObject, paddingChar))
    {
      lowerCase = ((BaseEncoding)localObject);
      return (BaseEncoding)localObject;
    }
  }
  
  int maxDecodedSize(int paramInt)
  {
    return (int)((alphabet.bitsPerChar * paramInt + 7L) / 8L);
  }
  
  int maxEncodedSize(int paramInt)
  {
    return alphabet.charsPerChunk * IntMath.divide(paramInt, alphabet.bytesPerChunk, RoundingMode.CEILING);
  }
  
  public BaseEncoding omitPadding()
  {
    if (paddingChar == null) {
      return this;
    }
    return new StandardBaseEncoding(alphabet, null);
  }
  
  CharMatcher padding()
  {
    if (paddingChar == null) {
      return CharMatcher.NONE;
    }
    return CharMatcher.is(paddingChar.charValue());
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("BaseEncoding.");
    localStringBuilder.append(alphabet.toString());
    if (8 % alphabet.bitsPerChar != 0)
    {
      if (paddingChar != null) {
        break label54;
      }
      localStringBuilder.append(".omitPadding()");
    }
    for (;;)
    {
      return localStringBuilder.toString();
      label54:
      localStringBuilder.append(".withPadChar(").append(paddingChar).append(')');
    }
  }
  
  public BaseEncoding upperCase()
  {
    BaseEncoding localBaseEncoding = upperCase;
    Object localObject = localBaseEncoding;
    if (localBaseEncoding == null)
    {
      localObject = alphabet.upperCase();
      if (localObject != alphabet) {
        break label36;
      }
    }
    label36:
    for (localObject = this;; localObject = new StandardBaseEncoding((BaseEncoding.Alphabet)localObject, paddingChar))
    {
      upperCase = ((BaseEncoding)localObject);
      return (BaseEncoding)localObject;
    }
  }
  
  public BaseEncoding withPadChar(char paramChar)
  {
    if ((8 % alphabet.bitsPerChar == 0) || ((paddingChar != null) && (paddingChar.charValue() == paramChar))) {
      return this;
    }
    return new StandardBaseEncoding(alphabet, Character.valueOf(paramChar));
  }
  
  public BaseEncoding withSeparator(String paramString, int paramInt)
  {
    Preconditions.checkNotNull(paramString);
    Preconditions.checkArgument(padding().or(alphabet).matchesNoneOf(paramString), "Separator cannot contain alphabet or padding characters");
    return new BaseEncoding.SeparatedBaseEncoding(this, paramString, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding.StandardBaseEncoding
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */