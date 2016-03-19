package uk.co.senab.photoview;

import android.graphics.Matrix;
import android.view.animation.Interpolator;
import android.widget.ImageView;

class PhotoViewAttacher$AnimatedZoomRunnable
  implements Runnable
{
  private final float mFocalX;
  private final float mFocalY;
  private final long mStartTime;
  private final float mZoomEnd;
  private final float mZoomStart;
  
  public PhotoViewAttacher$AnimatedZoomRunnable(PhotoViewAttacher paramPhotoViewAttacher, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    mFocalX = paramFloat3;
    mFocalY = paramFloat4;
    mStartTime = System.currentTimeMillis();
    mZoomStart = paramFloat1;
    mZoomEnd = paramFloat2;
  }
  
  private float interpolate()
  {
    float f = Math.min(1.0F, (float)(System.currentTimeMillis() - mStartTime) * 1.0F / 200.0F);
    return PhotoViewAttacher.sInterpolator.getInterpolation(f);
  }
  
  public void run()
  {
    ImageView localImageView = this$0.getImageView();
    if (localImageView == null) {}
    float f1;
    do
    {
      return;
      f1 = interpolate();
      float f2 = (mZoomStart + (mZoomEnd - mZoomStart) * f1) / this$0.getScale();
      PhotoViewAttacher.access$100(this$0).postScale(f2, f2, mFocalX, mFocalY);
      PhotoViewAttacher.access$200(this$0);
    } while (f1 >= 1.0F);
    Compat.postOnAnimation(localImageView, this);
  }
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.PhotoViewAttacher.AnimatedZoomRunnable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */