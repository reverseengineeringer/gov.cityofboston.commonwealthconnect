package com.android.volley.toolbox;

import com.android.volley.Cache.Entry;
import com.android.volley.VolleyLog;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

class DiskBasedCache$CacheHeader
{
  public String etag;
  public String key;
  public long lastModified;
  public Map<String, String> responseHeaders;
  public long serverDate;
  public long size;
  public long softTtl;
  public long ttl;
  
  private DiskBasedCache$CacheHeader() {}
  
  public DiskBasedCache$CacheHeader(String paramString, Cache.Entry paramEntry)
  {
    key = paramString;
    size = data.length;
    etag = etag;
    serverDate = serverDate;
    lastModified = lastModified;
    ttl = ttl;
    softTtl = softTtl;
    responseHeaders = responseHeaders;
  }
  
  public static CacheHeader readHeader(InputStream paramInputStream)
    throws IOException
  {
    CacheHeader localCacheHeader = new CacheHeader();
    if (DiskBasedCache.readInt(paramInputStream) != 538247942) {
      throw new IOException();
    }
    key = DiskBasedCache.readString(paramInputStream);
    etag = DiskBasedCache.readString(paramInputStream);
    if (etag.equals("")) {
      etag = null;
    }
    serverDate = DiskBasedCache.readLong(paramInputStream);
    lastModified = DiskBasedCache.readLong(paramInputStream);
    ttl = DiskBasedCache.readLong(paramInputStream);
    softTtl = DiskBasedCache.readLong(paramInputStream);
    responseHeaders = DiskBasedCache.readStringStringMap(paramInputStream);
    return localCacheHeader;
  }
  
  public Cache.Entry toCacheEntry(byte[] paramArrayOfByte)
  {
    Cache.Entry localEntry = new Cache.Entry();
    data = paramArrayOfByte;
    etag = etag;
    serverDate = serverDate;
    lastModified = lastModified;
    ttl = ttl;
    softTtl = softTtl;
    responseHeaders = responseHeaders;
    return localEntry;
  }
  
  public boolean writeHeader(OutputStream paramOutputStream)
  {
    try
    {
      DiskBasedCache.writeInt(paramOutputStream, 538247942);
      DiskBasedCache.writeString(paramOutputStream, key);
      if (etag == null) {}
      for (String str = "";; str = etag)
      {
        DiskBasedCache.writeString(paramOutputStream, str);
        DiskBasedCache.writeLong(paramOutputStream, serverDate);
        DiskBasedCache.writeLong(paramOutputStream, lastModified);
        DiskBasedCache.writeLong(paramOutputStream, ttl);
        DiskBasedCache.writeLong(paramOutputStream, softTtl);
        DiskBasedCache.writeStringStringMap(responseHeaders, paramOutputStream);
        paramOutputStream.flush();
        return true;
      }
      return false;
    }
    catch (IOException paramOutputStream)
    {
      VolleyLog.d("%s", new Object[] { paramOutputStream.toString() });
    }
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.DiskBasedCache.CacheHeader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */