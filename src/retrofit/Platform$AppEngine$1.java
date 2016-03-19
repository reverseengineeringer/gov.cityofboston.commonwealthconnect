package retrofit;

import retrofit.appengine.UrlFetchClient;
import retrofit.client.Client;
import retrofit.client.Client.Provider;

class Platform$AppEngine$1
  implements Client.Provider
{
  Platform$AppEngine$1(Platform.AppEngine paramAppEngine, UrlFetchClient paramUrlFetchClient) {}
  
  public Client get()
  {
    return val$client;
  }
}

/* Location:
 * Qualified Name:     retrofit.Platform.AppEngine.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */