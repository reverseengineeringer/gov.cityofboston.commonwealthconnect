package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.Iterables;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.Writer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Beta
public final class CharStreams
{
  private static final int BUF_SIZE = 2048;
  
  @Deprecated
  public static CharSink asCharSink(OutputSupplier<? extends Appendable> paramOutputSupplier)
  {
    Preconditions.checkNotNull(paramOutputSupplier);
    new CharSink()
    {
      public Writer openStream()
        throws IOException
      {
        return CharStreams.asWriter((Appendable)val$supplier.getOutput());
      }
      
      public String toString()
      {
        return "CharStreams.asCharSink(" + val$supplier + ")";
      }
    };
  }
  
  @Deprecated
  public static CharSource asCharSource(InputSupplier<? extends Readable> paramInputSupplier)
  {
    Preconditions.checkNotNull(paramInputSupplier);
    new CharSource()
    {
      public Reader openStream()
        throws IOException
      {
        return CharStreams.asReader((Readable)val$supplier.getInput());
      }
      
      public String toString()
      {
        return "CharStreams.asCharSource(" + val$supplier + ")";
      }
    };
  }
  
  static <R extends Reader> InputSupplier<R> asInputSupplier(CharSource paramCharSource)
  {
    return (InputSupplier)Preconditions.checkNotNull(paramCharSource);
  }
  
  static <W extends Writer> OutputSupplier<W> asOutputSupplier(CharSink paramCharSink)
  {
    return (OutputSupplier)Preconditions.checkNotNull(paramCharSink);
  }
  
  static Reader asReader(Readable paramReadable)
  {
    Preconditions.checkNotNull(paramReadable);
    if ((paramReadable instanceof Reader)) {
      return (Reader)paramReadable;
    }
    new Reader()
    {
      public void close()
        throws IOException
      {
        if ((val$readable instanceof Closeable)) {
          ((Closeable)val$readable).close();
        }
      }
      
      public int read(CharBuffer paramAnonymousCharBuffer)
        throws IOException
      {
        return val$readable.read(paramAnonymousCharBuffer);
      }
      
      public int read(char[] paramAnonymousArrayOfChar, int paramAnonymousInt1, int paramAnonymousInt2)
        throws IOException
      {
        return read(CharBuffer.wrap(paramAnonymousArrayOfChar, paramAnonymousInt1, paramAnonymousInt2));
      }
    };
  }
  
  public static Writer asWriter(Appendable paramAppendable)
  {
    if ((paramAppendable instanceof Writer)) {
      return (Writer)paramAppendable;
    }
    return new AppendableWriter(paramAppendable);
  }
  
  @Deprecated
  public static <R extends Readable,  extends Closeable, W extends Appendable,  extends Closeable> long copy(InputSupplier<R> paramInputSupplier, OutputSupplier<W> paramOutputSupplier)
    throws IOException
  {
    return asCharSource(paramInputSupplier).copyTo(asCharSink(paramOutputSupplier));
  }
  
  @Deprecated
  public static <R extends Readable,  extends Closeable> long copy(InputSupplier<R> paramInputSupplier, Appendable paramAppendable)
    throws IOException
  {
    return asCharSource(paramInputSupplier).copyTo(paramAppendable);
  }
  
  public static long copy(Readable paramReadable, Appendable paramAppendable)
    throws IOException
  {
    Preconditions.checkNotNull(paramReadable);
    Preconditions.checkNotNull(paramAppendable);
    CharBuffer localCharBuffer = CharBuffer.allocate(2048);
    long l = 0L;
    while (paramReadable.read(localCharBuffer) != -1)
    {
      localCharBuffer.flip();
      paramAppendable.append(localCharBuffer);
      l += localCharBuffer.remaining();
      localCharBuffer.clear();
    }
    return l;
  }
  
  @Deprecated
  public static InputSupplier<Reader> join(Iterable<? extends InputSupplier<? extends Reader>> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable);
    asInputSupplier(CharSource.concat(Iterables.transform(paramIterable, new Function()
    {
      public CharSource apply(InputSupplier<? extends Reader> paramAnonymousInputSupplier)
      {
        return CharStreams.asCharSource(paramAnonymousInputSupplier);
      }
    })));
  }
  
  @Deprecated
  public static InputSupplier<Reader> join(InputSupplier<? extends Reader>... paramVarArgs)
  {
    return join(Arrays.asList(paramVarArgs));
  }
  
  @Deprecated
  public static InputSupplier<InputStreamReader> newReaderSupplier(InputSupplier<? extends InputStream> paramInputSupplier, Charset paramCharset)
  {
    return asInputSupplier(ByteStreams.asByteSource(paramInputSupplier).asCharSource(paramCharset));
  }
  
  @Deprecated
  public static InputSupplier<StringReader> newReaderSupplier(String paramString)
  {
    return asInputSupplier(CharSource.wrap(paramString));
  }
  
  @Deprecated
  public static OutputSupplier<OutputStreamWriter> newWriterSupplier(OutputSupplier<? extends OutputStream> paramOutputSupplier, Charset paramCharset)
  {
    return asOutputSupplier(ByteStreams.asByteSink(paramOutputSupplier).asCharSink(paramCharset));
  }
  
  public static Writer nullWriter()
  {
    return NullWriter.INSTANCE;
  }
  
  @Deprecated
  public static <R extends Readable,  extends Closeable> String readFirstLine(InputSupplier<R> paramInputSupplier)
    throws IOException
  {
    return asCharSource(paramInputSupplier).readFirstLine();
  }
  
  @Deprecated
  public static <R extends Readable,  extends Closeable, T> T readLines(InputSupplier<R> paramInputSupplier, LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputSupplier);
    Preconditions.checkNotNull(paramLineProcessor);
    Closer localCloser = Closer.create();
    try
    {
      paramInputSupplier = readLines((Readable)localCloser.register((Closeable)paramInputSupplier.getInput()), paramLineProcessor);
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
  
  public static <T> T readLines(Readable paramReadable, LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramReadable);
    Preconditions.checkNotNull(paramLineProcessor);
    paramReadable = new LineReader(paramReadable);
    String str;
    do
    {
      str = paramReadable.readLine();
    } while ((str != null) && (paramLineProcessor.processLine(str)));
    return (T)paramLineProcessor.getResult();
  }
  
  @Deprecated
  public static <R extends Readable,  extends Closeable> List<String> readLines(InputSupplier<R> paramInputSupplier)
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      paramInputSupplier = readLines((Readable)localCloser.register((Closeable)paramInputSupplier.getInput()));
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
  
  public static List<String> readLines(Readable paramReadable)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    paramReadable = new LineReader(paramReadable);
    for (;;)
    {
      String str = paramReadable.readLine();
      if (str == null) {
        break;
      }
      localArrayList.add(str);
    }
    return localArrayList;
  }
  
  public static void skipFully(Reader paramReader, long paramLong)
    throws IOException
  {
    Preconditions.checkNotNull(paramReader);
    while (paramLong > 0L)
    {
      long l = paramReader.skip(paramLong);
      if (l == 0L)
      {
        if (paramReader.read() == -1) {
          throw new EOFException();
        }
        paramLong -= 1L;
      }
      else
      {
        paramLong -= l;
      }
    }
  }
  
  @Deprecated
  public static <R extends Readable,  extends Closeable> String toString(InputSupplier<R> paramInputSupplier)
    throws IOException
  {
    return asCharSource(paramInputSupplier).read();
  }
  
  public static String toString(Readable paramReadable)
    throws IOException
  {
    return toStringBuilder(paramReadable).toString();
  }
  
  private static StringBuilder toStringBuilder(Readable paramReadable)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    copy(paramReadable, localStringBuilder);
    return localStringBuilder;
  }
  
  @Deprecated
  public static <W extends Appendable,  extends Closeable> void write(CharSequence paramCharSequence, OutputSupplier<W> paramOutputSupplier)
    throws IOException
  {
    asCharSink(paramOutputSupplier).write(paramCharSequence);
  }
  
  private static final class NullWriter
    extends Writer
  {
    private static final NullWriter INSTANCE = new NullWriter();
    
    public Writer append(char paramChar)
    {
      return this;
    }
    
    public Writer append(CharSequence paramCharSequence)
    {
      Preconditions.checkNotNull(paramCharSequence);
      return this;
    }
    
    public Writer append(CharSequence paramCharSequence, int paramInt1, int paramInt2)
    {
      Preconditions.checkPositionIndexes(paramInt1, paramInt2, paramCharSequence.length());
      return this;
    }
    
    public void close() {}
    
    public void flush() {}
    
    public String toString()
    {
      return "CharStreams.nullWriter()";
    }
    
    public void write(int paramInt) {}
    
    public void write(String paramString)
    {
      Preconditions.checkNotNull(paramString);
    }
    
    public void write(String paramString, int paramInt1, int paramInt2)
    {
      Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramString.length());
    }
    
    public void write(char[] paramArrayOfChar)
    {
      Preconditions.checkNotNull(paramArrayOfChar);
    }
    
    public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    {
      Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfChar.length);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharStreams
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */