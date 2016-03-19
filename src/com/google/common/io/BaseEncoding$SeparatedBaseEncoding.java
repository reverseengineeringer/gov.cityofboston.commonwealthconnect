package com.google.common.io;

import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.math.RoundingMode;

final class BaseEncoding$SeparatedBaseEncoding
  extends BaseEncoding
{
  private final int afterEveryChars;
  private final BaseEncoding delegate;
  private final String separator;
  private final CharMatcher separatorChars;
  
  BaseEncoding$SeparatedBaseEncoding(BaseEncoding paramBaseEncoding, String paramString, int paramInt)
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

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding.SeparatedBaseEncoding
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */