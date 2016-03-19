package com.nineoldandroids.animation;

public class TimeAnimator
  extends ValueAnimator
{
  private TimeListener mListener;
  private long mPreviousTime = -1L;
  
  void animateValue(float paramFloat) {}
  
  boolean animationFrame(long paramLong)
  {
    long l1 = 0L;
    long l2;
    if (mPlayingState == 0)
    {
      mPlayingState = 1;
      if (mSeekTime < 0L) {
        mStartTime = paramLong;
      }
    }
    else if (mListener != null)
    {
      l2 = mStartTime;
      if (mPreviousTime >= 0L) {
        break label92;
      }
    }
    for (;;)
    {
      mPreviousTime = paramLong;
      mListener.onTimeUpdate(this, paramLong - l2, l1);
      return false;
      mStartTime = (paramLong - mSeekTime);
      mSeekTime = -1L;
      break;
      label92:
      l1 = paramLong - mPreviousTime;
    }
  }
  
  void initAnimation() {}
  
  public void setTimeListener(TimeListener paramTimeListener)
  {
    mListener = paramTimeListener;
  }
  
  public static abstract interface TimeListener
  {
    public abstract void onTimeUpdate(TimeAnimator paramTimeAnimator, long paramLong1, long paramLong2);
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.animation.TimeAnimator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */