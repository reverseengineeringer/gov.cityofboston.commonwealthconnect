package retrofit.mime;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

public class TypedByteArray
  implements TypedInput, TypedOutput
{
  private final byte[] bytes;
  private final String mimeType;
  
  public TypedByteArray(String paramString, byte[] paramArrayOfByte)
  {
    String str = paramString;
    if (paramString == null) {
      str = "application/unknown";
    }
    if (paramArrayOfByte == null) {
      throw new NullPointerException("bytes");
    }
    mimeType = str;
    bytes = paramArrayOfByte;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass())) {
        return false;
      }
      paramObject = (TypedByteArray)paramObject;
      if (!Arrays.equals(bytes, bytes)) {
        return false;
      }
    } while (mimeType.equals(mimeType));
    return false;
  }
  
  public String fileName()
  {
    return null;
  }
  
  public byte[] getBytes()
  {
    return bytes;
  }
  
  public int hashCode()
  {
    return mimeType.hashCode() * 31 + Arrays.hashCode(bytes);
  }
  
  public InputStream in()
    throws IOException
  {
    return new ByteArrayInputStream(bytes);
  }
  
  public long length()
  {
    return bytes.length;
  }
  
  public String mimeType()
  {
    return mimeType;
  }
  
  public String toString()
  {
    return "TypedByteArray[length=" + length() + "]";
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream.write(bytes);
  }
}

/* Location:
 * Qualified Name:     retrofit.mime.TypedByteArray
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */