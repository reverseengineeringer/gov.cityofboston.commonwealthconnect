package retrofit.mime;

import java.io.IOException;
import java.io.OutputStream;

final class MultipartTypedOutput$MimePart
{
  private final TypedOutput body;
  private final String boundary;
  private boolean isBuilt;
  private final boolean isFirst;
  private final String name;
  private byte[] partBoundary;
  private byte[] partHeader;
  private final String transferEncoding;
  
  public MultipartTypedOutput$MimePart(String paramString1, String paramString2, TypedOutput paramTypedOutput, String paramString3, boolean paramBoolean)
  {
    name = paramString1;
    transferEncoding = paramString2;
    body = paramTypedOutput;
    isFirst = paramBoolean;
    boundary = paramString3;
  }
  
  private void build()
  {
    if (isBuilt) {
      return;
    }
    partBoundary = MultipartTypedOutput.access$000(boundary, isFirst, false);
    partHeader = MultipartTypedOutput.access$100(name, transferEncoding, body);
    isBuilt = true;
  }
  
  public long size()
  {
    long l = -1L;
    build();
    if (body.length() > -1L) {
      l = body.length() + partBoundary.length + partHeader.length;
    }
    return l;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    build();
    paramOutputStream.write(partBoundary);
    paramOutputStream.write(partHeader);
    body.writeTo(paramOutputStream);
  }
}

/* Location:
 * Qualified Name:     retrofit.mime.MultipartTypedOutput.MimePart
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */