package com.google.common.io;

import java.io.IOException;
import java.io.OutputStream;

final class ByteStreams$4
  extends ByteSink
{
  ByteStreams$4(OutputSupplier paramOutputSupplier) {}
  
  public OutputStream openStream()
    throws IOException
  {
    return (OutputStream)val$supplier.getOutput();
  }
  
  public String toString()
  {
    return "ByteStreams.asByteSink(" + val$supplier + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */