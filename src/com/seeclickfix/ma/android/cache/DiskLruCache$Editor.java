package com.seeclickfix.ma.android.cache;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

public final class DiskLruCache$Editor
{
  private final DiskLruCache.Entry entry;
  private boolean hasErrors;
  
  private DiskLruCache$Editor(DiskLruCache paramDiskLruCache, DiskLruCache.Entry paramEntry)
  {
    entry = paramEntry;
  }
  
  public void abort()
    throws IOException
  {
    DiskLruCache.access$1900(this$0, this, false);
  }
  
  public void commit()
    throws IOException
  {
    if (hasErrors)
    {
      DiskLruCache.access$1900(this$0, this, false);
      this$0.remove(DiskLruCache.Entry.access$1100(entry));
      return;
    }
    DiskLruCache.access$1900(this$0, this, true);
  }
  
  public String getString(int paramInt)
    throws IOException
  {
    InputStream localInputStream = newInputStream(paramInt);
    if (localInputStream != null) {
      return DiskLruCache.access$1600(localInputStream);
    }
    return null;
  }
  
  public InputStream newInputStream(int paramInt)
    throws IOException
  {
    synchronized (this$0)
    {
      if (DiskLruCache.Entry.access$700(entry) != this) {
        throw new IllegalStateException();
      }
    }
    if (!DiskLruCache.Entry.access$600(entry)) {
      return null;
    }
    FileInputStream localFileInputStream = new FileInputStream(entry.getCleanFile(paramInt));
    return localFileInputStream;
  }
  
  public OutputStream newOutputStream(int paramInt)
    throws IOException
  {
    synchronized (this$0)
    {
      if (DiskLruCache.Entry.access$700(entry) != this) {
        throw new IllegalStateException();
      }
    }
    FaultHidingOutputStream localFaultHidingOutputStream = new FaultHidingOutputStream(new FileOutputStream(entry.getDirtyFile(paramInt)), null);
    return localFaultHidingOutputStream;
  }
  
  public void set(int paramInt, String paramString)
    throws IOException
  {
    Object localObject3 = null;
    try
    {
      OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(newOutputStream(paramInt), DiskLruCache.access$1800());
      DiskLruCache.closeQuietly(paramString);
    }
    finally
    {
      try
      {
        localOutputStreamWriter.write(paramString);
        DiskLruCache.closeQuietly(localOutputStreamWriter);
        return;
      }
      finally
      {
        paramString = (String)localObject1;
        Object localObject2 = localObject4;
      }
      localObject1 = finally;
      paramString = (String)localObject3;
    }
    throw ((Throwable)localObject1);
  }
  
  private class FaultHidingOutputStream
    extends FilterOutputStream
  {
    private FaultHidingOutputStream(OutputStream paramOutputStream)
    {
      super();
    }
    
    public void close()
    {
      try
      {
        out.close();
        return;
      }
      catch (IOException localIOException)
      {
        DiskLruCache.Editor.access$2002(DiskLruCache.Editor.this, true);
      }
    }
    
    public void flush()
    {
      try
      {
        out.flush();
        return;
      }
      catch (IOException localIOException)
      {
        DiskLruCache.Editor.access$2002(DiskLruCache.Editor.this, true);
      }
    }
    
    public void write(int paramInt)
    {
      try
      {
        out.write(paramInt);
        return;
      }
      catch (IOException localIOException)
      {
        DiskLruCache.Editor.access$2002(DiskLruCache.Editor.this, true);
      }
    }
    
    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      try
      {
        out.write(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
      catch (IOException paramArrayOfByte)
      {
        DiskLruCache.Editor.access$2002(DiskLruCache.Editor.this, true);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.cache.DiskLruCache.Editor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */