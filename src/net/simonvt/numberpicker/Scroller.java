package net.simonvt.numberpicker;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.util.FloatMath;
import android.view.ViewConfiguration;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;

public class Scroller
{
  private static float ALPHA = 0.0F;
  private static float DECELERATION_RATE = (float)(Math.log(0.75D) / Math.log(0.9D));
  private static final int DEFAULT_DURATION = 250;
  private static float END_TENSION = 0.0F;
  private static final int FLING_MODE = 1;
  private static final int NB_SAMPLES = 100;
  private static final int SCROLL_MODE = 0;
  private static final float[] SPLINE;
  private static float START_TENSION;
  private static float sViscousFluidNormalize = 1.0F / viscousFluid(1.0F);
  private static float sViscousFluidScale;
  private int mCurrX;
  private int mCurrY;
  private float mDeceleration;
  private float mDeltaX;
  private float mDeltaY;
  private int mDuration;
  private float mDurationReciprocal;
  private int mFinalX;
  private int mFinalY;
  private boolean mFinished = true;
  private boolean mFlywheel;
  private Interpolator mInterpolator;
  private int mMaxX;
  private int mMaxY;
  private int mMinX;
  private int mMinY;
  private int mMode;
  private final float mPpi;
  private long mStartTime;
  private int mStartX;
  private int mStartY;
  private float mVelocity;
  
  static
  {
    ALPHA = 800.0F;
    START_TENSION = 0.4F;
    END_TENSION = 1.0F - START_TENSION;
    SPLINE = new float[101];
    float f1 = 0.0F;
    int i = 0;
    if (i <= 100)
    {
      float f4 = i / 100.0F;
      float f2 = 1.0F;
      for (;;)
      {
        float f3 = f1 + (f2 - f1) / 2.0F;
        float f5 = 3.0F * f3 * (1.0F - f3);
        float f6 = ((1.0F - f3) * START_TENSION + END_TENSION * f3) * f5 + f3 * f3 * f3;
        if (Math.abs(f6 - f4) < 1.0E-5D)
        {
          SPLINE[i] = (f5 + f3 * f3 * f3);
          i += 1;
          break;
        }
        if (f6 > f4) {
          f2 = f3;
        } else {
          f1 = f3;
        }
      }
    }
    SPLINE[100] = 1.0F;
    sViscousFluidScale = 8.0F;
    sViscousFluidNormalize = 1.0F;
  }
  
  public Scroller(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public Scroller(Context paramContext, Interpolator paramInterpolator)
  {
    this(paramContext, paramInterpolator, true);
  }
  
  public Scroller(Context paramContext, Interpolator paramInterpolator, boolean paramBoolean)
  {
    mInterpolator = paramInterpolator;
    mPpi = (getResourcesgetDisplayMetricsdensity * 160.0F);
    mDeceleration = computeDeceleration(ViewConfiguration.getScrollFriction());
    mFlywheel = paramBoolean;
  }
  
  private float computeDeceleration(float paramFloat)
  {
    return 386.0878F * mPpi * paramFloat;
  }
  
  static float viscousFluid(float paramFloat)
  {
    paramFloat *= sViscousFluidScale;
    if (paramFloat < 1.0F) {}
    for (paramFloat -= 1.0F - (float)Math.exp(-paramFloat);; paramFloat = 0.36787945F + (1.0F - 0.36787945F) * (1.0F - (float)Math.exp(1.0F - paramFloat))) {
      return paramFloat * sViscousFluidNormalize;
    }
  }
  
  public void abortAnimation()
  {
    mCurrX = mFinalX;
    mCurrY = mFinalY;
    mFinished = true;
  }
  
  public boolean computeScrollOffset()
  {
    boolean bool2 = true;
    boolean bool1;
    if (mFinished) {
      bool1 = false;
    }
    do
    {
      do
      {
        return bool1;
        int i = (int)(AnimationUtils.currentAnimationTimeMillis() - mStartTime);
        if (i >= mDuration) {
          break;
        }
        switch (mMode)
        {
        default: 
          return true;
        case 0: 
          f1 = i * mDurationReciprocal;
          if (mInterpolator == null) {}
          for (f1 = viscousFluid(f1);; f1 = mInterpolator.getInterpolation(f1))
          {
            mCurrX = (mStartX + Math.round(mDeltaX * f1));
            mCurrY = (mStartY + Math.round(mDeltaY * f1));
            return true;
          }
        }
        float f1 = i / mDuration;
        i = (int)(100.0F * f1);
        float f2 = i / 100.0F;
        float f3 = (i + 1) / 100.0F;
        float f4 = SPLINE[i];
        float f5 = SPLINE[(i + 1)];
        f1 = f4 + (f1 - f2) / (f3 - f2) * (f5 - f4);
        mCurrX = (mStartX + Math.round((mFinalX - mStartX) * f1));
        mCurrX = Math.min(mCurrX, mMaxX);
        mCurrX = Math.max(mCurrX, mMinX);
        mCurrY = (mStartY + Math.round((mFinalY - mStartY) * f1));
        mCurrY = Math.min(mCurrY, mMaxY);
        mCurrY = Math.max(mCurrY, mMinY);
        bool1 = bool2;
      } while (mCurrX != mFinalX);
      bool1 = bool2;
    } while (mCurrY != mFinalY);
    mFinished = true;
    return true;
    mCurrX = mFinalX;
    mCurrY = mFinalY;
    mFinished = true;
    return true;
  }
  
  public void extendDuration(int paramInt)
  {
    mDuration = (timePassed() + paramInt);
    mDurationReciprocal = (1.0F / mDuration);
    mFinished = false;
  }
  
  public void fling(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8)
  {
    int j = paramInt3;
    int i = paramInt4;
    float f1;
    if (mFlywheel)
    {
      j = paramInt3;
      i = paramInt4;
      if (!mFinished)
      {
        f1 = getCurrVelocity();
        float f4 = mFinalX - mStartX;
        f2 = mFinalY - mStartY;
        float f3 = FloatMath.sqrt(f4 * f4 + f2 * f2);
        f4 /= f3;
        f2 /= f3;
        f3 = f4 * f1;
        f1 = f2 * f1;
        j = paramInt3;
        i = paramInt4;
        if (Math.signum(paramInt3) == Math.signum(f3))
        {
          j = paramInt3;
          i = paramInt4;
          if (Math.signum(paramInt4) == Math.signum(f1))
          {
            j = (int)(paramInt3 + f3);
            i = (int)(paramInt4 + f1);
          }
        }
      }
    }
    mMode = 1;
    mFinished = false;
    float f2 = FloatMath.sqrt(j * j + i * i);
    mVelocity = f2;
    double d = Math.log(START_TENSION * f2 / ALPHA);
    mDuration = ((int)(1000.0D * Math.exp(d / (DECELERATION_RATE - 1.0D))));
    mStartTime = AnimationUtils.currentAnimationTimeMillis();
    mStartX = paramInt1;
    mStartY = paramInt2;
    if (f2 == 0.0F)
    {
      f1 = 1.0F;
      if (f2 != 0.0F) {
        break label417;
      }
    }
    label417:
    for (f2 = 1.0F;; f2 = i / f2)
    {
      paramInt3 = (int)(ALPHA * Math.exp(DECELERATION_RATE / (DECELERATION_RATE - 1.0D) * d));
      mMinX = paramInt5;
      mMaxX = paramInt6;
      mMinY = paramInt7;
      mMaxY = paramInt8;
      mFinalX = (Math.round(paramInt3 * f1) + paramInt1);
      mFinalX = Math.min(mFinalX, mMaxX);
      mFinalX = Math.max(mFinalX, mMinX);
      mFinalY = (Math.round(paramInt3 * f2) + paramInt2);
      mFinalY = Math.min(mFinalY, mMaxY);
      mFinalY = Math.max(mFinalY, mMinY);
      return;
      f1 = j / f2;
      break;
    }
  }
  
  public final void forceFinished(boolean paramBoolean)
  {
    mFinished = paramBoolean;
  }
  
  public float getCurrVelocity()
  {
    return mVelocity - mDeceleration * timePassed() / 2000.0F;
  }
  
  public final int getCurrX()
  {
    return mCurrX;
  }
  
  public final int getCurrY()
  {
    return mCurrY;
  }
  
  public final int getDuration()
  {
    return mDuration;
  }
  
  public final int getFinalX()
  {
    return mFinalX;
  }
  
  public final int getFinalY()
  {
    return mFinalY;
  }
  
  public final int getStartX()
  {
    return mStartX;
  }
  
  public final int getStartY()
  {
    return mStartY;
  }
  
  public final boolean isFinished()
  {
    return mFinished;
  }
  
  public boolean isScrollingInDirection(float paramFloat1, float paramFloat2)
  {
    return (!mFinished) && (Math.signum(paramFloat1) == Math.signum(mFinalX - mStartX)) && (Math.signum(paramFloat2) == Math.signum(mFinalY - mStartY));
  }
  
  public void setFinalX(int paramInt)
  {
    mFinalX = paramInt;
    mDeltaX = (mFinalX - mStartX);
    mFinished = false;
  }
  
  public void setFinalY(int paramInt)
  {
    mFinalY = paramInt;
    mDeltaY = (mFinalY - mStartY);
    mFinished = false;
  }
  
  public final void setFriction(float paramFloat)
  {
    mDeceleration = computeDeceleration(paramFloat);
  }
  
  public void startScroll(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    startScroll(paramInt1, paramInt2, paramInt3, paramInt4, 250);
  }
  
  public void startScroll(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    mMode = 0;
    mFinished = false;
    mDuration = paramInt5;
    mStartTime = AnimationUtils.currentAnimationTimeMillis();
    mStartX = paramInt1;
    mStartY = paramInt2;
    mFinalX = (paramInt1 + paramInt3);
    mFinalY = (paramInt2 + paramInt4);
    mDeltaX = paramInt3;
    mDeltaY = paramInt4;
    mDurationReciprocal = (1.0F / mDuration);
  }
  
  public int timePassed()
  {
    return (int)(AnimationUtils.currentAnimationTimeMillis() - mStartTime);
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.Scroller
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */