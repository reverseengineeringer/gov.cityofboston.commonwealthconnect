package retrofit.mime;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class TypedFile
  implements TypedInput, TypedOutput
{
  private static final int BUFFER_SIZE = 4096;
  private final File file;
  private final String mimeType;
  
  public TypedFile(String paramString, File paramFile)
  {
    if (paramString == null) {
      throw new NullPointerException("mimeType");
    }
    if (paramFile == null) {
      throw new NullPointerException("file");
    }
    mimeType = paramString;
    file = paramFile;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if ((paramObject instanceof TypedFile))
    {
      paramObject = (TypedFile)paramObject;
      return file.equals(file);
    }
    return false;
  }
  
  public File file()
  {
    return file;
  }
  
  public String fileName()
  {
    return file.getName();
  }
  
  public int hashCode()
  {
    return file.hashCode();
  }
  
  public InputStream in()
    throws IOException
  {
    return new FileInputStream(file);
  }
  
  public long length()
  {
    return file.length();
  }
  
  public String mimeType()
  {
    return mimeType;
  }
  
  public void moveTo(TypedFile paramTypedFile)
    throws IOException
  {
    if (!mimeType().equals(paramTypedFile.mimeType())) {
      throw new IOException("Type mismatch.");
    }
    if (!file.renameTo(paramTypedFile.file())) {
      throw new IOException("Rename failed!");
    }
  }
  
  public String toString()
  {
    return file.getAbsolutePath() + " (" + mimeType() + ")";
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte['က'];
    FileInputStream localFileInputStream = new FileInputStream(file);
    try
    {
      for (;;)
      {
        int i = localFileInputStream.read(arrayOfByte);
        if (i == -1) {
          break;
        }
        paramOutputStream.write(arrayOfByte, 0, i);
      }
    }
    finally
    {
      localFileInputStream.close();
    }
  }
}

/* Location:
 * Qualified Name:     retrofit.mime.TypedFile
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */