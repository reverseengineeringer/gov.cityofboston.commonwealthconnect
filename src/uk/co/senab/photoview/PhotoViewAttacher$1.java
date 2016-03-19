package uk.co.senab.photoview;

import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View.OnLongClickListener;

class PhotoViewAttacher$1
  extends GestureDetector.SimpleOnGestureListener
{
  PhotoViewAttacher$1(PhotoViewAttacher paramPhotoViewAttacher) {}
  
  public void onLongPress(MotionEvent paramMotionEvent)
  {
    if (PhotoViewAttacher.access$000(this$0) != null) {
      PhotoViewAttacher.access$000(this$0).onLongClick(this$0.getImageView());
    }
  }
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.PhotoViewAttacher.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */