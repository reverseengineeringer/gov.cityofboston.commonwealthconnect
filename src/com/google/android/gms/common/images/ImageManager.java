package com.google.android.gms.common.images;

import android.app.ActivityManager;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.ResultReceiver;
import android.os.SystemClock;
import android.util.Log;
import android.widget.ImageView;
import com.google.android.gms.internal.jc;
import com.google.android.gms.internal.je;
import com.google.android.gms.internal.kj;
import com.google.android.gms.internal.ll;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public final class ImageManager
{
  private static final Object Lu = new Object();
  private static HashSet<Uri> Lv = new HashSet();
  private static ImageManager Lw;
  private static ImageManager Lx;
  private final jc LA;
  private final Map<a, ImageReceiver> LB;
  private final Map<Uri, ImageReceiver> LC;
  private final Map<Uri, Long> LD;
  private final ExecutorService Ly;
  private final b Lz;
  private final Context mContext;
  private final Handler mHandler;
  
  private ImageManager(Context paramContext, boolean paramBoolean)
  {
    mContext = paramContext.getApplicationContext();
    mHandler = new Handler(Looper.getMainLooper());
    Ly = Executors.newFixedThreadPool(4);
    if (paramBoolean)
    {
      Lz = new b(mContext);
      if (ll.ij()) {
        hd();
      }
    }
    for (;;)
    {
      LA = new jc();
      LB = new HashMap();
      LC = new HashMap();
      LD = new HashMap();
      return;
      Lz = null;
    }
  }
  
  private Bitmap a(a.a parama)
  {
    if (Lz == null) {
      return null;
    }
    return (Bitmap)Lz.get(parama);
  }
  
  public static ImageManager c(Context paramContext, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      if (Lx == null) {
        Lx = new ImageManager(paramContext, true);
      }
      return Lx;
    }
    if (Lw == null) {
      Lw = new ImageManager(paramContext, false);
    }
    return Lw;
  }
  
  public static ImageManager create(Context paramContext)
  {
    return c(paramContext, false);
  }
  
  private void hd()
  {
    mContext.registerComponentCallbacks(new e(Lz));
  }
  
  public void a(a parama)
  {
    je.aU("ImageManager.loadImage() must be called in the main thread");
    new d(parama).run();
  }
  
  public void loadImage(ImageView paramImageView, int paramInt)
  {
    a(new a.b(paramImageView, paramInt));
  }
  
  public void loadImage(ImageView paramImageView, Uri paramUri)
  {
    a(new a.b(paramImageView, paramUri));
  }
  
  public void loadImage(ImageView paramImageView, Uri paramUri, int paramInt)
  {
    paramImageView = new a.b(paramImageView, paramUri);
    paramImageView.az(paramInt);
    a(paramImageView);
  }
  
  public void loadImage(OnImageLoadedListener paramOnImageLoadedListener, Uri paramUri)
  {
    a(new a.c(paramOnImageLoadedListener, paramUri));
  }
  
  public void loadImage(OnImageLoadedListener paramOnImageLoadedListener, Uri paramUri, int paramInt)
  {
    paramOnImageLoadedListener = new a.c(paramOnImageLoadedListener, paramUri);
    paramOnImageLoadedListener.az(paramInt);
    a(paramOnImageLoadedListener);
  }
  
  private final class ImageReceiver
    extends ResultReceiver
  {
    private final ArrayList<a> LE;
    private final Uri mUri;
    
    ImageReceiver(Uri paramUri)
    {
      super();
      mUri = paramUri;
      LE = new ArrayList();
    }
    
    public void b(a parama)
    {
      je.aU("ImageReceiver.addImageRequest() must be called in the main thread");
      LE.add(parama);
    }
    
    public void c(a parama)
    {
      je.aU("ImageReceiver.removeImageRequest() must be called in the main thread");
      LE.remove(parama);
    }
    
    public void hg()
    {
      Intent localIntent = new Intent("com.google.android.gms.common.images.LOAD_IMAGE");
      localIntent.putExtra("com.google.android.gms.extras.uri", mUri);
      localIntent.putExtra("com.google.android.gms.extras.resultReceiver", this);
      localIntent.putExtra("com.google.android.gms.extras.priority", 3);
      ImageManager.b(ImageManager.this).sendBroadcast(localIntent);
    }
    
    public void onReceiveResult(int paramInt, Bundle paramBundle)
    {
      paramBundle = (ParcelFileDescriptor)paramBundle.getParcelable("com.google.android.gms.extra.fileDescriptor");
      ImageManager.f(ImageManager.this).execute(new ImageManager.c(ImageManager.this, mUri, paramBundle));
    }
  }
  
  public static abstract interface OnImageLoadedListener
  {
    public abstract void onImageLoaded(Uri paramUri, Drawable paramDrawable, boolean paramBoolean);
  }
  
  private static final class a
  {
    static int a(ActivityManager paramActivityManager)
    {
      return paramActivityManager.getLargeMemoryClass();
    }
  }
  
  private static final class b
    extends kj<a.a, Bitmap>
  {
    public b(Context paramContext)
    {
      super();
    }
    
    private static int I(Context paramContext)
    {
      ActivityManager localActivityManager = (ActivityManager)paramContext.getSystemService("activity");
      if ((getApplicationInfoflags & 0x100000) != 0)
      {
        i = 1;
        if ((i == 0) || (!ll.ig())) {
          break label55;
        }
      }
      label55:
      for (int i = ImageManager.a.a(localActivityManager);; i = localActivityManager.getMemoryClass())
      {
        return (int)(i * 1048576 * 0.33F);
        i = 0;
        break;
      }
    }
    
    protected int a(a.a parama, Bitmap paramBitmap)
    {
      return paramBitmap.getHeight() * paramBitmap.getRowBytes();
    }
    
    protected void a(boolean paramBoolean, a.a parama, Bitmap paramBitmap1, Bitmap paramBitmap2)
    {
      super.entryRemoved(paramBoolean, parama, paramBitmap1, paramBitmap2);
    }
  }
  
  private final class c
    implements Runnable
  {
    private final ParcelFileDescriptor LG;
    private final Uri mUri;
    
    public c(Uri paramUri, ParcelFileDescriptor paramParcelFileDescriptor)
    {
      mUri = paramUri;
      LG = paramParcelFileDescriptor;
    }
    
    public void run()
    {
      je.aV("LoadBitmapFromDiskRunnable can't be executed in the main thread");
      boolean bool1 = false;
      boolean bool2 = false;
      Bitmap localBitmap = null;
      CountDownLatch localCountDownLatch = null;
      if (LG != null) {}
      try
      {
        localBitmap = BitmapFactory.decodeFileDescriptor(LG.getFileDescriptor());
        bool1 = bool2;
        Object localObject;
        return;
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        try
        {
          for (;;)
          {
            LG.close();
            localCountDownLatch = new CountDownLatch(1);
            ImageManager.g(ImageManager.this).post(new ImageManager.f(ImageManager.this, mUri, localBitmap, bool1, localCountDownLatch));
            try
            {
              localCountDownLatch.await();
              return;
            }
            catch (InterruptedException localInterruptedException)
            {
              Log.w("ImageManager", "Latch interrupted while posting " + mUri);
            }
            localOutOfMemoryError = localOutOfMemoryError;
            Log.e("ImageManager", "OOM while loading bitmap for uri: " + mUri, localOutOfMemoryError);
            bool1 = true;
            localObject = localCountDownLatch;
          }
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            Log.e("ImageManager", "closed failed", localIOException);
          }
        }
      }
    }
  }
  
  private final class d
    implements Runnable
  {
    private final a LH;
    
    public d(a parama)
    {
      LH = parama;
    }
    
    public void run()
    {
      je.aU("LoadImageRunnable must be executed on the main thread");
      Object localObject1 = (ImageManager.ImageReceiver)ImageManager.a(ImageManager.this).get(LH);
      if (localObject1 != null)
      {
        ImageManager.a(ImageManager.this).remove(LH);
        ((ImageManager.ImageReceiver)localObject1).c(LH);
      }
      a.a locala = LH.LJ;
      if (uri == null)
      {
        LH.a(ImageManager.b(ImageManager.this), ImageManager.c(ImageManager.this), true);
        return;
      }
      localObject1 = ImageManager.a(ImageManager.this, locala);
      if (localObject1 != null)
      {
        LH.a(ImageManager.b(ImageManager.this), (Bitmap)localObject1, true);
        return;
      }
      localObject1 = (Long)ImageManager.d(ImageManager.this).get(uri);
      if (localObject1 != null)
      {
        if (SystemClock.elapsedRealtime() - ((Long)localObject1).longValue() < 3600000L)
        {
          LH.a(ImageManager.b(ImageManager.this), ImageManager.c(ImageManager.this), true);
          return;
        }
        ImageManager.d(ImageManager.this).remove(uri);
      }
      LH.a(ImageManager.b(ImageManager.this), ImageManager.c(ImageManager.this));
      ??? = (ImageManager.ImageReceiver)ImageManager.e(ImageManager.this).get(uri);
      localObject1 = ???;
      if (??? == null)
      {
        localObject1 = new ImageManager.ImageReceiver(ImageManager.this, uri);
        ImageManager.e(ImageManager.this).put(uri, localObject1);
      }
      ((ImageManager.ImageReceiver)localObject1).b(LH);
      if (!(LH instanceof a.c)) {
        ImageManager.a(ImageManager.this).put(LH, localObject1);
      }
      synchronized (ImageManager.he())
      {
        if (!ImageManager.hf().contains(uri))
        {
          ImageManager.hf().add(uri);
          ((ImageManager.ImageReceiver)localObject1).hg();
        }
        return;
      }
    }
  }
  
  private static final class e
    implements ComponentCallbacks2
  {
    private final ImageManager.b Lz;
    
    public e(ImageManager.b paramb)
    {
      Lz = paramb;
    }
    
    public void onConfigurationChanged(Configuration paramConfiguration) {}
    
    public void onLowMemory()
    {
      Lz.evictAll();
    }
    
    public void onTrimMemory(int paramInt)
    {
      if (paramInt >= 60) {
        Lz.evictAll();
      }
      while (paramInt < 20) {
        return;
      }
      Lz.trimToSize(Lz.size() / 2);
    }
  }
  
  private final class f
    implements Runnable
  {
    private boolean LI;
    private final Bitmap mBitmap;
    private final Uri mUri;
    private final CountDownLatch mr;
    
    public f(Uri paramUri, Bitmap paramBitmap, boolean paramBoolean, CountDownLatch paramCountDownLatch)
    {
      mUri = paramUri;
      mBitmap = paramBitmap;
      LI = paramBoolean;
      mr = paramCountDownLatch;
    }
    
    private void a(ImageManager.ImageReceiver paramImageReceiver, boolean paramBoolean)
    {
      paramImageReceiver = ImageManager.ImageReceiver.a(paramImageReceiver);
      int j = paramImageReceiver.size();
      int i = 0;
      if (i < j)
      {
        a locala = (a)paramImageReceiver.get(i);
        if (paramBoolean) {
          locala.a(ImageManager.b(ImageManager.this), mBitmap, false);
        }
        for (;;)
        {
          if (!(locala instanceof a.c)) {
            ImageManager.a(ImageManager.this).remove(locala);
          }
          i += 1;
          break;
          ImageManager.d(ImageManager.this).put(mUri, Long.valueOf(SystemClock.elapsedRealtime()));
          locala.a(ImageManager.b(ImageManager.this), ImageManager.c(ImageManager.this), false);
        }
      }
    }
    
    public void run()
    {
      je.aU("OnBitmapLoadedRunnable must be executed in the main thread");
      boolean bool;
      if (mBitmap != null) {
        bool = true;
      }
      while (ImageManager.h(ImageManager.this) != null) {
        if (LI)
        {
          ImageManager.h(ImageManager.this).evictAll();
          System.gc();
          LI = false;
          ImageManager.g(ImageManager.this).post(this);
          return;
          bool = false;
        }
        else if (bool)
        {
          ImageManager.h(ImageManager.this).put(new a.a(mUri), mBitmap);
        }
      }
      ??? = (ImageManager.ImageReceiver)ImageManager.e(ImageManager.this).remove(mUri);
      if (??? != null) {
        a((ImageManager.ImageReceiver)???, bool);
      }
      mr.countDown();
      synchronized (ImageManager.he())
      {
        ImageManager.hf().remove(mUri);
        return;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.common.images.ImageManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */