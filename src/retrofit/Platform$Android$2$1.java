package retrofit;

import android.os.Process;

class Platform$Android$2$1
  implements Runnable
{
  Platform$Android$2$1(Platform.Android.2 param2, Runnable paramRunnable) {}
  
  public void run()
  {
    Process.setThreadPriority(10);
    val$r.run();
  }
}

/* Location:
 * Qualified Name:     retrofit.Platform.Android.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */