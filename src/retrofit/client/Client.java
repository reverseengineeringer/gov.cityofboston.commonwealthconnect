package retrofit.client;

import java.io.IOException;

public abstract interface Client
{
  public abstract Response execute(Request paramRequest)
    throws IOException;
  
  public static abstract interface Provider
  {
    public abstract Client get();
  }
}

/* Location:
 * Qualified Name:     retrofit.client.Client
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */