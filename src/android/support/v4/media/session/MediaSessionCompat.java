package android.support.v4.media.session;

import android.content.Context;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.ResultReceiver;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import android.support.v4.media.VolumeProviderCompat;
import android.text.TextUtils;

public class MediaSessionCompat
{
  public static final int FLAG_HANDLES_MEDIA_BUTTONS = 1;
  public static final int FLAG_HANDLES_TRANSPORT_CONTROLS = 2;
  private final MediaSessionImpl mImpl;
  
  public MediaSessionCompat(Context paramContext, String paramString)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("context must not be null");
    }
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("tag must not be null or empty");
    }
    if (Build.VERSION.SDK_INT >= 21)
    {
      mImpl = new MediaSessionImplApi21(paramContext, paramString);
      return;
    }
    mImpl = new MediaSessionImplBase();
  }
  
  private MediaSessionCompat(MediaSessionImpl paramMediaSessionImpl)
  {
    mImpl = paramMediaSessionImpl;
  }
  
  public static MediaSessionCompat obtain(Object paramObject)
  {
    return new MediaSessionCompat(new MediaSessionImplApi21(paramObject));
  }
  
  public Object getMediaSession()
  {
    return mImpl.getMediaSession();
  }
  
  public Token getSessionToken()
  {
    return mImpl.getSessionToken();
  }
  
  public boolean isActive()
  {
    return mImpl.isActive();
  }
  
  public void release()
  {
    mImpl.release();
  }
  
  public void sendSessionEvent(String paramString, Bundle paramBundle)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("event cannot be null or empty");
    }
    mImpl.sendSessionEvent(paramString, paramBundle);
  }
  
  public void setActive(boolean paramBoolean)
  {
    mImpl.setActive(paramBoolean);
  }
  
  public void setCallback(Callback paramCallback)
  {
    setCallback(paramCallback, null);
  }
  
  public void setCallback(Callback paramCallback, Handler paramHandler)
  {
    MediaSessionImpl localMediaSessionImpl = mImpl;
    if (paramHandler != null) {}
    for (;;)
    {
      localMediaSessionImpl.setCallback(paramCallback, paramHandler);
      return;
      paramHandler = new Handler();
    }
  }
  
  public void setFlags(int paramInt)
  {
    mImpl.setFlags(paramInt);
  }
  
  public void setMetadata(MediaMetadataCompat paramMediaMetadataCompat)
  {
    mImpl.setMetadata(paramMediaMetadataCompat);
  }
  
  public void setPlaybackState(PlaybackStateCompat paramPlaybackStateCompat)
  {
    mImpl.setPlaybackState(paramPlaybackStateCompat);
  }
  
  public void setPlaybackToLocal(int paramInt)
  {
    mImpl.setPlaybackToLocal(paramInt);
  }
  
  public void setPlaybackToRemote(VolumeProviderCompat paramVolumeProviderCompat)
  {
    if (paramVolumeProviderCompat == null) {
      throw new IllegalArgumentException("volumeProvider may not be null!");
    }
    mImpl.setPlaybackToRemote(paramVolumeProviderCompat);
  }
  
  public static abstract class Callback
  {
    final Object mCallbackObj;
    
    public Callback()
    {
      if (Build.VERSION.SDK_INT >= 21)
      {
        mCallbackObj = MediaSessionCompatApi21.createCallback(new StubApi21(null));
        return;
      }
      mCallbackObj = null;
    }
    
    public void onCommand(String paramString, Bundle paramBundle, ResultReceiver paramResultReceiver) {}
    
    public void onFastForward() {}
    
    public boolean onMediaButtonEvent(Intent paramIntent)
    {
      return false;
    }
    
    public void onPause() {}
    
    public void onPlay() {}
    
    public void onRewind() {}
    
    public void onSeekTo(long paramLong) {}
    
    public void onSetRating(RatingCompat paramRatingCompat) {}
    
    public void onSkipToNext() {}
    
    public void onSkipToPrevious() {}
    
    public void onStop() {}
    
    private class StubApi21
      implements MediaSessionCompatApi21.Callback
    {
      private StubApi21() {}
      
      public void onCommand(String paramString, Bundle paramBundle, ResultReceiver paramResultReceiver)
      {
        MediaSessionCompat.Callback.this.onCommand(paramString, paramBundle, paramResultReceiver);
      }
      
      public void onFastForward()
      {
        MediaSessionCompat.Callback.this.onFastForward();
      }
      
      public boolean onMediaButtonEvent(Intent paramIntent)
      {
        return MediaSessionCompat.Callback.this.onMediaButtonEvent(paramIntent);
      }
      
      public void onPause()
      {
        MediaSessionCompat.Callback.this.onPause();
      }
      
      public void onPlay()
      {
        MediaSessionCompat.Callback.this.onPlay();
      }
      
      public void onRewind()
      {
        MediaSessionCompat.Callback.this.onRewind();
      }
      
      public void onSeekTo(long paramLong)
      {
        MediaSessionCompat.Callback.this.onSeekTo(paramLong);
      }
      
      public void onSetRating(Object paramObject)
      {
        onSetRating(RatingCompat.fromRating(paramObject));
      }
      
      public void onSkipToNext()
      {
        MediaSessionCompat.Callback.this.onSkipToNext();
      }
      
      public void onSkipToPrevious()
      {
        MediaSessionCompat.Callback.this.onSkipToPrevious();
      }
      
      public void onStop()
      {
        MediaSessionCompat.Callback.this.onStop();
      }
    }
  }
  
  static abstract interface MediaSessionImpl
  {
    public abstract Object getMediaSession();
    
    public abstract MediaSessionCompat.Token getSessionToken();
    
    public abstract boolean isActive();
    
    public abstract void release();
    
    public abstract void sendSessionEvent(String paramString, Bundle paramBundle);
    
    public abstract void setActive(boolean paramBoolean);
    
    public abstract void setCallback(MediaSessionCompat.Callback paramCallback, Handler paramHandler);
    
    public abstract void setFlags(int paramInt);
    
    public abstract void setMetadata(MediaMetadataCompat paramMediaMetadataCompat);
    
    public abstract void setPlaybackState(PlaybackStateCompat paramPlaybackStateCompat);
    
    public abstract void setPlaybackToLocal(int paramInt);
    
    public abstract void setPlaybackToRemote(VolumeProviderCompat paramVolumeProviderCompat);
  }
  
  static class MediaSessionImplApi21
    implements MediaSessionCompat.MediaSessionImpl
  {
    private final Object mSessionObj;
    private final MediaSessionCompat.Token mToken;
    
    public MediaSessionImplApi21(Context paramContext, String paramString)
    {
      mSessionObj = MediaSessionCompatApi21.createSession(paramContext, paramString);
      mToken = new MediaSessionCompat.Token(MediaSessionCompatApi21.getSessionToken(mSessionObj));
    }
    
    public MediaSessionImplApi21(Object paramObject)
    {
      mSessionObj = MediaSessionCompatApi21.verifySession(paramObject);
      mToken = new MediaSessionCompat.Token(MediaSessionCompatApi21.getSessionToken(mSessionObj));
    }
    
    public Object getMediaSession()
    {
      return mSessionObj;
    }
    
    public MediaSessionCompat.Token getSessionToken()
    {
      return mToken;
    }
    
    public boolean isActive()
    {
      return MediaSessionCompatApi21.isActive(mSessionObj);
    }
    
    public void release()
    {
      MediaSessionCompatApi21.release(mSessionObj);
    }
    
    public void sendSessionEvent(String paramString, Bundle paramBundle)
    {
      MediaSessionCompatApi21.sendSessionEvent(mSessionObj, paramString, paramBundle);
    }
    
    public void setActive(boolean paramBoolean)
    {
      MediaSessionCompatApi21.setActive(mSessionObj, paramBoolean);
    }
    
    public void setCallback(MediaSessionCompat.Callback paramCallback, Handler paramHandler)
    {
      MediaSessionCompatApi21.setCallback(mSessionObj, mCallbackObj, paramHandler);
    }
    
    public void setFlags(int paramInt)
    {
      MediaSessionCompatApi21.setFlags(mSessionObj, paramInt);
    }
    
    public void setMetadata(MediaMetadataCompat paramMediaMetadataCompat)
    {
      MediaSessionCompatApi21.setMetadata(mSessionObj, paramMediaMetadataCompat.getMediaMetadata());
    }
    
    public void setPlaybackState(PlaybackStateCompat paramPlaybackStateCompat)
    {
      MediaSessionCompatApi21.setPlaybackState(mSessionObj, paramPlaybackStateCompat.getPlaybackState());
    }
    
    public void setPlaybackToLocal(int paramInt)
    {
      MediaSessionCompatApi21.setPlaybackToLocal(mSessionObj, paramInt);
    }
    
    public void setPlaybackToRemote(VolumeProviderCompat paramVolumeProviderCompat)
    {
      MediaSessionCompatApi21.setPlaybackToRemote(mSessionObj, paramVolumeProviderCompat.getVolumeProvider());
    }
  }
  
  static class MediaSessionImplBase
    implements MediaSessionCompat.MediaSessionImpl
  {
    public Object getMediaSession()
    {
      return null;
    }
    
    public MediaSessionCompat.Token getSessionToken()
    {
      return null;
    }
    
    public boolean isActive()
    {
      return false;
    }
    
    public void release() {}
    
    public void sendSessionEvent(String paramString, Bundle paramBundle) {}
    
    public void setActive(boolean paramBoolean) {}
    
    public void setCallback(MediaSessionCompat.Callback paramCallback, Handler paramHandler) {}
    
    public void setFlags(int paramInt) {}
    
    public void setMetadata(MediaMetadataCompat paramMediaMetadataCompat) {}
    
    public void setPlaybackState(PlaybackStateCompat paramPlaybackStateCompat) {}
    
    public void setPlaybackToLocal(int paramInt) {}
    
    public void setPlaybackToRemote(VolumeProviderCompat paramVolumeProviderCompat) {}
  }
  
  public static final class Token
    implements Parcelable
  {
    public static final Parcelable.Creator<Token> CREATOR = new Parcelable.Creator()
    {
      public MediaSessionCompat.Token createFromParcel(Parcel paramAnonymousParcel)
      {
        return new MediaSessionCompat.Token(paramAnonymousParcel.readParcelable(null));
      }
      
      public MediaSessionCompat.Token[] newArray(int paramAnonymousInt)
      {
        return new MediaSessionCompat.Token[paramAnonymousInt];
      }
    };
    private final Parcelable mInner;
    
    Token(Parcelable paramParcelable)
    {
      mInner = paramParcelable;
    }
    
    public int describeContents()
    {
      return mInner.describeContents();
    }
    
    public Object getToken()
    {
      return mInner;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeParcelable(mInner, paramInt);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaSessionCompat
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */