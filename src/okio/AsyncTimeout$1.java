package okio;

import java.io.IOException;

class AsyncTimeout$1
  implements Sink
{
  AsyncTimeout$1(AsyncTimeout paramAsyncTimeout, Sink paramSink) {}
  
  public void close()
    throws IOException
  {
    this$0.enter();
    try
    {
      val$sink.close();
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
  
  public void flush()
    throws IOException
  {
    this$0.enter();
    try
    {
      val$sink.flush();
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
  
  public Timeout timeout()
  {
    return this$0;
  }
  
  public String toString()
  {
    return "AsyncTimeout.sink(" + val$sink + ")";
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    this$0.enter();
    try
    {
      val$sink.write(paramBuffer, paramLong);
      this$0.exit(true);
      return;
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
}

/* Location:
 * Qualified Name:     okio.AsyncTimeout.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */