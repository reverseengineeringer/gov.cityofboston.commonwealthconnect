package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.internal.NamedRunnable;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import okio.BufferedSource;
import okio.ByteString;

class SpdyConnection$Reader
  extends NamedRunnable
  implements FrameReader.Handler
{
  FrameReader frameReader;
  
  private SpdyConnection$Reader(SpdyConnection paramSpdyConnection)
  {
    super("OkHttp %s", new Object[] { SpdyConnection.access$900(paramSpdyConnection) });
  }
  
  private void ackSettingsLater()
  {
    SpdyConnection.access$1900().submit(new NamedRunnable("OkHttp %s ACK Settings", new Object[] { SpdyConnection.access$900(this$0) })
    {
      public void execute()
      {
        try
        {
          this$0.frameWriter.ackSettings();
          return;
        }
        catch (IOException localIOException) {}
      }
    });
  }
  
  public void ackSettings() {}
  
  public void alternateService(int paramInt1, String paramString1, ByteString paramByteString, String paramString2, int paramInt2, long paramLong) {}
  
  public void data(boolean paramBoolean, int paramInt1, BufferedSource paramBufferedSource, int paramInt2)
    throws IOException
  {
    if (SpdyConnection.access$1100(this$0, paramInt1)) {
      SpdyConnection.access$1200(this$0, paramInt1, paramBufferedSource, paramInt2, paramBoolean);
    }
    SpdyStream localSpdyStream;
    do
    {
      return;
      localSpdyStream = this$0.getStream(paramInt1);
      if (localSpdyStream == null)
      {
        this$0.writeSynResetLater(paramInt1, ErrorCode.INVALID_STREAM);
        paramBufferedSource.skip(paramInt2);
        return;
      }
      localSpdyStream.receiveData(paramBufferedSource, paramInt2);
    } while (!paramBoolean);
    localSpdyStream.receiveFin();
  }
  
  /* Error */
  protected void execute()
  {
    // Byte code:
    //   0: getstatic 102	com/squareup/okhttp/internal/spdy/ErrorCode:INTERNAL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   3: astore_3
    //   4: getstatic 102	com/squareup/okhttp/internal/spdy/ErrorCode:INTERNAL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   7: astore 4
    //   9: aload_3
    //   10: astore_2
    //   11: aload_3
    //   12: astore_1
    //   13: aload_0
    //   14: aload_0
    //   15: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    //   18: getfield 106	com/squareup/okhttp/internal/spdy/SpdyConnection:variant	Lcom/squareup/okhttp/internal/spdy/Variant;
    //   21: aload_0
    //   22: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    //   25: getfield 110	com/squareup/okhttp/internal/spdy/SpdyConnection:socket	Ljava/net/Socket;
    //   28: invokestatic 116	okio/Okio:source	(Ljava/net/Socket;)Lokio/Source;
    //   31: invokestatic 120	okio/Okio:buffer	(Lokio/Source;)Lokio/BufferedSource;
    //   34: aload_0
    //   35: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    //   38: getfield 124	com/squareup/okhttp/internal/spdy/SpdyConnection:client	Z
    //   41: invokeinterface 130 3 0
    //   46: putfield 132	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
    //   49: aload_3
    //   50: astore_2
    //   51: aload_3
    //   52: astore_1
    //   53: aload_0
    //   54: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    //   57: getfield 124	com/squareup/okhttp/internal/spdy/SpdyConnection:client	Z
    //   60: ifne +16 -> 76
    //   63: aload_3
    //   64: astore_2
    //   65: aload_3
    //   66: astore_1
    //   67: aload_0
    //   68: getfield 132	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
    //   71: invokeinterface 137 1 0
    //   76: aload_3
    //   77: astore_2
    //   78: aload_3
    //   79: astore_1
    //   80: aload_0
    //   81: getfield 132	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
    //   84: aload_0
    //   85: invokeinterface 141 2 0
    //   90: ifne -14 -> 76
    //   93: aload_3
    //   94: astore_2
    //   95: aload_3
    //   96: astore_1
    //   97: getstatic 144	com/squareup/okhttp/internal/spdy/ErrorCode:NO_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   100: astore_3
    //   101: aload_3
    //   102: astore_2
    //   103: aload_3
    //   104: astore_1
    //   105: getstatic 147	com/squareup/okhttp/internal/spdy/ErrorCode:CANCEL	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   108: astore 5
    //   110: aload_0
    //   111: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    //   114: aload_3
    //   115: aload 5
    //   117: invokestatic 151	com/squareup/okhttp/internal/spdy/SpdyConnection:access$1000	(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Lcom/squareup/okhttp/internal/spdy/ErrorCode;Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V
    //   120: aload_0
    //   121: getfield 132	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
    //   124: invokestatic 157	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
    //   127: return
    //   128: astore_1
    //   129: aload_2
    //   130: astore_1
    //   131: getstatic 160	com/squareup/okhttp/internal/spdy/ErrorCode:PROTOCOL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   134: astore_2
    //   135: aload_2
    //   136: astore_1
    //   137: getstatic 160	com/squareup/okhttp/internal/spdy/ErrorCode:PROTOCOL_ERROR	Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   140: astore_3
    //   141: aload_0
    //   142: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    //   145: aload_2
    //   146: aload_3
    //   147: invokestatic 151	com/squareup/okhttp/internal/spdy/SpdyConnection:access$1000	(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Lcom/squareup/okhttp/internal/spdy/ErrorCode;Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V
    //   150: aload_0
    //   151: getfield 132	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
    //   154: invokestatic 157	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
    //   157: return
    //   158: astore_2
    //   159: aload_0
    //   160: getfield 21	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    //   163: aload_1
    //   164: aload 4
    //   166: invokestatic 151	com/squareup/okhttp/internal/spdy/SpdyConnection:access$1000	(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Lcom/squareup/okhttp/internal/spdy/ErrorCode;Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V
    //   169: aload_0
    //   170: getfield 132	com/squareup/okhttp/internal/spdy/SpdyConnection$Reader:frameReader	Lcom/squareup/okhttp/internal/spdy/FrameReader;
    //   173: invokestatic 157	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
    //   176: aload_2
    //   177: athrow
    //   178: astore_1
    //   179: goto -10 -> 169
    //   182: astore_1
    //   183: goto -33 -> 150
    //   186: astore_1
    //   187: goto -67 -> 120
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	190	0	this	Reader
    //   12	93	1	localErrorCode1	ErrorCode
    //   128	1	1	localIOException1	IOException
    //   130	34	1	localErrorCode2	ErrorCode
    //   178	1	1	localIOException2	IOException
    //   182	1	1	localIOException3	IOException
    //   186	1	1	localIOException4	IOException
    //   10	136	2	localErrorCode3	ErrorCode
    //   158	19	2	localObject	Object
    //   3	144	3	localErrorCode4	ErrorCode
    //   7	158	4	localErrorCode5	ErrorCode
    //   108	8	5	localErrorCode6	ErrorCode
    // Exception table:
    //   from	to	target	type
    //   13	49	128	java/io/IOException
    //   53	63	128	java/io/IOException
    //   67	76	128	java/io/IOException
    //   80	93	128	java/io/IOException
    //   97	101	128	java/io/IOException
    //   105	110	128	java/io/IOException
    //   13	49	158	finally
    //   53	63	158	finally
    //   67	76	158	finally
    //   80	93	158	finally
    //   97	101	158	finally
    //   105	110	158	finally
    //   131	135	158	finally
    //   137	141	158	finally
    //   159	169	178	java/io/IOException
    //   141	150	182	java/io/IOException
    //   110	120	186	java/io/IOException
  }
  
  public void goAway(int paramInt, ErrorCode arg2, ByteString paramByteString)
  {
    if (paramByteString.size() > 0) {}
    synchronized (this$0)
    {
      SpdyConnection.access$1402(this$0, true);
      paramByteString = SpdyConnection.access$1700(this$0).entrySet().iterator();
      while (paramByteString.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramByteString.next();
        if ((((Integer)localEntry.getKey()).intValue() > paramInt) && (((SpdyStream)localEntry.getValue()).isLocallyInitiated()))
        {
          ((SpdyStream)localEntry.getValue()).receiveRstStream(ErrorCode.REFUSED_STREAM);
          paramByteString.remove();
        }
      }
    }
  }
  
  public void headers(boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, final List<Header> paramList, HeadersMode paramHeadersMode)
  {
    if (SpdyConnection.access$1100(this$0, paramInt1)) {
      SpdyConnection.access$1300(this$0, paramInt1, paramList, paramBoolean2);
    }
    SpdyStream localSpdyStream;
    do
    {
      return;
      synchronized (this$0)
      {
        if (SpdyConnection.access$1400(this$0)) {
          return;
        }
      }
      localSpdyStream = this$0.getStream(paramInt1);
      if (localSpdyStream == null)
      {
        if (paramHeadersMode.failIfStreamAbsent())
        {
          this$0.writeSynResetLater(paramInt1, ErrorCode.INVALID_STREAM);
          return;
        }
        if (paramInt1 <= SpdyConnection.access$1500(this$0)) {
          return;
        }
        if (paramInt1 % 2 == SpdyConnection.access$1600(this$0) % 2) {
          return;
        }
        paramList = new SpdyStream(paramInt1, this$0, paramBoolean1, paramBoolean2, paramList);
        SpdyConnection.access$1502(this$0, paramInt1);
        SpdyConnection.access$1700(this$0).put(Integer.valueOf(paramInt1), paramList);
        SpdyConnection.access$1900().submit(new NamedRunnable("OkHttp %s stream %d", new Object[] { SpdyConnection.access$900(this$0), Integer.valueOf(paramInt1) })
        {
          public void execute()
          {
            try
            {
              SpdyConnection.access$1800(this$0).receive(paramList);
              return;
            }
            catch (IOException localIOException)
            {
              throw new RuntimeException(localIOException);
            }
          }
        });
        return;
      }
      if (paramHeadersMode.failIfStreamPresent())
      {
        localSpdyStream.closeLater(ErrorCode.PROTOCOL_ERROR);
        this$0.removeStream(paramInt1);
        return;
      }
      localSpdyStream.receiveHeaders(paramList, paramHeadersMode);
    } while (!paramBoolean2);
    localSpdyStream.receiveFin();
  }
  
  public void ping(boolean paramBoolean, int paramInt1, int paramInt2)
  {
    if (paramBoolean)
    {
      Ping localPing = SpdyConnection.access$2200(this$0, paramInt1);
      if (localPing != null) {
        localPing.receive();
      }
      return;
    }
    SpdyConnection.access$2300(this$0, true, paramInt1, paramInt2, null);
  }
  
  public void priority(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean) {}
  
  public void pushPromise(int paramInt1, int paramInt2, List<Header> paramList)
  {
    SpdyConnection.access$2400(this$0, paramInt2, paramList);
  }
  
  public void rstStream(int paramInt, ErrorCode paramErrorCode)
  {
    if (SpdyConnection.access$1100(this$0, paramInt)) {
      SpdyConnection.access$2000(this$0, paramInt, paramErrorCode);
    }
    SpdyStream localSpdyStream;
    do
    {
      return;
      localSpdyStream = this$0.removeStream(paramInt);
    } while (localSpdyStream == null);
    localSpdyStream.receiveRstStream(paramErrorCode);
  }
  
  public void settings(boolean paramBoolean, Settings arg2)
  {
    long l2 = 0L;
    Iterator localIterator = null;
    synchronized (this$0)
    {
      int i = this$0.peerSettings.getInitialWindowSize(65536);
      if (paramBoolean) {
        this$0.peerSettings.clear();
      }
      this$0.peerSettings.merge(???);
      if (this$0.getProtocol() == Protocol.HTTP_2) {
        ackSettingsLater();
      }
      int j = this$0.peerSettings.getInitialWindowSize(65536);
      long l1 = l2;
      ??? = localIterator;
      if (j != -1)
      {
        l1 = l2;
        ??? = localIterator;
        if (j != i)
        {
          l2 = j - i;
          if (!SpdyConnection.access$2100(this$0))
          {
            this$0.addBytesToWriteWindow(l2);
            SpdyConnection.access$2102(this$0, true);
          }
          l1 = l2;
          ??? = localIterator;
          if (!SpdyConnection.access$1700(this$0).isEmpty())
          {
            ??? = (SpdyStream[])SpdyConnection.access$1700(this$0).values().toArray(new SpdyStream[SpdyConnection.access$1700(this$0).size()]);
            l1 = l2;
          }
        }
      }
      if ((??? != null) && (l1 != 0L))
      {
        localIterator = SpdyConnection.access$1700(this$0).values().iterator();
        while (localIterator.hasNext()) {
          synchronized ((SpdyStream)localIterator.next())
          {
            ???.addBytesToWriteWindow(l1);
          }
        }
      }
    }
  }
  
  public void windowUpdate(int paramInt, long paramLong)
  {
    if (paramInt == 0) {
      synchronized (this$0)
      {
        SpdyConnection localSpdyConnection = this$0;
        bytesLeftInWriteWindow += paramLong;
        this$0.notifyAll();
        return;
      }
    }
    ??? = this$0.getStream(paramInt);
    if (??? != null) {
      try
      {
        ((SpdyStream)???).addBytesToWriteWindow(paramLong);
        return;
      }
      finally {}
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyConnection.Reader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */