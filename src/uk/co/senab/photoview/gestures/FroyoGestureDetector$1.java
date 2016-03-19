package uk.co.senab.photoview.gestures;

import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;

class FroyoGestureDetector$1
  implements ScaleGestureDetector.OnScaleGestureListener
{
  FroyoGestureDetector$1(FroyoGestureDetector paramFroyoGestureDetector) {}
  
  public boolean onScale(ScaleGestureDetector paramScaleGestureDetector)
  {
    this$0.mListener.onScale(paramScaleGestureDetector.getScaleFactor(), paramScaleGestureDetector.getFocusX(), paramScaleGestureDetector.getFocusY());
    return true;
  }
  
  public boolean onScaleBegin(ScaleGestureDetector paramScaleGestureDetector)
  {
    return true;
  }
  
  public void onScaleEnd(ScaleGestureDetector paramScaleGestureDetector) {}
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.gestures.FroyoGestureDetector.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */