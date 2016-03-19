package com.seeclickfix.ma.android.net.volley;

import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;

public class VolleyRetryPolicy
  implements RetryPolicy
{
  public static final float DEFAULT_BACKOFF_MULT = 2.0F;
  public static final int DEFAULT_MAX_RETRIES = 3;
  public static final int DEFAULT_TIMEOUT_MS = 5000;
  private final float mBackoffMultiplier;
  private int mCurrentRetryCount;
  private int mCurrentTimeoutMs;
  private final int mMaxNumRetries;
  
  public VolleyRetryPolicy()
  {
    this(5000, 3, 2.0F);
  }
  
  public VolleyRetryPolicy(int paramInt1, int paramInt2, float paramFloat)
  {
    mCurrentTimeoutMs = paramInt1;
    mMaxNumRetries = paramInt2;
    mBackoffMultiplier = paramFloat;
  }
  
  public int getCurrentRetryCount()
  {
    return mCurrentRetryCount;
  }
  
  public int getCurrentTimeout()
  {
    return mCurrentTimeoutMs;
  }
  
  protected boolean hasAttemptRemaining()
  {
    return mCurrentRetryCount <= mMaxNumRetries;
  }
  
  public void retry(VolleyError paramVolleyError)
    throws VolleyError
  {
    mCurrentRetryCount += 1;
    mCurrentTimeoutMs = ((int)(mCurrentTimeoutMs + mCurrentTimeoutMs * mBackoffMultiplier));
    if (!hasAttemptRemaining()) {
      throw paramVolleyError;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.volley.VolleyRetryPolicy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */