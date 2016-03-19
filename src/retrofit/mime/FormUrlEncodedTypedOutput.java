package retrofit.mime;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

public final class FormUrlEncodedTypedOutput
  implements TypedOutput
{
  final ByteArrayOutputStream content = new ByteArrayOutputStream();
  
  public void addField(String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      throw new NullPointerException("name");
    }
    if (paramString2 == null) {
      throw new NullPointerException("value");
    }
    if (content.size() > 0) {
      content.write(38);
    }
    try
    {
      paramString1 = URLEncoder.encode(paramString1, "UTF-8");
      paramString2 = URLEncoder.encode(paramString2, "UTF-8");
      content.write(paramString1.getBytes("UTF-8"));
      content.write(61);
      content.write(paramString2.getBytes("UTF-8"));
      return;
    }
    catch (IOException paramString1)
    {
      throw new RuntimeException(paramString1);
    }
  }
  
  public String fileName()
  {
    return null;
  }
  
  public long length()
  {
    return content.size();
  }
  
  public String mimeType()
  {
    return "application/x-www-form-urlencoded; charset=UTF-8";
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream.write(content.toByteArray());
  }
}

/* Location:
 * Qualified Name:     retrofit.mime.FormUrlEncodedTypedOutput
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */