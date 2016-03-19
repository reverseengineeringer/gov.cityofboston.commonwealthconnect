package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.hash.Funnels;
import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import com.google.common.hash.Hasher;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Iterator;

public abstract class ByteSource
  implements InputSupplier<InputStream>
{
  private static final int BUF_SIZE = 4096;
  private static final byte[] countBuffer = new byte['က'];
  
  public static ByteSource concat(Iterable<? extends ByteSource> paramIterable)
  {
    return new ConcatenatedByteSource(paramIterable);
  }
  
  public static ByteSource concat(Iterator<? extends ByteSource> paramIterator)
  {
    return concat(ImmutableList.copyOf(paramIterator));
  }
  
  public static ByteSource concat(ByteSource... paramVarArgs)
  {
    return concat(ImmutableList.copyOf(paramVarArgs));
  }
  
  private long countByReading(InputStream paramInputStream)
    throws IOException
  {
    long l2;
    for (long l1 = 0L;; l1 += l2)
    {
      l2 = paramInputStream.read(countBuffer);
      if (l2 == -1L) {
        break;
      }
    }
    return l1;
  }
  
  private long countBySkipping(InputStream paramInputStream)
    throws IOException
  {
    long l1 = 0L;
    for (;;)
    {
      long l2 = paramInputStream.skip(Math.min(paramInputStream.available(), Integer.MAX_VALUE));
      if (l2 <= 0L)
      {
        if (paramInputStream.read() == -1) {
          return l1;
        }
        if ((l1 == 0L) && (paramInputStream.available() == 0)) {
          throw new IOException();
        }
        l1 += 1L;
      }
      else
      {
        l1 += l2;
      }
    }
  }
  
  public static ByteSource empty()
  {
    return EmptyByteSource.INSTANCE;
  }
  
  public static ByteSource wrap(byte[] paramArrayOfByte)
  {
    return new ByteArrayByteSource(paramArrayOfByte);
  }
  
  public CharSource asCharSource(Charset paramCharset)
  {
    return new AsCharSource(paramCharset, null);
  }
  
  public boolean contentEquals(ByteSource paramByteSource)
    throws IOException
  {
    Preconditions.checkNotNull(paramByteSource);
    byte[] arrayOfByte1 = new byte['က'];
    byte[] arrayOfByte2 = new byte['က'];
    Closer localCloser = Closer.create();
    try
    {
      InputStream localInputStream = (InputStream)localCloser.register(openStream());
      paramByteSource = (InputStream)localCloser.register(paramByteSource.openStream());
      int i;
      do
      {
        i = ByteStreams.read(localInputStream, arrayOfByte1, 0, 4096);
        if (i == ByteStreams.read(paramByteSource, arrayOfByte2, 0, 4096))
        {
          boolean bool = Arrays.equals(arrayOfByte1, arrayOfByte2);
          if (bool) {}
        }
        else
        {
          return false;
        }
      } while (i == 4096);
      return true;
    }
    catch (Throwable paramByteSource)
    {
      throw localCloser.rethrow(paramByteSource);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  public long copyTo(ByteSink paramByteSink)
    throws IOException
  {
    Preconditions.checkNotNull(paramByteSink);
    Closer localCloser = Closer.create();
    try
    {
      long l = ByteStreams.copy((InputStream)localCloser.register(openStream()), (OutputStream)localCloser.register(paramByteSink.openStream()));
      return l;
    }
    catch (Throwable paramByteSink)
    {
      throw localCloser.rethrow(paramByteSink);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  public long copyTo(OutputStream paramOutputStream)
    throws IOException
  {
    Preconditions.checkNotNull(paramOutputStream);
    Closer localCloser = Closer.create();
    try
    {
      long l = ByteStreams.copy((InputStream)localCloser.register(openStream()), paramOutputStream);
      return l;
    }
    catch (Throwable paramOutputStream)
    {
      throw localCloser.rethrow(paramOutputStream);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  @Deprecated
  public final InputStream getInput()
    throws IOException
  {
    return openStream();
  }
  
  public HashCode hash(HashFunction paramHashFunction)
    throws IOException
  {
    paramHashFunction = paramHashFunction.newHasher();
    copyTo(Funnels.asOutputStream(paramHashFunction));
    return paramHashFunction.hash();
  }
  
  /* Error */
  public boolean isEmpty()
    throws IOException
  {
    // Byte code:
    //   0: invokestatic 122	com/google/common/io/Closer:create	()Lcom/google/common/io/Closer;
    //   3: astore_3
    //   4: aload_3
    //   5: aload_0
    //   6: invokevirtual 126	com/google/common/io/ByteSource:openStream	()Ljava/io/InputStream;
    //   9: invokevirtual 130	com/google/common/io/Closer:register	(Ljava/io/Closeable;)Ljava/io/Closeable;
    //   12: checkcast 64	java/io/InputStream
    //   15: invokevirtual 89	java/io/InputStream:read	()I
    //   18: istore_1
    //   19: iload_1
    //   20: iconst_m1
    //   21: if_icmpne +11 -> 32
    //   24: iconst_1
    //   25: istore_2
    //   26: aload_3
    //   27: invokevirtual 144	com/google/common/io/Closer:close	()V
    //   30: iload_2
    //   31: ireturn
    //   32: iconst_0
    //   33: istore_2
    //   34: goto -8 -> 26
    //   37: astore 4
    //   39: aload_3
    //   40: aload 4
    //   42: invokevirtual 148	com/google/common/io/Closer:rethrow	(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    //   45: athrow
    //   46: astore 4
    //   48: aload_3
    //   49: invokevirtual 144	com/google/common/io/Closer:close	()V
    //   52: aload 4
    //   54: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	55	0	this	ByteSource
    //   18	4	1	i	int
    //   25	9	2	bool	boolean
    //   3	46	3	localCloser	Closer
    //   37	4	4	localThrowable	Throwable
    //   46	7	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   4	19	37	java/lang/Throwable
    //   4	19	46	finally
    //   39	46	46	finally
  }
  
  public InputStream openBufferedStream()
    throws IOException
  {
    InputStream localInputStream = openStream();
    if ((localInputStream instanceof BufferedInputStream)) {
      return (BufferedInputStream)localInputStream;
    }
    return new BufferedInputStream(localInputStream);
  }
  
  public abstract InputStream openStream()
    throws IOException;
  
  @Beta
  public <T> T read(ByteProcessor<T> paramByteProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramByteProcessor);
    Closer localCloser = Closer.create();
    try
    {
      paramByteProcessor = ByteStreams.readBytes((InputStream)localCloser.register(openStream()), paramByteProcessor);
      return paramByteProcessor;
    }
    catch (Throwable paramByteProcessor)
    {
      throw localCloser.rethrow(paramByteProcessor);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  public byte[] read()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      byte[] arrayOfByte = ByteStreams.toByteArray((InputStream)localCloser.register(openStream()));
      return arrayOfByte;
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
    localCloser = Closer.create();
    try
    {
      l = countBySkipping((InputStream)localCloser.register(openStream()));
      localCloser.close();
      return l;
    }
    catch (IOException localIOException)
    {
      localIOException = localIOException;
      localCloser.close();
      localCloser = Closer.create();
    }
    finally
    {
      try
      {
        long l = countByReading((InputStream)localCloser.register(openStream()));
        return l;
      }
      catch (Throwable localThrowable)
      {
        throw localCloser.rethrow(localThrowable);
      }
      finally
      {
        localCloser.close();
      }
      localObject1 = finally;
      localCloser.close();
      throw ((Throwable)localObject1);
    }
  }
  
  public ByteSource slice(long paramLong1, long paramLong2)
  {
    return new SlicedByteSource(paramLong1, paramLong2, null);
  }
  
  private final class AsCharSource
    extends CharSource
  {
    private final Charset charset;
    
    private AsCharSource(Charset paramCharset)
    {
      charset = ((Charset)Preconditions.checkNotNull(paramCharset));
    }
    
    public Reader openStream()
      throws IOException
    {
      return new InputStreamReader(openStream(), charset);
    }
    
    public String toString()
    {
      return ByteSource.this.toString() + ".asCharSource(" + charset + ")";
    }
  }
  
  private static class ByteArrayByteSource
    extends ByteSource
  {
    protected final byte[] bytes;
    
    protected ByteArrayByteSource(byte[] paramArrayOfByte)
    {
      bytes = ((byte[])Preconditions.checkNotNull(paramArrayOfByte));
    }
    
    public long copyTo(OutputStream paramOutputStream)
      throws IOException
    {
      paramOutputStream.write(bytes);
      return bytes.length;
    }
    
    public HashCode hash(HashFunction paramHashFunction)
      throws IOException
    {
      return paramHashFunction.hashBytes(bytes);
    }
    
    public boolean isEmpty()
    {
      return bytes.length == 0;
    }
    
    public InputStream openBufferedStream()
      throws IOException
    {
      return openStream();
    }
    
    public InputStream openStream()
    {
      return new ByteArrayInputStream(bytes);
    }
    
    public <T> T read(ByteProcessor<T> paramByteProcessor)
      throws IOException
    {
      paramByteProcessor.processBytes(bytes, 0, bytes.length);
      return (T)paramByteProcessor.getResult();
    }
    
    public byte[] read()
    {
      return (byte[])bytes.clone();
    }
    
    public long size()
    {
      return bytes.length;
    }
    
    public String toString()
    {
      return "ByteSource.wrap(" + Ascii.truncate(BaseEncoding.base16().encode(bytes), 30, "...") + ")";
    }
  }
  
  private static final class ConcatenatedByteSource
    extends ByteSource
  {
    private final Iterable<? extends ByteSource> sources;
    
    ConcatenatedByteSource(Iterable<? extends ByteSource> paramIterable)
    {
      sources = ((Iterable)Preconditions.checkNotNull(paramIterable));
    }
    
    public boolean isEmpty()
      throws IOException
    {
      Iterator localIterator = sources.iterator();
      while (localIterator.hasNext()) {
        if (!((ByteSource)localIterator.next()).isEmpty()) {
          return false;
        }
      }
      return true;
    }
    
    public InputStream openStream()
      throws IOException
    {
      return new MultiInputStream(sources.iterator());
    }
    
    public long size()
      throws IOException
    {
      long l = 0L;
      Iterator localIterator = sources.iterator();
      while (localIterator.hasNext()) {
        l += ((ByteSource)localIterator.next()).size();
      }
      return l;
    }
    
    public String toString()
    {
      return "ByteSource.concat(" + sources + ")";
    }
  }
  
  private static final class EmptyByteSource
    extends ByteSource.ByteArrayByteSource
  {
    private static final EmptyByteSource INSTANCE = new EmptyByteSource();
    
    private EmptyByteSource()
    {
      super();
    }
    
    public CharSource asCharSource(Charset paramCharset)
    {
      Preconditions.checkNotNull(paramCharset);
      return CharSource.empty();
    }
    
    public byte[] read()
    {
      return bytes;
    }
    
    public String toString()
    {
      return "ByteSource.empty()";
    }
  }
  
  private final class SlicedByteSource
    extends ByteSource
  {
    private final long length;
    private final long offset;
    
    private SlicedByteSource(long paramLong1, long paramLong2)
    {
      if (paramLong1 >= 0L)
      {
        bool = true;
        Preconditions.checkArgument(bool, "offset (%s) may not be negative", new Object[] { Long.valueOf(paramLong1) });
        if (paramLong2 < 0L) {
          break label83;
        }
      }
      label83:
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "length (%s) may not be negative", new Object[] { Long.valueOf(paramLong2) });
        offset = paramLong1;
        length = paramLong2;
        return;
        bool = false;
        break;
      }
    }
    
    private InputStream sliceStream(InputStream paramInputStream)
      throws IOException
    {
      if (offset > 0L) {}
      try
      {
        ByteStreams.skipFully(paramInputStream, offset);
        return ByteStreams.limit(paramInputStream, length);
      }
      catch (Throwable localThrowable)
      {
        Closer localCloser = Closer.create();
        localCloser.register(paramInputStream);
        try
        {
          throw localCloser.rethrow(localThrowable);
        }
        finally
        {
          localCloser.close();
        }
      }
    }
    
    public boolean isEmpty()
      throws IOException
    {
      return (length == 0L) || (super.isEmpty());
    }
    
    public InputStream openBufferedStream()
      throws IOException
    {
      return sliceStream(ByteSource.this.openBufferedStream());
    }
    
    public InputStream openStream()
      throws IOException
    {
      return sliceStream(ByteSource.this.openStream());
    }
    
    public ByteSource slice(long paramLong1, long paramLong2)
    {
      if (paramLong1 >= 0L)
      {
        bool = true;
        Preconditions.checkArgument(bool, "offset (%s) may not be negative", new Object[] { Long.valueOf(paramLong1) });
        if (paramLong2 < 0L) {
          break label88;
        }
      }
      label88:
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "length (%s) may not be negative", new Object[] { Long.valueOf(paramLong2) });
        long l = length;
        return ByteSource.this.slice(offset + paramLong1, Math.min(paramLong2, l - paramLong1));
        bool = false;
        break;
      }
    }
    
    public String toString()
    {
      return ByteSource.this.toString() + ".slice(" + offset + ", " + length + ")";
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */