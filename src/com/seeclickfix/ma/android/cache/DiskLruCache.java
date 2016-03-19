package com.seeclickfix.ma.android.cache;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.reflect.Array;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class DiskLruCache
  implements Closeable
{
  static final long ANY_SEQUENCE_NUMBER = -1L;
  private static final String CLEAN = "CLEAN";
  private static final String DIRTY = "DIRTY";
  private static final int IO_BUFFER_SIZE = 8192;
  static final String JOURNAL_FILE = "journal";
  static final String JOURNAL_FILE_TMP = "journal.tmp";
  static final String MAGIC = "libcore.io.DiskLruCache";
  private static final String READ = "READ";
  private static final String REMOVE = "REMOVE";
  private static final Charset UTF_8 = Charset.forName("UTF-8");
  static final String VERSION_1 = "1";
  private final int appVersion;
  private final Callable<Void> cleanupCallable = new Callable()
  {
    public Void call()
      throws Exception
    {
      synchronized (DiskLruCache.this)
      {
        if (journalWriter == null) {
          return null;
        }
        DiskLruCache.this.trimToSize();
        if (DiskLruCache.this.journalRebuildRequired())
        {
          DiskLruCache.this.rebuildJournal();
          DiskLruCache.access$402(DiskLruCache.this, 0);
        }
        return null;
      }
    }
  };
  private final File directory;
  private final ExecutorService executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue());
  private final File journalFile;
  private final File journalFileTmp;
  private Writer journalWriter;
  private final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap(0, 0.75F, true);
  private final long maxSize;
  private long nextSequenceNumber = 0L;
  private int redundantOpCount;
  private long size = 0L;
  private final int valueCount;
  
  private DiskLruCache(File paramFile, int paramInt1, int paramInt2, long paramLong)
  {
    directory = paramFile;
    appVersion = paramInt1;
    journalFile = new File(paramFile, "journal");
    journalFileTmp = new File(paramFile, "journal.tmp");
    valueCount = paramInt2;
    maxSize = paramLong;
  }
  
  private void checkNotClosed()
  {
    if (journalWriter == null) {
      throw new IllegalStateException("cache is closed");
    }
  }
  
  public static void closeQuietly(Closeable paramCloseable)
  {
    if (paramCloseable != null) {}
    try
    {
      paramCloseable.close();
      return;
    }
    catch (RuntimeException paramCloseable)
    {
      throw paramCloseable;
    }
    catch (Exception paramCloseable) {}
  }
  
  private void completeEdit(Editor paramEditor, boolean paramBoolean)
    throws IOException
  {
    Entry localEntry;
    try
    {
      localEntry = entry;
      if (currentEditor != paramEditor) {
        throw new IllegalStateException();
      }
    }
    finally {}
    int i;
    if ((paramBoolean) && (!readable))
    {
      i = 0;
      if (i < valueCount) {
        if (!localEntry.getDirtyFile(i).exists())
        {
          paramEditor.abort();
          throw new IllegalStateException("edit didn't create file " + i);
        }
      }
    }
    for (;;)
    {
      long l1;
      if (i < valueCount)
      {
        paramEditor = localEntry.getDirtyFile(i);
        if (paramBoolean)
        {
          if (paramEditor.exists())
          {
            File localFile = localEntry.getCleanFile(i);
            paramEditor.renameTo(localFile);
            l1 = lengths[i];
            long l2 = localFile.length();
            lengths[i] = l2;
            size = (size - l1 + l2);
          }
        }
        else {
          deleteIfExists(paramEditor);
        }
      }
      else
      {
        redundantOpCount += 1;
        Entry.access$702(localEntry, null);
        if ((readable | paramBoolean))
        {
          Entry.access$602(localEntry, true);
          journalWriter.write("CLEAN " + key + localEntry.getLengths() + '\n');
          if (paramBoolean)
          {
            l1 = nextSequenceNumber;
            nextSequenceNumber = (1L + l1);
            Entry.access$1202(localEntry, l1);
          }
        }
        for (;;)
        {
          if ((size > maxSize) || (journalRebuildRequired())) {
            executorService.submit(cleanupCallable);
          }
          return;
          lruEntries.remove(key);
          journalWriter.write("REMOVE " + key + '\n');
        }
        i += 1;
        break;
        i = 0;
        continue;
      }
      i += 1;
    }
  }
  
  private static <T> T[] copyOfRange(T[] paramArrayOfT, int paramInt1, int paramInt2)
  {
    int i = paramArrayOfT.length;
    if (paramInt1 > paramInt2) {
      throw new IllegalArgumentException();
    }
    if ((paramInt1 < 0) || (paramInt1 > i)) {
      throw new ArrayIndexOutOfBoundsException();
    }
    paramInt2 -= paramInt1;
    i = Math.min(paramInt2, i - paramInt1);
    Object[] arrayOfObject = (Object[])Array.newInstance(paramArrayOfT.getClass().getComponentType(), paramInt2);
    System.arraycopy(paramArrayOfT, paramInt1, arrayOfObject, 0, i);
    return arrayOfObject;
  }
  
  public static void deleteContents(File paramFile)
    throws IOException
  {
    File[] arrayOfFile = paramFile.listFiles();
    if (arrayOfFile == null) {
      throw new IllegalArgumentException("not a directory: " + paramFile);
    }
    int j = arrayOfFile.length;
    int i = 0;
    while (i < j)
    {
      paramFile = arrayOfFile[i];
      if (paramFile.isDirectory()) {
        deleteContents(paramFile);
      }
      if (!paramFile.delete()) {
        throw new IOException("failed to delete file: " + paramFile);
      }
      i += 1;
    }
  }
  
  private static void deleteIfExists(File paramFile)
    throws IOException
  {
    if ((paramFile.exists()) && (!paramFile.delete())) {
      throw new IOException();
    }
  }
  
  private Editor edit(String paramString, long paramLong)
    throws IOException
  {
    Editor localEditor1 = null;
    for (;;)
    {
      Entry localEntry;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        localEntry = (Entry)lruEntries.get(paramString);
        if (paramLong != -1L)
        {
          localObject = localEditor1;
          if (localEntry != null)
          {
            long l = sequenceNumber;
            if (l != paramLong) {
              localObject = localEditor1;
            }
          }
          else
          {
            return (Editor)localObject;
          }
        }
        if (localEntry == null)
        {
          localObject = new Entry(paramString, null);
          lruEntries.put(paramString, localObject);
          localEditor1 = new Editor((Entry)localObject, null);
          Entry.access$702((Entry)localObject, localEditor1);
          journalWriter.write("DIRTY " + paramString + '\n');
          journalWriter.flush();
          localObject = localEditor1;
          continue;
        }
        localEditor2 = currentEditor;
      }
      finally {}
      Editor localEditor2;
      Object localObject = localEntry;
      if (localEditor2 != null) {
        localObject = localEditor1;
      }
    }
  }
  
  private static String inputStreamToString(InputStream paramInputStream)
    throws IOException
  {
    return readFully(new InputStreamReader(paramInputStream, UTF_8));
  }
  
  private boolean journalRebuildRequired()
  {
    return (redundantOpCount >= 2000) && (redundantOpCount >= lruEntries.size());
  }
  
  public static DiskLruCache open(File paramFile, int paramInt1, int paramInt2, long paramLong)
    throws IOException
  {
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    if (paramInt2 <= 0) {
      throw new IllegalArgumentException("valueCount <= 0");
    }
    DiskLruCache localDiskLruCache = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
    if (journalFile.exists()) {
      try
      {
        localDiskLruCache.readJournal();
        localDiskLruCache.processJournal();
        journalWriter = new BufferedWriter(new FileWriter(journalFile, true), 8192);
        return localDiskLruCache;
      }
      catch (IOException localIOException)
      {
        localDiskLruCache.delete();
      }
    }
    paramFile.mkdirs();
    paramFile = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
    paramFile.rebuildJournal();
    return paramFile;
  }
  
  private void processJournal()
    throws IOException
  {
    deleteIfExists(journalFileTmp);
    Iterator localIterator = lruEntries.values().iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      int i;
      if (currentEditor == null)
      {
        i = 0;
        while (i < valueCount)
        {
          size += lengths[i];
          i += 1;
        }
      }
      else
      {
        Entry.access$702(localEntry, null);
        i = 0;
        while (i < valueCount)
        {
          deleteIfExists(localEntry.getCleanFile(i));
          deleteIfExists(localEntry.getDirtyFile(i));
          i += 1;
        }
        localIterator.remove();
      }
    }
  }
  
  public static String readAsciiLine(InputStream paramInputStream)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder(80);
    for (;;)
    {
      int i = paramInputStream.read();
      if (i == -1) {
        throw new EOFException();
      }
      if (i == 10)
      {
        i = localStringBuilder.length();
        if ((i > 0) && (localStringBuilder.charAt(i - 1) == '\r')) {
          localStringBuilder.setLength(i - 1);
        }
        return localStringBuilder.toString();
      }
      localStringBuilder.append((char)i);
    }
  }
  
  public static String readFully(Reader paramReader)
    throws IOException
  {
    try
    {
      StringWriter localStringWriter = new StringWriter();
      char[] arrayOfChar = new char['Ѐ'];
      for (;;)
      {
        int i = paramReader.read(arrayOfChar);
        if (i == -1) {
          break;
        }
        localStringWriter.write(arrayOfChar, 0, i);
      }
      str = ((StringWriter)localObject).toString();
    }
    finally
    {
      paramReader.close();
    }
    String str;
    paramReader.close();
    return str;
  }
  
  private void readJournal()
    throws IOException
  {
    BufferedInputStream localBufferedInputStream = new BufferedInputStream(new FileInputStream(journalFile), 8192);
    try
    {
      String str1 = readAsciiLine(localBufferedInputStream);
      String str2 = readAsciiLine(localBufferedInputStream);
      String str3 = readAsciiLine(localBufferedInputStream);
      String str4 = readAsciiLine(localBufferedInputStream);
      String str5 = readAsciiLine(localBufferedInputStream);
      if ((!"libcore.io.DiskLruCache".equals(str1)) || (!"1".equals(str2)) || (!Integer.toString(appVersion).equals(str3)) || (!Integer.toString(valueCount).equals(str4)) || (!"".equals(str5))) {
        throw new IOException("unexpected journal header: [" + str1 + ", " + str2 + ", " + str4 + ", " + str5 + "]");
      }
    }
    finally
    {
      closeQuietly(localBufferedInputStream);
    }
  }
  
  private void readJournalLine(String paramString)
    throws IOException
  {
    String[] arrayOfString = paramString.split(" ");
    if (arrayOfString.length < 2) {
      throw new IOException("unexpected journal line: " + paramString);
    }
    String str = arrayOfString[1];
    if ((arrayOfString[0].equals("REMOVE")) && (arrayOfString.length == 2)) {
      lruEntries.remove(str);
    }
    do
    {
      return;
      Entry localEntry2 = (Entry)lruEntries.get(str);
      Entry localEntry1 = localEntry2;
      if (localEntry2 == null)
      {
        localEntry1 = new Entry(str, null);
        lruEntries.put(str, localEntry1);
      }
      if ((arrayOfString[0].equals("CLEAN")) && (arrayOfString.length == valueCount + 2))
      {
        Entry.access$602(localEntry1, true);
        Entry.access$702(localEntry1, null);
        localEntry1.setLengths((String[])copyOfRange(arrayOfString, 2, arrayOfString.length));
        return;
      }
      if ((arrayOfString[0].equals("DIRTY")) && (arrayOfString.length == 2))
      {
        Entry.access$702(localEntry1, new Editor(localEntry1, null));
        return;
      }
    } while ((arrayOfString[0].equals("READ")) && (arrayOfString.length == 2));
    throw new IOException("unexpected journal line: " + paramString);
  }
  
  private void rebuildJournal()
    throws IOException
  {
    for (;;)
    {
      try
      {
        if (journalWriter != null) {
          journalWriter.close();
        }
        BufferedWriter localBufferedWriter = new BufferedWriter(new FileWriter(journalFileTmp), 8192);
        localBufferedWriter.write("libcore.io.DiskLruCache");
        localBufferedWriter.write("\n");
        localBufferedWriter.write("1");
        localBufferedWriter.write("\n");
        localBufferedWriter.write(Integer.toString(appVersion));
        localBufferedWriter.write("\n");
        localBufferedWriter.write(Integer.toString(valueCount));
        localBufferedWriter.write("\n");
        localBufferedWriter.write("\n");
        Iterator localIterator = lruEntries.values().iterator();
        if (!localIterator.hasNext()) {
          break;
        }
        Entry localEntry = (Entry)localIterator.next();
        if (currentEditor != null) {
          localBufferedWriter.write("DIRTY " + key + '\n');
        } else {
          ((Writer)localObject).write("CLEAN " + key + localEntry.getLengths() + '\n');
        }
      }
      finally {}
    }
    ((Writer)localObject).close();
    journalFileTmp.renameTo(journalFile);
    journalWriter = new BufferedWriter(new FileWriter(journalFile, true), 8192);
  }
  
  private void trimToSize()
    throws IOException
  {
    while (size > maxSize) {
      remove((String)((Map.Entry)lruEntries.entrySet().iterator().next()).getKey());
    }
  }
  
  private void validateKey(String paramString)
  {
    if ((paramString.contains(" ")) || (paramString.contains("\n")) || (paramString.contains("\r"))) {
      throw new IllegalArgumentException("keys must not contain spaces or newlines: \"" + paramString + "\"");
    }
  }
  
  public void close()
    throws IOException
  {
    for (;;)
    {
      try
      {
        Object localObject1 = journalWriter;
        if (localObject1 == null) {
          return;
        }
        localObject1 = new ArrayList(lruEntries.values()).iterator();
        if (((Iterator)localObject1).hasNext())
        {
          Entry localEntry = (Entry)((Iterator)localObject1).next();
          if (currentEditor == null) {
            continue;
          }
          currentEditor.abort();
          continue;
        }
        trimToSize();
      }
      finally {}
      journalWriter.close();
      journalWriter = null;
    }
  }
  
  public void delete()
    throws IOException
  {
    close();
    deleteContents(directory);
  }
  
  public Editor edit(String paramString)
    throws IOException
  {
    return edit(paramString, -1L);
  }
  
  public void flush()
    throws IOException
  {
    try
    {
      checkNotClosed();
      trimToSize();
      journalWriter.flush();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public Snapshot get(String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_0
    //   4: monitorenter
    //   5: aload_0
    //   6: invokespecial 367	com/seeclickfix/ma/android/cache/DiskLruCache:checkNotClosed	()V
    //   9: aload_0
    //   10: aload_1
    //   11: invokespecial 370	com/seeclickfix/ma/android/cache/DiskLruCache:validateKey	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: getfield 97	com/seeclickfix/ma/android/cache/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   18: aload_1
    //   19: invokevirtual 373	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   22: checkcast 16	com/seeclickfix/ma/android/cache/DiskLruCache$Entry
    //   25: astore 5
    //   27: aload 5
    //   29: ifnonnull +10 -> 39
    //   32: aload 4
    //   34: astore_3
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_3
    //   38: areturn
    //   39: aload 4
    //   41: astore_3
    //   42: aload 5
    //   44: invokestatic 217	com/seeclickfix/ma/android/cache/DiskLruCache$Entry:access$600	(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)Z
    //   47: ifeq -12 -> 35
    //   50: aload_0
    //   51: getfield 137	com/seeclickfix/ma/android/cache/DiskLruCache:valueCount	I
    //   54: anewarray 460	java/io/InputStream
    //   57: astore_3
    //   58: iconst_0
    //   59: istore_2
    //   60: iload_2
    //   61: aload_0
    //   62: getfield 137	com/seeclickfix/ma/android/cache/DiskLruCache:valueCount	I
    //   65: if_icmpge +33 -> 98
    //   68: aload_3
    //   69: iload_2
    //   70: new 492	java/io/FileInputStream
    //   73: dup
    //   74: aload 5
    //   76: iload_2
    //   77: invokevirtual 246	com/seeclickfix/ma/android/cache/DiskLruCache$Entry:getCleanFile	(I)Ljava/io/File;
    //   80: invokespecial 494	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   83: aastore
    //   84: iload_2
    //   85: iconst_1
    //   86: iadd
    //   87: istore_2
    //   88: goto -28 -> 60
    //   91: astore_1
    //   92: aload 4
    //   94: astore_3
    //   95: goto -60 -> 35
    //   98: aload_0
    //   99: aload_0
    //   100: getfield 187	com/seeclickfix/ma/android/cache/DiskLruCache:redundantOpCount	I
    //   103: iconst_1
    //   104: iadd
    //   105: putfield 187	com/seeclickfix/ma/android/cache/DiskLruCache:redundantOpCount	I
    //   108: aload_0
    //   109: getfield 143	com/seeclickfix/ma/android/cache/DiskLruCache:journalWriter	Ljava/io/Writer;
    //   112: new 229	java/lang/StringBuilder
    //   115: dup
    //   116: invokespecial 230	java/lang/StringBuilder:<init>	()V
    //   119: ldc_w 581
    //   122: invokevirtual 236	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   125: aload_1
    //   126: invokevirtual 236	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   129: bipush 10
    //   131: invokevirtual 282	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   134: invokevirtual 243	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   137: invokevirtual 584	java/io/Writer:append	(Ljava/lang/CharSequence;)Ljava/io/Writer;
    //   140: pop
    //   141: aload_0
    //   142: invokespecial 175	com/seeclickfix/ma/android/cache/DiskLruCache:journalRebuildRequired	()Z
    //   145: ifeq +17 -> 162
    //   148: aload_0
    //   149: getfield 117	com/seeclickfix/ma/android/cache/DiskLruCache:executorService	Ljava/util/concurrent/ExecutorService;
    //   152: aload_0
    //   153: getfield 122	com/seeclickfix/ma/android/cache/DiskLruCache:cleanupCallable	Ljava/util/concurrent/Callable;
    //   156: invokeinterface 297 2 0
    //   161: pop
    //   162: new 19	com/seeclickfix/ma/android/cache/DiskLruCache$Snapshot
    //   165: dup
    //   166: aload_0
    //   167: aload_1
    //   168: aload 5
    //   170: invokestatic 377	com/seeclickfix/ma/android/cache/DiskLruCache$Entry:access$1200	(Lcom/seeclickfix/ma/android/cache/DiskLruCache$Entry;)J
    //   173: aload_3
    //   174: aconst_null
    //   175: invokespecial 587	com/seeclickfix/ma/android/cache/DiskLruCache$Snapshot:<init>	(Lcom/seeclickfix/ma/android/cache/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;Lcom/seeclickfix/ma/android/cache/DiskLruCache$1;)V
    //   178: astore_3
    //   179: goto -144 -> 35
    //   182: astore_1
    //   183: aload_0
    //   184: monitorexit
    //   185: aload_1
    //   186: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	187	0	this	DiskLruCache
    //   0	187	1	paramString	String
    //   59	29	2	i	int
    //   34	145	3	localObject1	Object
    //   1	92	4	localObject2	Object
    //   25	144	5	localEntry	Entry
    // Exception table:
    //   from	to	target	type
    //   60	84	91	java/io/FileNotFoundException
    //   5	27	182	finally
    //   42	58	182	finally
    //   60	84	182	finally
    //   98	162	182	finally
    //   162	179	182	finally
  }
  
  public File getDirectory()
  {
    return directory;
  }
  
  public boolean isClosed()
  {
    return journalWriter == null;
  }
  
  public long maxSize()
  {
    return maxSize;
  }
  
  public boolean remove(String paramString)
    throws IOException
  {
    for (;;)
    {
      Entry localEntry;
      int i;
      try
      {
        checkNotClosed();
        validateKey(paramString);
        localEntry = (Entry)lruEntries.get(paramString);
        if (localEntry != null)
        {
          localObject = currentEditor;
          if (localObject == null) {}
        }
        else
        {
          bool = false;
          return bool;
        }
        i = 0;
        if (i >= valueCount) {
          break label138;
        }
        Object localObject = localEntry.getCleanFile(i);
        if (!((File)localObject).delete()) {
          throw new IOException("failed to delete " + localObject);
        }
      }
      finally {}
      size -= lengths[i];
      lengths[i] = 0L;
      i += 1;
      continue;
      label138:
      redundantOpCount += 1;
      journalWriter.append("REMOVE " + paramString + '\n');
      lruEntries.remove(paramString);
      if (journalRebuildRequired()) {
        executorService.submit(cleanupCallable);
      }
      boolean bool = true;
    }
  }
  
  public long size()
  {
    try
    {
      long l = size;
      return l;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public final class Editor
  {
    private final DiskLruCache.Entry entry;
    private boolean hasErrors;
    
    private Editor(DiskLruCache.Entry paramEntry)
    {
      entry = paramEntry;
    }
    
    public void abort()
      throws IOException
    {
      DiskLruCache.this.completeEdit(this, false);
    }
    
    public void commit()
      throws IOException
    {
      if (hasErrors)
      {
        DiskLruCache.this.completeEdit(this, false);
        remove(DiskLruCache.Entry.access$1100(entry));
        return;
      }
      DiskLruCache.this.completeEdit(this, true);
    }
    
    public String getString(int paramInt)
      throws IOException
    {
      InputStream localInputStream = newInputStream(paramInt);
      if (localInputStream != null) {
        return DiskLruCache.inputStreamToString(localInputStream);
      }
      return null;
    }
    
    public InputStream newInputStream(int paramInt)
      throws IOException
    {
      synchronized (DiskLruCache.this)
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
      synchronized (DiskLruCache.this)
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
        OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(newOutputStream(paramInt), DiskLruCache.UTF_8);
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
  
  private final class Entry
  {
    private DiskLruCache.Editor currentEditor;
    private final String key;
    private final long[] lengths;
    private boolean readable;
    private long sequenceNumber;
    
    private Entry(String paramString)
    {
      key = paramString;
      lengths = new long[valueCount];
    }
    
    private IOException invalidLengths(String[] paramArrayOfString)
      throws IOException
    {
      throw new IOException("unexpected journal line: " + Arrays.toString(paramArrayOfString));
    }
    
    private void setLengths(String[] paramArrayOfString)
      throws IOException
    {
      if (paramArrayOfString.length != valueCount) {
        throw invalidLengths(paramArrayOfString);
      }
      int i = 0;
      try
      {
        while (i < paramArrayOfString.length)
        {
          lengths[i] = Long.parseLong(paramArrayOfString[i]);
          i += 1;
        }
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw invalidLengths(paramArrayOfString);
      }
    }
    
    public File getCleanFile(int paramInt)
    {
      return new File(directory, key + "." + paramInt);
    }
    
    public File getDirtyFile(int paramInt)
    {
      return new File(directory, key + "." + paramInt + ".tmp");
    }
    
    public String getLengths()
      throws IOException
    {
      StringBuilder localStringBuilder = new StringBuilder();
      long[] arrayOfLong = lengths;
      int j = arrayOfLong.length;
      int i = 0;
      while (i < j)
      {
        long l = arrayOfLong[i];
        localStringBuilder.append(' ').append(l);
        i += 1;
      }
      return localStringBuilder.toString();
    }
  }
  
  public final class Snapshot
    implements Closeable
  {
    private final InputStream[] ins;
    private final String key;
    private final long sequenceNumber;
    
    private Snapshot(String paramString, long paramLong, InputStream[] paramArrayOfInputStream)
    {
      key = paramString;
      sequenceNumber = paramLong;
      ins = paramArrayOfInputStream;
    }
    
    public void close()
    {
      InputStream[] arrayOfInputStream = ins;
      int j = arrayOfInputStream.length;
      int i = 0;
      while (i < j)
      {
        DiskLruCache.closeQuietly(arrayOfInputStream[i]);
        i += 1;
      }
    }
    
    public DiskLruCache.Editor edit()
      throws IOException
    {
      return DiskLruCache.this.edit(key, sequenceNumber);
    }
    
    public InputStream getInputStream(int paramInt)
    {
      return ins[paramInt];
    }
    
    public String getString(int paramInt)
      throws IOException
    {
      return DiskLruCache.inputStreamToString(getInputStream(paramInt));
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.cache.DiskLruCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */