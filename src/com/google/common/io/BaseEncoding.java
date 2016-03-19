package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Ascii;
import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.math.RoundingMode;
import java.util.Arrays;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nullable;

@Beta
@GwtCompatible(emulated=true)
public abstract class BaseEncoding
{
  private static final BaseEncoding BASE16 = new StandardBaseEncoding("base16()", "0123456789ABCDEF", null);
  private static final BaseEncoding BASE32;
  private static final BaseEncoding BASE32_HEX;
  private static final BaseEncoding BASE64 = new StandardBaseEncoding("base64()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", Character.valueOf('='));
  private static final BaseEncoding BASE64_URL = new StandardBaseEncoding("base64Url()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_", Character.valueOf('='));
  
  static
  {
    BASE32 = new StandardBaseEncoding("base32()", "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567", Character.valueOf('='));
    BASE32_HEX = new StandardBaseEncoding("base32Hex()", "0123456789ABCDEFGHIJKLMNOPQRSTUV", Character.valueOf('='));
  }
  
  public static BaseEncoding base16()
  {
    return BASE16;
  }
  
  public static BaseEncoding base32()
  {
    return BASE32;
  }
  
  public static BaseEncoding base32Hex()
  {
    return BASE32_HEX;
  }
  
  public static BaseEncoding base64()
  {
    return BASE64;
  }
  
  public static BaseEncoding base64Url()
  {
    return BASE64_URL;
  }
  
  private static byte[] extract(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramInt == paramArrayOfByte.length) {
      return paramArrayOfByte;
    }
    byte[] arrayOfByte = new byte[paramInt];
    System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 0, paramInt);
    return arrayOfByte;
  }
  
  static GwtWorkarounds.CharInput ignoringInput(GwtWorkarounds.CharInput paramCharInput, final CharMatcher paramCharMatcher)
  {
    Preconditions.checkNotNull(paramCharInput);
    Preconditions.checkNotNull(paramCharMatcher);
    new GwtWorkarounds.CharInput()
    {
      public void close()
        throws IOException
      {
        val$delegate.close();
      }
      
      public int read()
        throws IOException
      {
        int i;
        do
        {
          i = val$delegate.read();
        } while ((i != -1) && (paramCharMatcher.matches((char)i)));
        return i;
      }
    };
  }
  
  static GwtWorkarounds.CharOutput separatingOutput(final GwtWorkarounds.CharOutput paramCharOutput, final String paramString, int paramInt)
  {
    Preconditions.checkNotNull(paramCharOutput);
    Preconditions.checkNotNull(paramString);
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      new GwtWorkarounds.CharOutput()
      {
        int charsUntilSeparator = val$afterEveryChars;
        
        public void close()
          throws IOException
        {
          paramCharOutput.close();
        }
        
        public void flush()
          throws IOException
        {
          paramCharOutput.flush();
        }
        
        public void write(char paramAnonymousChar)
          throws IOException
        {
          if (charsUntilSeparator == 0)
          {
            int i = 0;
            while (i < paramString.length())
            {
              paramCharOutput.write(paramString.charAt(i));
              i += 1;
            }
            charsUntilSeparator = val$afterEveryChars;
          }
          paramCharOutput.write(paramAnonymousChar);
          charsUntilSeparator -= 1;
        }
      };
    }
  }
  
  public final byte[] decode(CharSequence paramCharSequence)
  {
    try
    {
      paramCharSequence = decodeChecked(paramCharSequence);
      return paramCharSequence;
    }
    catch (DecodingException paramCharSequence)
    {
      throw new IllegalArgumentException(paramCharSequence);
    }
  }
  
  final byte[] decodeChecked(CharSequence paramCharSequence)
    throws BaseEncoding.DecodingException
  {
    localObject = padding().trimTrailingFrom(paramCharSequence);
    paramCharSequence = decodingStream(GwtWorkarounds.asCharInput((CharSequence)localObject));
    localObject = new byte[maxDecodedSize(((CharSequence)localObject).length())];
    try
    {
      int j = paramCharSequence.read();
      int i = 0;
      while (j != -1)
      {
        localObject[i] = ((byte)j);
        j = paramCharSequence.read();
        i += 1;
      }
      return extract((byte[])localObject, i);
    }
    catch (DecodingException paramCharSequence)
    {
      throw paramCharSequence;
    }
    catch (IOException paramCharSequence)
    {
      throw new AssertionError(paramCharSequence);
    }
  }
  
  @GwtIncompatible("ByteSource,CharSource")
  public final ByteSource decodingSource(final CharSource paramCharSource)
  {
    Preconditions.checkNotNull(paramCharSource);
    new ByteSource()
    {
      public InputStream openStream()
        throws IOException
      {
        return decodingStream(paramCharSource.openStream());
      }
    };
  }
  
  abstract GwtWorkarounds.ByteInput decodingStream(GwtWorkarounds.CharInput paramCharInput);
  
  @GwtIncompatible("Reader,InputStream")
  public final InputStream decodingStream(Reader paramReader)
  {
    return GwtWorkarounds.asInputStream(decodingStream(GwtWorkarounds.asCharInput(paramReader)));
  }
  
  public String encode(byte[] paramArrayOfByte)
  {
    return encode((byte[])Preconditions.checkNotNull(paramArrayOfByte), 0, paramArrayOfByte.length);
  }
  
  public final String encode(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    Preconditions.checkNotNull(paramArrayOfByte);
    Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfByte.length);
    GwtWorkarounds.CharOutput localCharOutput = GwtWorkarounds.stringBuilderOutput(maxEncodedSize(paramInt2));
    GwtWorkarounds.ByteOutput localByteOutput = encodingStream(localCharOutput);
    int i = 0;
    for (;;)
    {
      if (i < paramInt2) {}
      try
      {
        localByteOutput.write(paramArrayOfByte[(paramInt1 + i)]);
        i += 1;
      }
      catch (IOException paramArrayOfByte)
      {
        throw new AssertionError("impossible");
      }
    }
    localByteOutput.close();
    return localCharOutput.toString();
  }
  
  @GwtIncompatible("ByteSink,CharSink")
  public final ByteSink encodingSink(final CharSink paramCharSink)
  {
    Preconditions.checkNotNull(paramCharSink);
    new ByteSink()
    {
      public OutputStream openStream()
        throws IOException
      {
        return encodingStream(paramCharSink.openStream());
      }
    };
  }
  
  abstract GwtWorkarounds.ByteOutput encodingStream(GwtWorkarounds.CharOutput paramCharOutput);
  
  @GwtIncompatible("Writer,OutputStream")
  public final OutputStream encodingStream(Writer paramWriter)
  {
    return GwtWorkarounds.asOutputStream(encodingStream(GwtWorkarounds.asCharOutput(paramWriter)));
  }
  
  @CheckReturnValue
  public abstract BaseEncoding lowerCase();
  
  abstract int maxDecodedSize(int paramInt);
  
  abstract int maxEncodedSize(int paramInt);
  
  @CheckReturnValue
  public abstract BaseEncoding omitPadding();
  
  abstract CharMatcher padding();
  
  @CheckReturnValue
  public abstract BaseEncoding upperCase();
  
  @CheckReturnValue
  public abstract BaseEncoding withPadChar(char paramChar);
  
  @CheckReturnValue
  public abstract BaseEncoding withSeparator(String paramString, int paramInt);
  
  private static final class Alphabet
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
    
    Alphabet(String paramString, char[] paramArrayOfChar)
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
  
  public static final class DecodingException
    extends IOException
  {
    DecodingException(String paramString)
    {
      super();
    }
    
    DecodingException(Throwable paramThrowable)
    {
      super();
    }
  }
  
  static final class SeparatedBaseEncoding
    extends BaseEncoding
  {
    private final int afterEveryChars;
    private final BaseEncoding delegate;
    private final String separator;
    private final CharMatcher separatorChars;
    
    SeparatedBaseEncoding(BaseEncoding paramBaseEncoding, String paramString, int paramInt)
    {
      delegate = ((BaseEncoding)Preconditions.checkNotNull(paramBaseEncoding));
      separator = ((String)Preconditions.checkNotNull(paramString));
      afterEveryChars = paramInt;
      if (paramInt > 0) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "Cannot add a separator after every %s chars", new Object[] { Integer.valueOf(paramInt) });
        separatorChars = CharMatcher.anyOf(paramString).precomputed();
        return;
      }
    }
    
    GwtWorkarounds.ByteInput decodingStream(GwtWorkarounds.CharInput paramCharInput)
    {
      return delegate.decodingStream(ignoringInput(paramCharInput, separatorChars));
    }
    
    GwtWorkarounds.ByteOutput encodingStream(GwtWorkarounds.CharOutput paramCharOutput)
    {
      return delegate.encodingStream(separatingOutput(paramCharOutput, separator, afterEveryChars));
    }
    
    public BaseEncoding lowerCase()
    {
      return delegate.lowerCase().withSeparator(separator, afterEveryChars);
    }
    
    int maxDecodedSize(int paramInt)
    {
      return delegate.maxDecodedSize(paramInt);
    }
    
    int maxEncodedSize(int paramInt)
    {
      paramInt = delegate.maxEncodedSize(paramInt);
      return separator.length() * IntMath.divide(Math.max(0, paramInt - 1), afterEveryChars, RoundingMode.FLOOR) + paramInt;
    }
    
    public BaseEncoding omitPadding()
    {
      return delegate.omitPadding().withSeparator(separator, afterEveryChars);
    }
    
    CharMatcher padding()
    {
      return delegate.padding();
    }
    
    public String toString()
    {
      return delegate.toString() + ".withSeparator(\"" + separator + "\", " + afterEveryChars + ")";
    }
    
    public BaseEncoding upperCase()
    {
      return delegate.upperCase().withSeparator(separator, afterEveryChars);
    }
    
    public BaseEncoding withPadChar(char paramChar)
    {
      return delegate.withPadChar(paramChar).withSeparator(separator, afterEveryChars);
    }
    
    public BaseEncoding withSeparator(String paramString, int paramInt)
    {
      throw new UnsupportedOperationException("Already have a separator");
    }
  }
  
  static final class StandardBaseEncoding
    extends BaseEncoding
  {
    private final BaseEncoding.Alphabet alphabet;
    private transient BaseEncoding lowerCase;
    @Nullable
    private final Character paddingChar;
    private transient BaseEncoding upperCase;
    
    StandardBaseEncoding(BaseEncoding.Alphabet paramAlphabet, @Nullable Character paramCharacter)
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
    
    StandardBaseEncoding(String paramString1, String paramString2, @Nullable Character paramCharacter)
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
}

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */