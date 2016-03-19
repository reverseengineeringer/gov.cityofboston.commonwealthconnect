package com.squareup.okhttp.internal.http;

import java.io.IOException;
import okio.Buffer;
import okio.BufferedSink;
import okio.Sink;
import okio.Timeout;

final class HttpConnection$ChunkedSink
  implements Sink
{
  private boolean closed;
  private final byte[] hex = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 10 };
  
  private HttpConnection$ChunkedSink(HttpConnection paramHttpConnection) {}
  
  private void writeHex(long paramLong)
    throws IOException
  {
    int i = 16;
    int j;
    long l;
    do
    {
      byte[] arrayOfByte = hex;
      j = i - 1;
      arrayOfByte[j] = HttpConnection.access$500()[((int)(0xF & paramLong))];
      l = paramLong >>> 4;
      i = j;
      paramLong = l;
    } while (l != 0L);
    HttpConnection.access$200(this$0).write(hex, j, hex.length - j);
  }
  
  /* Error */
  public void close()
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 55	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:closed	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: iconst_1
    //   16: putfield 55	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:closed	Z
    //   19: aload_0
    //   20: getfield 19	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:this$0	Lcom/squareup/okhttp/internal/http/HttpConnection;
    //   23: invokestatic 45	com/squareup/okhttp/internal/http/HttpConnection:access$200	(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;
    //   26: invokestatic 58	com/squareup/okhttp/internal/http/HttpConnection:access$400	()[B
    //   29: invokeinterface 61 2 0
    //   34: pop
    //   35: aload_0
    //   36: getfield 19	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:this$0	Lcom/squareup/okhttp/internal/http/HttpConnection;
    //   39: iconst_3
    //   40: invokestatic 65	com/squareup/okhttp/internal/http/HttpConnection:access$302	(Lcom/squareup/okhttp/internal/http/HttpConnection;I)I
    //   43: pop
    //   44: goto -33 -> 11
    //   47: astore_2
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_2
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	ChunkedSink
    //   6	2	1	bool	boolean
    //   47	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	47	finally
    //   14	44	47	finally
  }
  
  /* Error */
  public void flush()
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 55	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:closed	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: getfield 19	com/squareup/okhttp/internal/http/HttpConnection$ChunkedSink:this$0	Lcom/squareup/okhttp/internal/http/HttpConnection;
    //   18: invokestatic 45	com/squareup/okhttp/internal/http/HttpConnection:access$200	(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;
    //   21: invokeinterface 68 1 0
    //   26: goto -15 -> 11
    //   29: astore_2
    //   30: aload_0
    //   31: monitorexit
    //   32: aload_2
    //   33: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	34	0	this	ChunkedSink
    //   6	2	1	bool	boolean
    //   29	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	29	finally
    //   14	26	29	finally
  }
  
  public Timeout timeout()
  {
    return HttpConnection.access$200(this$0).timeout();
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    if (paramLong == 0L) {
      return;
    }
    writeHex(paramLong);
    HttpConnection.access$200(this$0).write(paramBuffer, paramLong);
    HttpConnection.access$200(this$0).writeUtf8("\r\n");
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.HttpConnection.ChunkedSink
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */