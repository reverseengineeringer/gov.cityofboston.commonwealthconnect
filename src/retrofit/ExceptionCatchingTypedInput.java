package retrofit;

import java.io.IOException;
import java.io.InputStream;
import retrofit.mime.TypedInput;

class ExceptionCatchingTypedInput
  implements TypedInput
{
  private final TypedInput delegate;
  private final ExceptionCatchingInputStream delegateStream;
  
  ExceptionCatchingTypedInput(TypedInput paramTypedInput)
    throws IOException
  {
    delegate = paramTypedInput;
    delegateStream = new ExceptionCatchingInputStream(paramTypedInput.in());
  }
  
  IOException getThrownException()
  {
    return delegateStream.thrownException;
  }
  
  public InputStream in()
    throws IOException
  {
    return delegateStream;
  }
  
  public long length()
  {
    return delegate.length();
  }
  
  public String mimeType()
  {
    return delegate.mimeType();
  }
  
  boolean threwException()
  {
    return delegateStream.thrownException != null;
  }
  
  private static class ExceptionCatchingInputStream
    extends InputStream
  {
    private final InputStream delegate;
    private IOException thrownException;
    
    ExceptionCatchingInputStream(InputStream paramInputStream)
    {
      delegate = paramInputStream;
    }
    
    public int available()
      throws IOException
    {
      try
      {
        int i = delegate.available();
        return i;
      }
      catch (IOException localIOException)
      {
        thrownException = localIOException;
        throw localIOException;
      }
    }
    
    public void close()
      throws IOException
    {
      try
      {
        delegate.close();
        return;
      }
      catch (IOException localIOException)
      {
        thrownException = localIOException;
        throw localIOException;
      }
    }
    
    public void mark(int paramInt)
    {
      try
      {
        delegate.mark(paramInt);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public boolean markSupported()
    {
      return delegate.markSupported();
    }
    
    public int read()
      throws IOException
    {
      try
      {
        int i = delegate.read();
        return i;
      }
      catch (IOException localIOException)
      {
        thrownException = localIOException;
        throw localIOException;
      }
    }
    
    public int read(byte[] paramArrayOfByte)
      throws IOException
    {
      try
      {
        int i = delegate.read(paramArrayOfByte);
        return i;
      }
      catch (IOException paramArrayOfByte)
      {
        thrownException = paramArrayOfByte;
        throw paramArrayOfByte;
      }
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      try
      {
        paramInt1 = delegate.read(paramArrayOfByte, paramInt1, paramInt2);
        return paramInt1;
      }
      catch (IOException paramArrayOfByte)
      {
        thrownException = paramArrayOfByte;
        throw paramArrayOfByte;
      }
    }
    
    public void reset()
      throws IOException
    {
      try
      {
        delegate.reset();
        return;
      }
      catch (IOException localIOException)
      {
        thrownException = localIOException;
        throw localIOException;
      }
      finally {}
    }
    
    public long skip(long paramLong)
      throws IOException
    {
      try
      {
        paramLong = delegate.skip(paramLong);
        return paramLong;
      }
      catch (IOException localIOException)
      {
        thrownException = localIOException;
        throw localIOException;
      }
    }
  }
}

/* Location:
 * Qualified Name:     retrofit.ExceptionCatchingTypedInput
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */