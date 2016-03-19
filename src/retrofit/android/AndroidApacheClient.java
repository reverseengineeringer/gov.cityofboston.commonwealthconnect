package retrofit.android;

import android.net.http.AndroidHttpClient;
import retrofit.client.ApacheClient;

public final class AndroidApacheClient
  extends ApacheClient
{
  public AndroidApacheClient()
  {
    super(AndroidHttpClient.newInstance("Retrofit"));
  }
}

/* Location:
 * Qualified Name:     retrofit.android.AndroidApacheClient
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */