package com.seeclickfix.ma.android.media;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory.Options;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.os.Environment;
import android.os.StatFs;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.util.LruCache;
import android.util.Log;
import com.seeclickfix.ma.android.androidsdk.APIUtil;
import com.seeclickfix.ma.android.cache.DiskLruCache;
import com.seeclickfix.ma.android.cache.DiskLruCache.Snapshot;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.SoftReference;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;
import java.util.Iterator;

public class ImageCache
{
  private static final boolean D = false;
  private static final Bitmap.CompressFormat DEFAULT_COMPRESS_FORMAT = Bitmap.CompressFormat.JPEG;
  private static final int DEFAULT_COMPRESS_QUALITY = 70;
  private static final boolean DEFAULT_DISK_CACHE_ENABLED = true;
  private static final int DEFAULT_DISK_CACHE_SIZE = 10485760;
  private static final boolean DEFAULT_INIT_DISK_CACHE_ON_CREATE = false;
  private static final boolean DEFAULT_MEM_CACHE_ENABLED = true;
  private static final int DEFAULT_MEM_CACHE_SIZE = 5120;
  private static final int DISK_CACHE_INDEX = 0;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ImageCache";
  private ImageCacheParams mCacheParams;
  private final Object mDiskCacheLock = new Object();
  private boolean mDiskCacheStarting = true;
  private DiskLruCache mDiskLruCache;
  private LruCache<String, BitmapDrawable> mMemoryCache;
  private HashSet<SoftReference<Bitmap>> mReusableBitmaps;
  
  private ImageCache(ImageCacheParams paramImageCacheParams)
  {
    init(paramImageCacheParams);
  }
  
  private static String bytesToHexString(byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 0;
    while (i < paramArrayOfByte.length)
    {
      String str = Integer.toHexString(paramArrayOfByte[i] & 0xFF);
      if (str.length() == 1) {
        localStringBuilder.append('0');
      }
      localStringBuilder.append(str);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  private static boolean canUseForInBitmap(Bitmap paramBitmap, BitmapFactory.Options paramOptions)
  {
    int i = outWidth / inSampleSize;
    int j = outHeight / inSampleSize;
    return (paramBitmap.getWidth() == i) && (paramBitmap.getHeight() == j);
  }
  
  private static RetainFragment findOrCreateRetainFragment(FragmentManager paramFragmentManager)
  {
    RetainFragment localRetainFragment2 = (RetainFragment)paramFragmentManager.findFragmentByTag("ImageCache");
    RetainFragment localRetainFragment1 = localRetainFragment2;
    if (localRetainFragment2 == null)
    {
      localRetainFragment1 = new RetainFragment();
      paramFragmentManager.beginTransaction().add(localRetainFragment1, "ImageCache").commitAllowingStateLoss();
    }
    return localRetainFragment1;
  }
  
  @TargetApi(12)
  public static int getBitmapSize(BitmapDrawable paramBitmapDrawable)
  {
    paramBitmapDrawable = paramBitmapDrawable.getBitmap();
    paramBitmapDrawable.getRowBytes();
    paramBitmapDrawable.getHeight();
    paramBitmapDrawable.getByteCount();
    if (APIUtil.hasHoneycombMR1()) {
      return paramBitmapDrawable.getByteCount();
    }
    return paramBitmapDrawable.getRowBytes() * paramBitmapDrawable.getHeight();
  }
  
  public static File getDiskCacheDir(Context paramContext, String paramString)
  {
    try
    {
      if (("mounted".equals(Environment.getExternalStorageState())) || (!isExternalStorageRemovable())) {}
      for (paramContext = getExternalCacheDir(paramContext).getPath();; paramContext = paramContext.getCacheDir().getPath()) {
        return new File(paramContext + File.separator + paramString);
      }
      return null;
    }
    catch (Exception paramContext) {}
  }
  
  @TargetApi(8)
  public static File getExternalCacheDir(Context paramContext)
  {
    if (APIUtil.hasFroyo()) {
      return paramContext.getExternalCacheDir();
    }
    paramContext = "/Android/data/" + paramContext.getPackageName() + "/cache/";
    return new File(Environment.getExternalStorageDirectory().getPath() + paramContext);
  }
  
  public static ImageCache getInstance(FragmentManager paramFragmentManager, ImageCacheParams paramImageCacheParams)
  {
    RetainFragment localRetainFragment = findOrCreateRetainFragment(paramFragmentManager);
    ImageCache localImageCache = (ImageCache)localRetainFragment.getObject();
    paramFragmentManager = localImageCache;
    if (localImageCache == null)
    {
      paramFragmentManager = new ImageCache(paramImageCacheParams);
      localRetainFragment.setObject(paramFragmentManager);
    }
    return paramFragmentManager;
  }
  
  @TargetApi(9)
  public static long getUsableSpace(File paramFile)
  {
    if (APIUtil.hasGingerbread()) {
      return paramFile.getUsableSpace();
    }
    paramFile = new StatFs(paramFile.getPath());
    return paramFile.getBlockSize() * paramFile.getAvailableBlocks();
  }
  
  public static String hashKeyForDisk(String paramString)
  {
    try
    {
      Object localObject = MessageDigest.getInstance("MD5");
      ((MessageDigest)localObject).update(paramString.getBytes());
      localObject = bytesToHexString(((MessageDigest)localObject).digest());
      return (String)localObject;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException) {}
    return String.valueOf(paramString.hashCode());
  }
  
  private void init(ImageCacheParams paramImageCacheParams)
  {
    mCacheParams = paramImageCacheParams;
    if (mCacheParams.memoryCacheEnabled)
    {
      if (APIUtil.hasHoneycomb()) {
        mReusableBitmaps = new HashSet();
      }
      mMemoryCache = new LruCache(mCacheParams.memCacheSize)
      {
        protected void entryRemoved(boolean paramAnonymousBoolean, String paramAnonymousString, BitmapDrawable paramAnonymousBitmapDrawable1, BitmapDrawable paramAnonymousBitmapDrawable2)
        {
          if (RecyclingBitmapDrawable.class.isInstance(paramAnonymousBitmapDrawable1)) {
            ((RecyclingBitmapDrawable)paramAnonymousBitmapDrawable1).setIsCached(false);
          }
          while (!APIUtil.hasHoneycomb()) {
            return;
          }
          mReusableBitmaps.add(new SoftReference(paramAnonymousBitmapDrawable1.getBitmap()));
        }
        
        protected int sizeOf(String paramAnonymousString, BitmapDrawable paramAnonymousBitmapDrawable)
        {
          int j = ImageCache.getBitmapSize(paramAnonymousBitmapDrawable) / 1024;
          int i = j;
          if (j == 0) {
            i = 1;
          }
          return i;
        }
      };
    }
    if (initDiskCacheOnCreate) {
      initDiskCache();
    }
  }
  
  @TargetApi(9)
  public static boolean isExternalStorageRemovable()
  {
    if (APIUtil.hasGingerbread()) {
      return Environment.isExternalStorageRemovable();
    }
    return true;
  }
  
  /* Error */
  public void addBitmapToCache(String paramString, BitmapDrawable paramBitmapDrawable)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +7 -> 8
    //   4: aload_2
    //   5: ifnonnull +4 -> 9
    //   8: return
    //   9: aload_0
    //   10: getfield 306	com/seeclickfix/ma/android/media/ImageCache:mMemoryCache	Landroid/support/v4/util/LruCache;
    //   13: ifnull +31 -> 44
    //   16: ldc_w 319
    //   19: aload_2
    //   20: invokevirtual 324	java/lang/Class:isInstance	(Ljava/lang/Object;)Z
    //   23: ifeq +11 -> 34
    //   26: aload_2
    //   27: checkcast 319	com/seeclickfix/ma/android/media/RecyclingBitmapDrawable
    //   30: iconst_1
    //   31: invokevirtual 328	com/seeclickfix/ma/android/media/RecyclingBitmapDrawable:setIsCached	(Z)V
    //   34: aload_0
    //   35: getfield 306	com/seeclickfix/ma/android/media/ImageCache:mMemoryCache	Landroid/support/v4/util/LruCache;
    //   38: aload_1
    //   39: aload_2
    //   40: invokevirtual 334	android/support/v4/util/LruCache:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   43: pop
    //   44: aload_0
    //   45: getfield 64	com/seeclickfix/ma/android/media/ImageCache:mDiskCacheLock	Ljava/lang/Object;
    //   48: astore 9
    //   50: aload 9
    //   52: monitorenter
    //   53: aload_0
    //   54: getfield 336	com/seeclickfix/ma/android/media/ImageCache:mDiskLruCache	Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    //   57: ifnull +156 -> 213
    //   60: aload_1
    //   61: invokestatic 338	com/seeclickfix/ma/android/media/ImageCache:hashKeyForDisk	(Ljava/lang/String;)Ljava/lang/String;
    //   64: astore 10
    //   66: aconst_null
    //   67: astore 6
    //   69: aconst_null
    //   70: astore 7
    //   72: aconst_null
    //   73: astore 8
    //   75: aconst_null
    //   76: astore_3
    //   77: aload 6
    //   79: astore 4
    //   81: aload 7
    //   83: astore 5
    //   85: aload 8
    //   87: astore_1
    //   88: aload_0
    //   89: getfield 336	com/seeclickfix/ma/android/media/ImageCache:mDiskLruCache	Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    //   92: aload 10
    //   94: invokevirtual 344	com/seeclickfix/ma/android/cache/DiskLruCache:get	(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Snapshot;
    //   97: astore 11
    //   99: aload 11
    //   101: ifnonnull +122 -> 223
    //   104: aload 6
    //   106: astore 4
    //   108: aload 7
    //   110: astore 5
    //   112: aload 8
    //   114: astore_1
    //   115: aload_0
    //   116: getfield 336	com/seeclickfix/ma/android/media/ImageCache:mDiskLruCache	Lcom/seeclickfix/ma/android/cache/DiskLruCache;
    //   119: aload 10
    //   121: invokevirtual 348	com/seeclickfix/ma/android/cache/DiskLruCache:edit	(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/DiskLruCache$Editor;
    //   124: astore 10
    //   126: aload 10
    //   128: ifnull +77 -> 205
    //   131: aload 6
    //   133: astore 4
    //   135: aload 7
    //   137: astore 5
    //   139: aload 8
    //   141: astore_1
    //   142: aload 10
    //   144: iconst_0
    //   145: invokevirtual 354	com/seeclickfix/ma/android/cache/DiskLruCache$Editor:newOutputStream	(I)Ljava/io/OutputStream;
    //   148: astore_3
    //   149: aload_3
    //   150: astore 4
    //   152: aload_3
    //   153: astore 5
    //   155: aload_3
    //   156: astore_1
    //   157: aload_2
    //   158: invokevirtual 157	android/graphics/drawable/BitmapDrawable:getBitmap	()Landroid/graphics/Bitmap;
    //   161: aload_0
    //   162: getfield 289	com/seeclickfix/ma/android/media/ImageCache:mCacheParams	Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;
    //   165: getfield 357	com/seeclickfix/ma/android/media/ImageCache$ImageCacheParams:compressFormat	Landroid/graphics/Bitmap$CompressFormat;
    //   168: aload_0
    //   169: getfield 289	com/seeclickfix/ma/android/media/ImageCache:mCacheParams	Lcom/seeclickfix/ma/android/media/ImageCache$ImageCacheParams;
    //   172: getfield 360	com/seeclickfix/ma/android/media/ImageCache$ImageCacheParams:compressQuality	I
    //   175: aload_3
    //   176: invokevirtual 364	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   179: pop
    //   180: aload_3
    //   181: astore 4
    //   183: aload_3
    //   184: astore 5
    //   186: aload_3
    //   187: astore_1
    //   188: aload 10
    //   190: invokevirtual 367	com/seeclickfix/ma/android/cache/DiskLruCache$Editor:commit	()V
    //   193: aload_3
    //   194: astore 4
    //   196: aload_3
    //   197: astore 5
    //   199: aload_3
    //   200: astore_1
    //   201: aload_3
    //   202: invokevirtual 372	java/io/OutputStream:close	()V
    //   205: aload_3
    //   206: ifnull +7 -> 213
    //   209: aload_3
    //   210: invokevirtual 372	java/io/OutputStream:close	()V
    //   213: aload 9
    //   215: monitorexit
    //   216: return
    //   217: astore_1
    //   218: aload 9
    //   220: monitorexit
    //   221: aload_1
    //   222: athrow
    //   223: aload 6
    //   225: astore 4
    //   227: aload 7
    //   229: astore 5
    //   231: aload 8
    //   233: astore_1
    //   234: aload 11
    //   236: iconst_0
    //   237: invokevirtual 378	com/seeclickfix/ma/android/cache/DiskLruCache$Snapshot:getInputStream	(I)Ljava/io/InputStream;
    //   240: invokevirtual 381	java/io/InputStream:close	()V
    //   243: goto -38 -> 205
    //   246: astore_2
    //   247: aload 4
    //   249: astore_1
    //   250: ldc 35
    //   252: new 79	java/lang/StringBuilder
    //   255: dup
    //   256: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   259: ldc_w 383
    //   262: invokevirtual 99	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   265: aload_2
    //   266: invokevirtual 386	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   269: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   272: invokestatic 392	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   275: pop
    //   276: aload 4
    //   278: ifnull -65 -> 213
    //   281: aload 4
    //   283: invokevirtual 372	java/io/OutputStream:close	()V
    //   286: goto -73 -> 213
    //   289: astore_1
    //   290: goto -77 -> 213
    //   293: astore_2
    //   294: aload 5
    //   296: astore_1
    //   297: ldc 35
    //   299: new 79	java/lang/StringBuilder
    //   302: dup
    //   303: invokespecial 80	java/lang/StringBuilder:<init>	()V
    //   306: ldc_w 383
    //   309: invokevirtual 99	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   312: aload_2
    //   313: invokevirtual 386	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   316: invokevirtual 103	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   319: invokestatic 392	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   322: pop
    //   323: aload 5
    //   325: ifnull -112 -> 213
    //   328: aload 5
    //   330: invokevirtual 372	java/io/OutputStream:close	()V
    //   333: goto -120 -> 213
    //   336: astore_1
    //   337: goto -124 -> 213
    //   340: astore_2
    //   341: aload_1
    //   342: ifnull +7 -> 349
    //   345: aload_1
    //   346: invokevirtual 372	java/io/OutputStream:close	()V
    //   349: aload_2
    //   350: athrow
    //   351: astore_1
    //   352: goto -139 -> 213
    //   355: astore_1
    //   356: goto -7 -> 349
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	359	0	this	ImageCache
    //   0	359	1	paramString	String
    //   0	359	2	paramBitmapDrawable	BitmapDrawable
    //   76	134	3	localOutputStream	java.io.OutputStream
    //   79	203	4	localObject1	Object
    //   83	246	5	localObject2	Object
    //   67	157	6	localObject3	Object
    //   70	158	7	localObject4	Object
    //   73	159	8	localObject5	Object
    //   48	171	9	localObject6	Object
    //   64	125	10	localObject7	Object
    //   97	138	11	localSnapshot	DiskLruCache.Snapshot
    // Exception table:
    //   from	to	target	type
    //   53	66	217	finally
    //   209	213	217	finally
    //   213	216	217	finally
    //   218	221	217	finally
    //   281	286	217	finally
    //   328	333	217	finally
    //   345	349	217	finally
    //   349	351	217	finally
    //   88	99	246	java/io/IOException
    //   115	126	246	java/io/IOException
    //   142	149	246	java/io/IOException
    //   157	180	246	java/io/IOException
    //   188	193	246	java/io/IOException
    //   201	205	246	java/io/IOException
    //   234	243	246	java/io/IOException
    //   281	286	289	java/io/IOException
    //   88	99	293	java/lang/Exception
    //   115	126	293	java/lang/Exception
    //   142	149	293	java/lang/Exception
    //   157	180	293	java/lang/Exception
    //   188	193	293	java/lang/Exception
    //   201	205	293	java/lang/Exception
    //   234	243	293	java/lang/Exception
    //   328	333	336	java/io/IOException
    //   88	99	340	finally
    //   115	126	340	finally
    //   142	149	340	finally
    //   157	180	340	finally
    //   188	193	340	finally
    //   201	205	340	finally
    //   234	243	340	finally
    //   250	276	340	finally
    //   297	323	340	finally
    //   209	213	351	java/io/IOException
    //   345	349	355	java/io/IOException
  }
  
  public void clearCache()
  {
    if (mMemoryCache != null) {
      mMemoryCache.evictAll();
    }
    synchronized (mDiskCacheLock)
    {
      mDiskCacheStarting = true;
      if (mDiskLruCache != null)
      {
        boolean bool = mDiskLruCache.isClosed();
        if (bool) {}
      }
      try
      {
        mDiskLruCache.delete();
        mDiskLruCache = null;
        initDiskCache();
        return;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          Log.e("ImageCache", "clearCache - " + localIOException);
        }
      }
    }
  }
  
  public void close()
  {
    synchronized (mDiskCacheLock)
    {
      DiskLruCache localDiskLruCache = mDiskLruCache;
      if (localDiskLruCache != null) {}
      try
      {
        if (!mDiskLruCache.isClosed())
        {
          mDiskLruCache.close();
          mDiskLruCache = null;
        }
        return;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          Log.e("ImageCache", "close - " + localIOException);
        }
      }
    }
  }
  
  public void flush()
  {
    synchronized (mDiskCacheLock)
    {
      DiskLruCache localDiskLruCache = mDiskLruCache;
      if (localDiskLruCache != null) {}
      try
      {
        mDiskLruCache.flush();
        return;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          Log.e("ImageCache", "flush - " + localIOException);
        }
      }
    }
  }
  
  public Bitmap getBitmapFromDiskCache(String paramString)
  {
    Object localObject8 = hashKeyForDisk(paramString);
    localObject4 = null;
    Bitmap localBitmap = null;
    synchronized (mDiskCacheLock)
    {
      for (;;)
      {
        boolean bool = mDiskCacheStarting;
        if (!bool) {
          break;
        }
        try
        {
          mDiskCacheLock.wait();
        }
        catch (InterruptedException paramString) {}
      }
      paramString = mDiskLruCache;
      Object localObject2 = localObject4;
      Object localObject5;
      Object localObject6;
      if (paramString != null)
      {
        localObject2 = null;
        localObject5 = null;
        localObject6 = null;
        paramString = (String)localObject2;
        localObject1 = localObject5;
      }
      try
      {
        localObject8 = mDiskLruCache.get((String)localObject8);
        paramString = localBitmap;
        localObject1 = localObject6;
        if (localObject8 != null)
        {
          paramString = (String)localObject2;
          localObject1 = localObject5;
          localObject2 = ((DiskLruCache.Snapshot)localObject8).getInputStream(0);
          paramString = localBitmap;
          localObject1 = localObject2;
          if (localObject2 != null)
          {
            paramString = (String)localObject2;
            localObject1 = localObject2;
            localBitmap = ImageResizer.decodeSampledBitmapFromDescriptor(((FileInputStream)localObject2).getFD(), Integer.MAX_VALUE, Integer.MAX_VALUE, this);
            paramString = localBitmap;
            localObject1 = localObject2;
          }
        }
        localObject2 = paramString;
      }
      catch (IOException localIOException3)
      {
        for (;;)
        {
          localObject1 = paramString;
          Log.e("ImageCache", "getBitmapFromDiskCache - " + localIOException3);
          localObject3 = localObject4;
          if (paramString != null) {
            try
            {
              paramString.close();
              localObject3 = localObject4;
            }
            catch (IOException paramString)
            {
              localObject3 = localObject4;
            }
          }
        }
      }
      finally
      {
        if (localObject1 == null) {}
      }
      try
      {
        ((InputStream)localObject1).close();
        localObject2 = paramString;
      }
      catch (IOException localIOException1)
      {
        try
        {
          ((InputStream)localObject1).close();
          throw paramString;
          paramString = finally;
          throw paramString;
          localIOException1 = localIOException1;
          localObject3 = paramString;
        }
        catch (IOException localIOException2)
        {
          for (;;) {}
        }
      }
      return (Bitmap)localObject2;
    }
  }
  
  public BitmapDrawable getBitmapFromMemCache(String paramString)
  {
    BitmapDrawable localBitmapDrawable = null;
    if (mMemoryCache != null) {
      localBitmapDrawable = (BitmapDrawable)mMemoryCache.get(paramString);
    }
    return localBitmapDrawable;
  }
  
  protected Bitmap getBitmapFromReusableSet(BitmapFactory.Options paramOptions)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    Iterator localIterator;
    if (mReusableBitmaps != null)
    {
      localObject1 = localObject2;
      if (!mReusableBitmaps.isEmpty()) {
        localIterator = mReusableBitmaps.iterator();
      }
    }
    for (;;)
    {
      localObject1 = localObject2;
      if (localIterator.hasNext())
      {
        localObject1 = (Bitmap)((SoftReference)localIterator.next()).get();
        if ((localObject1 != null) && (((Bitmap)localObject1).isMutable()))
        {
          if (!canUseForInBitmap((Bitmap)localObject1, paramOptions)) {
            continue;
          }
          localIterator.remove();
        }
      }
      else
      {
        return (Bitmap)localObject1;
      }
      localIterator.remove();
    }
  }
  
  public void initDiskCache()
  {
    synchronized (mDiskCacheLock)
    {
      File localFile;
      if ((mDiskLruCache == null) || (mDiskLruCache.isClosed()))
      {
        localFile = mCacheParams.diskCacheDir;
        if ((mCacheParams.diskCacheEnabled) && (localFile != null))
        {
          if (!localFile.exists()) {
            localFile.mkdirs();
          }
          long l = getUsableSpace(localFile);
          int i = mCacheParams.diskCacheSize;
          if (l <= i) {}
        }
      }
      try
      {
        mDiskLruCache = DiskLruCache.open(localFile, 1, 1, mCacheParams.diskCacheSize);
        mDiskCacheStarting = false;
        mDiskCacheLock.notifyAll();
        return;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          mCacheParams.diskCacheDir = null;
          Log.e("ImageCache", "initDiskCache - " + localIOException);
        }
      }
    }
  }
  
  public static class ImageCacheParams
  {
    public Bitmap.CompressFormat compressFormat = ImageCache.DEFAULT_COMPRESS_FORMAT;
    public int compressQuality = 70;
    public File diskCacheDir;
    public boolean diskCacheEnabled = true;
    public int diskCacheSize = 10485760;
    public boolean initDiskCacheOnCreate = false;
    public int memCacheSize = 5120;
    public boolean memoryCacheEnabled = true;
    
    public ImageCacheParams(Context paramContext, String paramString)
    {
      diskCacheDir = ImageCache.getDiskCacheDir(paramContext, paramString);
    }
    
    public void setMemCacheSizePercent(float paramFloat)
    {
      if ((paramFloat < 0.05F) || (paramFloat > 0.8F)) {
        throw new IllegalArgumentException("setMemCacheSizePercent - percent must be between 0.05 and 0.8 (inclusive)");
      }
      memCacheSize = Math.round((float)Runtime.getRuntime().maxMemory() * paramFloat / 1024.0F);
    }
  }
  
  public static class RetainFragment
    extends Fragment
  {
    private Object mObject;
    
    public Object getObject()
    {
      return mObject;
    }
    
    public void onCreate(Bundle paramBundle)
    {
      super.onCreate(paramBundle);
      setRetainInstance(true);
    }
    
    public void setObject(Object paramObject)
    {
      mObject = paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */