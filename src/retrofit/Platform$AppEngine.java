package retrofit;

import retrofit.appengine.UrlFetchClient;
import retrofit.client.Client;
import retrofit.client.Client.Provider;

class Platform$AppEngine
  extends Platform.Base
{
  private Platform$AppEngine()
  {
    super(null);
  }
  
  Client.Provider defaultClient()
  {
    new Client.Provider()
    {
      public Client get()
      {
        return val$client;
      }
    };
  }
}

/* Location:
 * Qualified Name:     retrofit.Platform.AppEngine
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */