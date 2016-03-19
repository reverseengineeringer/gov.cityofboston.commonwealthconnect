package okio;

import java.io.IOException;
import java.io.OutputStream;

final class Okio$1
  implements Sink
{
  Okio$1(Timeout paramTimeout, OutputStream paramOutputStream) {}
  
  public void close()
    throws IOException
  {
    val$out.close();
  }
  
  public void flush()
    throws IOException
  {
    val$out.flush();
  }
  
  public Timeout timeout()
  {
    return val$timeout;
  }
  
  public String toString()
  {
    return "sink(" + val$out + ")";
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    Util.checkOffsetAndCount(size, 0L, paramLong);
    while (paramLong > 0L)
    {
      val$timeout.throwIfReached();
      Segment localSegment = head;
      int i = (int)Math.min(paramLong, limit - pos);
      val$out.write(data, pos, i);
      pos += i;
      long l = paramLong - i;
      size -= i;
      paramLong = l;
      if (pos == limit)
      {
        head = localSegment.pop();
        SegmentPool.INSTANCE.recycle(localSegment);
        paramLong = l;
      }
    }
  }
}

/* Location:
 * Qualified Name:     okio.Okio.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */