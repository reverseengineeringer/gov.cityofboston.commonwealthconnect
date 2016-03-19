package com.google.common.io;

import java.io.IOException;
import java.io.InputStream;

final class ByteStreams$3
  extends ByteSource
{
  ByteStreams$3(InputSupplier paramInputSupplier) {}
  
  public InputStream openStream()
    throws IOException
  {
    return (InputStream)val$supplier.getInput();
  }
  
  public String toString()
  {
    return "ByteStreams.asByteSource(" + val$supplier + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */