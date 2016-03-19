package retrofit;

import android.os.Process;
import java.util.concurrent.ThreadFactory;

class Platform$Android$2
  implements ThreadFactory
{
  Platform$Android$2(Platform.Android paramAndroid) {}
  
  public Thread newThread(final Runnable paramRunnable)
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        Process.setThreadPriority(10);
        paramRunnable.run();
      }
    }, "Retrofit-Idle");
  }
}

/* Location:
 * Qualified Name:     retrofit.Platform.Android.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */