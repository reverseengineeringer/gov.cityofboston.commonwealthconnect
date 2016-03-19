package android.support.v4.view;

import android.view.View;

class ViewPropertyAnimatorCompat$ICSViewPropertyAnimatorCompatImpl$MyVpaListener
  implements ViewPropertyAnimatorListener
{
  ViewPropertyAnimatorCompat mVpa;
  
  ViewPropertyAnimatorCompat$ICSViewPropertyAnimatorCompatImpl$MyVpaListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat)
  {
    mVpa = paramViewPropertyAnimatorCompat;
  }
  
  public void onAnimationCancel(View paramView)
  {
    Object localObject = paramView.getTag(2113929216);
    ViewPropertyAnimatorListener localViewPropertyAnimatorListener = null;
    if ((localObject instanceof ViewPropertyAnimatorListener)) {
      localViewPropertyAnimatorListener = (ViewPropertyAnimatorListener)localObject;
    }
    if (localViewPropertyAnimatorListener != null) {
      localViewPropertyAnimatorListener.onAnimationCancel(paramView);
    }
  }
  
  public void onAnimationEnd(View paramView)
  {
    if (ViewPropertyAnimatorCompat.access$400(mVpa) >= 0)
    {
      ViewCompat.setLayerType(paramView, ViewPropertyAnimatorCompat.access$400(mVpa), null);
      ViewPropertyAnimatorCompat.access$402(mVpa, -1);
    }
    if (ViewPropertyAnimatorCompat.access$000(mVpa) != null) {
      ViewPropertyAnimatorCompat.access$000(mVpa).run();
    }
    Object localObject = paramView.getTag(2113929216);
    ViewPropertyAnimatorListener localViewPropertyAnimatorListener = null;
    if ((localObject instanceof ViewPropertyAnimatorListener)) {
      localViewPropertyAnimatorListener = (ViewPropertyAnimatorListener)localObject;
    }
    if (localViewPropertyAnimatorListener != null) {
      localViewPropertyAnimatorListener.onAnimationEnd(paramView);
    }
  }
  
  public void onAnimationStart(View paramView)
  {
    if (ViewPropertyAnimatorCompat.access$400(mVpa) >= 0) {
      ViewCompat.setLayerType(paramView, 2, null);
    }
    if (ViewPropertyAnimatorCompat.access$100(mVpa) != null) {
      ViewPropertyAnimatorCompat.access$100(mVpa).run();
    }
    Object localObject = paramView.getTag(2113929216);
    ViewPropertyAnimatorListener localViewPropertyAnimatorListener = null;
    if ((localObject instanceof ViewPropertyAnimatorListener)) {
      localViewPropertyAnimatorListener = (ViewPropertyAnimatorListener)localObject;
    }
    if (localViewPropertyAnimatorListener != null) {
      localViewPropertyAnimatorListener.onAnimationStart(paramView);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.view.ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl.MyVpaListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */