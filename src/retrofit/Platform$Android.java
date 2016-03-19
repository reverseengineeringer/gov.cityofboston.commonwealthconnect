package retrofit;

import android.os.Build.VERSION;
import android.os.Process;
import com.google.gson.Gson;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import retrofit.android.AndroidApacheClient;
import retrofit.android.AndroidLog;
import retrofit.android.MainThreadExecutor;
import retrofit.client.Client;
import retrofit.client.Client.Provider;
import retrofit.client.UrlConnectionClient;
import retrofit.converter.Converter;
import retrofit.converter.GsonConverter;

class Platform$Android
  extends Platform
{
  Executor defaultCallbackExecutor()
  {
    return new MainThreadExecutor();
  }
  
  Client.Provider defaultClient()
  {
    final Object localObject;
    if (Platform.access$300()) {
      localObject = Platform.OkClientInstantiator.instantiate();
    }
    for (;;)
    {
      new Client.Provider()
      {
        public Client get()
        {
          return localObject;
        }
      };
      if (Build.VERSION.SDK_INT < 9) {
        localObject = new AndroidApacheClient();
      } else {
        localObject = new UrlConnectionClient();
      }
    }
  }
  
  Converter defaultConverter()
  {
    return new GsonConverter(new Gson());
  }
  
  Executor defaultHttpExecutor()
  {
    Executors.newCachedThreadPool(new ThreadFactory()
    {
      public Thread newThread(final Runnable paramAnonymousRunnable)
      {
        new Thread(new Runnable()
        {
          public void run()
          {
            Process.setThreadPriority(10);
            paramAnonymousRunnable.run();
          }
        }, "Retrofit-Idle");
      }
    });
  }
  
  RestAdapter.Log defaultLog()
  {
    return new AndroidLog("Retrofit");
  }
}

/* Location:
 * Qualified Name:     retrofit.Platform.Android
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */