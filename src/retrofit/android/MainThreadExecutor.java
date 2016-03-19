package retrofit.android;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;

public final class MainThreadExecutor
  implements Executor
{
  private final Handler handler = new Handler(Looper.getMainLooper());
  
  public void execute(Runnable paramRunnable)
  {
    handler.post(paramRunnable);
  }
}

/* Location:
 * Qualified Name:     retrofit.android.MainThreadExecutor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */