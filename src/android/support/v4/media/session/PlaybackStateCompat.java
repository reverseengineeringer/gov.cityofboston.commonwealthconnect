package android.support.v4.media.session;

import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.SystemClock;
import android.text.TextUtils;

public final class PlaybackStateCompat
  implements Parcelable
{
  public static final long ACTION_FAST_FORWARD = 64L;
  public static final long ACTION_PAUSE = 2L;
  public static final long ACTION_PLAY = 4L;
  public static final long ACTION_PLAY_FROM_MEDIA_ID = 1024L;
  public static final long ACTION_PLAY_FROM_SEARCH = 2048L;
  public static final long ACTION_PLAY_PAUSE = 512L;
  public static final long ACTION_REWIND = 8L;
  public static final long ACTION_SEEK_TO = 256L;
  public static final long ACTION_SET_RATING = 128L;
  public static final long ACTION_SKIP_TO_NEXT = 32L;
  public static final long ACTION_SKIP_TO_PREVIOUS = 16L;
  public static final long ACTION_SKIP_TO_QUEUE_ITEM = 4096L;
  public static final long ACTION_STOP = 1L;
  public static final Parcelable.Creator<PlaybackStateCompat> CREATOR = new Parcelable.Creator()
  {
    public PlaybackStateCompat createFromParcel(Parcel paramAnonymousParcel)
    {
      return new PlaybackStateCompat(paramAnonymousParcel, null);
    }
    
    public PlaybackStateCompat[] newArray(int paramAnonymousInt)
    {
      return new PlaybackStateCompat[paramAnonymousInt];
    }
  };
  public static final long PLAYBACK_POSITION_UNKNOWN = -1L;
  public static final int STATE_BUFFERING = 6;
  public static final int STATE_CONNECTING = 8;
  public static final int STATE_ERROR = 7;
  public static final int STATE_FAST_FORWARDING = 4;
  public static final int STATE_NONE = 0;
  public static final int STATE_PAUSED = 2;
  public static final int STATE_PLAYING = 3;
  public static final int STATE_REWINDING = 5;
  public static final int STATE_SKIPPING_TO_NEXT = 10;
  public static final int STATE_SKIPPING_TO_PREVIOUS = 9;
  public static final int STATE_STOPPED = 1;
  private final long mActions;
  private final long mBufferedPosition;
  private final CharSequence mErrorMessage;
  private final long mPosition;
  private final float mSpeed;
  private final int mState;
  private Object mStateObj;
  private final long mUpdateTime;
  
  private PlaybackStateCompat(int paramInt, long paramLong1, long paramLong2, float paramFloat, long paramLong3, CharSequence paramCharSequence, long paramLong4)
  {
    mState = paramInt;
    mPosition = paramLong1;
    mBufferedPosition = paramLong2;
    mSpeed = paramFloat;
    mActions = paramLong3;
    mErrorMessage = paramCharSequence;
    mUpdateTime = paramLong4;
  }
  
  private PlaybackStateCompat(Parcel paramParcel)
  {
    mState = paramParcel.readInt();
    mPosition = paramParcel.readLong();
    mSpeed = paramParcel.readFloat();
    mUpdateTime = paramParcel.readLong();
    mBufferedPosition = paramParcel.readLong();
    mActions = paramParcel.readLong();
    mErrorMessage = ((CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(paramParcel));
  }
  
  public static PlaybackStateCompat fromPlaybackState(Object paramObject)
  {
    if ((paramObject == null) || (Build.VERSION.SDK_INT < 21)) {
      return null;
    }
    PlaybackStateCompat localPlaybackStateCompat = new PlaybackStateCompat(PlaybackStateCompatApi21.getState(paramObject), PlaybackStateCompatApi21.getPosition(paramObject), PlaybackStateCompatApi21.getBufferedPosition(paramObject), PlaybackStateCompatApi21.getPlaybackSpeed(paramObject), PlaybackStateCompatApi21.getActions(paramObject), PlaybackStateCompatApi21.getErrorMessage(paramObject), PlaybackStateCompatApi21.getLastPositionUpdateTime(paramObject));
    mStateObj = paramObject;
    return localPlaybackStateCompat;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public long getActions()
  {
    return mActions;
  }
  
  public long getBufferedPosition()
  {
    return mBufferedPosition;
  }
  
  public CharSequence getErrorMessage()
  {
    return mErrorMessage;
  }
  
  public long getLastPositionUpdateTime()
  {
    return mUpdateTime;
  }
  
  public float getPlaybackSpeed()
  {
    return mSpeed;
  }
  
  public Object getPlaybackState()
  {
    if ((mStateObj != null) || (Build.VERSION.SDK_INT < 21)) {
      return mStateObj;
    }
    mStateObj = PlaybackStateCompatApi21.newInstance(mState, mPosition, mBufferedPosition, mSpeed, mActions, mErrorMessage, mUpdateTime);
    return mStateObj;
  }
  
  public long getPosition()
  {
    return mPosition;
  }
  
  public int getState()
  {
    return mState;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("PlaybackState {");
    localStringBuilder.append("state=").append(mState);
    localStringBuilder.append(", position=").append(mPosition);
    localStringBuilder.append(", buffered position=").append(mBufferedPosition);
    localStringBuilder.append(", speed=").append(mSpeed);
    localStringBuilder.append(", updated=").append(mUpdateTime);
    localStringBuilder.append(", actions=").append(mActions);
    localStringBuilder.append(", error=").append(mErrorMessage);
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(mState);
    paramParcel.writeLong(mPosition);
    paramParcel.writeFloat(mSpeed);
    paramParcel.writeLong(mUpdateTime);
    paramParcel.writeLong(mBufferedPosition);
    paramParcel.writeLong(mActions);
    TextUtils.writeToParcel(mErrorMessage, paramParcel, paramInt);
  }
  
  public static final class Builder
  {
    private long mActions;
    private long mBufferedPosition;
    private CharSequence mErrorMessage;
    private long mPosition;
    private float mRate;
    private int mState;
    private long mUpdateTime;
    
    public Builder() {}
    
    public Builder(PlaybackStateCompat paramPlaybackStateCompat)
    {
      mState = mState;
      mPosition = mPosition;
      mRate = mSpeed;
      mUpdateTime = mUpdateTime;
      mBufferedPosition = mBufferedPosition;
      mActions = mActions;
      mErrorMessage = mErrorMessage;
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
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.PlaybackStateCompat
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */