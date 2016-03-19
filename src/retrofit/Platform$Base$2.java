package retrofit;

import java.util.concurrent.ThreadFactory;

class Platform$Base$2
  implements ThreadFactory
{
  Platform$Base$2(Platform.Base paramBase) {}
  
  public Thread newThread(final Runnable paramRunnable)
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        Thread.currentThread().setPriority(1);
        paramRunnable.run();
      }
    }, "Retrofit-Idle");
  }
}

/* Location:
 * Qualified Name:     retrofit.Platform.Base.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */