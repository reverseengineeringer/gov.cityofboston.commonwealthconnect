package retrofit;

import com.google.gson.Gson;
import java.io.PrintStream;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import retrofit.client.Client;
import retrofit.client.Client.Provider;
import retrofit.client.UrlConnectionClient;
import retrofit.converter.Converter;
import retrofit.converter.GsonConverter;

class Platform$Base
  extends Platform
{
  Executor defaultCallbackExecutor()
  {
    return new Utils.SynchronousExecutor();
  }
  
  Client.Provider defaultClient()
  {
    if (Platform.access$300()) {}
    for (final Object localObject = Platform.OkClientInstantiator.instantiate();; localObject = new UrlConnectionClient()) {
      new Client.Provider()
      {
        public Client get()
        {
          return localObject;
        }
      };
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
            Thread.currentThread().setPriority(1);
            paramAnonymousRunnable.run();
          }
        }, "Retrofit-Idle");
      }
    });
  }
  
  RestAdapter.Log defaultLog()
  {
    new RestAdapter.Log()
    {
      public void log(String paramAnonymousString)
      {
        System.out.println(paramAnonymousString);
      }
    };
  }
}

/* Location:
 * Qualified Name:     retrofit.Platform.Base
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */