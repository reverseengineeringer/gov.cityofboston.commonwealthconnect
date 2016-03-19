package retrofit;

import java.util.concurrent.Executor;

class Utils$SynchronousExecutor
  implements Executor
{
  public void execute(Runnable paramRunnable)
  {
    paramRunnable.run();
  }
}

/* Location:
 * Qualified Name:     retrofit.Utils.SynchronousExecutor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */