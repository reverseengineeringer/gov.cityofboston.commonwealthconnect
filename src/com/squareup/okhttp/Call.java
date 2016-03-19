package com.squareup.okhttp;

import com.squareup.okhttp.internal.NamedRunnable;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.HttpMethod;
import com.squareup.okhttp.internal.http.OkHeaders;
import com.squareup.okhttp.internal.http.RetryableSink;
import java.io.IOException;
import java.net.ProtocolException;
import java.net.URL;
import okio.BufferedSink;
import okio.BufferedSource;

public final class Call
{
  volatile boolean canceled;
  private final OkHttpClient client;
  private final Dispatcher dispatcher;
  HttpEngine engine;
  private boolean executed;
  private int redirectionCount;
  private Request request;
  
  Call(OkHttpClient paramOkHttpClient, Dispatcher paramDispatcher, Request paramRequest)
  {
    client = paramOkHttpClient;
    dispatcher = paramDispatcher;
    request = paramRequest;
  }
  
  private Response getResponse()
    throws IOException
  {
    Object localObject2 = request.body();
    Object localObject1 = null;
    Object localObject3;
    if (localObject2 != null)
    {
      localObject3 = request.newBuilder();
      MediaType localMediaType = ((RequestBody)localObject2).contentType();
      if (localMediaType != null) {
        ((Request.Builder)localObject3).header("Content-Type", localMediaType.toString());
      }
      long l = ((RequestBody)localObject2).contentLength();
      if (l != -1L)
      {
        ((Request.Builder)localObject3).header("Content-Length", Long.toString(l));
        ((Request.Builder)localObject3).removeHeader("Transfer-Encoding");
        request = ((Request.Builder)localObject3).build();
      }
    }
    label94:
    for (engine = new HttpEngine(client, request, false, null, null, (RetryableSink)localObject1, null);; engine = new HttpEngine(client, request, false, (Connection)localObject3, null, null, localIOException))
    {
      for (;;)
      {
        if (canceled)
        {
          return null;
          ((Request.Builder)localObject3).header("Transfer-Encoding", "chunked");
          ((Request.Builder)localObject3).removeHeader("Content-Length");
          break;
          if (!HttpMethod.hasRequestBody(request.method())) {
            break label94;
          }
          localObject1 = Util.emptySink();
          break label94;
        }
        try
        {
          engine.sendRequest();
          if (request.body() != null)
          {
            localObject1 = engine.getBufferedRequestBody();
            request.body().writeTo((BufferedSink)localObject1);
          }
          engine.readResponse();
          localObject1 = engine.getResponse();
          localObject2 = engine.followUpRequest();
          if (localObject2 == null)
          {
            engine.releaseConnection();
            return ((Response)localObject1).newBuilder().body(new RealResponseBody((Response)localObject1, engine.getResponseBody())).build();
          }
        }
        catch (IOException localIOException)
        {
          localObject2 = engine.recover(localIOException, null);
          if (localObject2 != null) {
            engine = ((HttpEngine)localObject2);
          } else {
            throw localIOException;
          }
        }
      }
      if (engine.getResponse().isRedirect())
      {
        int i = redirectionCount + 1;
        redirectionCount = i;
        if (i > 20) {
          throw new ProtocolException("Too many redirects: " + redirectionCount);
        }
      }
      if (!engine.sameConnection(((Request)localObject2).url())) {
        engine.releaseConnection();
      }
      localObject3 = engine.close();
      request = ((Request)localObject2);
    }
  }
  
  public void cancel()
  {
    canceled = true;
    if (engine != null) {
      engine.disconnect();
    }
  }
  
  public void enqueue(Callback paramCallback)
  {
    try
    {
      if (executed) {
        throw new IllegalStateException("Already Executed");
      }
    }
    finally {}
    executed = true;
    dispatcher.enqueue(new AsyncCall(paramCallback, null));
  }
  
  public Response execute()
    throws IOException
  {
    try
    {
      if (executed) {
        throw new IllegalStateException("Already Executed");
      }
    }
    finally {}
    executed = true;
    Response localResponse = getResponse();
    engine.releaseConnection();
    if (localResponse == null) {
      throw new IOException("Canceled");
    }
    return localResponse;
  }
  
  final class AsyncCall
    extends NamedRunnable
  {
    private final Callback responseCallback;
    
    private AsyncCall(Callback paramCallback)
    {
      super(new Object[] { request.urlString() });
      responseCallback = paramCallback;
    }
    
    protected void execute()
    {
      int j = 0;
      int i = j;
      try
      {
        Response localResponse = Call.this.getResponse();
        i = j;
        if (canceled)
        {
          i = 1;
          responseCallback.onFailure(request, new IOException("Canceled"));
        }
        for (;;)
        {
          return;
          j = 1;
          i = j;
          engine.releaseConnection();
          i = j;
          responseCallback.onResponse(localResponse);
        }
        responseCallback.onFailure(request, localIOException2);
      }
      catch (IOException localIOException1)
      {
        if (i != 0) {
          throw new RuntimeException(localIOException1);
        }
      }
      finally
      {
        dispatcher.finished(this);
      }
      dispatcher.finished(this);
    }
    
    Call get()
    {
      return Call.this;
    }
    
    String host()
    {
      return request.url().getHost();
    }
    
    Request request()
    {
      return request;
    }
    
    Object tag()
    {
      return request.tag();
    }
  }
  
  private static class RealResponseBody
    extends ResponseBody
  {
    private final Response response;
    private final BufferedSource source;
    
    RealResponseBody(Response paramResponse, BufferedSource paramBufferedSource)
    {
      response = paramResponse;
      source = paramBufferedSource;
    }
    
    public long contentLength()
    {
      return OkHeaders.contentLength(response);
    }
    
    public MediaType contentType()
    {
      String str = response.header("Content-Type");
      if (str != null) {
        return MediaType.parse(str);
      }
      return null;
    }
    
    public BufferedSource source()
    {
      return source;
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Call
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */