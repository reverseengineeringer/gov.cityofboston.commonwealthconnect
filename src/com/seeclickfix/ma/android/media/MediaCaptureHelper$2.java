package com.seeclickfix.ma.android.media;

import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.ImageView;

class MediaCaptureHelper$2
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  MediaCaptureHelper$2(MediaCaptureHelper paramMediaCaptureHelper) {}
  
  public void onGlobalLayout()
  {
    MediaCaptureHelper.access$900(this$0).getViewTreeObserver().removeGlobalOnLayoutListener(this);
    if ((MediaCaptureHelper.access$900(this$0).getHeight() == 0) || (MediaCaptureHelper.access$900(this$0).getWidth() == 0)) {
      MediaCaptureHelper.access$602(this$0, true);
    }
    MediaCaptureHelper.access$1000(this$0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.MediaCaptureHelper.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */