package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Connection;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.Response.Builder;
import com.squareup.okhttp.Route;
import java.io.IOException;
import java.net.CacheRequest;
import java.net.Proxy;
import okio.Sink;
import okio.Source;

public final class HttpTransport
  implements Transport
{
  private final HttpConnection httpConnection;
  private final HttpEngine httpEngine;
  
  public HttpTransport(HttpEngine paramHttpEngine, HttpConnection paramHttpConnection)
  {
    httpEngine = paramHttpEngine;
    httpConnection = paramHttpConnection;
  }
  
  public boolean canReuseConnection()
  {
    if ("close".equalsIgnoreCase(httpEngine.getRequest().header("Connection"))) {}
    while (("close".equalsIgnoreCase(httpEngine.getResponse().header("Connection"))) || (httpConnection.isClosed())) {
      return false;
    }
    return true;
  }
  
  public Sink createRequestBody(Request paramRequest)
    throws IOException
  {
    long l = OkHeaders.contentLength(paramRequest);
    if (httpEngine.bufferRequestBody)
    {
      if (l > 2147483647L) {
        throw new IllegalStateException("Use setFixedLengthStreamingMode() or setChunkedStreamingMode() for requests larger than 2 GiB.");
      }
      if (l != -1L)
      {
        writeRequestHeaders(paramRequest);
        return new RetryableSink((int)l);
      }
      return new RetryableSink();
    }
    if ("chunked".equalsIgnoreCase(paramRequest.header("Transfer-Encoding")))
    {
      writeRequestHeaders(paramRequest);
      return httpConnection.newChunkedSink();
    }
    if (l != -1L)
    {
      writeRequestHeaders(paramRequest);
      return httpConnection.newFixedLengthSink(l);
    }
    throw new IllegalStateException("Cannot stream a request body without chunked encoding or a known content length!");
  }
  
  public void disconnect(HttpEngine paramHttpEngine)
    throws IOException
  {
    httpConnection.closeIfOwnedBy(paramHttpEngine);
  }
  
  public void emptyTransferStream()
    throws IOException
  {
    httpConnection.emptyResponseBody();
  }
  
  public void flushRequest()
    throws IOException
  {
    httpConnection.flush();
  }
  
  public Source getTransferStream(CacheRequest paramCacheRequest)
    throws IOException
  {
    if (!httpEngine.hasResponseBody()) {
      return httpConnection.newFixedLengthSource(paramCacheRequest, 0L);
    }
    if ("chunked".equalsIgnoreCase(httpEngine.getResponse().header("Transfer-Encoding"))) {
      return httpConnection.newChunkedSource(paramCacheRequest, httpEngine);
    }
    long l = OkHeaders.contentLength(httpEngine.getResponse());
    if (l != -1L) {
      return httpConnection.newFixedLengthSource(paramCacheRequest, l);
    }
    return httpConnection.newUnknownLengthSource(paramCacheRequest);
  }
  
  public Response.Builder readResponseHeaders()
    throws IOException
  {
    return httpConnection.readResponse();
  }
  
  public void releaseConnectionOnIdle()
    throws IOException
  {
    if (canReuseConnection())
    {
      httpConnection.poolOnIdle();
      return;
    }
    httpConnection.closeOnIdle();
  }
  
  public void writeRequestBody(RetryableSink paramRetryableSink)
    throws IOException
  {
    httpConnection.writeRequestBody(paramRetryableSink);
  }
  
  public void writeRequestHeaders(Request paramRequest)
    throws IOException
  {
    httpEngine.writingRequestHeaders();
    String str = RequestLine.get(paramRequest, httpEngine.getConnection().getRoute().getProxy().type(), httpEngine.getConnection().getProtocol());
    httpConnection.writeRequest(paramRequest.headers(), str);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.HttpTransport
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */