package retrofit.client;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import retrofit.mime.TypedOutput;

public final class Request
{
  private final TypedOutput body;
  private final List<Header> headers;
  private final String method;
  private final String url;
  
  public Request(String paramString1, String paramString2, List<Header> paramList, TypedOutput paramTypedOutput)
  {
    if (paramString1 == null) {
      throw new NullPointerException("Method must not be null.");
    }
    if (paramString2 == null) {
      throw new NullPointerException("URL must not be null.");
    }
    method = paramString1;
    url = paramString2;
    if (paramList == null) {}
    for (headers = Collections.emptyList();; headers = Collections.unmodifiableList(new ArrayList(paramList)))
    {
      body = paramTypedOutput;
      return;
    }
  }
  
  public TypedOutput getBody()
  {
    return body;
  }
  
  public List<Header> getHeaders()
  {
    return headers;
  }
  
  public String getMethod()
  {
    return method;
  }
  
  public String getUrl()
  {
    return url;
  }
}

/* Location:
 * Qualified Name:     retrofit.client.Request
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */