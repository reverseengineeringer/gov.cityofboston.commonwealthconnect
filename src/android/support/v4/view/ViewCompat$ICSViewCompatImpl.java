package android.support.v4.view;

import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

class ViewCompat$ICSViewCompatImpl
  extends ViewCompat.HCViewCompatImpl
{
  static boolean accessibilityDelegateCheckFailed = false;
  static Field mAccessibilityDelegateField;
  
  public ViewPropertyAnimatorCompat animate(View paramView)
  {
    if (mViewPropertyAnimatorCompatMap == null) {
      mViewPropertyAnimatorCompatMap = new WeakHashMap();
    }
    ViewPropertyAnimatorCompat localViewPropertyAnimatorCompat2 = (ViewPropertyAnimatorCompat)mViewPropertyAnimatorCompatMap.get(paramView);
    ViewPropertyAnimatorCompat localViewPropertyAnimatorCompat1 = localViewPropertyAnimatorCompat2;
    if (localViewPropertyAnimatorCompat2 == null)
    {
      localViewPropertyAnimatorCompat1 = new ViewPropertyAnimatorCompat(paramView);
      mViewPropertyAnimatorCompatMap.put(paramView, localViewPropertyAnimatorCompat1);
    }
    return localViewPropertyAnimatorCompat1;
  }
  
  public boolean canScrollHorizontally(View paramView, int paramInt)
  {
    return ViewCompatICS.canScrollHorizontally(paramView, paramInt);
  }
  
  public boolean canScrollVertically(View paramView, int paramInt)
  {
    return ViewCompatICS.canScrollVertically(paramView, paramInt);
  }
  
  /* Error */
  public boolean hasAccessibilityDelegate(View paramView)
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_2
    //   2: getstatic 15	android/support/v4/view/ViewCompat$ICSViewCompatImpl:accessibilityDelegateCheckFailed	Z
    //   5: ifeq +5 -> 10
    //   8: iconst_0
    //   9: ireturn
    //   10: getstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
    //   13: ifnonnull +20 -> 33
    //   16: ldc 58
    //   18: ldc 60
    //   20: invokevirtual 66	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   23: putstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
    //   26: getstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
    //   29: iconst_1
    //   30: invokevirtual 72	java/lang/reflect/Field:setAccessible	(Z)V
    //   33: getstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
    //   36: aload_1
    //   37: invokevirtual 73	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   40: astore_1
    //   41: aload_1
    //   42: ifnull +12 -> 54
    //   45: iload_2
    //   46: ireturn
    //   47: astore_1
    //   48: iconst_1
    //   49: putstatic 15	android/support/v4/view/ViewCompat$ICSViewCompatImpl:accessibilityDelegateCheckFailed	Z
    //   52: iconst_0
    //   53: ireturn
    //   54: iconst_0
    //   55: istore_2
    //   56: goto -11 -> 45
    //   59: astore_1
    //   60: iconst_1
    //   61: putstatic 15	android/support/v4/view/ViewCompat$ICSViewCompatImpl:accessibilityDelegateCheckFailed	Z
    //   64: iconst_0
    //   65: ireturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	66	0	this	ICSViewCompatImpl
    //   0	66	1	paramView	View
    //   1	55	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   16	33	47	java/lang/Throwable
    //   33	41	59	java/lang/Throwable
  }
  
  public void onInitializeAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    ViewCompatICS.onInitializeAccessibilityEvent(paramView, paramAccessibilityEvent);
  }
  
  public void onInitializeAccessibilityNodeInfo(View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
  {
    ViewCompatICS.onInitializeAccessibilityNodeInfo(paramView, paramAccessibilityNodeInfoCompat.getInfo());
  }
  
  public void onPopulateAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    ViewCompatICS.onPopulateAccessibilityEvent(paramView, paramAccessibilityEvent);
  }
  
  public void setAccessibilityDelegate(View paramView, AccessibilityDelegateCompat paramAccessibilityDelegateCompat)
  {
    ViewCompatICS.setAccessibilityDelegate(paramView, paramAccessibilityDelegateCompat.getBridge());
  }
}

/* Location:
 * Qualified Name:     android.support.v4.view.ViewCompat.ICSViewCompatImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */