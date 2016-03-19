package okio;

import java.io.IOException;

class AsyncTimeout$2
  implements Source
{
  AsyncTimeout$2(AsyncTimeout paramAsyncTimeout, Source paramSource) {}
  
  public void close()
    throws IOException
  {
    try
    {
      val$source.close();
      this$0.exit(true);
      return;
    }
    catch (IOException localIOException)
    {
      throw this$0.exit(localIOException);
    }
    finally
    {
      this$0.exit(false);
    }
  }
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    this$0.enter();
    try
    {
      paramLong = val$source.read(paramBuffer, paramLong);
      this$0.exit(true);
      return paramLong;
    }
    catch (IOException paramBuffer)
    {
      throw this$0.exit(paramBuffer);
    }
    finally
    {
      this$0.exit(false);
    }
  }
  
  public Timeout timeout()
  {
    return this$0;
  }
  
  public String toString()
  {
    return "AsyncTimeout.source(" + val$source + ")";
  }
}

/* Location:
 * Qualified Name:     okio.AsyncTimeout.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */