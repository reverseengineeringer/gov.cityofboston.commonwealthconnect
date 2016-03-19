package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.Writer;

final class CharStreams$NullWriter
  extends Writer
{
  private static final NullWriter INSTANCE = new NullWriter();
  
  public Writer append(char paramChar)
  {
    return this;
  }
  
  public Writer append(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    return this;
  }
  
  public Writer append(CharSequence paramCharSequence, int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, paramCharSequence.length());
    return this;
  }
  
  public void close() {}
  
  public void flush() {}
  
  public String toString()
  {
    return "CharStreams.nullWriter()";
  }
  
  public void write(int paramInt) {}
  
  public void write(String paramString)
  {
    Preconditions.checkNotNull(paramString);
  }
  
  public void write(String paramString, int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramString.length());
  }
  
  public void write(char[] paramArrayOfChar)
  {
    Preconditions.checkNotNull(paramArrayOfChar);
  }
  
  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfChar.length);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharStreams.NullWriter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */