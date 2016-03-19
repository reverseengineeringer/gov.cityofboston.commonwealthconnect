package com.nineoldandroids.view;

import android.view.View;
import android.view.animation.Interpolator;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.Animator.AnimatorListener;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import com.nineoldandroids.view.animation.AnimatorProxy;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

class ViewPropertyAnimatorPreHC
  extends ViewPropertyAnimator
{
  private static final int ALPHA = 512;
  private static final int NONE = 0;
  private static final int ROTATION = 16;
  private static final int ROTATION_X = 32;
  private static final int ROTATION_Y = 64;
  private static final int SCALE_X = 4;
  private static final int SCALE_Y = 8;
  private static final int TRANSFORM_MASK = 511;
  private static final int TRANSLATION_X = 1;
  private static final int TRANSLATION_Y = 2;
  private static final int X = 128;
  private static final int Y = 256;
  private Runnable mAnimationStarter = new Runnable()
  {
    public void run()
    {
      ViewPropertyAnimatorPreHC.this.startAnimation();
    }
  };
  private AnimatorEventListener mAnimatorEventListener = new AnimatorEventListener(null);
  private HashMap<Animator, PropertyBundle> mAnimatorMap = new HashMap();
  private long mDuration;
  private boolean mDurationSet = false;
  private Interpolator mInterpolator;
  private boolean mInterpolatorSet = false;
  private Animator.AnimatorListener mListener = null;
  ArrayList<NameValuesHolder> mPendingAnimations = new ArrayList();
  private final AnimatorProxy mProxy;
  private long mStartDelay = 0L;
  private boolean mStartDelaySet = false;
  private final WeakReference<View> mView;
  
  ViewPropertyAnimatorPreHC(View paramView)
  {
    mView = new WeakReference(paramView);
    mProxy = AnimatorProxy.wrap(paramView);
  }
  
  private void animateProperty(int paramInt, float paramFloat)
  {
    float f = getValue(paramInt);
    animatePropertyBy(paramInt, f, paramFloat - f);
  }
  
  private void animatePropertyBy(int paramInt, float paramFloat)
  {
    animatePropertyBy(paramInt, getValue(paramInt), paramFloat);
  }
  
  private void animatePropertyBy(int paramInt, float paramFloat1, float paramFloat2)
  {
    if (mAnimatorMap.size() > 0)
    {
      Object localObject2 = null;
      Iterator localIterator = mAnimatorMap.keySet().iterator();
      PropertyBundle localPropertyBundle;
      do
      {
        localObject1 = localObject2;
        if (!localIterator.hasNext()) {
          break;
        }
        localObject1 = (Animator)localIterator.next();
        localPropertyBundle = (PropertyBundle)mAnimatorMap.get(localObject1);
      } while ((!localPropertyBundle.cancel(paramInt)) || (mPropertyMask != 0));
      if (localObject1 != null) {
        ((Animator)localObject1).cancel();
      }
    }
    Object localObject1 = new NameValuesHolder(paramInt, paramFloat1, paramFloat2);
    mPendingAnimations.add(localObject1);
    localObject1 = (View)mView.get();
    if (localObject1 != null)
    {
      ((View)localObject1).removeCallbacks(mAnimationStarter);
      ((View)localObject1).post(mAnimationStarter);
    }
  }
  
  private float getValue(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return 0.0F;
    case 1: 
      return mProxy.getTranslationX();
    case 2: 
      return mProxy.getTranslationY();
    case 16: 
      return mProxy.getRotation();
    case 32: 
      return mProxy.getRotationX();
    case 64: 
      return mProxy.getRotationY();
    case 4: 
      return mProxy.getScaleX();
    case 8: 
      return mProxy.getScaleY();
    case 128: 
      return mProxy.getX();
    case 256: 
      return mProxy.getY();
    }
    return mProxy.getAlpha();
  }
  
  private void setValue(int paramInt, float paramFloat)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 1: 
      mProxy.setTranslationX(paramFloat);
      return;
    case 2: 
      mProxy.setTranslationY(paramFloat);
      return;
    case 16: 
      mProxy.setRotation(paramFloat);
      return;
    case 32: 
      mProxy.setRotationX(paramFloat);
      return;
    case 64: 
      mProxy.setRotationY(paramFloat);
      return;
    case 4: 
      mProxy.setScaleX(paramFloat);
      return;
    case 8: 
      mProxy.setScaleY(paramFloat);
      return;
    case 128: 
      mProxy.setX(paramFloat);
      return;
    case 256: 
      mProxy.setY(paramFloat);
      return;
    }
    mProxy.setAlpha(paramFloat);
  }
  
  private void startAnimation()
  {
    ValueAnimator localValueAnimator = ValueAnimator.ofFloat(new float[] { 1.0F });
    ArrayList localArrayList = (ArrayList)mPendingAnimations.clone();
    mPendingAnimations.clear();
    int j = 0;
    int k = localArrayList.size();
    int i = 0;
    while (i < k)
    {
      j |= getmNameConstant;
      i += 1;
    }
    mAnimatorMap.put(localValueAnimator, new PropertyBundle(j, localArrayList));
    localValueAnimator.addUpdateListener(mAnimatorEventListener);
    localValueAnimator.addListener(mAnimatorEventListener);
    if (mStartDelaySet) {
      localValueAnimator.setStartDelay(mStartDelay);
    }
    if (mDurationSet) {
      localValueAnimator.setDuration(mDuration);
    }
    if (mInterpolatorSet) {
      localValueAnimator.setInterpolator(mInterpolator);
    }
    localValueAnimator.start();
  }
  
  public ViewPropertyAnimator alpha(float paramFloat)
  {
    animateProperty(512, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator alphaBy(float paramFloat)
  {
    animatePropertyBy(512, paramFloat);
    return this;
  }
  
  public void cancel()
  {
    if (mAnimatorMap.size() > 0)
    {
      localObject = ((HashMap)mAnimatorMap.clone()).keySet().iterator();
      while (((Iterator)localObject).hasNext()) {
        ((Animator)((Iterator)localObject).next()).cancel();
      }
    }
    mPendingAnimations.clear();
    Object localObject = (View)mView.get();
    if (localObject != null) {
      ((View)localObject).removeCallbacks(mAnimationStarter);
    }
  }
  
  public long getDuration()
  {
    if (mDurationSet) {
      return mDuration;
    }
    return new ValueAnimator().getDuration();
  }
  
  public long getStartDelay()
  {
    if (mStartDelaySet) {
      return mStartDelay;
    }
    return 0L;
  }
  
  public ViewPropertyAnimator rotation(float paramFloat)
  {
    animateProperty(16, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator rotationBy(float paramFloat)
  {
    animatePropertyBy(16, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator rotationX(float paramFloat)
  {
    animateProperty(32, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator rotationXBy(float paramFloat)
  {
    animatePropertyBy(32, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator rotationY(float paramFloat)
  {
    animateProperty(64, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator rotationYBy(float paramFloat)
  {
    animatePropertyBy(64, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator scaleX(float paramFloat)
  {
    animateProperty(4, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator scaleXBy(float paramFloat)
  {
    animatePropertyBy(4, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator scaleY(float paramFloat)
  {
    animateProperty(8, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator scaleYBy(float paramFloat)
  {
    animatePropertyBy(8, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator setDuration(long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("Animators cannot have negative duration: " + paramLong);
    }
    mDurationSet = true;
    mDuration = paramLong;
    return this;
  }
  
  public ViewPropertyAnimator setInterpolator(Interpolator paramInterpolator)
  {
    mInterpolatorSet = true;
    mInterpolator = paramInterpolator;
    return this;
  }
  
  public ViewPropertyAnimator setListener(Animator.AnimatorListener paramAnimatorListener)
  {
    mListener = paramAnimatorListener;
    return this;
  }
  
  public ViewPropertyAnimator setStartDelay(long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("Animators cannot have negative duration: " + paramLong);
    }
    mStartDelaySet = true;
    mStartDelay = paramLong;
    return this;
  }
  
  public void start()
  {
    startAnimation();
  }
  
  public ViewPropertyAnimator translationX(float paramFloat)
  {
    animateProperty(1, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator translationXBy(float paramFloat)
  {
    animatePropertyBy(1, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator translationY(float paramFloat)
  {
    animateProperty(2, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator translationYBy(float paramFloat)
  {
    animatePropertyBy(2, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator x(float paramFloat)
  {
    animateProperty(128, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator xBy(float paramFloat)
  {
    animatePropertyBy(128, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator y(float paramFloat)
  {
    animateProperty(256, paramFloat);
    return this;
  }
  
  public ViewPropertyAnimator yBy(float paramFloat)
  {
    animatePropertyBy(256, paramFloat);
    return this;
  }
  
  private class AnimatorEventListener
    implements Animator.AnimatorListener, ValueAnimator.AnimatorUpdateListener
  {
    private AnimatorEventListener() {}
    
    public void onAnimationCancel(Animator paramAnimator)
    {
      if (mListener != null) {
        mListener.onAnimationCancel(paramAnimator);
      }
    }
    
    public void onAnimationEnd(Animator paramAnimator)
    {
      if (mListener != null) {
        mListener.onAnimationEnd(paramAnimator);
      }
      mAnimatorMap.remove(paramAnimator);
      if (mAnimatorMap.isEmpty()) {
        ViewPropertyAnimatorPreHC.access$202(ViewPropertyAnimatorPreHC.this, null);
      }
    }
    
    public void onAnimationRepeat(Animator paramAnimator)
    {
      if (mListener != null) {
        mListener.onAnimationRepeat(paramAnimator);
      }
    }
    
    public void onAnimationStart(Animator paramAnimator)
    {
      if (mListener != null) {
        mListener.onAnimationStart(paramAnimator);
      }
    }
    
    public void onAnimationUpdate(ValueAnimator paramValueAnimator)
    {
      float f1 = paramValueAnimator.getAnimatedFraction();
      paramValueAnimator = (ViewPropertyAnimatorPreHC.PropertyBundle)mAnimatorMap.get(paramValueAnimator);
      Object localObject;
      if ((mPropertyMask & 0x1FF) != 0)
      {
        localObject = (View)mView.get();
        if (localObject != null) {
          ((View)localObject).invalidate();
        }
      }
      paramValueAnimator = mNameValuesHolder;
      if (paramValueAnimator != null)
      {
        int j = paramValueAnimator.size();
        int i = 0;
        while (i < j)
        {
          localObject = (ViewPropertyAnimatorPreHC.NameValuesHolder)paramValueAnimator.get(i);
          float f2 = mFromValue;
          float f3 = mDeltaValue;
          ViewPropertyAnimatorPreHC.this.setValue(mNameConstant, f2 + f3 * f1);
          i += 1;
        }
      }
      paramValueAnimator = (View)mView.get();
      if (paramValueAnimator != null) {
        paramValueAnimator.invalidate();
      }
    }
  }
  
  private static class NameValuesHolder
  {
    float mDeltaValue;
    float mFromValue;
    int mNameConstant;
    
    NameValuesHolder(int paramInt, float paramFloat1, float paramFloat2)
    {
      mNameConstant = paramInt;
      mFromValue = paramFloat1;
      mDeltaValue = paramFloat2;
    }
  }
  
  private static class PropertyBundle
  {
    ArrayList<ViewPropertyAnimatorPreHC.NameValuesHolder> mNameValuesHolder;
    int mPropertyMask;
    
    PropertyBundle(int paramInt, ArrayList<ViewPropertyAnimatorPreHC.NameValuesHolder> paramArrayList)
    {
      mPropertyMask = paramInt;
      mNameValuesHolder = paramArrayList;
    }
    
    boolean cancel(int paramInt)
    {
      if (((mPropertyMask & paramInt) != 0) && (mNameValuesHolder != null))
      {
        int j = mNameValuesHolder.size();
        int i = 0;
        while (i < j)
        {
          if (mNameValuesHolder.get(i)).mNameConstant == paramInt)
          {
            mNameValuesHolder.remove(i);
            mPropertyMask &= (paramInt ^ 0xFFFFFFFF);
            return true;
          }
          i += 1;
        }
      }
      return false;
    }
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.view.ViewPropertyAnimatorPreHC
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */