package com.google.common.io;

import java.io.IOException;
import java.io.Writer;

final class CharStreams$4
  extends CharSink
{
  CharStreams$4(OutputSupplier paramOutputSupplier) {}
  
  public Writer openStream()
    throws IOException
  {
    return CharStreams.asWriter((Appendable)val$supplier.getOutput());
  }
  
  public String toString()
  {
    return "CharStreams.asCharSink(" + val$supplier + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharStreams.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */