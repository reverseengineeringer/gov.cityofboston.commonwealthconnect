package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.collect.AbstractIterator;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
import javax.annotation.Nullable;

public abstract class CharSource
  implements InputSupplier<Reader>
{
  public static CharSource concat(Iterable<? extends CharSource> paramIterable)
  {
    return new ConcatenatedCharSource(paramIterable);
  }
  
  public static CharSource concat(Iterator<? extends CharSource> paramIterator)
  {
    return concat(ImmutableList.copyOf(paramIterator));
  }
  
  public static CharSource concat(CharSource... paramVarArgs)
  {
    return concat(ImmutableList.copyOf(paramVarArgs));
  }
  
  public static CharSource empty()
  {
    return EmptyCharSource.INSTANCE;
  }
  
  public static CharSource wrap(CharSequence paramCharSequence)
  {
    return new CharSequenceCharSource(paramCharSequence);
  }
  
  public long copyTo(CharSink paramCharSink)
    throws IOException
  {
    Preconditions.checkNotNull(paramCharSink);
    Closer localCloser = Closer.create();
    try
    {
      long l = CharStreams.copy((Reader)localCloser.register(openStream()), (Writer)localCloser.register(paramCharSink.openStream()));
      return l;
    }
    catch (Throwable paramCharSink)
    {
      throw localCloser.rethrow(paramCharSink);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  public long copyTo(Appendable paramAppendable)
    throws IOException
  {
    Preconditions.checkNotNull(paramAppendable);
    Closer localCloser = Closer.create();
    try
    {
      long l = CharStreams.copy((Reader)localCloser.register(openStream()), paramAppendable);
      return l;
    }
    catch (Throwable paramAppendable)
    {
      throw localCloser.rethrow(paramAppendable);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  @Deprecated
  public final Reader getInput()
    throws IOException
  {
    return openStream();
  }
  
  /* Error */
  public boolean isEmpty()
    throws IOException
  {
    // Byte code:
    //   0: invokestatic 75	com/google/common/io/Closer:create	()Lcom/google/common/io/Closer;
    //   3: astore_3
    //   4: aload_3
    //   5: aload_0
    //   6: invokevirtual 79	com/google/common/io/CharSource:openStream	()Ljava/io/Reader;
    //   9: invokevirtual 83	com/google/common/io/Closer:register	(Ljava/io/Closeable;)Ljava/io/Closeable;
    //   12: checkcast 85	java/io/Reader
    //   15: invokevirtual 119	java/io/Reader:read	()I
    //   18: istore_1
    //   19: iload_1
    //   20: iconst_m1
    //   21: if_icmpne +11 -> 32
    //   24: iconst_1
    //   25: istore_2
    //   26: aload_3
    //   27: invokevirtual 101	com/google/common/io/Closer:close	()V
    //   30: iload_2
    //   31: ireturn
    //   32: iconst_0
    //   33: istore_2
    //   34: goto -8 -> 26
    //   37: astore 4
    //   39: aload_3
    //   40: aload 4
    //   42: invokevirtual 105	com/google/common/io/Closer:rethrow	(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    //   45: athrow
    //   46: astore 4
    //   48: aload_3
    //   49: invokevirtual 101	com/google/common/io/Closer:close	()V
    //   52: aload 4
    //   54: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	55	0	this	CharSource
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
  
  public BufferedReader openBufferedStream()
    throws IOException
  {
    Reader localReader = openStream();
    if ((localReader instanceof BufferedReader)) {
      return (BufferedReader)localReader;
    }
    return new BufferedReader(localReader);
  }
  
  public abstract Reader openStream()
    throws IOException;
  
  public String read()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      String str = CharStreams.toString((Reader)localCloser.register(openStream()));
      return str;
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
  
  @Nullable
  public String readFirstLine()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      String str = ((BufferedReader)localCloser.register(openBufferedStream())).readLine();
      return str;
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
  
  public ImmutableList<String> readLines()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      BufferedReader localBufferedReader = (BufferedReader)localCloser.register(openBufferedStream());
      ArrayList localArrayList = Lists.newArrayList();
      for (;;)
      {
        String str = localBufferedReader.readLine();
        if (str == null) {
          break;
        }
        localArrayList.add(str);
      }
      localImmutableList = ImmutableList.copyOf(localArrayList);
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
    ImmutableList localImmutableList;
    localCloser.close();
    return localImmutableList;
  }
  
  @Beta
  public <T> T readLines(LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramLineProcessor);
    Closer localCloser = Closer.create();
    try
    {
      paramLineProcessor = CharStreams.readLines((Reader)localCloser.register(openStream()), paramLineProcessor);
      return paramLineProcessor;
    }
    catch (Throwable paramLineProcessor)
    {
      throw localCloser.rethrow(paramLineProcessor);
    }
    finally
    {
      localCloser.close();
    }
  }
  
  private static class CharSequenceCharSource
    extends CharSource
  {
    private static final Splitter LINE_SPLITTER = Splitter.on(Pattern.compile("\r\n|\n|\r"));
    private final CharSequence seq;
    
    protected CharSequenceCharSource(CharSequence paramCharSequence)
    {
      seq = ((CharSequence)Preconditions.checkNotNull(paramCharSequence));
    }
    
    private Iterable<String> lines()
    {
      new Iterable()
      {
        public Iterator<String> iterator()
        {
          new AbstractIterator()
          {
            Iterator<String> lines = CharSource.CharSequenceCharSource.LINE_SPLITTER.split(seq).iterator();
            
            protected String computeNext()
            {
              if (lines.hasNext())
              {
                String str = (String)lines.next();
                if ((lines.hasNext()) || (!str.isEmpty())) {
                  return str;
                }
              }
              return (String)endOfData();
            }
          };
        }
      };
    }
    
    public boolean isEmpty()
    {
      return seq.length() == 0;
    }
    
    public Reader openStream()
    {
      return new CharSequenceReader(seq);
    }
    
    public String read()
    {
      return seq.toString();
    }
    
    public String readFirstLine()
    {
      Iterator localIterator = lines().iterator();
      if (localIterator.hasNext()) {
        return (String)localIterator.next();
      }
      return null;
    }
    
    public ImmutableList<String> readLines()
    {
      return ImmutableList.copyOf(lines());
    }
    
    public <T> T readLines(LineProcessor<T> paramLineProcessor)
      throws IOException
    {
      Iterator localIterator = lines().iterator();
      while ((localIterator.hasNext()) && (paramLineProcessor.processLine((String)localIterator.next()))) {}
      return (T)paramLineProcessor.getResult();
    }
    
    public String toString()
    {
      return "CharSource.wrap(" + Ascii.truncate(seq, 30, "...") + ")";
    }
  }
  
  private static final class ConcatenatedCharSource
    extends CharSource
  {
    private final Iterable<? extends CharSource> sources;
    
    ConcatenatedCharSource(Iterable<? extends CharSource> paramIterable)
    {
      sources = ((Iterable)Preconditions.checkNotNull(paramIterable));
    }
    
    public boolean isEmpty()
      throws IOException
    {
      Iterator localIterator = sources.iterator();
      while (localIterator.hasNext()) {
        if (!((CharSource)localIterator.next()).isEmpty()) {
          return false;
        }
      }
      return true;
    }
    
    public Reader openStream()
      throws IOException
    {
      return new MultiReader(sources.iterator());
    }
    
    public String toString()
    {
      return "CharSource.concat(" + sources + ")";
    }
  }
  
  private static final class EmptyCharSource
    extends CharSource.CharSequenceCharSource
  {
    private static final EmptyCharSource INSTANCE = new EmptyCharSource();
    
    private EmptyCharSource()
    {
      super();
    }
    
    public String toString()
    {
      return "CharSource.empty()";
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */