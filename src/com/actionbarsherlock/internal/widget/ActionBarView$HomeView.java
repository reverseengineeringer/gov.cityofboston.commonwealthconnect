package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.accessibility.AccessibilityEvent;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import com.actionbarsherlock.R.id;
import java.util.List;

public class ActionBarView$HomeView
  extends FrameLayout
{
  private ImageView mIconView;
  private View mUpView;
  private int mUpWidth;
  
  public ActionBarView$HomeView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionBarView$HomeView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public boolean dispatchHoverEvent(MotionEvent paramMotionEvent)
  {
    return onHoverEvent(paramMotionEvent);
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    onPopulateAccessibilityEvent(paramAccessibilityEvent);
    return true;
  }
  
  public int getLeftOffset()
  {
    if (mUpView.getVisibility() == 8) {
      return mUpWidth;
    }
    return 0;
  }
  
  protected void onFinishInflate()
  {
    mUpView = findViewById(R.id.abs__up);
    mIconView = ((ImageView)findViewById(R.id.abs__home));
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = (paramInt4 - paramInt2) / 2;
    paramInt2 = 0;
    paramInt4 = paramInt1;
    if (mUpView.getVisibility() != 8)
    {
      localLayoutParams = (FrameLayout.LayoutParams)mUpView.getLayoutParams();
      paramInt2 = mUpView.getMeasuredHeight();
      paramInt4 = mUpView.getMeasuredWidth();
      j = i - paramInt2 / 2;
      mUpView.layout(0, j, paramInt4, j + paramInt2);
      paramInt2 = leftMargin + paramInt4 + rightMargin;
      paramInt4 = paramInt1 + paramInt2;
    }
    FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)mIconView.getLayoutParams();
    paramInt1 = mIconView.getMeasuredHeight();
    int j = mIconView.getMeasuredWidth();
    paramInt3 = (paramInt3 - paramInt4) / 2;
    paramInt2 += Math.max(leftMargin, paramInt3 - j / 2);
    paramInt3 = Math.max(topMargin, i - paramInt1 / 2);
    mIconView.layout(paramInt2, paramInt3, paramInt2 + j, paramInt3 + paramInt1);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    measureChildWithMargins(mUpView, paramInt1, 0, paramInt2, 0);
    FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)mUpView.getLayoutParams();
    mUpWidth = (leftMargin + mUpView.getMeasuredWidth() + rightMargin);
    int i;
    int j;
    if (mUpView.getVisibility() == 8)
    {
      i = 0;
      j = topMargin;
      int k = mUpView.getMeasuredHeight();
      int m = bottomMargin;
      measureChildWithMargins(mIconView, paramInt1, i, paramInt2, 0);
      localLayoutParams = (FrameLayout.LayoutParams)mIconView.getLayoutParams();
      i += leftMargin + mIconView.getMeasuredWidth() + rightMargin;
      j = Math.max(j + k + m, topMargin + mIconView.getMeasuredHeight() + bottomMargin);
      m = View.MeasureSpec.getMode(paramInt1);
      k = View.MeasureSpec.getMode(paramInt2);
      paramInt1 = View.MeasureSpec.getSize(paramInt1);
      paramInt2 = View.MeasureSpec.getSize(paramInt2);
      switch (m)
      {
      default: 
        paramInt1 = i;
        switch (k)
        {
        default: 
          label214:
          paramInt2 = j;
        }
        break;
      }
    }
    for (;;)
    {
      setMeasuredDimension(paramInt1, paramInt2);
      return;
      i = mUpWidth;
      break;
      paramInt1 = Math.min(i, paramInt1);
      break label214;
      break label214;
      paramInt2 = Math.min(j, paramInt2);
    }
  }
  
  public void onPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    if (Build.VERSION.SDK_INT >= 14) {
      super.onPopulateAccessibilityEvent(paramAccessibilityEvent);
    }
    CharSequence localCharSequence = getContentDescription();
    if (!TextUtils.isEmpty(localCharSequence)) {
      paramAccessibilityEvent.getText().add(localCharSequence);
    }
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    mIconView.setImageDrawable(paramDrawable);
  }
  
  public void setUp(boolean paramBoolean)
  {
    View localView = mUpView;
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      localView.setVisibility(i);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.ActionBarView.HomeView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */