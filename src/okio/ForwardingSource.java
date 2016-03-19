package okio;

import java.io.IOException;

public abstract class ForwardingSource
  implements Source
{
  private final Source delegate;
  
  public ForwardingSource(Source paramSource)
  {
    if (paramSource == null) {
      throw new IllegalArgumentException("delegate == null");
    }
    delegate = paramSource;
  }
  
  public void close()
    throws IOException
  {
    delegate.close();
  }
  
  public final Source delegate()
  {
    return delegate;
  }
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    return delegate.read(paramBuffer, paramLong);
  }
  
  public Timeout timeout()
  {
    return delegate.timeout();
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + "(" + delegate.toString() + ")";
  }
}

/* Location:
 * Qualified Name:     okio.ForwardingSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */