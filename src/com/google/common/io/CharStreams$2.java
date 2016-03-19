package com.google.common.io;

import java.io.Closeable;
import java.io.IOException;
import java.io.Reader;
import java.nio.CharBuffer;

final class CharStreams$2
  extends Reader
{
  CharStreams$2(Readable paramReadable) {}
  
  public void close()
    throws IOException
  {
    if ((val$readable instanceof Closeable)) {
      ((Closeable)val$readable).close();
    }
  }
  
  public int read(CharBuffer paramCharBuffer)
    throws IOException
  {
    return val$readable.read(paramCharBuffer);
  }
  
  public int read(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException
  {
    return read(CharBuffer.wrap(paramArrayOfChar, paramInt1, paramInt2));
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharStreams.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */