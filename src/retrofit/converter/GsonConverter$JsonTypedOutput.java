package retrofit.converter;

import java.io.IOException;
import java.io.OutputStream;
import retrofit.mime.TypedOutput;

class GsonConverter$JsonTypedOutput
  implements TypedOutput
{
  private final byte[] jsonBytes;
  private final String mimeType;
  
  GsonConverter$JsonTypedOutput(byte[] paramArrayOfByte, String paramString)
  {
    jsonBytes = paramArrayOfByte;
    mimeType = ("application/json; charset=" + paramString);
  }
  
  public String fileName()
  {
    return null;
  }
  
  public long length()
  {
    return jsonBytes.length;
  }
  
  public String mimeType()
  {
    return mimeType;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream.write(jsonBytes);
  }
}

/* Location:
 * Qualified Name:     retrofit.converter.GsonConverter.JsonTypedOutput
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */