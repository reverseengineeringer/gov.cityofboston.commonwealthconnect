package okio;

import java.io.IOException;
import java.io.InputStream;

class RealBufferedSource$1
  extends InputStream
{
  RealBufferedSource$1(RealBufferedSource paramRealBufferedSource) {}
  
  public int available()
    throws IOException
  {
    if (RealBufferedSource.access$000(this$0)) {
      throw new IOException("closed");
    }
    return (int)Math.min(this$0.buffer.size, 2147483647L);
  }
  
  public void close()
    throws IOException
  {
    this$0.close();
  }
  
  public int read()
    throws IOException
  {
    if (RealBufferedSource.access$000(this$0)) {
      throw new IOException("closed");
    }
    if ((this$0.buffer.size == 0L) && (this$0.source.read(this$0.buffer, 2048L) == -1L)) {
      return -1;
    }
    return this$0.buffer.readByte() & 0xFF;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (RealBufferedSource.access$000(this$0)) {
      throw new IOException("closed");
    }
    Util.checkOffsetAndCount(paramArrayOfByte.length, paramInt1, paramInt2);
    if ((this$0.buffer.size == 0L) && (this$0.source.read(this$0.buffer, 2048L) == -1L)) {
      return -1;
    }
    return this$0.buffer.read(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public String toString()
  {
    return this$0 + ".inputStream()";
  }
}

/* Location:
 * Qualified Name:     okio.RealBufferedSource.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */