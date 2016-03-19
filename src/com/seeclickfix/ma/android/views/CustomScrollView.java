package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.ScrollView;
import com.seeclickfix.ma.android.views.platform.PlatformSpecificScrollerFactory;
import com.seeclickfix.ma.android.views.platform.SimpleScrollerCompat;
import java.lang.reflect.Field;

public class CustomScrollView
  extends ScrollView
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "CustomScrollView";
  private LayoutChangedListener layoutListener;
  private Object myScroller;
  
  public CustomScrollView(Context paramContext)
  {
    super(paramContext);
    init();
  }
  
  public CustomScrollView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init();
  }
  
  public CustomScrollView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }
  
  private void init()
  {
    try
    {
      Object localObject = getClass();
      Class localClass;
      do
      {
        localClass = ((Class)localObject).getSuperclass();
        localObject = localClass;
      } while (!localClass.getName().equals("android.widget.ScrollView"));
      Log.i("Scroller", "class: " + localClass.getName());
      localObject = localClass.getDeclaredField("mScroller");
      ((Field)localObject).setAccessible(true);
      myScroller = ((Field)localObject).get(this);
      return;
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      localNoSuchFieldException.printStackTrace();
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      localIllegalArgumentException.printStackTrace();
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      localIllegalAccessException.printStackTrace();
    }
  }
  
  public void customSmoothScrollBy(int paramInt1, int paramInt2)
  {
    if (myScroller == null) {
      smoothScrollBy(paramInt1, paramInt2);
    }
    while (getChildCount() == 0) {
      return;
    }
    int i = getWidth();
    int j = getPaddingRight();
    int k = getPaddingLeft();
    j = Math.max(0, getChildAt(0).getWidth() - (i - j - k));
    i = getScrollX();
    k = getHeight();
    int m = getPaddingTop();
    int n = getPaddingBottom();
    m = Math.max(0, getChildAt(0).getBottom() - (k - m - n));
    k = getScrollY();
    paramInt1 = Math.max(0, Math.min(i + paramInt1, j));
    paramInt2 = Math.max(0, Math.min(k + paramInt2, m));
    PlatformSpecificScrollerFactory.getPlatformScroller(myScroller).startScroll(i, k, paramInt1 - i, paramInt2 - k, 1500);
    invalidate();
  }
  
  public void customSmoothScrollTo(int paramInt1, int paramInt2)
  {
    customSmoothScrollBy(paramInt1 - getScrollX(), paramInt2 - getScrollY());
  }
  
  public LayoutChangedListener getLayoutListener()
  {
    return layoutListener;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (layoutListener != null) {
      layoutListener.onChangeLayout();
    }
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
  }
  
  public void setLayoutListener(LayoutChangedListener paramLayoutChangedListener)
  {
    layoutListener = paramLayoutChangedListener;
  }
  
  public static abstract interface LayoutChangedListener
  {
    public abstract void onChangeLayout();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.CustomScrollView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */