package okio;

import java.io.IOException;
import java.io.InputStream;

final class Okio$2
  implements Source
{
  Okio$2(Timeout paramTimeout, InputStream paramInputStream) {}
  
  public void close()
    throws IOException
  {
    val$in.close();
  }
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("byteCount < 0: " + paramLong);
    }
    val$timeout.throwIfReached();
    Segment localSegment = paramBuffer.writableSegment(1);
    int i = (int)Math.min(paramLong, 2048 - limit);
    i = val$in.read(data, limit, i);
    if (i == -1) {
      return -1L;
    }
    limit += i;
    size += i;
    return i;
  }
  
  public Timeout timeout()
  {
    return val$timeout;
  }
  
  public String toString()
  {
    return "source(" + val$in + ")";
  }
}

/* Location:
 * Qualified Name:     okio.Okio.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */