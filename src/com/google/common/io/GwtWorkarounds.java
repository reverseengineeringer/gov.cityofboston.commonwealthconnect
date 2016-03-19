package com.google.common.io;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;

@GwtCompatible(emulated=true)
final class GwtWorkarounds
{
  @GwtIncompatible("Reader")
  static CharInput asCharInput(Reader paramReader)
  {
    Preconditions.checkNotNull(paramReader);
    new CharInput()
    {
      public void close()
        throws IOException
      {
        val$reader.close();
      }
      
      public int read()
        throws IOException
      {
        return val$reader.read();
      }
    };
  }
  
  static CharInput asCharInput(CharSequence paramCharSequence)
  {
    Preconditions.checkNotNull(paramCharSequence);
    new CharInput()
    {
      int index = 0;
      
      public void close()
      {
        index = val$chars.length();
      }
      
      public int read()
      {
        if (index < val$chars.length())
        {
          CharSequence localCharSequence = val$chars;
          int i = index;
          index = (i + 1);
          return localCharSequence.charAt(i);
        }
        return -1;
      }
    };
  }
  
  @GwtIncompatible("Writer")
  static CharOutput asCharOutput(Writer paramWriter)
  {
    Preconditions.checkNotNull(paramWriter);
    new CharOutput()
    {
      public void close()
        throws IOException
      {
        val$writer.close();
      }
      
      public void flush()
        throws IOException
      {
        val$writer.flush();
      }
      
      public void write(char paramAnonymousChar)
        throws IOException
      {
        val$writer.append(paramAnonymousChar);
      }
    };
  }
  
  @GwtIncompatible("InputStream")
  static InputStream asInputStream(ByteInput paramByteInput)
  {
    Preconditions.checkNotNull(paramByteInput);
    new InputStream()
    {
      public void close()
        throws IOException
      {
        val$input.close();
      }
      
      public int read()
        throws IOException
      {
        return val$input.read();
      }
      
      public int read(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
        throws IOException
      {
        Preconditions.checkNotNull(paramAnonymousArrayOfByte);
        Preconditions.checkPositionIndexes(paramAnonymousInt1, paramAnonymousInt1 + paramAnonymousInt2, paramAnonymousArrayOfByte.length);
        int j;
        if (paramAnonymousInt2 == 0)
        {
          j = 0;
          return j;
        }
        int i = read();
        if (i == -1) {
          return -1;
        }
        paramAnonymousArrayOfByte[paramAnonymousInt1] = ((byte)i);
        i = 1;
        for (;;)
        {
          if (i >= paramAnonymousInt2) {
            return paramAnonymousInt2;
          }
          int k = read();
          j = i;
          if (k == -1) {
            break;
          }
          paramAnonymousArrayOfByte[(paramAnonymousInt1 + i)] = ((byte)k);
          i += 1;
        }
        return paramAnonymousInt2;
      }
    };
  }
  
  @GwtIncompatible("OutputStream")
  static OutputStream asOutputStream(ByteOutput paramByteOutput)
  {
    Preconditions.checkNotNull(paramByteOutput);
    new OutputStream()
    {
      public void close()
        throws IOException
      {
        val$output.close();
      }
      
      public void flush()
        throws IOException
      {
        val$output.flush();
      }
      
      public void write(int paramAnonymousInt)
        throws IOException
      {
        val$output.write((byte)paramAnonymousInt);
      }
    };
  }
  
  static CharOutput stringBuilderOutput(int paramInt)
  {
    new CharOutput()
    {
      public void close() {}
      
      public void flush() {}
      
      public String toString()
      {
        return val$builder.toString();
      }
      
      public void write(char paramAnonymousChar)
      {
        val$builder.append(paramAnonymousChar);
      }
    };
  }
  
  static abstract interface ByteInput
  {
    public abstract void close()
      throws IOException;
    
    public abstract int read()
      throws IOException;
  }
  
  static abstract interface ByteOutput
  {
    public abstract void close()
      throws IOException;
    
    public abstract void flush()
      throws IOException;
    
    public abstract void write(byte paramByte)
      throws IOException;
  }
  
  static abstract interface CharInput
  {
    public abstract void close()
      throws IOException;
    
    public abstract int read()
      throws IOException;
  }
  
  static abstract interface CharOutput
  {
    public abstract void close()
      throws IOException;
    
    public abstract void flush()
      throws IOException;
    
    public abstract void write(char paramChar)
      throws IOException;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */