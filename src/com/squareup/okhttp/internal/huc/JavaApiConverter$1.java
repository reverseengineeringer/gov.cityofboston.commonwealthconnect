package com.squareup.okhttp.internal.huc;

import com.squareup.okhttp.Handshake;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;
import com.squareup.okhttp.internal.http.OkHeaders;
import com.squareup.okhttp.internal.http.StatusLine;
import java.io.IOException;
import java.io.InputStream;
import java.net.SecureCacheResponse;
import java.security.Principal;
import java.security.cert.Certificate;
import java.util.List;
import java.util.Map;
import javax.net.ssl.SSLPeerUnverifiedException;

final class JavaApiConverter$1
  extends SecureCacheResponse
{
  JavaApiConverter$1(Handshake paramHandshake, Headers paramHeaders, Response paramResponse, ResponseBody paramResponseBody) {}
  
  public InputStream getBody()
    throws IOException
  {
    if (val$body == null) {
      return null;
    }
    return val$body.byteStream();
  }
  
  public String getCipherSuite()
  {
    if (val$handshake != null) {
      return val$handshake.cipherSuite();
    }
    return null;
  }
  
  public Map<String, List<String>> getHeaders()
    throws IOException
  {
    return OkHeaders.toMultimap(val$headers, StatusLine.get(val$response).toString());
  }
  
  public List<Certificate> getLocalCertificateChain()
  {
    if (val$handshake == null) {
      return null;
    }
    List localList = val$handshake.localCertificates();
    if (localList.size() > 0) {}
    for (;;)
    {
      return localList;
      localList = null;
    }
  }
  
  public Principal getLocalPrincipal()
  {
    if (val$handshake == null) {
      return null;
    }
    return val$handshake.localPrincipal();
  }
  
  public Principal getPeerPrincipal()
    throws SSLPeerUnverifiedException
  {
    if (val$handshake == null) {
      return null;
    }
    return val$handshake.peerPrincipal();
  }
  
  public List<Certificate> getServerCertificateChain()
    throws SSLPeerUnverifiedException
  {
    if (val$handshake == null) {
      return null;
    }
    List localList = val$handshake.peerCertificates();
    if (localList.size() > 0) {}
    for (;;)
    {
      return localList;
      localList = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.huc.JavaApiConverter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */