package com.squareup.okhttp;

import com.squareup.okhttp.internal.DiskLruCache.Editor;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

class Cache$CacheRequestImpl$1
  extends FilterOutputStream
{
  Cache$CacheRequestImpl$1(Cache.CacheRequestImpl paramCacheRequestImpl, OutputStream paramOutputStream, Cache paramCache, DiskLruCache.Editor paramEditor)
  {
    super(paramOutputStream);
  }
  
  public void close()
    throws IOException
  {
    synchronized (this$1.this$0)
    {
      if (Cache.CacheRequestImpl.access$600(this$1)) {
        return;
      }
      Cache.CacheRequestImpl.access$602(this$1, true);
      Cache.access$708(this$1.this$0);
      super.close();
      val$editor.commit();
      return;
    }
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    out.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Cache.CacheRequestImpl.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */