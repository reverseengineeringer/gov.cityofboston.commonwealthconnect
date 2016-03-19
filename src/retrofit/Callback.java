package retrofit;

import retrofit.client.Response;

public abstract interface Callback<T>
{
  public abstract void failure(RetrofitError paramRetrofitError);
  
  public abstract void success(T paramT, Response paramResponse);
}

/* Location:
 * Qualified Name:     retrofit.Callback
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */