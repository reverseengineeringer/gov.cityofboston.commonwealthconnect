package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.DecelerateInterpolator;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.actionbarsherlock.R.attr;
import com.actionbarsherlock.R.id;
import com.actionbarsherlock.R.layout;
import com.actionbarsherlock.R.styleable;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet.Builder;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.view.animation.AnimatorProxy;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineLinearLayout;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.view.ActionMode;

public class ActionBarContextView
  extends AbsActionBarView
  implements Animator.AnimatorListener
{
  private static final int ANIMATE_IDLE = 0;
  private static final int ANIMATE_IN = 1;
  private static final int ANIMATE_OUT = 2;
  private boolean mAnimateInOnLayout;
  private int mAnimationMode;
  private NineLinearLayout mClose;
  private Animator mCurrentAnimation;
  private View mCustomView;
  private Drawable mSplitBackground;
  private CharSequence mSubtitle;
  private int mSubtitleStyleRes;
  private TextView mSubtitleView;
  private CharSequence mTitle;
  private LinearLayout mTitleLayout;
  private int mTitleStyleRes;
  private TextView mTitleView;
  
  public ActionBarContextView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionBarContextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.actionModeStyle);
  }
  
  public ActionBarContextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.SherlockActionMode, paramInt, 0);
    setBackgroundDrawable(paramContext.getDrawable(R.styleable.SherlockActionMode_background));
    mTitleStyleRes = paramContext.getResourceId(R.styleable.SherlockActionMode_titleTextStyle, 0);
    mSubtitleStyleRes = paramContext.getResourceId(R.styleable.SherlockActionMode_subtitleTextStyle, 0);
    mContentHeight = paramContext.getLayoutDimension(R.styleable.SherlockActionMode_height, 0);
    mSplitBackground = paramContext.getDrawable(R.styleable.SherlockActionMode_backgroundSplit);
    paramContext.recycle();
  }
  
  private void finishAnimation()
  {
    Animator localAnimator = mCurrentAnimation;
    if (localAnimator != null)
    {
      mCurrentAnimation = null;
      localAnimator.end();
    }
  }
  
  private void initTitle()
  {
    int m = 8;
    if (mTitleLayout == null)
    {
      LayoutInflater.from(getContext()).inflate(R.layout.abs__action_bar_title_item, this);
      mTitleLayout = ((LinearLayout)getChildAt(getChildCount() - 1));
      mTitleView = ((TextView)mTitleLayout.findViewById(R.id.abs__action_bar_title));
      mSubtitleView = ((TextView)mTitleLayout.findViewById(R.id.abs__action_bar_subtitle));
      if (mTitleStyleRes != 0) {
        mTitleView.setTextAppearance(mContext, mTitleStyleRes);
      }
      if (mSubtitleStyleRes != 0) {
        mSubtitleView.setTextAppearance(mContext, mSubtitleStyleRes);
      }
    }
    mTitleView.setText(mTitle);
    mSubtitleView.setText(mSubtitle);
    int i;
    int j;
    label167:
    Object localObject;
    if (!TextUtils.isEmpty(mTitle))
    {
      i = 1;
      if (TextUtils.isEmpty(mSubtitle)) {
        break label234;
      }
      j = 1;
      localObject = mSubtitleView;
      if (j == 0) {
        break label239;
      }
    }
    label234:
    label239:
    for (int k = 0;; k = 8)
    {
      ((TextView)localObject).setVisibility(k);
      localObject = mTitleLayout;
      if (i == 0)
      {
        i = m;
        if (j == 0) {}
      }
      else
      {
        i = 0;
      }
      ((LinearLayout)localObject).setVisibility(i);
      if (mTitleLayout.getParent() == null) {
        addView(mTitleLayout);
      }
      return;
      i = 0;
      break;
      j = 0;
      break label167;
    }
  }
  
  private Animator makeInAnimation()
  {
    mClose.setTranslationX(-mClose.getWidth() - mClose.getLayoutParams()).leftMargin);
    Object localObject1 = ObjectAnimator.ofFloat(mClose, "translationX", new float[] { 0.0F });
    ((ObjectAnimator)localObject1).setDuration(200L);
    ((ObjectAnimator)localObject1).addListener(this);
    ((ObjectAnimator)localObject1).setInterpolator(new DecelerateInterpolator());
    AnimatorSet localAnimatorSet = new AnimatorSet();
    localObject1 = localAnimatorSet.play((Animator)localObject1);
    if (mMenuView != null)
    {
      int i = mMenuView.getChildCount();
      if (i > 0)
      {
        int j = i - 1;
        i = 0;
        while (j >= 0)
        {
          Object localObject2 = AnimatorProxy.wrap(mMenuView.getChildAt(j));
          ((AnimatorProxy)localObject2).setScaleY(0.0F);
          localObject2 = ObjectAnimator.ofFloat(localObject2, "scaleY", new float[] { 0.0F, 1.0F });
          ((ObjectAnimator)localObject2).setDuration(100L);
          ((ObjectAnimator)localObject2).setStartDelay(i * 70);
          ((AnimatorSet.Builder)localObject1).with((Animator)localObject2);
          j -= 1;
          i += 1;
        }
      }
    }
    return localAnimatorSet;
  }
  
  private Animator makeOutAnimation()
  {
    Object localObject1 = ObjectAnimator.ofFloat(mClose, "translationX", new float[] { -mClose.getWidth() - mClose.getLayoutParams()).leftMargin });
    ((ObjectAnimator)localObject1).setDuration(200L);
    ((ObjectAnimator)localObject1).addListener(this);
    ((ObjectAnimator)localObject1).setInterpolator(new DecelerateInterpolator());
    AnimatorSet localAnimatorSet = new AnimatorSet();
    localObject1 = localAnimatorSet.play((Animator)localObject1);
    if ((mMenuView != null) && (mMenuView.getChildCount() > 0))
    {
      int i = 0;
      while (i < 0)
      {
        Object localObject2 = AnimatorProxy.wrap(mMenuView.getChildAt(i));
        ((AnimatorProxy)localObject2).setScaleY(0.0F);
        localObject2 = ObjectAnimator.ofFloat(localObject2, "scaleY", new float[] { 0.0F });
        ((ObjectAnimator)localObject2).setDuration(100L);
        ((ObjectAnimator)localObject2).setStartDelay(i * 70);
        ((AnimatorSet.Builder)localObject1).with((Animator)localObject2);
        i += 1;
      }
    }
    return localAnimatorSet;
  }
  
  public void closeMode()
  {
    if (mAnimationMode == 2) {
      return;
    }
    if (mClose == null)
    {
      killMode();
      return;
    }
    finishAnimation();
    mAnimationMode = 2;
    mCurrentAnimation = makeOutAnimation();
    mCurrentAnimation.start();
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ViewGroup.MarginLayoutParams(-1, -2);
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new ViewGroup.MarginLayoutParams(getContext(), paramAttributeSet);
  }
  
  public CharSequence getSubtitle()
  {
    return mSubtitle;
  }
  
  public CharSequence getTitle()
  {
    return mTitle;
  }
  
  public boolean hideOverflowMenu()
  {
    if (mActionMenuPresenter != null) {
      return mActionMenuPresenter.hideOverflowMenu();
    }
    return false;
  }
  
  public void initForMode(final ActionMode paramActionMode)
  {
    ViewGroup.LayoutParams localLayoutParams;
    if (mClose == null)
    {
      mClose = ((NineLinearLayout)LayoutInflater.from(mContext).inflate(R.layout.abs__action_mode_close_item, this, false));
      addView(mClose);
      mClose.findViewById(R.id.abs__action_mode_close_button).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramActionMode.finish();
        }
      });
      paramActionMode = (MenuBuilder)paramActionMode.getMenu();
      if (mActionMenuPresenter != null) {
        mActionMenuPresenter.dismissPopupMenus();
      }
      mActionMenuPresenter = new ActionMenuPresenter(mContext);
      mActionMenuPresenter.setReserveOverflow(true);
      localLayoutParams = new ViewGroup.LayoutParams(-2, -1);
      if (mSplitActionBar) {
        break label190;
      }
      paramActionMode.addMenuPresenter(mActionMenuPresenter);
      mMenuView = ((ActionMenuView)mActionMenuPresenter.getMenuView(this));
      mMenuView.setBackgroundDrawable(null);
      addView(mMenuView, localLayoutParams);
    }
    for (;;)
    {
      mAnimateInOnLayout = true;
      return;
      if (mClose.getParent() != null) {
        break;
      }
      addView(mClose);
      break;
      label190:
      mActionMenuPresenter.setWidthLimit(getContextgetResourcesgetDisplayMetricswidthPixels, true);
      mActionMenuPresenter.setItemLimit(Integer.MAX_VALUE);
      width = -1;
      height = mContentHeight;
      paramActionMode.addMenuPresenter(mActionMenuPresenter);
      mMenuView = ((ActionMenuView)mActionMenuPresenter.getMenuView(this));
      mMenuView.setBackgroundDrawable(mSplitBackground);
      mSplitView.addView(mMenuView, localLayoutParams);
    }
  }
  
  public boolean isOverflowMenuShowing()
  {
    if (mActionMenuPresenter != null) {
      return mActionMenuPresenter.isOverflowMenuShowing();
    }
    return false;
  }
  
  public void killMode()
  {
    finishAnimation();
    removeAllViews();
    if (mSplitView != null) {
      mSplitView.removeView(mMenuView);
    }
    mCustomView = null;
    mMenuView = null;
    mAnimateInOnLayout = false;
  }
  
  public void onAnimationCancel(Animator paramAnimator) {}
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    if (mAnimationMode == 2) {
      killMode();
    }
    mAnimationMode = 0;
  }
  
  public void onAnimationRepeat(Animator paramAnimator) {}
  
  public void onAnimationStart(Animator paramAnimator) {}
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (mActionMenuPresenter != null)
    {
      mActionMenuPresenter.hideOverflowMenu();
      mActionMenuPresenter.hideSubMenus();
    }
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    if (paramAccessibilityEvent.getEventType() == 32)
    {
      paramAccessibilityEvent.setClassName(getClass().getName());
      paramAccessibilityEvent.setPackageName(getContext().getPackageName());
      paramAccessibilityEvent.setContentDescription(mTitle);
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = getPaddingLeft();
    int j = getPaddingTop();
    int k = paramInt4 - paramInt2 - getPaddingTop() - getPaddingBottom();
    paramInt2 = i;
    if (mClose != null)
    {
      paramInt2 = i;
      if (mClose.getVisibility() != 8)
      {
        ViewGroup.MarginLayoutParams localMarginLayoutParams = (ViewGroup.MarginLayoutParams)mClose.getLayoutParams();
        paramInt2 = i + leftMargin;
        paramInt4 = paramInt2 + positionChild(mClose, paramInt2, j, k) + rightMargin;
        paramInt2 = paramInt4;
        if (mAnimateInOnLayout)
        {
          mAnimationMode = 1;
          mCurrentAnimation = makeInAnimation();
          mCurrentAnimation.start();
          mAnimateInOnLayout = false;
          paramInt2 = paramInt4;
        }
      }
    }
    paramInt4 = paramInt2;
    if (mTitleLayout != null)
    {
      paramInt4 = paramInt2;
      if (mCustomView == null) {
        paramInt4 = paramInt2 + positionChild(mTitleLayout, paramInt2, j, k);
      }
    }
    if (mCustomView != null) {
      positionChild(mCustomView, paramInt4, j, k);
    }
    paramInt1 = paramInt3 - paramInt1 - getPaddingRight();
    if (mMenuView != null) {
      positionChildInverse(mMenuView, paramInt1, j, k);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (View.MeasureSpec.getMode(paramInt1) != 1073741824) {
      throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_width=\"match_parent\" (or fill_parent)");
    }
    if (View.MeasureSpec.getMode(paramInt2) == 0) {
      throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_height=\"wrap_content\"");
    }
    int m = View.MeasureSpec.getSize(paramInt1);
    int i;
    int n;
    int k;
    int j;
    if (mContentHeight > 0)
    {
      i = mContentHeight;
      n = getPaddingTop() + getPaddingBottom();
      paramInt2 = m - getPaddingLeft() - getPaddingRight();
      k = i - n;
      j = View.MeasureSpec.makeMeasureSpec(k, Integer.MIN_VALUE);
      paramInt1 = paramInt2;
      Object localObject;
      if (mClose != null)
      {
        paramInt1 = measureChildView(mClose, paramInt2, j, 0);
        localObject = (ViewGroup.MarginLayoutParams)mClose.getLayoutParams();
        paramInt1 -= leftMargin + rightMargin;
      }
      paramInt2 = paramInt1;
      if (mMenuView != null)
      {
        paramInt2 = paramInt1;
        if (mMenuView.getParent() == this) {
          paramInt2 = measureChildView(mMenuView, paramInt1, j, 0);
        }
      }
      paramInt1 = paramInt2;
      if (mTitleLayout != null)
      {
        paramInt1 = paramInt2;
        if (mCustomView == null) {
          paramInt1 = measureChildView(mTitleLayout, paramInt2, j, 0);
        }
      }
      if (mCustomView != null)
      {
        localObject = mCustomView.getLayoutParams();
        if (width == -2) {
          break label435;
        }
        paramInt2 = 1073741824;
        label299:
        if (width < 0) {
          break label442;
        }
        paramInt1 = Math.min(width, paramInt1);
        label317:
        if (height == -2) {
          break label445;
        }
        j = 1073741824;
        label332:
        if (height < 0) {
          break label453;
        }
        k = Math.min(height, k);
      }
    }
    label435:
    label442:
    label445:
    label453:
    for (;;)
    {
      mCustomView.measure(View.MeasureSpec.makeMeasureSpec(paramInt1, paramInt2), View.MeasureSpec.makeMeasureSpec(k, j));
      if (mContentHeight > 0) {
        break label464;
      }
      paramInt2 = 0;
      k = getChildCount();
      paramInt1 = 0;
      while (paramInt1 < k)
      {
        j = getChildAt(paramInt1).getMeasuredHeight() + n;
        i = paramInt2;
        if (j > paramInt2) {
          i = j;
        }
        paramInt1 += 1;
        paramInt2 = i;
      }
      i = View.MeasureSpec.getSize(paramInt2);
      break;
      paramInt2 = Integer.MIN_VALUE;
      break label299;
      break label317;
      j = Integer.MIN_VALUE;
      break label332;
    }
    setMeasuredDimension(m, paramInt2);
    return;
    label464:
    setMeasuredDimension(m, i);
  }
  
  public void setContentHeight(int paramInt)
  {
    mContentHeight = paramInt;
  }
  
  public void setCustomView(View paramView)
  {
    if (mCustomView != null) {
      removeView(mCustomView);
    }
    mCustomView = paramView;
    if (mTitleLayout != null)
    {
      removeView(mTitleLayout);
      mTitleLayout = null;
    }
    if (paramView != null) {
      addView(paramView);
    }
    requestLayout();
  }
  
  public void setSplitActionBar(boolean paramBoolean)
  {
    ViewGroup.LayoutParams localLayoutParams;
    ViewGroup localViewGroup;
    if (mSplitActionBar != paramBoolean) {
      if (mActionMenuPresenter != null)
      {
        localLayoutParams = new ViewGroup.LayoutParams(-2, -1);
        if (paramBoolean) {
          break label91;
        }
        mMenuView = ((ActionMenuView)mActionMenuPresenter.getMenuView(this));
        mMenuView.setBackgroundDrawable(null);
        localViewGroup = (ViewGroup)mMenuView.getParent();
        if (localViewGroup != null) {
          localViewGroup.removeView(mMenuView);
        }
        addView(mMenuView, localLayoutParams);
      }
    }
    for (;;)
    {
      super.setSplitActionBar(paramBoolean);
      return;
      label91:
      mActionMenuPresenter.setWidthLimit(getContextgetResourcesgetDisplayMetricswidthPixels, true);
      mActionMenuPresenter.setItemLimit(Integer.MAX_VALUE);
      width = -1;
      height = mContentHeight;
      mMenuView = ((ActionMenuView)mActionMenuPresenter.getMenuView(this));
      mMenuView.setBackgroundDrawable(mSplitBackground);
      localViewGroup = (ViewGroup)mMenuView.getParent();
      if (localViewGroup != null) {
        localViewGroup.removeView(mMenuView);
      }
      mSplitView.addView(mMenuView, localLayoutParams);
    }
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    mSubtitle = paramCharSequence;
    initTitle();
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mTitle = paramCharSequence;
    initTitle();
  }
  
  public boolean shouldDelayChildPressedState()
  {
    return false;
  }
  
  public boolean showOverflowMenu()
  {
    if (mActionMenuPresenter != null) {
      return mActionMenuPresenter.showOverflowMenu();
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.ActionBarContextView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */