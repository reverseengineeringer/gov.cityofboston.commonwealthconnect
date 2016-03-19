package retrofit.client;

import java.io.IOException;
import java.io.InputStream;
import retrofit.mime.TypedInput;

class UrlConnectionClient$TypedInputStream
  implements TypedInput
{
  private final long length;
  private final String mimeType;
  private final InputStream stream;
  
  private UrlConnectionClient$TypedInputStream(String paramString, long paramLong, InputStream paramInputStream)
  {
    mimeType = paramString;
    length = paramLong;
    stream = paramInputStream;
  }
  
  public InputStream in()
    throws IOException
  {
    return stream;
  }
  
  public long length()
  {
    return length;
  }
  
  public String mimeType()
  {
    return mimeType;
  }
}

/* Location:
 * Qualified Name:     retrofit.client.UrlConnectionClient.TypedInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */