package com.squareup.okhttp;

import com.squareup.okhttp.internal.NamedRunnable;
import com.squareup.okhttp.internal.http.HttpEngine;
import java.io.IOException;
import java.net.URL;

final class Call$AsyncCall
  extends NamedRunnable
{
  private final Callback responseCallback;
  
  private Call$AsyncCall(Call paramCall, Callback paramCallback)
  {
    super("OkHttp %s", new Object[] { Call.access$100(paramCall).urlString() });
    responseCallback = paramCallback;
  }
  
  protected void execute()
  {
    int j = 0;
    int i = j;
    try
    {
      Response localResponse = Call.access$200(this$0);
      i = j;
      if (this$0.canceled)
      {
        i = 1;
        responseCallback.onFailure(Call.access$100(this$0), new IOException("Canceled"));
      }
      for (;;)
      {
        return;
        j = 1;
        i = j;
        this$0.engine.releaseConnection();
        i = j;
        responseCallback.onResponse(localResponse);
      }
      responseCallback.onFailure(Call.access$100(this$0), localIOException2);
    }
    catch (IOException localIOException1)
    {
      if (i != 0) {
        throw new RuntimeException(localIOException1);
      }
    }
    finally
    {
      Call.access$300(this$0).finished(this);
    }
    Call.access$300(this$0).finished(this);
  }
  
  Call get()
  {
    return this$0;
  }
  
  String host()
  {
    return Call.access$100(this$0).url().getHost();
  }
  
  Request request()
  {
    return Call.access$100(this$0);
  }
  
  Object tag()
  {
    return Call.access$100(this$0).tag();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Call.AsyncCall
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */