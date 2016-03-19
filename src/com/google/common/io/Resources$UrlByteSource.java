package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

final class Resources$UrlByteSource
  extends ByteSource
{
  private final URL url;
  
  private Resources$UrlByteSource(URL paramURL)
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

/* Location:
 * Qualified Name:     com.google.common.io.Resources.UrlByteSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */