package com.squareup.okhttp.internal.spdy;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import okio.Buffer;
import okio.BufferedSink;
import okio.ByteString;

final class Http20Draft12$Writer
  implements FrameWriter
{
  private final boolean client;
  private boolean closed;
  private final Buffer hpackBuffer;
  private final HpackDraft07.Writer hpackWriter;
  private final BufferedSink sink;
  
  Http20Draft12$Writer(BufferedSink paramBufferedSink, boolean paramBoolean)
  {
    sink = paramBufferedSink;
    client = paramBoolean;
    hpackBuffer = new Buffer();
    hpackWriter = new HpackDraft07.Writer(hpackBuffer);
  }
  
  private void writeContinuationFrames(int paramInt, long paramLong)
    throws IOException
  {
    if (paramLong > 0L)
    {
      int i = (int)Math.min(16383L, paramLong);
      paramLong -= i;
      if (paramLong == 0L) {}
      for (byte b = 4;; b = 0)
      {
        frameHeader(paramInt, i, (byte)9, b);
        sink.write(hpackBuffer, i);
        break;
      }
    }
  }
  
  public void ackSettings()
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    frameHeader(0, 0, (byte)4, (byte)1);
    sink.flush();
  }
  
  public void close()
    throws IOException
  {
    try
    {
      closed = true;
      sink.close();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void connectionPreface()
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    boolean bool = client;
    if (!bool) {}
    for (;;)
    {
      return;
      if (Http20Draft12.access$100().isLoggable(Level.FINE)) {
        Http20Draft12.access$100().fine(String.format(">> CONNECTION %s", new Object[] { Http20Draft12.access$000().hex() }));
      }
      sink.write(Http20Draft12.access$000().toByteArray());
      sink.flush();
    }
  }
  
  public void data(boolean paramBoolean, int paramInt, Buffer paramBuffer)
    throws IOException
  {
    try
    {
      data(paramBoolean, paramInt, paramBuffer, (int)paramBuffer.size());
      return;
    }
    finally
    {
      paramBuffer = finally;
      throw paramBuffer;
    }
  }
  
  public void data(boolean paramBoolean, int paramInt1, Buffer paramBuffer, int paramInt2)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    byte b = 0;
    if (paramBoolean) {
      b = (byte)1;
    }
    dataFrame(paramInt1, b, paramBuffer, paramInt2);
  }
  
  void dataFrame(int paramInt1, byte paramByte, Buffer paramBuffer, int paramInt2)
    throws IOException
  {
    frameHeader(paramInt1, paramInt2, (byte)0, paramByte);
    if (paramInt2 > 0) {
      sink.write(paramBuffer, paramInt2);
    }
  }
  
  public void flush()
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    sink.flush();
  }
  
  void frameHeader(int paramInt1, int paramInt2, byte paramByte1, byte paramByte2)
    throws IOException
  {
    if (Http20Draft12.access$100().isLoggable(Level.FINE)) {
      Http20Draft12.access$100().fine(Http20Draft12.FrameLogger.formatHeader(false, paramInt1, paramInt2, paramByte1, paramByte2));
    }
    if (paramInt2 > 16383) {
      throw Http20Draft12.access$500("FRAME_SIZE_ERROR length > %d: %d", new Object[] { Integer.valueOf(16383), Integer.valueOf(paramInt2) });
    }
    if ((0x80000000 & paramInt1) != 0) {
      throw Http20Draft12.access$500("reserved bit set: %s", new Object[] { Integer.valueOf(paramInt1) });
    }
    sink.writeInt((paramInt2 & 0x3FFF) << 16 | (paramByte1 & 0xFF) << 8 | paramByte2 & 0xFF);
    sink.writeInt(0x7FFFFFFF & paramInt1);
  }
  
  public void goAway(int paramInt, ErrorCode paramErrorCode, byte[] paramArrayOfByte)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    if (httpCode == -1) {
      throw Http20Draft12.access$500("errorCode.httpCode == -1", new Object[0]);
    }
    frameHeader(0, paramArrayOfByte.length + 8, (byte)7, (byte)0);
    sink.writeInt(paramInt);
    sink.writeInt(httpCode);
    if (paramArrayOfByte.length > 0) {
      sink.write(paramArrayOfByte);
    }
    sink.flush();
  }
  
  public void headers(int paramInt, List<Header> paramList)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    headers(false, paramInt, paramList);
  }
  
  void headers(boolean paramBoolean, int paramInt, List<Header> paramList)
    throws IOException
  {
    if (closed) {
      throw new IOException("closed");
    }
    if (hpackBuffer.size() != 0L) {
      throw new IllegalStateException();
    }
    hpackWriter.writeHeaders(paramList);
    long l = hpackBuffer.size();
    int i = (int)Math.min(16383L, l);
    if (l == i) {}
    for (byte b1 = 4;; b1 = 0)
    {
      byte b2 = b1;
      if (paramBoolean) {
        b2 = (byte)(b1 | 0x1);
      }
      frameHeader(paramInt, i, (byte)1, b2);
      sink.write(hpackBuffer, i);
      if (l > i) {
        writeContinuationFrames(paramInt, l - i);
      }
      return;
    }
  }
  
  public void ping(boolean paramBoolean, int paramInt1, int paramInt2)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    if (paramBoolean) {}
    for (byte b = 1;; b = 0)
    {
      frameHeader(0, 8, (byte)6, b);
      sink.writeInt(paramInt1);
      sink.writeInt(paramInt2);
      sink.flush();
      return;
    }
  }
  
  public void pushPromise(int paramInt1, int paramInt2, List<Header> paramList)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    if (hpackBuffer.size() != 0L) {
      throw new IllegalStateException();
    }
    hpackWriter.writeHeaders(paramList);
    long l = hpackBuffer.size();
    int i = (int)Math.min(16379L, l);
    if (l == i) {}
    for (byte b = 4;; b = 0)
    {
      frameHeader(paramInt1, i + 4, (byte)5, b);
      sink.writeInt(0x7FFFFFFF & paramInt2);
      sink.write(hpackBuffer, i);
      if (l > i) {
        writeContinuationFrames(paramInt1, l - i);
      }
      return;
    }
  }
  
  public void rstStream(int paramInt, ErrorCode paramErrorCode)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    if (spdyRstCode == -1) {
      throw new IllegalArgumentException();
    }
    frameHeader(paramInt, 4, (byte)3, (byte)0);
    sink.writeInt(httpCode);
    sink.flush();
  }
  
  public void settings(Settings paramSettings)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    frameHeader(0, paramSettings.size() * 5, (byte)4, (byte)0);
    int i = 0;
    if (i < 10) {
      if (paramSettings.isSet(i)) {
        break label104;
      }
    }
    for (;;)
    {
      int j;
      sink.writeByte(j);
      sink.writeInt(paramSettings.get(i));
      break label97;
      sink.flush();
      return;
      label97:
      i += 1;
      break;
      label104:
      int k = i;
      if (k == 4)
      {
        j = 3;
      }
      else
      {
        j = k;
        if (k == 7) {
          j = 4;
        }
      }
    }
  }
  
  public void synReply(boolean paramBoolean, int paramInt, List<Header> paramList)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    headers(paramBoolean, paramInt, paramList);
  }
  
  public void synStream(boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, List<Header> paramList)
    throws IOException
  {
    if (paramBoolean2) {
      try
      {
        throw new UnsupportedOperationException();
      }
      finally {}
    }
    if (closed) {
      throw new IOException("closed");
    }
    headers(paramBoolean1, paramInt1, paramList);
  }
  
  public void windowUpdate(int paramInt, long paramLong)
    throws IOException
  {
    try
    {
      if (closed) {
        throw new IOException("closed");
      }
    }
    finally {}
    if ((paramLong == 0L) || (paramLong > 2147483647L)) {
      throw Http20Draft12.access$500("windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: %s", new Object[] { Long.valueOf(paramLong) });
    }
    frameHeader(paramInt, 4, (byte)8, (byte)0);
    sink.writeInt((int)paramLong);
    sink.flush();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.Http20Draft12.Writer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */