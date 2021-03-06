package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.Protocol;
import okio.BufferedSink;
import okio.BufferedSource;

public abstract interface Variant
{
  public abstract Protocol getProtocol();
  
  public abstract int maxFrameSize();
  
  public abstract FrameReader newReader(BufferedSource paramBufferedSource, boolean paramBoolean);
  
  public abstract FrameWriter newWriter(BufferedSink paramBufferedSink, boolean paramBoolean);
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.Variant
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */