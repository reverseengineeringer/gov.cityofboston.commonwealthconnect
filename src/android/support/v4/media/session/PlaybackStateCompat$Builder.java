package android.support.v4.media.session;

import android.os.SystemClock;

public final class PlaybackStateCompat$Builder
{
  private long mActions;
  private long mBufferedPosition;
  private CharSequence mErrorMessage;
  private long mPosition;
  private float mRate;
  private int mState;
  private long mUpdateTime;
  
  public PlaybackStateCompat$Builder() {}
  
  public PlaybackStateCompat$Builder(PlaybackStateCompat paramPlaybackStateCompat)
  {
    mState = PlaybackStateCompat.access$100(paramPlaybackStateCompat);
    mPosition = PlaybackStateCompat.access$200(paramPlaybackStateCompat);
    mRate = PlaybackStateCompat.access$300(paramPlaybackStateCompat);
    mUpdateTime = PlaybackStateCompat.access$400(paramPlaybackStateCompat);
    mBufferedPosition = PlaybackStateCompat.access$500(paramPlaybackStateCompat);
    mActions = PlaybackStateCompat.access$600(paramPlaybackStateCompat);
    mErrorMessage = PlaybackStateCompat.access$700(paramPlaybackStateCompat);
  }
  
  public PlaybackStateCompat build()
  {
    return new PlaybackStateCompat(mState, mPosition, mBufferedPosition, mRate, mActions, mErrorMessage, mUpdateTime, null);
  }
  
  public void setActions(long paramLong)
  {
    mActions = paramLong;
  }
  
  public void setBufferedPosition(long paramLong)
  {
    mBufferedPosition = paramLong;
  }
  
  public void setErrorMessage(CharSequence paramCharSequence)
  {
    mErrorMessage = paramCharSequence;
  }
  
  public void setState(int paramInt, long paramLong, float paramFloat)
  {
    mState = paramInt;
    mPosition = paramLong;
    mRate = paramFloat;
    mUpdateTime = SystemClock.elapsedRealtime();
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.PlaybackStateCompat.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */