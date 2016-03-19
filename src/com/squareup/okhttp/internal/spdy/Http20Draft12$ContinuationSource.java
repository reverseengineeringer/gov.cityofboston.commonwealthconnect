package com.squareup.okhttp.internal.spdy;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import okio.Buffer;
import okio.BufferedSource;
import okio.Source;
import okio.Timeout;

final class Http20Draft12$ContinuationSource
  implements Source
{
  byte flags;
  short left;
  short length;
  short padding;
  private final BufferedSource source;
  int streamId;
  
  public Http20Draft12$ContinuationSource(BufferedSource paramBufferedSource)
  {
    source = paramBufferedSource;
  }
  
  private void readContinuationHeader()
    throws IOException
  {
    int i = streamId;
    int j = source.readInt();
    int k = source.readInt();
    length = ((short)((0x3FFF0000 & j) >> 16));
    byte b = (byte)((0xFF00 & j) >> 8);
    flags = ((byte)(j & 0xFF));
    if (Http20Draft12.access$100().isLoggable(Level.FINE)) {
      Http20Draft12.access$100().fine(Http20Draft12.FrameLogger.formatHeader(true, streamId, length, b, flags));
    }
    padding = Http20Draft12.access$300(source, flags);
    short s = Http20Draft12.access$400(length, flags, padding);
    left = s;
    length = s;
    streamId = (0x7FFFFFFF & k);
    if (b != 9) {
      throw Http20Draft12.access$200("%s != TYPE_CONTINUATION", new Object[] { Byte.valueOf(b) });
    }
    if (streamId != i) {
      throw Http20Draft12.access$200("TYPE_CONTINUATION streamId changed", new Object[0]);
    }
  }
  
  public void close()
    throws IOException
  {}
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    while (left == 0)
    {
      source.skip(padding);
      padding = 0;
      if ((flags & 0x4) != 0) {
        return -1L;
      }
      readContinuationHeader();
    }
    paramLong = source.read(paramBuffer, Math.min(paramLong, left));
    if (paramLong == -1L) {
      return -1L;
    }
    left = ((short)(int)(left - paramLong));
    return paramLong;
  }
  
  public Timeout timeout()
  {
    return source.timeout();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.Http20Draft12.ContinuationSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */