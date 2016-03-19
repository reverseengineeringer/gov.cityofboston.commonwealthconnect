package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;

@Beta
public final class Resources
{
  public static ByteSource asByteSource(URL paramURL)
  {
    return new UrlByteSource(paramURL, null);
  }
  
  public static CharSource asCharSource(URL paramURL, Charset paramCharset)
  {
    return asByteSource(paramURL).asCharSource(paramCharset);
  }
  
  public static void copy(URL paramURL, OutputStream paramOutputStream)
    throws IOException
  {
    asByteSource(paramURL).copyTo(paramOutputStream);
  }
  
  public static URL getResource(Class<?> paramClass, String paramString)
  {
    URL localURL = paramClass.getResource(paramString);
    if (localURL != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "resource %s relative to %s not found.", new Object[] { paramString, paramClass.getName() });
      return localURL;
    }
  }
  
  public static URL getResource(String paramString)
  {
    URL localURL = ((ClassLoader)Objects.firstNonNull(Thread.currentThread().getContextClassLoader(), Resources.class.getClassLoader())).getResource(paramString);
    if (localURL != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "resource %s not found.", new Object[] { paramString });
      return localURL;
    }
  }
  
  @Deprecated
  public static InputSupplier<InputStream> newInputStreamSupplier(URL paramURL)
  {
    return ByteStreams.asInputSupplier(asByteSource(paramURL));
  }
  
  @Deprecated
  public static InputSupplier<InputStreamReader> newReaderSupplier(URL paramURL, Charset paramCharset)
  {
    return CharStreams.asInputSupplier(asCharSource(paramURL, paramCharset));
  }
  
  public static <T> T readLines(URL paramURL, Charset paramCharset, LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    return (T)CharStreams.readLines(newReaderSupplier(paramURL, paramCharset), paramLineProcessor);
  }
  
  public static List<String> readLines(URL paramURL, Charset paramCharset)
    throws IOException
  {
    (List)readLines(paramURL, paramCharset, new LineProcessor()
    {
      final List<String> result = Lists.newArrayList();
      
      public List<String> getResult()
      {
        return result;
      }
      
      public boolean processLine(String paramAnonymousString)
      {
        result.add(paramAnonymousString);
        return true;
      }
    });
  }
  
  public static byte[] toByteArray(URL paramURL)
    throws IOException
  {
    return asByteSource(paramURL).read();
  }
  
  public static String toString(URL paramURL, Charset paramCharset)
    throws IOException
  {
    return asCharSource(paramURL, paramCharset).read();
  }
  
  private static final class UrlByteSource
    extends ByteSource
  {
    private final URL url;
    
    private UrlByteSource(URL paramURL)
    {
      url = ((URL)Preconditions.checkNotNull(paramURL));
    }
    
    public InputStream openStream()
      throws IOException
    {
      return url.openStream();
    }
    
    public String toString()
    {
      return "Resources.asByteSource(" + url + ")";
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.Resources
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */