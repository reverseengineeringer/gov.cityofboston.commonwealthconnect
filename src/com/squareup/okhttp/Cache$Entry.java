package com.squareup.okhttp;

import com.squareup.okhttp.internal.DiskLruCache.Editor;
import com.squareup.okhttp.internal.DiskLruCache.Snapshot;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.OkHeaders;
import com.squareup.okhttp.internal.http.StatusLine;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.security.cert.Certificate;
import java.security.cert.CertificateEncodingException;
import java.util.List;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;

final class Cache$Entry
{
  private final int code;
  private final Handshake handshake;
  private final String message;
  private final Protocol protocol;
  private final String requestMethod;
  private final Headers responseHeaders;
  private final String url;
  private final Headers varyHeaders;
  
  public Cache$Entry(Response paramResponse)
  {
    url = paramResponse.request().urlString();
    varyHeaders = OkHeaders.varyHeaders(paramResponse);
    requestMethod = paramResponse.request().method();
    protocol = paramResponse.protocol();
    code = paramResponse.code();
    message = paramResponse.message();
    responseHeaders = paramResponse.headers();
    handshake = paramResponse.handshake();
  }
  
  public Cache$Entry(InputStream paramInputStream)
    throws IOException
  {
    try
    {
      BufferedSource localBufferedSource1 = Okio.buffer(Okio.source(paramInputStream));
      url = localBufferedSource1.readUtf8LineStrict();
      requestMethod = localBufferedSource1.readUtf8LineStrict();
      Object localObject = new Headers.Builder();
      int j = Cache.access$900(localBufferedSource1);
      int i = 0;
      while (i < j)
      {
        ((Headers.Builder)localObject).addLine(localBufferedSource1.readUtf8LineStrict());
        i += 1;
      }
      varyHeaders = ((Headers.Builder)localObject).build();
      localObject = StatusLine.parse(localBufferedSource1.readUtf8LineStrict());
      protocol = protocol;
      code = code;
      message = message;
      localObject = new Headers.Builder();
      j = Cache.access$900(localBufferedSource1);
      i = 0;
      while (i < j)
      {
        ((Headers.Builder)localObject).addLine(localBufferedSource1.readUtf8LineStrict());
        i += 1;
      }
      responseHeaders = ((Headers.Builder)localObject).build();
      if (isHttps())
      {
        localObject = localBufferedSource1.readUtf8LineStrict();
        if (((String)localObject).length() > 0) {
          throw new IOException("expected \"\" but was \"" + (String)localObject + "\"");
        }
      }
    }
    finally
    {
      paramInputStream.close();
    }
    for (handshake = Handshake.get(localBufferedSource2.readUtf8LineStrict(), readCertificateList(localBufferedSource2), readCertificateList(localBufferedSource2));; handshake = null)
    {
      paramInputStream.close();
      return;
    }
  }
  
  private boolean isHttps()
  {
    return url.startsWith("https://");
  }
  
  /* Error */
  private List<Certificate> readCertificateList(BufferedSource paramBufferedSource)
    throws IOException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokestatic 102	com/squareup/okhttp/Cache:access$900	(Lokio/BufferedSource;)I
    //   4: istore_3
    //   5: iload_3
    //   6: iconst_m1
    //   7: if_icmpne +11 -> 18
    //   10: invokestatic 174	java/util/Collections:emptyList	()Ljava/util/List;
    //   13: astore 4
    //   15: aload 4
    //   17: areturn
    //   18: ldc -80
    //   20: invokestatic 182	java/security/cert/CertificateFactory:getInstance	(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;
    //   23: astore 6
    //   25: new 184	java/util/ArrayList
    //   28: dup
    //   29: iload_3
    //   30: invokespecial 187	java/util/ArrayList:<init>	(I)V
    //   33: astore 5
    //   35: iconst_0
    //   36: istore_2
    //   37: aload 5
    //   39: astore 4
    //   41: iload_2
    //   42: iload_3
    //   43: if_icmpge -28 -> 15
    //   46: aload 5
    //   48: aload 6
    //   50: new 189	java/io/ByteArrayInputStream
    //   53: dup
    //   54: aload_1
    //   55: invokeinterface 95 1 0
    //   60: invokestatic 195	okio/ByteString:decodeBase64	(Ljava/lang/String;)Lokio/ByteString;
    //   63: invokevirtual 199	okio/ByteString:toByteArray	()[B
    //   66: invokespecial 202	java/io/ByteArrayInputStream:<init>	([B)V
    //   69: invokevirtual 206	java/security/cert/CertificateFactory:generateCertificate	(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    //   72: invokeinterface 212 2 0
    //   77: pop
    //   78: iload_2
    //   79: iconst_1
    //   80: iadd
    //   81: istore_2
    //   82: goto -45 -> 37
    //   85: astore_1
    //   86: new 80	java/io/IOException
    //   89: dup
    //   90: aload_1
    //   91: invokevirtual 215	java/security/cert/CertificateException:getMessage	()Ljava/lang/String;
    //   94: invokespecial 144	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   97: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	98	0	this	Entry
    //   0	98	1	paramBufferedSource	BufferedSource
    //   36	46	2	i	int
    //   4	40	3	j	int
    //   13	27	4	localObject	Object
    //   33	14	5	localArrayList	java.util.ArrayList
    //   23	26	6	localCertificateFactory	java.security.cert.CertificateFactory
    // Exception table:
    //   from	to	target	type
    //   18	35	85	java/security/cert/CertificateException
    //   46	78	85	java/security/cert/CertificateException
  }
  
  private void writeCertArray(Writer paramWriter, List<Certificate> paramList)
    throws IOException
  {
    try
    {
      paramWriter.write(Integer.toString(paramList.size()));
      paramWriter.write(10);
      int i = 0;
      int j = paramList.size();
      while (i < j)
      {
        paramWriter.write(ByteString.of(((Certificate)paramList.get(i)).getEncoded()).base64());
        paramWriter.write(10);
        i += 1;
      }
      return;
    }
    catch (CertificateEncodingException paramWriter)
    {
      throw new IOException(paramWriter.getMessage());
    }
  }
  
  public boolean matches(Request paramRequest, Response paramResponse)
  {
    return (url.equals(paramRequest.urlString())) && (requestMethod.equals(paramRequest.method())) && (OkHeaders.varyMatches(paramResponse, varyHeaders, paramRequest));
  }
  
  public Response response(Request paramRequest, DiskLruCache.Snapshot paramSnapshot)
  {
    paramRequest = responseHeaders.get("Content-Type");
    String str = responseHeaders.get("Content-Length");
    Request localRequest = new Request.Builder().url(url).method(message, null).headers(varyHeaders).build();
    return new Response.Builder().request(localRequest).protocol(protocol).code(code).message(message).headers(responseHeaders).body(new Cache.CacheResponseBody(paramSnapshot, paramRequest, str)).handshake(handshake).build();
  }
  
  public void writeTo(DiskLruCache.Editor paramEditor)
    throws IOException
  {
    paramEditor = new BufferedWriter(new OutputStreamWriter(paramEditor.newOutputStream(0), Util.UTF_8));
    paramEditor.write(url);
    paramEditor.write(10);
    paramEditor.write(requestMethod);
    paramEditor.write(10);
    paramEditor.write(Integer.toString(varyHeaders.size()));
    paramEditor.write(10);
    int i = 0;
    while (i < varyHeaders.size())
    {
      paramEditor.write(varyHeaders.name(i));
      paramEditor.write(": ");
      paramEditor.write(varyHeaders.value(i));
      paramEditor.write(10);
      i += 1;
    }
    paramEditor.write(new StatusLine(protocol, code, message).toString());
    paramEditor.write(10);
    paramEditor.write(Integer.toString(responseHeaders.size()));
    paramEditor.write(10);
    i = 0;
    while (i < responseHeaders.size())
    {
      paramEditor.write(responseHeaders.name(i));
      paramEditor.write(": ");
      paramEditor.write(responseHeaders.value(i));
      paramEditor.write(10);
      i += 1;
    }
    if (isHttps())
    {
      paramEditor.write(10);
      paramEditor.write(handshake.cipherSuite());
      paramEditor.write(10);
      writeCertArray(paramEditor, handshake.peerCertificates());
      writeCertArray(paramEditor, handshake.localCertificates());
    }
    paramEditor.close();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Cache.Entry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */