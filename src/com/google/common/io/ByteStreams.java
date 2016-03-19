package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.Iterables;
import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.nio.channels.WritableByteChannel;
import java.util.Arrays;

@Beta
public final class ByteStreams
{
  private static final int BUF_SIZE = 4096;
  private static final OutputStream NULL_OUTPUT_STREAM = new OutputStream()
  {
    public String toString()
    {
      return "ByteStreams.nullOutputStream()";
    }
    
    public void write(int paramAnonymousInt) {}
    
    public void write(byte[] paramAnonymousArrayOfByte)
    {
      Preconditions.checkNotNull(paramAnonymousArrayOfByte);
    }
    
    public void write(byte[] paramAnonymousArrayOfByte, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      Preconditions.checkNotNull(paramAnonymousArrayOfByte);
    }
  };
  
  @Deprecated
  public static ByteSink asByteSink(OutputSupplier<? extends OutputStream> paramOutputSupplier)
  {
    Preconditions.checkNotNull(paramOutputSupplier);
    new ByteSink()
    {
      public OutputStream openStream()
        throws IOException
      {
        return (OutputStream)val$supplier.getOutput();
      }
      
      public String toString()
      {
        return "ByteStreams.asByteSink(" + val$supplier + ")";
      }
    };
  }
  
  @Deprecated
  public static ByteSource asByteSource(InputSupplier<? extends InputStream> paramInputSupplier)
  {
    Preconditions.checkNotNull(paramInputSupplier);
    new ByteSource()
    {
      public InputStream openStream()
        throws IOException
      {
        return (InputStream)val$supplier.getInput();
      }
      
      public String toString()
      {
        return "ByteStreams.asByteSource(" + val$supplier + ")";
      }
    };
  }
  
  static <S extends InputStream> InputSupplier<S> asInputSupplier(ByteSource paramByteSource)
  {
    return (InputSupplier)Preconditions.checkNotNull(paramByteSource);
  }
  
  static <S extends OutputStream> OutputSupplier<S> asOutputSupplier(ByteSink paramByteSink)
  {
    return (OutputSupplier)Preconditions.checkNotNull(paramByteSink);
  }
  
  @Deprecated
  public static long copy(InputSupplier<? extends InputStream> paramInputSupplier, OutputSupplier<? extends OutputStream> paramOutputSupplier)
    throws IOException
  {
    return asByteSource(paramInputSupplier).copyTo(asByteSink(paramOutputSupplier));
  }
  
  @Deprecated
  public static long copy(InputSupplier<? extends InputStream> paramInputSupplier, OutputStream paramOutputStream)
    throws IOException
  {
    return asByteSource(paramInputSupplier).copyTo(paramOutputStream);
  }
  
  @Deprecated
  public static long copy(InputStream paramInputStream, OutputSupplier<? extends OutputStream> paramOutputSupplier)
    throws IOException
  {
    return asByteSink(paramOutputSupplier).writeFrom(paramInputStream);
  }
  
  public static long copy(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Preconditions.checkNotNull(paramOutputStream);
    byte[] arrayOfByte = new byte['က'];
    int i;
    for (long l = 0L;; l += i)
    {
      i = paramInputStream.read(arrayOfByte);
      if (i == -1) {
        return l;
      }
      paramOutputStream.write(arrayOfByte, 0, i);
    }
  }
  
  public static long copy(ReadableByteChannel paramReadableByteChannel, WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    Preconditions.checkNotNull(paramReadableByteChannel);
    Preconditions.checkNotNull(paramWritableByteChannel);
    ByteBuffer localByteBuffer = ByteBuffer.allocate(4096);
    long l = 0L;
    while (paramReadableByteChannel.read(localByteBuffer) != -1)
    {
      localByteBuffer.flip();
      while (localByteBuffer.hasRemaining()) {
        l += paramWritableByteChannel.write(localByteBuffer);
      }
      localByteBuffer.clear();
    }
    return l;
  }
  
  @Deprecated
  public static boolean equal(InputSupplier<? extends InputStream> paramInputSupplier1, InputSupplier<? extends InputStream> paramInputSupplier2)
    throws IOException
  {
    return asByteSource(paramInputSupplier1).contentEquals(asByteSource(paramInputSupplier2));
  }
  
  @Deprecated
  public static HashCode hash(InputSupplier<? extends InputStream> paramInputSupplier, HashFunction paramHashFunction)
    throws IOException
  {
    return asByteSource(paramInputSupplier).hash(paramHashFunction);
  }
  
  @Deprecated
  public static InputSupplier<InputStream> join(Iterable<? extends InputSupplier<? extends InputStream>> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable);
    asInputSupplier(ByteSource.concat(Iterables.transform(paramIterable, new Function()
    {
      public ByteSource apply(InputSupplier<? extends InputStream> paramAnonymousInputSupplier)
      {
        return ByteStreams.asByteSource(paramAnonymousInputSupplier);
      }
    })));
  }
  
  @Deprecated
  public static InputSupplier<InputStream> join(InputSupplier<? extends InputStream>... paramVarArgs)
  {
    return join(Arrays.asList(paramVarArgs));
  }
  
  @Deprecated
  public static long length(InputSupplier<? extends InputStream> paramInputSupplier)
    throws IOException
  {
    return asByteSource(paramInputSupplier).size();
  }
  
  public static InputStream limit(InputStream paramInputStream, long paramLong)
  {
    return new LimitedInputStream(paramInputStream, paramLong);
  }
  
  public static ByteArrayDataInput newDataInput(ByteArrayInputStream paramByteArrayInputStream)
  {
    return new ByteArrayDataInputStream((ByteArrayInputStream)Preconditions.checkNotNull(paramByteArrayInputStream));
  }
  
  public static ByteArrayDataInput newDataInput(byte[] paramArrayOfByte)
  {
    return newDataInput(new ByteArrayInputStream(paramArrayOfByte));
  }
  
  public static ByteArrayDataInput newDataInput(byte[] paramArrayOfByte, int paramInt)
  {
    Preconditions.checkPositionIndex(paramInt, paramArrayOfByte.length);
    return newDataInput(new ByteArrayInputStream(paramArrayOfByte, paramInt, paramArrayOfByte.length - paramInt));
  }
  
  public static ByteArrayDataOutput newDataOutput()
  {
    return newDataOutput(new ByteArrayOutputStream());
  }
  
  public static ByteArrayDataOutput newDataOutput(int paramInt)
  {
    if (paramInt >= 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Invalid size: %s", new Object[] { Integer.valueOf(paramInt) });
      return newDataOutput(new ByteArrayOutputStream(paramInt));
    }
  }
  
  public static ByteArrayDataOutput newDataOutput(ByteArrayOutputStream paramByteArrayOutputStream)
  {
    return new ByteArrayDataOutputStream((ByteArrayOutputStream)Preconditions.checkNotNull(paramByteArrayOutputStream));
  }
  
  @Deprecated
  public static InputSupplier<ByteArrayInputStream> newInputStreamSupplier(byte[] paramArrayOfByte)
  {
    return asInputSupplier(ByteSource.wrap(paramArrayOfByte));
  }
  
  @Deprecated
  public static InputSupplier<ByteArrayInputStream> newInputStreamSupplier(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return asInputSupplier(ByteSource.wrap(paramArrayOfByte).slice(paramInt1, paramInt2));
  }
  
  public static OutputStream nullOutputStream()
  {
    return NULL_OUTPUT_STREAM;
  }
  
  public static int read(InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Preconditions.checkNotNull(paramArrayOfByte);
    if (paramInt2 < 0) {
      throw new IndexOutOfBoundsException("len is negative");
    }
    int i = 0;
    for (;;)
    {
      int j;
      if (i < paramInt2)
      {
        j = paramInputStream.read(paramArrayOfByte, paramInt1 + i, paramInt2 - i);
        if (j != -1) {}
      }
      else
      {
        return i;
      }
      i += j;
    }
  }
  
  @Deprecated
  public static <T> T readBytes(InputSupplier<? extends InputStream> paramInputSupplier, ByteProcessor<T> paramByteProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputSupplier);
    Preconditions.checkNotNull(paramByteProcessor);
    Closer localCloser = Closer.create();
    try
    {
      paramInputSupplier = readBytes((InputStream)localCloser.register((Closeable)paramInputSupplier.getInput()), paramByteProcessor);
      return paramInputSupplier;
    }
    catch (Throwable paramInputSupplier)
    {
      throw localCloser.rethrow(paramInputSupplier);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  public static <T> T readBytes(InputStream paramInputStream, ByteProcessor<T> paramByteProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Preconditions.checkNotNull(paramByteProcessor);
    byte[] arrayOfByte = new byte['က'];
    int i;
    do
    {
      i = paramInputStream.read(arrayOfByte);
    } while ((i != -1) && (paramByteProcessor.processBytes(arrayOfByte, 0, i)));
    return (T)paramByteProcessor.getResult();
  }
  
  public static void readFully(InputStream paramInputStream, byte[] paramArrayOfByte)
    throws IOException
  {
    readFully(paramInputStream, paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public static void readFully(InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    paramInt1 = read(paramInputStream, paramArrayOfByte, paramInt1, paramInt2);
    if (paramInt1 != paramInt2) {
      throw new EOFException("reached end of stream after reading " + paramInt1 + " bytes; " + paramInt2 + " bytes expected");
    }
  }
  
  public static void skipFully(InputStream paramInputStream, long paramLong)
    throws IOException
  {
    long l1 = paramLong;
    while (l1 > 0L)
    {
      long l2 = paramInputStream.skip(l1);
      if (l2 == 0L)
      {
        if (paramInputStream.read() == -1) {
          throw new EOFException("reached end of stream after skipping " + (paramLong - l1) + " bytes; " + paramLong + " bytes expected");
        }
        l1 -= 1L;
      }
      else
      {
        l1 -= l2;
      }
    }
  }
  
  @Deprecated
  public static InputSupplier<InputStream> slice(InputSupplier<? extends InputStream> paramInputSupplier, long paramLong1, long paramLong2)
  {
    return asInputSupplier(asByteSource(paramInputSupplier).slice(paramLong1, paramLong2));
  }
  
  @Deprecated
  public static byte[] toByteArray(InputSupplier<? extends InputStream> paramInputSupplier)
    throws IOException
  {
    return asByteSource(paramInputSupplier).read();
  }
  
  public static byte[] toByteArray(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    copy(paramInputStream, localByteArrayOutputStream);
    return localByteArrayOutputStream.toByteArray();
  }
  
  static byte[] toByteArray(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInt];
    int i = paramInt;
    int k;
    if (i > 0)
    {
      int j = paramInt - i;
      k = paramInputStream.read(arrayOfByte, j, i);
      if (k == -1) {
        localObject = Arrays.copyOf(arrayOfByte, j);
      }
    }
    do
    {
      return (byte[])localObject;
      i -= k;
      break;
      paramInt = paramInputStream.read();
      localObject = arrayOfByte;
    } while (paramInt == -1);
    Object localObject = new FastByteArrayOutputStream(null);
    ((FastByteArrayOutputStream)localObject).write(paramInt);
    copy(paramInputStream, (OutputStream)localObject);
    paramInputStream = new byte[arrayOfByte.length + ((FastByteArrayOutputStream)localObject).size()];
    System.arraycopy(arrayOfByte, 0, paramInputStream, 0, arrayOfByte.length);
    ((FastByteArrayOutputStream)localObject).writeTo(paramInputStream, arrayOfByte.length);
    return paramInputStream;
  }
  
  @Deprecated
  public static void write(byte[] paramArrayOfByte, OutputSupplier<? extends OutputStream> paramOutputSupplier)
    throws IOException
  {
    asByteSink(paramOutputSupplier).write(paramArrayOfByte);
  }
  
  private static class ByteArrayDataInputStream
    implements ByteArrayDataInput
  {
    final DataInput input;
    
    ByteArrayDataInputStream(ByteArrayInputStream paramByteArrayInputStream)
    {
      input = new DataInputStream(paramByteArrayInputStream);
    }
    
    public boolean readBoolean()
    {
      try
      {
        boolean bool = input.readBoolean();
        return bool;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public byte readByte()
    {
      try
      {
        byte b = input.readByte();
        return b;
      }
      catch (EOFException localEOFException)
      {
        throw new IllegalStateException(localEOFException);
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public char readChar()
    {
      try
      {
        char c = input.readChar();
        return c;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public double readDouble()
    {
      try
      {
        double d = input.readDouble();
        return d;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public float readFloat()
    {
      try
      {
        float f = input.readFloat();
        return f;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public void readFully(byte[] paramArrayOfByte)
    {
      try
      {
        input.readFully(paramArrayOfByte);
        return;
      }
      catch (IOException paramArrayOfByte)
      {
        throw new IllegalStateException(paramArrayOfByte);
      }
    }
    
    public void readFully(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      try
      {
        input.readFully(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
      catch (IOException paramArrayOfByte)
      {
        throw new IllegalStateException(paramArrayOfByte);
      }
    }
    
    public int readInt()
    {
      try
      {
        int i = input.readInt();
        return i;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public String readLine()
    {
      try
      {
        String str = input.readLine();
        return str;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public long readLong()
    {
      try
      {
        long l = input.readLong();
        return l;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public short readShort()
    {
      try
      {
        short s = input.readShort();
        return s;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public String readUTF()
    {
      try
      {
        String str = input.readUTF();
        return str;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public int readUnsignedByte()
    {
      try
      {
        int i = input.readUnsignedByte();
        return i;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public int readUnsignedShort()
    {
      try
      {
        int i = input.readUnsignedShort();
        return i;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
    
    public int skipBytes(int paramInt)
    {
      try
      {
        paramInt = input.skipBytes(paramInt);
        return paramInt;
      }
      catch (IOException localIOException)
      {
        throw new IllegalStateException(localIOException);
      }
    }
  }
  
  private static class ByteArrayDataOutputStream
    implements ByteArrayDataOutput
  {
    final ByteArrayOutputStream byteArrayOutputSteam;
    final DataOutput output;
    
    ByteArrayDataOutputStream(ByteArrayOutputStream paramByteArrayOutputStream)
    {
      byteArrayOutputSteam = paramByteArrayOutputStream;
      output = new DataOutputStream(paramByteArrayOutputStream);
    }
    
    public byte[] toByteArray()
    {
      return byteArrayOutputSteam.toByteArray();
    }
    
    public void write(int paramInt)
    {
      try
      {
        output.write(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void write(byte[] paramArrayOfByte)
    {
      try
      {
        output.write(paramArrayOfByte);
        return;
      }
      catch (IOException paramArrayOfByte)
      {
        throw new AssertionError(paramArrayOfByte);
      }
    }
    
    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      try
      {
        output.write(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
      catch (IOException paramArrayOfByte)
      {
        throw new AssertionError(paramArrayOfByte);
      }
    }
    
    public void writeBoolean(boolean paramBoolean)
    {
      try
      {
        output.writeBoolean(paramBoolean);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeByte(int paramInt)
    {
      try
      {
        output.writeByte(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeBytes(String paramString)
    {
      try
      {
        output.writeBytes(paramString);
        return;
      }
      catch (IOException paramString)
      {
        throw new AssertionError(paramString);
      }
    }
    
    public void writeChar(int paramInt)
    {
      try
      {
        output.writeChar(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeChars(String paramString)
    {
      try
      {
        output.writeChars(paramString);
        return;
      }
      catch (IOException paramString)
      {
        throw new AssertionError(paramString);
      }
    }
    
    public void writeDouble(double paramDouble)
    {
      try
      {
        output.writeDouble(paramDouble);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeFloat(float paramFloat)
    {
      try
      {
        output.writeFloat(paramFloat);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeInt(int paramInt)
    {
      try
      {
        output.writeInt(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeLong(long paramLong)
    {
      try
      {
        output.writeLong(paramLong);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeShort(int paramInt)
    {
      try
      {
        output.writeShort(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        throw new AssertionError(localIOException);
      }
    }
    
    public void writeUTF(String paramString)
    {
      try
      {
        output.writeUTF(paramString);
        return;
      }
      catch (IOException paramString)
      {
        throw new AssertionError(paramString);
      }
    }
  }
  
  private static final class FastByteArrayOutputStream
    extends ByteArrayOutputStream
  {
    void writeTo(byte[] paramArrayOfByte, int paramInt)
    {
      System.arraycopy(buf, 0, paramArrayOfByte, paramInt, count);
    }
  }
  
  private static final class LimitedInputStream
    extends FilterInputStream
  {
    private long left;
    private long mark = -1L;
    
    LimitedInputStream(InputStream paramInputStream, long paramLong)
    {
      super();
      Preconditions.checkNotNull(paramInputStream);
      if (paramLong >= 0L) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "limit must be non-negative");
        left = paramLong;
        return;
      }
    }
    
    public int available()
      throws IOException
    {
      return (int)Math.min(in.available(), left);
    }
    
    public void mark(int paramInt)
    {
      try
      {
        in.mark(paramInt);
        mark = left;
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public int read()
      throws IOException
    {
      int i;
      if (left == 0L) {
        i = -1;
      }
      int j;
      do
      {
        return i;
        j = in.read();
        i = j;
      } while (j == -1);
      left -= 1L;
      return j;
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      if (left == 0L) {
        paramInt1 = -1;
      }
      do
      {
        return paramInt1;
        paramInt2 = (int)Math.min(paramInt2, left);
        paramInt2 = in.read(paramArrayOfByte, paramInt1, paramInt2);
        paramInt1 = paramInt2;
      } while (paramInt2 == -1);
      left -= paramInt2;
      return paramInt2;
    }
    
    public void reset()
      throws IOException
    {
      try
      {
        if (!in.markSupported()) {
          throw new IOException("Mark not supported");
        }
      }
      finally {}
      if (mark == -1L) {
        throw new IOException("Mark not set");
      }
      in.reset();
      left = mark;
    }
    
    public long skip(long paramLong)
      throws IOException
    {
      paramLong = Math.min(paramLong, left);
      paramLong = in.skip(paramLong);
      left -= paramLong;
      return paramLong;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */