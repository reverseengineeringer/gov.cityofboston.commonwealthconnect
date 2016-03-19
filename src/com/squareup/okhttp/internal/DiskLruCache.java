package com.squareup.okhttp.internal;

import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;

public final class DiskLruCache
  implements Closeable
{
  static final long ANY_SEQUENCE_NUMBER = -1L;
  private static final String CLEAN = "CLEAN";
  private static final String DIRTY = "DIRTY";
  static final String JOURNAL_FILE = "journal";
  static final String JOURNAL_FILE_BACKUP = "journal.bkp";
  static final String JOURNAL_FILE_TEMP = "journal.tmp";
  static final Pattern LEGAL_KEY_PATTERN = Pattern.compile("[a-z0-9_-]{1,64}");
  static final String MAGIC = "libcore.io.DiskLruCache";
  private static final OutputStream NULL_OUTPUT_STREAM = new OutputStream()
  {
    public void write(int paramAnonymousInt)
      throws IOException
    {}
  };
  private static final String READ = "READ";
  private static final String REMOVE = "REMOVE";
  static final String VERSION_1 = "1";
  private final int appVersion;
  private final Runnable cleanupRunnable = new Runnable()
  {
    public void run()
    {
      synchronized (DiskLruCache.this)
      {
        if (journalWriter == null) {
          return;
        }
      }
    }
  };
  private final File directory;
  final ThreadPoolExecutor executorService = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory("OkHttp DiskLruCache", true));
  private final File journalFile;
  private final File journalFileBackup;
  private final File journalFileTmp;
  private BufferedSink journalWriter;
  private final LinkedHashMap<String, Entry> lruEntries = new LinkedHashMap(0, 0.75F, true);
  private long maxSize;
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
    journalFileBackup = new File(paramFile, "journal.bkp");
    valueCount = paramInt2;
    maxSize = paramLong;
  }
  
  private void checkNotClosed()
  {
    if (journalWriter == null) {
      throw new IllegalStateException("cache is closed");
    }
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
    if ((paramBoolean) && (!readable))
    {
      i = 0;
      while (i < valueCount)
      {
        if (written[i] == 0)
        {
          paramEditor.abort();
          throw new IllegalStateException("Newly created entry didn't create value for index " + i);
        }
        if (!localEntry.getDirtyFile(i).exists())
        {
          paramEditor.abort();
          return;
        }
        i += 1;
      }
    }
    int i = 0;
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
          journalWriter.writeUtf8("CLEAN").writeByte(32);
          journalWriter.writeUtf8(key);
          journalWriter.writeUtf8(localEntry.getLengths());
          journalWriter.writeByte(10);
          if (paramBoolean)
          {
            l1 = nextSequenceNumber;
            nextSequenceNumber = (1L + l1);
            Entry.access$1202(localEntry, l1);
          }
        }
        for (;;)
        {
          journalWriter.flush();
          if ((size <= maxSize) && (!journalRebuildRequired())) {
            break;
          }
          executorService.execute(cleanupRunnable);
          break;
          lruEntries.remove(key);
          journalWriter.writeUtf8("REMOVE").writeByte(32);
          journalWriter.writeUtf8(key);
          journalWriter.writeByte(10);
        }
      }
      i += 1;
    }
  }
  
  private static void deleteIfExists(File paramFile)
    throws IOException
  {
    if ((!paramFile.delete()) && (paramFile.exists())) {
      throw new IOException("failed to delete " + paramFile);
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
          journalWriter.writeUtf8("DIRTY").writeByte(32).writeUtf8(paramString).writeByte(10);
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
    try
    {
      Object localObject1 = new Buffer();
      ((Buffer)localObject1).writeAll(Okio.source(paramInputStream));
      localObject1 = ((Buffer)localObject1).readUtf8();
      return (String)localObject1;
    }
    finally
    {
      Util.closeQuietly(paramInputStream);
    }
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
    Object localObject = new File(paramFile, "journal.bkp");
    File localFile;
    if (((File)localObject).exists())
    {
      localFile = new File(paramFile, "journal");
      if (!localFile.exists()) {
        break label139;
      }
      ((File)localObject).delete();
    }
    for (;;)
    {
      localObject = new DiskLruCache(paramFile, paramInt1, paramInt2, paramLong);
      if (!journalFile.exists()) {
        break label203;
      }
      try
      {
        ((DiskLruCache)localObject).readJournal();
        ((DiskLruCache)localObject).processJournal();
        journalWriter = Okio.buffer(Okio.sink(new FileOutputStream(journalFile, true)));
        return (DiskLruCache)localObject;
      }
      catch (IOException localIOException)
      {
        label139:
        Platform.get().logW("DiskLruCache " + paramFile + " is corrupt: " + localIOException.getMessage() + ", removing");
        ((DiskLruCache)localObject).delete();
      }
      renameTo((File)localObject, localFile, false);
    }
    label203:
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
  
  private void readJournal()
    throws IOException
  {
    BufferedSource localBufferedSource = Okio.buffer(Okio.source(journalFile));
    int i;
    try
    {
      String str1 = localBufferedSource.readUtf8LineStrict();
      String str2 = localBufferedSource.readUtf8LineStrict();
      String str3 = localBufferedSource.readUtf8LineStrict();
      String str4 = localBufferedSource.readUtf8LineStrict();
      String str5 = localBufferedSource.readUtf8LineStrict();
      if ((!"libcore.io.DiskLruCache".equals(str1)) || (!"1".equals(str2)) || (!Integer.toString(appVersion).equals(str3)) || (!Integer.toString(valueCount).equals(str4)) || (!"".equals(str5))) {
        throw new IOException("unexpected journal header: [" + str1 + ", " + str2 + ", " + str4 + ", " + str5 + "]");
      }
    }
    finally
    {
      Util.closeQuietly(localBufferedSource);
      throw ((Throwable)localObject);
    }
  }
  
  private void readJournalLine(String paramString)
    throws IOException
  {
    int i = paramString.indexOf(' ');
    if (i == -1) {
      throw new IOException("unexpected journal line: " + paramString);
    }
    int j = i + 1;
    int k = paramString.indexOf(' ', j);
    Object localObject2;
    Object localObject1;
    if (k == -1)
    {
      localObject2 = paramString.substring(j);
      localObject1 = localObject2;
      if (i != "REMOVE".length()) {
        break label112;
      }
      localObject1 = localObject2;
      if (!paramString.startsWith("REMOVE")) {
        break label112;
      }
      lruEntries.remove(localObject2);
    }
    label112:
    do
    {
      return;
      localObject1 = paramString.substring(j, k);
      Entry localEntry = (Entry)lruEntries.get(localObject1);
      localObject2 = localEntry;
      if (localEntry == null)
      {
        localObject2 = new Entry((String)localObject1, null);
        lruEntries.put(localObject1, localObject2);
      }
      if ((k != -1) && (i == "CLEAN".length()) && (paramString.startsWith("CLEAN")))
      {
        paramString = paramString.substring(k + 1).split(" ");
        Entry.access$602((Entry)localObject2, true);
        Entry.access$702((Entry)localObject2, null);
        ((Entry)localObject2).setLengths(paramString);
        return;
      }
      if ((k == -1) && (i == "DIRTY".length()) && (paramString.startsWith("DIRTY")))
      {
        Entry.access$702((Entry)localObject2, new Editor((Entry)localObject2, null));
        return;
      }
    } while ((k == -1) && (i == "READ".length()) && (paramString.startsWith("READ")));
    throw new IOException("unexpected journal line: " + paramString);
  }
  
  private void rebuildJournal()
    throws IOException
  {
    for (;;)
    {
      Entry localEntry;
      try
      {
        if (journalWriter != null) {
          journalWriter.close();
        }
        BufferedSink localBufferedSink = Okio.buffer(Okio.sink(new FileOutputStream(journalFileTmp)));
        try
        {
          localBufferedSink.writeUtf8("libcore.io.DiskLruCache").writeByte(10);
          localBufferedSink.writeUtf8("1").writeByte(10);
          localBufferedSink.writeUtf8(Integer.toString(appVersion)).writeByte(10);
          localBufferedSink.writeUtf8(Integer.toString(valueCount)).writeByte(10);
          localBufferedSink.writeByte(10);
          Iterator localIterator = lruEntries.values().iterator();
          if (!localIterator.hasNext()) {
            break;
          }
          localEntry = (Entry)localIterator.next();
          if (currentEditor != null)
          {
            localBufferedSink.writeUtf8("DIRTY").writeByte(32);
            localBufferedSink.writeUtf8(key);
            localBufferedSink.writeByte(10);
            continue;
            localObject1 = finally;
          }
        }
        finally
        {
          localBufferedSink.close();
        }
        ((BufferedSink)localObject1).writeUtf8("CLEAN").writeByte(32);
      }
      finally {}
      ((BufferedSink)localObject1).writeUtf8(key);
      ((BufferedSink)localObject1).writeUtf8(localEntry.getLengths());
      ((BufferedSink)localObject1).writeByte(10);
    }
    ((BufferedSink)localObject1).close();
    if (journalFile.exists()) {
      renameTo(journalFile, journalFileBackup, true);
    }
    renameTo(journalFileTmp, journalFile, false);
    journalFileBackup.delete();
    journalWriter = Okio.buffer(Okio.sink(new FileOutputStream(journalFile, true)));
  }
  
  private static void renameTo(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramBoolean) {
      deleteIfExists(paramFile2);
    }
    if (!paramFile1.renameTo(paramFile2)) {
      throw new IOException();
    }
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
    if (!LEGAL_KEY_PATTERN.matcher(paramString).matches()) {
      throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,64}: \"" + paramString + "\"");
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
        localObject1 = lruEntries.values().toArray();
        int j = localObject1.length;
        int i = 0;
        if (i < j)
        {
          Entry localEntry = (Entry)localObject1[i];
          if (currentEditor != null) {
            currentEditor.abort();
          }
        }
        else
        {
          trimToSize();
          journalWriter.close();
          journalWriter = null;
          continue;
        }
        i += 1;
      }
      finally {}
    }
  }
  
  public void delete()
    throws IOException
  {
    close();
    Util.deleteContents(directory);
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
    //   6: invokespecial 326	com/squareup/okhttp/internal/DiskLruCache:checkNotClosed	()V
    //   9: aload_0
    //   10: aload_1
    //   11: invokespecial 329	com/squareup/okhttp/internal/DiskLruCache:validateKey	(Ljava/lang/String;)V
    //   14: aload_0
    //   15: getfield 105	com/squareup/okhttp/internal/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   18: aload_1
    //   19: invokevirtual 332	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   22: checkcast 18	com/squareup/okhttp/internal/DiskLruCache$Entry
    //   25: astore 6
    //   27: aload 6
    //   29: ifnonnull +10 -> 39
    //   32: aload 4
    //   34: astore_3
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_3
    //   38: areturn
    //   39: aload 4
    //   41: astore_3
    //   42: aload 6
    //   44: invokestatic 226	com/squareup/okhttp/internal/DiskLruCache$Entry:access$600	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Z
    //   47: ifeq -12 -> 35
    //   50: aload_0
    //   51: getfield 155	com/squareup/okhttp/internal/DiskLruCache:valueCount	I
    //   54: anewarray 558	java/io/InputStream
    //   57: astore 5
    //   59: iconst_0
    //   60: istore_2
    //   61: iload_2
    //   62: aload_0
    //   63: getfield 155	com/squareup/okhttp/internal/DiskLruCache:valueCount	I
    //   66: if_icmpge +65 -> 131
    //   69: aload 5
    //   71: iload_2
    //   72: new 560	java/io/FileInputStream
    //   75: dup
    //   76: aload 6
    //   78: iload_2
    //   79: invokevirtual 259	com/squareup/okhttp/internal/DiskLruCache$Entry:getCleanFile	(I)Ljava/io/File;
    //   82: invokespecial 561	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   85: aastore
    //   86: iload_2
    //   87: iconst_1
    //   88: iadd
    //   89: istore_2
    //   90: goto -29 -> 61
    //   93: astore_1
    //   94: iconst_0
    //   95: istore_2
    //   96: aload 4
    //   98: astore_3
    //   99: iload_2
    //   100: aload_0
    //   101: getfield 155	com/squareup/okhttp/internal/DiskLruCache:valueCount	I
    //   104: if_icmpge -69 -> 35
    //   107: aload 4
    //   109: astore_3
    //   110: aload 5
    //   112: iload_2
    //   113: aaload
    //   114: ifnull -79 -> 35
    //   117: aload 5
    //   119: iload_2
    //   120: aaload
    //   121: invokestatic 366	com/squareup/okhttp/internal/Util:closeQuietly	(Ljava/io/Closeable;)V
    //   124: iload_2
    //   125: iconst_1
    //   126: iadd
    //   127: istore_2
    //   128: goto -32 -> 96
    //   131: aload_0
    //   132: aload_0
    //   133: getfield 205	com/squareup/okhttp/internal/DiskLruCache:redundantOpCount	I
    //   136: iconst_1
    //   137: iadd
    //   138: putfield 205	com/squareup/okhttp/internal/DiskLruCache:redundantOpCount	I
    //   141: aload_0
    //   142: getfield 161	com/squareup/okhttp/internal/DiskLruCache:journalWriter	Lokio/BufferedSink;
    //   145: ldc 49
    //   147: invokeinterface 289 2 0
    //   152: bipush 32
    //   154: invokeinterface 293 2 0
    //   159: aload_1
    //   160: invokeinterface 289 2 0
    //   165: bipush 10
    //   167: invokeinterface 293 2 0
    //   172: pop
    //   173: aload_0
    //   174: invokespecial 189	com/squareup/okhttp/internal/DiskLruCache:journalRebuildRequired	()Z
    //   177: ifeq +14 -> 191
    //   180: aload_0
    //   181: getfield 133	com/squareup/okhttp/internal/DiskLruCache:executorService	Ljava/util/concurrent/ThreadPoolExecutor;
    //   184: aload_0
    //   185: getfield 138	com/squareup/okhttp/internal/DiskLruCache:cleanupRunnable	Ljava/lang/Runnable;
    //   188: invokevirtual 311	java/util/concurrent/ThreadPoolExecutor:execute	(Ljava/lang/Runnable;)V
    //   191: new 21	com/squareup/okhttp/internal/DiskLruCache$Snapshot
    //   194: dup
    //   195: aload_0
    //   196: aload_1
    //   197: aload 6
    //   199: invokestatic 336	com/squareup/okhttp/internal/DiskLruCache$Entry:access$1200	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)J
    //   202: aload 5
    //   204: aload 6
    //   206: invokestatic 267	com/squareup/okhttp/internal/DiskLruCache$Entry:access$1000	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J
    //   209: aconst_null
    //   210: invokespecial 564	com/squareup/okhttp/internal/DiskLruCache$Snapshot:<init>	(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[JLcom/squareup/okhttp/internal/DiskLruCache$1;)V
    //   213: astore_3
    //   214: goto -179 -> 35
    //   217: astore_1
    //   218: aload_0
    //   219: monitorexit
    //   220: aload_1
    //   221: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	222	0	this	DiskLruCache
    //   0	222	1	paramString	String
    //   60	68	2	i	int
    //   34	180	3	localObject1	Object
    //   1	107	4	localObject2	Object
    //   57	146	5	arrayOfInputStream	InputStream[]
    //   25	180	6	localEntry	Entry
    // Exception table:
    //   from	to	target	type
    //   61	86	93	java/io/FileNotFoundException
    //   5	27	217	finally
    //   42	59	217	finally
    //   61	86	217	finally
    //   99	107	217	finally
    //   117	124	217	finally
    //   131	191	217	finally
    //   191	214	217	finally
  }
  
  public File getDirectory()
  {
    return directory;
  }
  
  public long getMaxSize()
  {
    try
    {
      long l = maxSize;
      return l;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean isClosed()
  {
    return journalWriter == null;
  }
  
  /* Error */
  public boolean remove(String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 326	com/squareup/okhttp/internal/DiskLruCache:checkNotClosed	()V
    //   6: aload_0
    //   7: aload_1
    //   8: invokespecial 329	com/squareup/okhttp/internal/DiskLruCache:validateKey	(Ljava/lang/String;)V
    //   11: aload_0
    //   12: getfield 105	com/squareup/okhttp/internal/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   15: aload_1
    //   16: invokevirtual 332	java/util/LinkedHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   19: checkcast 18	com/squareup/okhttp/internal/DiskLruCache$Entry
    //   22: astore 4
    //   24: aload 4
    //   26: ifnull +15 -> 41
    //   29: aload 4
    //   31: invokestatic 221	com/squareup/okhttp/internal/DiskLruCache$Entry:access$700	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    //   34: astore 5
    //   36: aload 5
    //   38: ifnull +9 -> 47
    //   41: iconst_0
    //   42: istore_3
    //   43: aload_0
    //   44: monitorexit
    //   45: iload_3
    //   46: ireturn
    //   47: iconst_0
    //   48: istore_2
    //   49: iload_2
    //   50: aload_0
    //   51: getfield 155	com/squareup/okhttp/internal/DiskLruCache:valueCount	I
    //   54: if_icmpge +43 -> 97
    //   57: aload 4
    //   59: iload_2
    //   60: invokevirtual 259	com/squareup/okhttp/internal/DiskLruCache$Entry:getCleanFile	(I)Ljava/io/File;
    //   63: invokestatic 275	com/squareup/okhttp/internal/DiskLruCache:deleteIfExists	(Ljava/io/File;)V
    //   66: aload_0
    //   67: aload_0
    //   68: getfield 97	com/squareup/okhttp/internal/DiskLruCache:size	J
    //   71: aload 4
    //   73: invokestatic 267	com/squareup/okhttp/internal/DiskLruCache$Entry:access$1000	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J
    //   76: iload_2
    //   77: laload
    //   78: lsub
    //   79: putfield 97	com/squareup/okhttp/internal/DiskLruCache:size	J
    //   82: aload 4
    //   84: invokestatic 267	com/squareup/okhttp/internal/DiskLruCache$Entry:access$1000	(Lcom/squareup/okhttp/internal/DiskLruCache$Entry;)[J
    //   87: iload_2
    //   88: lconst_0
    //   89: lastore
    //   90: iload_2
    //   91: iconst_1
    //   92: iadd
    //   93: istore_2
    //   94: goto -45 -> 49
    //   97: aload_0
    //   98: aload_0
    //   99: getfield 205	com/squareup/okhttp/internal/DiskLruCache:redundantOpCount	I
    //   102: iconst_1
    //   103: iadd
    //   104: putfield 205	com/squareup/okhttp/internal/DiskLruCache:redundantOpCount	I
    //   107: aload_0
    //   108: getfield 161	com/squareup/okhttp/internal/DiskLruCache:journalWriter	Lokio/BufferedSink;
    //   111: ldc 51
    //   113: invokeinterface 289 2 0
    //   118: bipush 32
    //   120: invokeinterface 293 2 0
    //   125: aload_1
    //   126: invokeinterface 289 2 0
    //   131: bipush 10
    //   133: invokeinterface 293 2 0
    //   138: pop
    //   139: aload_0
    //   140: getfield 105	com/squareup/okhttp/internal/DiskLruCache:lruEntries	Ljava/util/LinkedHashMap;
    //   143: aload_1
    //   144: invokevirtual 315	java/util/LinkedHashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   147: pop
    //   148: aload_0
    //   149: invokespecial 189	com/squareup/okhttp/internal/DiskLruCache:journalRebuildRequired	()Z
    //   152: ifeq +14 -> 166
    //   155: aload_0
    //   156: getfield 133	com/squareup/okhttp/internal/DiskLruCache:executorService	Ljava/util/concurrent/ThreadPoolExecutor;
    //   159: aload_0
    //   160: getfield 138	com/squareup/okhttp/internal/DiskLruCache:cleanupRunnable	Ljava/lang/Runnable;
    //   163: invokevirtual 311	java/util/concurrent/ThreadPoolExecutor:execute	(Ljava/lang/Runnable;)V
    //   166: iconst_1
    //   167: istore_3
    //   168: goto -125 -> 43
    //   171: astore_1
    //   172: aload_0
    //   173: monitorexit
    //   174: aload_1
    //   175: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	176	0	this	DiskLruCache
    //   0	176	1	paramString	String
    //   48	46	2	i	int
    //   42	126	3	bool	boolean
    //   22	61	4	localEntry	Entry
    //   34	3	5	localEditor	Editor
    // Exception table:
    //   from	to	target	type
    //   2	24	171	finally
    //   29	36	171	finally
    //   49	90	171	finally
    //   97	166	171	finally
  }
  
  public void setMaxSize(long paramLong)
  {
    try
    {
      maxSize = paramLong;
      executorService.execute(cleanupRunnable);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
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
    private boolean committed;
    private final DiskLruCache.Entry entry;
    private boolean hasErrors;
    private final boolean[] written;
    
    private Editor(DiskLruCache.Entry paramEntry)
    {
      entry = paramEntry;
      if (DiskLruCache.Entry.access$600(paramEntry)) {}
      for (this$1 = null;; this$1 = new boolean[valueCount])
      {
        written = DiskLruCache.this;
        return;
      }
    }
    
    public void abort()
      throws IOException
    {
      DiskLruCache.this.completeEdit(this, false);
    }
    
    public void abortUnlessCommitted()
    {
      if (!committed) {}
      try
      {
        abort();
        return;
      }
      catch (IOException localIOException) {}
    }
    
    public void commit()
      throws IOException
    {
      if (hasErrors)
      {
        DiskLruCache.this.completeEdit(this, false);
        remove(DiskLruCache.Entry.access$1100(entry));
      }
      for (;;)
      {
        committed = true;
        return;
        DiskLruCache.this.completeEdit(this, true);
      }
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
      try
      {
        FileInputStream localFileInputStream = new FileInputStream(entry.getCleanFile(paramInt));
        return localFileInputStream;
      }
      catch (FileNotFoundException localFileNotFoundException) {}
      return null;
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
      if (!DiskLruCache.Entry.access$600(entry)) {
        written[paramInt] = true;
      }
      File localFile = entry.getDirtyFile(paramInt);
      try
      {
        Object localObject2 = new FileOutputStream(localFile);
        localObject2 = new FaultHidingOutputStream((OutputStream)localObject2, null);
        return (OutputStream)localObject2;
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        for (;;)
        {
          directory.mkdirs();
          try
          {
            FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
          }
          catch (FileNotFoundException localFileNotFoundException2)
          {
            OutputStream localOutputStream = DiskLruCache.NULL_OUTPUT_STREAM;
            return localOutputStream;
          }
        }
      }
    }
    
    public void set(int paramInt, String paramString)
      throws IOException
    {
      BufferedSink localBufferedSink = Okio.buffer(Okio.sink(newOutputStream(paramInt)));
      localBufferedSink.writeUtf8(paramString);
      localBufferedSink.close();
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
          DiskLruCache.Editor.access$2302(DiskLruCache.Editor.this, true);
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
          DiskLruCache.Editor.access$2302(DiskLruCache.Editor.this, true);
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
          DiskLruCache.Editor.access$2302(DiskLruCache.Editor.this, true);
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
          DiskLruCache.Editor.access$2302(DiskLruCache.Editor.this, true);
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
    private final long[] lengths;
    private final long sequenceNumber;
    
    private Snapshot(String paramString, long paramLong, InputStream[] paramArrayOfInputStream, long[] paramArrayOfLong)
    {
      key = paramString;
      sequenceNumber = paramLong;
      ins = paramArrayOfInputStream;
      lengths = paramArrayOfLong;
    }
    
    public void close()
    {
      InputStream[] arrayOfInputStream = ins;
      int j = arrayOfInputStream.length;
      int i = 0;
      while (i < j)
      {
        Util.closeQuietly(arrayOfInputStream[i]);
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
    
    public long getLength(int paramInt)
    {
      return lengths[paramInt];
    }
    
    public String getString(int paramInt)
      throws IOException
    {
      return DiskLruCache.inputStreamToString(getInputStream(paramInt));
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.DiskLruCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */