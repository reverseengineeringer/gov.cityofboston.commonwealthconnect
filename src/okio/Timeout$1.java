package okio;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

final class Timeout$1
  extends Timeout
{
  public Timeout deadlineNanoTime(long paramLong)
  {
    return this;
  }
  
  public void throwIfReached()
    throws IOException
  {}
  
  public Timeout timeout(long paramLong, TimeUnit paramTimeUnit)
  {
    return this;
  }
}

/* Location:
 * Qualified Name:     okio.Timeout.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */