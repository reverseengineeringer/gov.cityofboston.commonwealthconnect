package retrofit.client;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.entity.AbstractHttpEntity;
import retrofit.mime.TypedOutput;

class ApacheClient$TypedOutputEntity
  extends AbstractHttpEntity
{
  final TypedOutput typedOutput;
  
  ApacheClient$TypedOutputEntity(TypedOutput paramTypedOutput)
  {
    typedOutput = paramTypedOutput;
    setContentType(paramTypedOutput.mimeType());
  }
  
  public InputStream getContent()
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    typedOutput.writeTo(localByteArrayOutputStream);
    return new ByteArrayInputStream(localByteArrayOutputStream.toByteArray());
  }
  
  public long getContentLength()
  {
    return typedOutput.length();
  }
  
  public boolean isRepeatable()
  {
    return true;
  }
  
  public boolean isStreaming()
  {
    return false;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    typedOutput.writeTo(paramOutputStream);
  }
}

/* Location:
 * Qualified Name:     retrofit.client.ApacheClient.TypedOutputEntity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */