package okio;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.concurrent.TimeUnit;

public class Timeout
{
  public static final Timeout NONE = new Timeout()
  {
    public Timeout deadlineNanoTime(long paramAnonymousLong)
    {
      return this;
    }
    
    public void throwIfReached()
      throws IOException
    {}
    
    public Timeout timeout(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
    {
      return this;
    }
  };
  private long deadlineNanoTime;
  private boolean hasDeadline;
  private long timeoutNanos;
  
  public Timeout clearDeadline()
  {
    hasDeadline = false;
    return this;
  }
  
  public Timeout clearTimeout()
  {
    timeoutNanos = 0L;
    return this;
  }
  
  public final Timeout deadline(long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("duration <= 0: " + paramLong);
    }
    if (paramTimeUnit == null) {
      throw new IllegalArgumentException("unit == null");
    }
    return deadlineNanoTime(System.nanoTime() + paramTimeUnit.toNanos(paramLong));
  }
  
  public long deadlineNanoTime()
  {
    if (!hasDeadline) {
      throw new IllegalStateException("No deadline");
    }
    return deadlineNanoTime;
  }
  
  public Timeout deadlineNanoTime(long paramLong)
  {
    hasDeadline = true;
    deadlineNanoTime = paramLong;
    return this;
  }
  
  public boolean hasDeadline()
  {
    return hasDeadline;
  }
  
  public void throwIfReached()
    throws IOException
  {
    if (Thread.interrupted()) {
      throw new InterruptedIOException();
    }
    if ((hasDeadline) && (System.nanoTime() > deadlineNanoTime)) {
      throw new IOException("deadline reached");
    }
  }
  
  public Timeout timeout(long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("timeout < 0: " + paramLong);
    }
    if (paramTimeUnit == null) {
      throw new IllegalArgumentException("unit == null");
    }
    timeoutNanos = paramTimeUnit.toNanos(paramLong);
    return this;
  }
  
  public long timeoutNanos()
  {
    return timeoutNanos;
  }
}

/* Location:
 * Qualified Name:     okio.Timeout
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */