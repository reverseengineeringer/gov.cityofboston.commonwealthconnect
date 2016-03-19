package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;

final class Files$FileByteSource
  extends ByteSource
{
  private final File file;
  
  private Files$FileByteSource(File paramFile)
  {
    file = ((File)Preconditions.checkNotNull(paramFile));
  }
  
  public FileInputStream openStream()
    throws IOException
  {
    return new FileInputStream(file);
  }
  
  public byte[] read()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      Object localObject1 = (FileInputStream)localCloser.register(openStream());
      localObject1 = Files.readFile((InputStream)localObject1, ((FileInputStream)localObject1).getChannel().size());
      return (byte[])localObject1;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  public long size()
    throws IOException
  {
    if (!file.isFile()) {
      throw new FileNotFoundException(file.toString());
    }
    return file.length();
  }
  
  public String toString()
  {
    return "Files.asByteSource(" + file + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.Files.FileByteSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */