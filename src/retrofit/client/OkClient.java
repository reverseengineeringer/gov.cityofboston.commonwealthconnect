package retrofit.client;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.OkUrlFactory;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.TimeUnit;

public class OkClient
  extends UrlConnectionClient
{
  private final OkUrlFactory okUrlFactory;
  
  public OkClient()
  {
    this(generateDefaultOkHttp());
  }
  
  public OkClient(OkHttpClient paramOkHttpClient)
  {
    okUrlFactory = new OkUrlFactory(paramOkHttpClient);
  }
  
  private static OkHttpClient generateDefaultOkHttp()
  {
    OkHttpClient localOkHttpClient = new OkHttpClient();
    localOkHttpClient.setConnectTimeout(15000L, TimeUnit.MILLISECONDS);
    localOkHttpClient.setReadTimeout(20000L, TimeUnit.MILLISECONDS);
    return localOkHttpClient;
  }
  
  protected HttpURLConnection openConnection(Request paramRequest)
    throws IOException
  {
    return okUrlFactory.open(new URL(paramRequest.getUrl()));
  }
}

/* Location:
 * Qualified Name:     retrofit.client.OkClient
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */