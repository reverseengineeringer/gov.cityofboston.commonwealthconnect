package retrofit;

import retrofit.client.Response;

public abstract class ResponseCallback
  implements Callback<Response>
{
  public abstract void success(Response paramResponse);
  
  public void success(Response paramResponse1, Response paramResponse2)
  {
    success(paramResponse1);
  }
}

/* Location:
 * Qualified Name:     retrofit.ResponseCallback
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */