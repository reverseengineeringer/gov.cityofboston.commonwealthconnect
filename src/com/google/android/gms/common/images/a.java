package com.google.android.gms.common.images;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.widget.ImageView;
import com.google.android.gms.internal.iz;
import com.google.android.gms.internal.ja;
import com.google.android.gms.internal.jb;
import com.google.android.gms.internal.jc;
import com.google.android.gms.internal.jc.a;
import com.google.android.gms.internal.je;
import com.google.android.gms.internal.jv;
import java.lang.ref.WeakReference;

public abstract class a
{
  final a LJ;
  protected int LK = 0;
  protected int LL = 0;
  protected boolean LM = false;
  protected ImageManager.OnImageLoadedListener LN;
  private boolean LO = true;
  private boolean LP = false;
  private boolean LQ = true;
  protected int LR;
  
  public a(Uri paramUri, int paramInt)
  {
    LJ = new a(paramUri);
    LL = paramInt;
  }
  
  private Drawable a(Context paramContext, jc paramjc, int paramInt)
  {
    Resources localResources = paramContext.getResources();
    if (LR > 0)
    {
      jc.a locala = new jc.a(paramInt, LR);
      Drawable localDrawable = (Drawable)paramjc.get(locala);
      paramContext = localDrawable;
      if (localDrawable == null)
      {
        localDrawable = localResources.getDrawable(paramInt);
        paramContext = localDrawable;
        if ((LR & 0x1) != 0) {
          paramContext = a(localResources, localDrawable);
        }
        paramjc.put(locala, paramContext);
      }
      return paramContext;
    }
    return localResources.getDrawable(paramInt);
  }
  
  protected Drawable a(Resources paramResources, Drawable paramDrawable)
  {
    return ja.a(paramResources, paramDrawable);
  }
  
  protected iz a(Drawable paramDrawable1, Drawable paramDrawable2)
  {
    if (paramDrawable1 != null)
    {
      localDrawable = paramDrawable1;
      if (!(paramDrawable1 instanceof iz)) {}
    }
    for (Drawable localDrawable = ((iz)paramDrawable1).hh();; localDrawable = null) {
      return new iz(localDrawable, paramDrawable2);
    }
  }
  
  void a(Context paramContext, Bitmap paramBitmap, boolean paramBoolean)
  {
    je.f(paramBitmap);
    Bitmap localBitmap = paramBitmap;
    if ((LR & 0x1) != 0) {
      localBitmap = ja.a(paramBitmap);
    }
    paramContext = new BitmapDrawable(paramContext.getResources(), localBitmap);
    if (LN != null) {
      LN.onImageLoaded(LJ.uri, paramContext, true);
    }
    a(paramContext, paramBoolean, false, true);
  }
  
  void a(Context paramContext, jc paramjc)
  {
    if (LQ)
    {
      Drawable localDrawable = null;
      if (LK != 0) {
        localDrawable = a(paramContext, paramjc, LK);
      }
      a(localDrawable, false, true, false);
    }
  }
  
  void a(Context paramContext, jc paramjc, boolean paramBoolean)
  {
    Drawable localDrawable = null;
    if (LL != 0) {
      localDrawable = a(paramContext, paramjc, LL);
    }
    if (LN != null) {
      LN.onImageLoaded(LJ.uri, localDrawable, false);
    }
    a(localDrawable, paramBoolean, false, false);
  }
  
  protected abstract void a(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3);
  
  public void az(int paramInt)
  {
    LL = paramInt;
  }
  
  protected boolean b(boolean paramBoolean1, boolean paramBoolean2)
  {
    return (LO) && (!paramBoolean2) && ((!paramBoolean1) || (LP));
  }
  
  static final class a
  {
    public final Uri uri;
    
    public a(Uri paramUri)
    {
      uri = paramUri;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof a)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      return jv.equal(uri, uri);
    }
    
    public int hashCode()
    {
      return jv.hashCode(new Object[] { uri });
    }
  }
  
  public static final class b
    extends a
  {
    private WeakReference<ImageView> LS;
    
    public b(ImageView paramImageView, int paramInt)
    {
      super(paramInt);
      je.f(paramImageView);
      LS = new WeakReference(paramImageView);
    }
    
    public b(ImageView paramImageView, Uri paramUri)
    {
      super(0);
      je.f(paramImageView);
      LS = new WeakReference(paramImageView);
    }
    
    private void a(ImageView paramImageView, Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      if ((!paramBoolean2) && (!paramBoolean3)) {}
      for (int i = 1; (i != 0) && ((paramImageView instanceof jb)); i = 0)
      {
        int j = ((jb)paramImageView).hj();
        if ((LL == 0) || (j != LL)) {
          break;
        }
        return;
      }
      paramBoolean1 = b(paramBoolean1, paramBoolean2);
      if ((LM) && (paramDrawable != null)) {
        paramDrawable = paramDrawable.getConstantState().newDrawable();
      }
      for (;;)
      {
        Object localObject = paramDrawable;
        if (paramBoolean1) {
          localObject = a(paramImageView.getDrawable(), paramDrawable);
        }
        paramImageView.setImageDrawable((Drawable)localObject);
        if ((paramImageView instanceof jb))
        {
          paramDrawable = (jb)paramImageView;
          if (!paramBoolean3) {
            break label171;
          }
          paramImageView = LJ.uri;
          label133:
          paramDrawable.g(paramImageView);
          if (i == 0) {
            break label176;
          }
        }
        label171:
        label176:
        for (i = LL;; i = 0)
        {
          paramDrawable.aB(i);
          if (!paramBoolean1) {
            break;
          }
          ((iz)localObject).startTransition(250);
          return;
          paramImageView = null;
          break label133;
        }
      }
    }
    
    protected void a(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      ImageView localImageView = (ImageView)LS.get();
      if (localImageView != null) {
        a(localImageView, paramDrawable, paramBoolean1, paramBoolean2, paramBoolean3);
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof b)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      Object localObject = (b)paramObject;
      paramObject = (ImageView)LS.get();
      localObject = (ImageView)LS.get();
      if ((localObject != null) && (paramObject != null) && (jv.equal(localObject, paramObject))) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public int hashCode()
    {
      return 0;
    }
  }
  
  public static final class c
    extends a
  {
    private WeakReference<ImageManager.OnImageLoadedListener> LT;
    
    public c(ImageManager.OnImageLoadedListener paramOnImageLoadedListener, Uri paramUri)
    {
      super(0);
      je.f(paramOnImageLoadedListener);
      LT = new WeakReference(paramOnImageLoadedListener);
    }
    
    protected void a(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      if (!paramBoolean2)
      {
        ImageManager.OnImageLoadedListener localOnImageLoadedListener = (ImageManager.OnImageLoadedListener)LT.get();
        if (localOnImageLoadedListener != null) {
          localOnImageLoadedListener.onImageLoaded(LJ.uri, paramDrawable, paramBoolean3);
        }
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof c)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      paramObject = (c)paramObject;
      ImageManager.OnImageLoadedListener localOnImageLoadedListener1 = (ImageManager.OnImageLoadedListener)LT.get();
      ImageManager.OnImageLoadedListener localOnImageLoadedListener2 = (ImageManager.OnImageLoadedListener)LT.get();
      if ((localOnImageLoadedListener2 != null) && (localOnImageLoadedListener1 != null) && (jv.equal(localOnImageLoadedListener2, localOnImageLoadedListener1)) && (jv.equal(LJ, LJ))) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public int hashCode()
    {
      return jv.hashCode(new Object[] { LJ });
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.common.images.a
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */