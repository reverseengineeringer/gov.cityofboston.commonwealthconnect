package uk.co.senab.photoview;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.widget.ImageView;
import uk.co.senab.photoview.log.LogManager;
import uk.co.senab.photoview.log.Logger;
import uk.co.senab.photoview.scrollerproxy.ScrollerProxy;

class PhotoViewAttacher$FlingRunnable
  implements Runnable
{
  private int mCurrentX;
  private int mCurrentY;
  private final ScrollerProxy mScroller;
  
  public PhotoViewAttacher$FlingRunnable(PhotoViewAttacher paramPhotoViewAttacher, Context paramContext)
  {
    mScroller = ScrollerProxy.getScroller(paramContext);
  }
  
  public void cancelFling()
  {
    if (PhotoViewAttacher.access$300()) {
      LogManager.getLogger().d("PhotoViewAttacher", "Cancel Fling");
    }
    mScroller.forceFinished(true);
  }
  
  public void fling(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    RectF localRectF = this$0.getDisplayRect();
    if (localRectF == null) {
      return;
    }
    int i = Math.round(-left);
    int k;
    int j;
    label56:
    int n;
    int m;
    if (paramInt1 < localRectF.width())
    {
      k = 0;
      j = Math.round(localRectF.width() - paramInt1);
      paramInt1 = k;
      k = Math.round(-top);
      if (paramInt2 >= localRectF.height()) {
        break label223;
      }
      n = 0;
      m = Math.round(localRectF.height() - paramInt2);
    }
    for (paramInt2 = n;; paramInt2 = k)
    {
      mCurrentX = i;
      mCurrentY = k;
      if (PhotoViewAttacher.access$300()) {
        LogManager.getLogger().d("PhotoViewAttacher", "fling. StartX:" + i + " StartY:" + k + " MaxX:" + j + " MaxY:" + m);
      }
      if ((i == j) && (k == m)) {
        break;
      }
      mScroller.fling(i, k, paramInt3, paramInt4, paramInt1, j, paramInt2, m, 0, 0);
      return;
      j = i;
      paramInt1 = i;
      break label56;
      label223:
      m = k;
    }
  }
  
  public void run()
  {
    if (mScroller.isFinished()) {}
    ImageView localImageView;
    do
    {
      return;
      localImageView = this$0.getImageView();
    } while ((localImageView == null) || (!mScroller.computeScrollOffset()));
    int i = mScroller.getCurrX();
    int j = mScroller.getCurrY();
    if (PhotoViewAttacher.access$300()) {
      LogManager.getLogger().d("PhotoViewAttacher", "fling run(). CurrentX:" + mCurrentX + " CurrentY:" + mCurrentY + " NewX:" + i + " NewY:" + j);
    }
    PhotoViewAttacher.access$100(this$0).postTranslate(mCurrentX - i, mCurrentY - j);
    PhotoViewAttacher.access$400(this$0, this$0.getDrawMatrix());
    mCurrentX = i;
    mCurrentY = j;
    Compat.postOnAnimation(localImageView, this);
  }
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.PhotoViewAttacher.FlingRunnable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */