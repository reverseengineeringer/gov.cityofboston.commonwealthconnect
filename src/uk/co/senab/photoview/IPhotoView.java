package uk.co.senab.photoview;

import android.graphics.Matrix;
import android.graphics.RectF;
import android.view.View.OnLongClickListener;
import android.widget.ImageView.ScaleType;

public abstract interface IPhotoView
{
  public abstract boolean canZoom();
  
  public abstract Matrix getDisplayMatrix();
  
  public abstract RectF getDisplayRect();
  
  @Deprecated
  public abstract float getMaxScale();
  
  public abstract float getMaximumScale();
  
  public abstract float getMediumScale();
  
  @Deprecated
  public abstract float getMidScale();
  
  @Deprecated
  public abstract float getMinScale();
  
  public abstract float getMinimumScale();
  
  public abstract float getScale();
  
  public abstract ImageView.ScaleType getScaleType();
  
  public abstract void setAllowParentInterceptOnEdge(boolean paramBoolean);
  
  public abstract boolean setDisplayMatrix(Matrix paramMatrix);
  
  @Deprecated
  public abstract void setMaxScale(float paramFloat);
  
  public abstract void setMaximumScale(float paramFloat);
  
  public abstract void setMediumScale(float paramFloat);
  
  @Deprecated
  public abstract void setMidScale(float paramFloat);
  
  @Deprecated
  public abstract void setMinScale(float paramFloat);
  
  public abstract void setMinimumScale(float paramFloat);
  
  public abstract void setOnLongClickListener(View.OnLongClickListener paramOnLongClickListener);
  
  public abstract void setOnMatrixChangeListener(PhotoViewAttacher.OnMatrixChangedListener paramOnMatrixChangedListener);
  
  public abstract void setOnPhotoTapListener(PhotoViewAttacher.OnPhotoTapListener paramOnPhotoTapListener);
  
  public abstract void setOnViewTapListener(PhotoViewAttacher.OnViewTapListener paramOnViewTapListener);
  
  public abstract void setPhotoViewRotation(float paramFloat);
  
  public abstract void setScale(float paramFloat);
  
  public abstract void setScale(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean);
  
  public abstract void setScale(float paramFloat, boolean paramBoolean);
  
  public abstract void setScaleType(ImageView.ScaleType paramScaleType);
  
  public abstract void setZoomable(boolean paramBoolean);
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.IPhotoView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */