package okio;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

final class RealBufferedSource
  implements BufferedSource
{
  public final Buffer buffer;
  private boolean closed;
  public final Source source;
  
  public RealBufferedSource(Source paramSource)
  {
    this(paramSource, new Buffer());
  }
  
  public RealBufferedSource(Source paramSource, Buffer paramBuffer)
  {
    if (paramSource == null) {
      throw new IllegalArgumentException("source == null");
    }
    buffer = paramBuffer;
    source = paramSource;
  }
  
  public Buffer buffer()
  {
    return buffer;
  }
  
  public void close()
    throws IOException
  {
    if (closed) {
      return;
    }
    closed = true;
    source.close();
    buffer.clear();
  }
  
  public boolean exhausted()
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    return (buffer.exhausted()) && (source.read(buffer, 2048L) == -1L);
  }
  
  public long indexOf(byte paramByte)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    long l1 = 0L;
    do
    {
      long l2 = buffer.indexOf(paramByte, l1);
      l1 = l2;
      if (l2 != -1L) {
        break;
      }
      l1 = buffer.size;
    } while (source.read(buffer, 2048L) != -1L);
    l1 = -1L;
    return l1;
  }
  
  public InputStream inputStream()
  {
    new InputStream()
    {
      public int available()
        throws IOException
      {
        if (closed) {
          throw new IOException("closed");
        }
        return (int)Math.min(buffer.size, 2147483647L);
      }
      
      public void close()
        throws IOException
      {
        RealBufferedSource.this.close();
      }
      
      public int read()
        throws IOException
      {
        if (closed) {
          throw new IOException("closed");
        }
        if ((buffer.size == 0L) && (source.read(buffer, 2048L) == -1L)) {
          return -1;
        }
        return buffer.readByte() & 0xFF;
      }
      
      public int read(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
        throws IOException
      {
        if (closed) {
          throw new IOException("closed");
        }
        Util.checkOffsetAndCount(paramAnonymousArrayOfByte.length, paramAnonymousInt1, paramAnonymousInt2);
        if ((buffer.size == 0L) && (source.read(buffer, 2048L) == -1L)) {
          return -1;
        }
        return buffer.read(paramAnonymousArrayOfByte, paramAnonymousInt1, paramAnonymousInt2);
      }
      
      public String toString()
      {
        return RealBufferedSource.this + ".inputStream()";
      }
    };
  }
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (paramBuffer == null) {
      throw new IllegalArgumentException("sink == null");
    }
    if (paramLong < 0L) {
      throw new IllegalArgumentException("byteCount < 0: " + paramLong);
    }
    if (closed) {
      throw new IllegalStateException("closed");
    }
    if ((buffer.size == 0L) && (source.read(buffer, 2048L) == -1L)) {
      return -1L;
    }
    paramLong = Math.min(paramLong, buffer.size);
    return buffer.read(paramBuffer, paramLong);
  }
  
  public long readAll(Sink paramSink)
    throws IOException
  {
    if (paramSink == null) {
      throw new IllegalArgumentException("sink == null");
    }
    long l1 = 0L;
    while (source.read(buffer, 2048L) != -1L)
    {
      l2 = buffer.completeSegmentByteCount();
      if (l2 > 0L)
      {
        l1 += l2;
        paramSink.write(buffer, l2);
      }
    }
    long l2 = l1;
    if (buffer.size() > 0L)
    {
      l2 = l1 + buffer.size();
      paramSink.write(buffer, buffer.size());
    }
    return l2;
  }
  
  public byte readByte()
    throws IOException
  {
    require(1L);
    return buffer.readByte();
  }
  
  public byte[] readByteArray()
    throws IOException
  {
    buffer.writeAll(source);
    return buffer.readByteArray();
  }
  
  public byte[] readByteArray(long paramLong)
    throws IOException
  {
    require(paramLong);
    return buffer.readByteArray(paramLong);
  }
  
  public ByteString readByteString()
    throws IOException
  {
    buffer.writeAll(source);
    return buffer.readByteString();
  }
  
  public ByteString readByteString(long paramLong)
    throws IOException
  {
    require(paramLong);
    return buffer.readByteString(paramLong);
  }
  
  public void readFully(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    require(paramLong);
    buffer.readFully(paramBuffer, paramLong);
  }
  
  public int readInt()
    throws IOException
  {
    require(4L);
    return buffer.readInt();
  }
  
  public int readIntLe()
    throws IOException
  {
    require(4L);
    return buffer.readIntLe();
  }
  
  public long readLong()
    throws IOException
  {
    require(8L);
    return buffer.readLong();
  }
  
  public long readLongLe()
    throws IOException
  {
    require(8L);
    return buffer.readLongLe();
  }
  
  public short readShort()
    throws IOException
  {
    require(2L);
    return buffer.readShort();
  }
  
  public short readShortLe()
    throws IOException
  {
    require(2L);
    return buffer.readShortLe();
  }
  
  public String readString(long paramLong, Charset paramCharset)
    throws IOException
  {
    require(paramLong);
    if (paramCharset == null) {
      throw new IllegalArgumentException("charset == null");
    }
    return buffer.readString(paramLong, paramCharset);
  }
  
  public String readString(Charset paramCharset)
    throws IOException
  {
    if (paramCharset == null) {
      throw new IllegalArgumentException("charset == null");
    }
    buffer.writeAll(source);
    return buffer.readString(paramCharset);
  }
  
  public String readUtf8()
    throws IOException
  {
    buffer.writeAll(source);
    return buffer.readUtf8();
  }
  
  public String readUtf8(long paramLong)
    throws IOException
  {
    require(paramLong);
    return buffer.readUtf8(paramLong);
  }
  
  public String readUtf8Line()
    throws IOException
  {
    long l = indexOf((byte)10);
    if (l == -1L)
    {
      if (buffer.size != 0L) {
        return readUtf8(buffer.size);
      }
      return null;
    }
    return buffer.readUtf8Line(l);
  }
  
  public String readUtf8LineStrict()
    throws IOException
  {
    long l = indexOf((byte)10);
    if (l == -1L) {
      throw new EOFException();
    }
    return buffer.readUtf8Line(l);
  }
  
  public void require(long paramLong)
    throws IOException
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("byteCount < 0: " + paramLong);
    }
    if (closed) {
      throw new IllegalStateException("closed");
    }
    while (buffer.size < paramLong) {
      if (source.read(buffer, 2048L) == -1L) {
        throw new EOFException();
      }
    }
  }
  
  public void skip(long paramLong)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    do
    {
      long l = Math.min(paramLong, buffer.size());
      buffer.skip(l);
      paramLong -= l;
      if (paramLong <= 0L) {
        break;
      }
    } while ((buffer.size != 0L) || (source.read(buffer, 2048L) != -1L));
    throw new EOFException();
  }
  
  public Timeout timeout()
  {
    return source.timeout();
  }
  
  public String toString()
  {
    return "buffer(" + source + ")";
  }
}

/* Location:
 * Qualified Name:     okio.RealBufferedSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */