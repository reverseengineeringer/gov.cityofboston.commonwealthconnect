package android.support.v4.view;

import android.view.View;
import java.lang.ref.WeakReference;

class ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl$Starter
  implements Runnable
{
  WeakReference<View> mViewRef;
  ViewPropertyAnimatorCompat mVpa;
  
  private ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl$Starter(ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl paramBaseViewPropertyAnimatorCompatImpl, ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
  {
    mViewRef = new WeakReference(paramView);
    mVpa = paramViewPropertyAnimatorCompat;
  }
  
  public void run()
  {
    ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl.access$200(this$0, mVpa, (View)mViewRef.get());
  }
}

/* Location:
 * Qualified Name:     android.support.v4.view.ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl.Starter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */