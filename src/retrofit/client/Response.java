package retrofit.client;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import retrofit.mime.TypedInput;

public final class Response
{
  private final TypedInput body;
  private final List<Header> headers;
  private final String reason;
  private final int status;
  private final String url;
  
  public Response(String paramString1, int paramInt, String paramString2, List<Header> paramList, TypedInput paramTypedInput)
  {
    if (paramString1 == null) {
      throw new IllegalArgumentException("url == null");
    }
    if (paramInt < 200) {
      throw new IllegalArgumentException("Invalid status code: " + paramInt);
    }
    if (paramString2 == null) {
      throw new IllegalArgumentException("reason == null");
    }
    if (paramList == null) {
      throw new IllegalArgumentException("headers == null");
    }
    url = paramString1;
    status = paramInt;
    reason = paramString2;
    headers = Collections.unmodifiableList(new ArrayList(paramList));
    body = paramTypedInput;
  }
  
  public TypedInput getBody()
  {
    return body;
  }
  
  public List<Header> getHeaders()
  {
    return headers;
  }
  
  public String getReason()
  {
    return reason;
  }
  
  public int getStatus()
  {
    return status;
  }
  
  public String getUrl()
  {
    return url;
  }
}

/* Location:
 * Qualified Name:     retrofit.client.Response
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */