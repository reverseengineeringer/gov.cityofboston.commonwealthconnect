package com.google.common.io;

import java.io.IOException;
import java.io.Reader;

final class CharStreams$3
  extends CharSource
{
  CharStreams$3(InputSupplier paramInputSupplier) {}
  
  public Reader openStream()
    throws IOException
  {
    return CharStreams.asReader((Readable)val$supplier.getInput());
  }
  
  public String toString()
  {
    return "CharStreams.asCharSource(" + val$supplier + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharStreams.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */