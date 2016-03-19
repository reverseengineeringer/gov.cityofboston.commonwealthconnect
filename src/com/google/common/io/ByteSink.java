package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

public abstract class ByteSink
  implements OutputSupplier<OutputStream>
{
  public CharSink asCharSink(Charset paramCharset)
  {
    return new AsCharSink(paramCharset, null);
  }
  
  @Deprecated
  public final OutputStream getOutput()
    throws IOException
  {
    return openStream();
  }
  
  public OutputStream openBufferedStream()
    throws IOException
  {
    OutputStream localOutputStream = openStream();
    if ((localOutputStream instanceof BufferedOutputStream)) {
      return (BufferedOutputStream)localOutputStream;
    }
    return new BufferedOutputStream(localOutputStream);
  }
  
  public abstract OutputStream openStream()
    throws IOException;
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    Preconditions.checkNotNull(paramArrayOfByte);
    Closer localCloser = Closer.create();
    try
    {
      OutputStream localOutputStream = (OutputStream)localCloser.register(openStream());
      localOutputStream.write(paramArrayOfByte);
      localOutputStream.flush();
      return;
    }
    catch (Throwable paramArrayOfByte)
    {
      throw localCloser.rethrow(paramArrayOfByte);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  public long writeFrom(InputStream paramInputStream)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Closer localCloser = Closer.create();
    try
    {
      OutputStream localOutputStream = (OutputStream)localCloser.register(openStream());
      long l = ByteStreams.copy(paramInputStream, localOutputStream);
      localOutputStream.flush();
      return l;
    }
    catch (Throwable paramInputStream)
    {
      throw localCloser.rethrow(paramInputStream);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  private final class AsCharSink
    extends CharSink
  {
    private final Charset charset;
    
    private AsCharSink(Charset paramCharset)
    {
      charset = ((Charset)Preconditions.checkNotNull(paramCharset));
    }
    
    public Writer openStream()
      throws IOException
    {
      return new OutputStreamWriter(openStream(), charset);
    }
    
    public String toString()
    {
      return ByteSink.this.toString() + ".asCharSink(" + charset + ")";
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSink
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */