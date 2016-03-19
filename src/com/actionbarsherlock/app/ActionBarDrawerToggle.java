package com.actionbarsherlock.app;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.support.v4.widget.DrawerLayout;
import android.support.v4.widget.DrawerLayout.DrawerListener;
import android.view.View;
import com.actionbarsherlock.R.attr;
import com.actionbarsherlock.view.MenuItem;

public class ActionBarDrawerToggle
  implements DrawerLayout.DrawerListener
{
  private static final int ID_HOME = 16908332;
  private static final int[] THEME_ATTRS = { R.attr.homeAsUpIndicator };
  private final ActionBar mActionBar;
  private final int mCloseDrawerContentDescRes;
  private final Context mContext;
  private Drawable mDrawerImage;
  private final int mDrawerImageResource;
  private boolean mDrawerIndicatorEnabled = true;
  private final DrawerLayout mDrawerLayout;
  private final int mOpenDrawerContentDescRes;
  private SlideDrawable mSlider;
  private Drawable mThemeImage;
  
  public ActionBarDrawerToggle(Activity paramActivity, ActionBar paramActionBar, DrawerLayout paramDrawerLayout, int paramInt1, int paramInt2, int paramInt3)
  {
    mContext = paramActivity;
    mActionBar = paramActionBar;
    mDrawerLayout = paramDrawerLayout;
    mDrawerImageResource = paramInt1;
    mOpenDrawerContentDescRes = paramInt2;
    mCloseDrawerContentDescRes = paramInt3;
    mThemeImage = getThemeUpIndicator();
    mDrawerImage = mContext.getResources().getDrawable(paramInt1);
    mSlider = new SlideDrawable(mDrawerImage);
    mSlider.setOffsetBy(0.33333334F);
  }
  
  private Drawable getThemeUpIndicator()
  {
    TypedArray localTypedArray = mContext.obtainStyledAttributes(THEME_ATTRS);
    Drawable localDrawable = localTypedArray.getDrawable(0);
    localTypedArray.recycle();
    return localDrawable;
  }
  
  public boolean isDrawerIndicatorEnabled()
  {
    return mDrawerIndicatorEnabled;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    mThemeImage = getThemeUpIndicator();
    mDrawerImage = mContext.getResources().getDrawable(mDrawerImageResource);
    syncState();
  }
  
  public void onDrawerClosed(View paramView)
  {
    mSlider.setOffset(0.0F);
    if (mDrawerIndicatorEnabled) {
      mActionBar.setHomeActionContentDescription(mCloseDrawerContentDescRes);
    }
  }
  
  public void onDrawerOpened(View paramView)
  {
    mSlider.setOffset(1.0F);
    if (mDrawerIndicatorEnabled) {
      mActionBar.setHomeActionContentDescription(mOpenDrawerContentDescRes);
    }
  }
  
  public void onDrawerSlide(View paramView, float paramFloat)
  {
    float f = mSlider.getOffset();
    if (paramFloat > 0.5F) {}
    for (paramFloat = Math.max(f, Math.max(0.0F, paramFloat - 0.5F) * 2.0F);; paramFloat = Math.min(f, paramFloat * 2.0F))
    {
      mSlider.setOffset(paramFloat);
      return;
    }
  }
  
  public void onDrawerStateChanged(int paramInt) {}
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if ((paramMenuItem != null) && (paramMenuItem.getItemId() == 16908332) && (mDrawerIndicatorEnabled))
    {
      if (!mDrawerLayout.isDrawerVisible(8388611)) {
        break label45;
      }
      mDrawerLayout.closeDrawer(8388611);
    }
    for (;;)
    {
      return false;
      label45:
      mDrawerLayout.openDrawer(8388611);
    }
  }
  
  public void setDrawerIndicatorEnabled(boolean paramBoolean)
  {
    int i;
    if (paramBoolean != mDrawerIndicatorEnabled)
    {
      if (!paramBoolean) {
        break label64;
      }
      mActionBar.setHomeAsUpIndicator(mSlider);
      ActionBar localActionBar = mActionBar;
      if (!mDrawerLayout.isDrawerOpen(8388611)) {
        break label56;
      }
      i = mOpenDrawerContentDescRes;
      localActionBar.setHomeActionContentDescription(i);
    }
    for (;;)
    {
      mDrawerIndicatorEnabled = paramBoolean;
      return;
      label56:
      i = mCloseDrawerContentDescRes;
      break;
      label64:
      mActionBar.setHomeAsUpIndicator(mThemeImage);
      mActionBar.setHomeActionContentDescription(0);
    }
  }
  
  public void syncState()
  {
    ActionBar localActionBar;
    if (mDrawerLayout.isDrawerOpen(8388611))
    {
      mSlider.setOffset(1.0F);
      if (mDrawerIndicatorEnabled)
      {
        mActionBar.setHomeAsUpIndicator(mSlider);
        localActionBar = mActionBar;
        if (!mDrawerLayout.isDrawerOpen(8388611)) {
          break label77;
        }
      }
    }
    label77:
    for (int i = mOpenDrawerContentDescRes;; i = mCloseDrawerContentDescRes)
    {
      localActionBar.setHomeActionContentDescription(i);
      return;
      mSlider.setOffset(0.0F);
      break;
    }
  }
  
  private static class SlideDrawable
    extends Drawable
    implements Drawable.Callback
  {
    private float mOffset;
    private float mOffsetBy;
    private final Rect mTmpRect = new Rect();
    private Drawable mWrapped;
    
    public SlideDrawable(Drawable paramDrawable)
    {
      mWrapped = paramDrawable;
    }
    
    public void clearColorFilter()
    {
      mWrapped.clearColorFilter();
    }
    
    public void draw(Canvas paramCanvas)
    {
      mWrapped.copyBounds(mTmpRect);
      paramCanvas.save();
      paramCanvas.translate(mOffsetBy * mTmpRect.width() * -mOffset, 0.0F);
      mWrapped.draw(paramCanvas);
      paramCanvas.restore();
    }
    
    public int getChangingConfigurations()
    {
      return mWrapped.getChangingConfigurations();
    }
    
    public Drawable.ConstantState getConstantState()
    {
      return super.getConstantState();
    }
    
    public Drawable getCurrent()
    {
      return mWrapped.getCurrent();
    }
    
    public int getIntrinsicHeight()
    {
      return mWrapped.getIntrinsicHeight();
    }
    
    public int getIntrinsicWidth()
    {
      return mWrapped.getIntrinsicWidth();
    }
    
    public int getMinimumHeight()
    {
      return mWrapped.getMinimumHeight();
    }
    
    public int getMinimumWidth()
    {
      return mWrapped.getMinimumWidth();
    }
    
    public float getOffset()
    {
      return mOffset;
    }
    
    public int getOpacity()
    {
      return mWrapped.getOpacity();
    }
    
    public boolean getPadding(Rect paramRect)
    {
      return mWrapped.getPadding(paramRect);
    }
    
    public int[] getState()
    {
      return mWrapped.getState();
    }
    
    public Region getTransparentRegion()
    {
      return mWrapped.getTransparentRegion();
    }
    
    public void invalidateDrawable(Drawable paramDrawable)
    {
      if (paramDrawable == mWrapped) {
        invalidateSelf();
      }
    }
    
    public boolean isStateful()
    {
      return mWrapped.isStateful();
    }
    
    protected void onBoundsChange(Rect paramRect)
    {
      super.onBoundsChange(paramRect);
      mWrapped.setBounds(paramRect);
    }
    
    protected boolean onStateChange(int[] paramArrayOfInt)
    {
      mWrapped.setState(paramArrayOfInt);
      return super.onStateChange(paramArrayOfInt);
    }
    
    public void scheduleDrawable(Drawable paramDrawable, Runnable paramRunnable, long paramLong)
    {
      if (paramDrawable == mWrapped) {
        scheduleSelf(paramRunnable, paramLong);
      }
    }
    
    public void setAlpha(int paramInt)
    {
      mWrapped.setAlpha(paramInt);
    }
    
    public void setChangingConfigurations(int paramInt)
    {
      mWrapped.setChangingConfigurations(paramInt);
    }
    
    public void setColorFilter(int paramInt, PorterDuff.Mode paramMode)
    {
      mWrapped.setColorFilter(paramInt, paramMode);
    }
    
    public void setColorFilter(ColorFilter paramColorFilter)
    {
      mWrapped.setColorFilter(paramColorFilter);
    }
    
    public void setDither(boolean paramBoolean)
    {
      mWrapped.setDither(paramBoolean);
    }
    
    public void setFilterBitmap(boolean paramBoolean)
    {
      mWrapped.setFilterBitmap(paramBoolean);
    }
    
    public void setOffset(float paramFloat)
    {
      mOffset = paramFloat;
      invalidateSelf();
    }
    
    public void setOffsetBy(float paramFloat)
    {
      mOffsetBy = paramFloat;
      invalidateSelf();
    }
    
    public boolean setState(int[] paramArrayOfInt)
    {
      return mWrapped.setState(paramArrayOfInt);
    }
    
    public boolean setVisible(boolean paramBoolean1, boolean paramBoolean2)
    {
      return super.setVisible(paramBoolean1, paramBoolean2);
    }
    
    public void unscheduleDrawable(Drawable paramDrawable, Runnable paramRunnable)
    {
      if (paramDrawable == mWrapped) {
        unscheduleSelf(paramRunnable);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.app.ActionBarDrawerToggle
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */