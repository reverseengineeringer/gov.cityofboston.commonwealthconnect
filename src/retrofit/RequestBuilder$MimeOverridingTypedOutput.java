package retrofit;

import java.io.IOException;
import java.io.OutputStream;
import retrofit.mime.TypedOutput;

class RequestBuilder$MimeOverridingTypedOutput
  implements TypedOutput
{
  private final TypedOutput delegate;
  private final String mimeType;
  
  RequestBuilder$MimeOverridingTypedOutput(TypedOutput paramTypedOutput, String paramString)
  {
    delegate = paramTypedOutput;
    mimeType = paramString;
  }
  
  public String fileName()
  {
    return delegate.fileName();
  }
  
  public long length()
  {
    return delegate.length();
  }
  
  public String mimeType()
  {
    return mimeType;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    delegate.writeTo(paramOutputStream);
  }
}

/* Location:
 * Qualified Name:     retrofit.RequestBuilder.MimeOverridingTypedOutput
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */