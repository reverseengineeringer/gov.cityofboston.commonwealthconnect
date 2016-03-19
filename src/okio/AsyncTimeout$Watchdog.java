package okio;

final class AsyncTimeout$Watchdog
  extends Thread
{
  public AsyncTimeout$Watchdog()
  {
    super("Okio Watchdog");
    setDaemon(true);
  }
  
  public void run()
  {
    try
    {
      for (;;)
      {
        AsyncTimeout localAsyncTimeout = AsyncTimeout.access$000();
        if (localAsyncTimeout != null) {
          localAsyncTimeout.timedOut();
        }
      }
    }
    catch (InterruptedException localInterruptedException) {}
  }
}

/* Location:
 * Qualified Name:     okio.AsyncTimeout.Watchdog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */