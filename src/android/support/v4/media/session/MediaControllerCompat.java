package android.support.v4.media.session;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import android.text.TextUtils;
import android.view.KeyEvent;

public final class MediaControllerCompat
{
  private final MediaControllerImpl mImpl;
  
  public MediaControllerCompat(Context paramContext, MediaSessionCompat.Token paramToken)
    throws RemoteException
  {
    if (paramToken == null) {
      throw new IllegalArgumentException("sessionToken must not be null");
    }
    if (Build.VERSION.SDK_INT >= 21)
    {
      mImpl = new MediaControllerImplApi21(paramContext, paramToken);
      return;
    }
    mImpl = new MediaControllerImplBase();
  }
  
  public MediaControllerCompat(Context paramContext, MediaSessionCompat paramMediaSessionCompat)
  {
    if (paramMediaSessionCompat == null) {
      throw new IllegalArgumentException("session must not be null");
    }
    if (Build.VERSION.SDK_INT >= 21)
    {
      mImpl = new MediaControllerImplApi21(paramContext, paramMediaSessionCompat);
      return;
    }
    mImpl = new MediaControllerImplBase();
  }
  
  public boolean dispatchMediaButtonEvent(KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent == null) {
      throw new IllegalArgumentException("KeyEvent may not be null");
    }
    return mImpl.dispatchMediaButtonEvent(paramKeyEvent);
  }
  
  public Object getMediaController()
  {
    return mImpl.getMediaController();
  }
  
  public MediaMetadataCompat getMetadata()
  {
    return mImpl.getMetadata();
  }
  
  public PlaybackInfo getPlaybackInfo()
  {
    return mImpl.getPlaybackInfo();
  }
  
  public PlaybackStateCompat getPlaybackState()
  {
    return mImpl.getPlaybackState();
  }
  
  public int getRatingType()
  {
    return mImpl.getRatingType();
  }
  
  public TransportControls getTransportControls()
  {
    return mImpl.getTransportControls();
  }
  
  public void registerCallback(Callback paramCallback)
  {
    registerCallback(paramCallback, null);
  }
  
  public void registerCallback(Callback paramCallback, Handler paramHandler)
  {
    if (paramCallback == null) {
      throw new IllegalArgumentException("callback cannot be null");
    }
    Handler localHandler = paramHandler;
    if (paramHandler == null) {
      localHandler = new Handler();
    }
    mImpl.registerCallback(paramCallback, localHandler);
  }
  
  public void sendCommand(String paramString, Bundle paramBundle, ResultReceiver paramResultReceiver)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("command cannot be null or empty");
    }
    mImpl.sendCommand(paramString, paramBundle, paramResultReceiver);
  }
  
  public void unregisterCallback(Callback paramCallback)
  {
    if (paramCallback == null) {
      throw new IllegalArgumentException("callback cannot be null");
    }
    mImpl.unregisterCallback(paramCallback);
  }
  
  public static abstract class Callback
  {
    final Object mCallbackObj;
    
    public Callback()
    {
      if (Build.VERSION.SDK_INT >= 21)
      {
        mCallbackObj = MediaControllerCompatApi21.createCallback(new StubApi21(null));
        return;
      }
      mCallbackObj = null;
    }
    
    public void onMetadataChanged(MediaMetadataCompat paramMediaMetadataCompat) {}
    
    public void onPlaybackStateChanged(PlaybackStateCompat paramPlaybackStateCompat) {}
    
    public void onSessionDestroyed() {}
    
    public void onSessionEvent(String paramString, Bundle paramBundle) {}
    
    private class StubApi21
      implements MediaControllerCompatApi21.Callback
    {
      private StubApi21() {}
      
      public void onMetadataChanged(Object paramObject)
      {
        onMetadataChanged(MediaMetadataCompat.fromMediaMetadata(paramObject));
      }
      
      public void onPlaybackStateChanged(Object paramObject)
      {
        onPlaybackStateChanged(PlaybackStateCompat.fromPlaybackState(paramObject));
      }
      
      public void onSessionDestroyed()
      {
        MediaControllerCompat.Callback.this.onSessionDestroyed();
      }
      
      public void onSessionEvent(String paramString, Bundle paramBundle)
      {
        MediaControllerCompat.Callback.this.onSessionEvent(paramString, paramBundle);
      }
    }
  }
  
  static abstract interface MediaControllerImpl
  {
    public abstract boolean dispatchMediaButtonEvent(KeyEvent paramKeyEvent);
    
    public abstract Object getMediaController();
    
    public abstract MediaMetadataCompat getMetadata();
    
    public abstract MediaControllerCompat.PlaybackInfo getPlaybackInfo();
    
    public abstract PlaybackStateCompat getPlaybackState();
    
    public abstract int getRatingType();
    
    public abstract MediaControllerCompat.TransportControls getTransportControls();
    
    public abstract void registerCallback(MediaControllerCompat.Callback paramCallback, Handler paramHandler);
    
    public abstract void sendCommand(String paramString, Bundle paramBundle, ResultReceiver paramResultReceiver);
    
    public abstract void unregisterCallback(MediaControllerCompat.Callback paramCallback);
  }
  
  static class MediaControllerImplApi21
    implements MediaControllerCompat.MediaControllerImpl
  {
    private final Object mControllerObj;
    
    public MediaControllerImplApi21(Context paramContext, MediaSessionCompat.Token paramToken)
      throws RemoteException
    {
      mControllerObj = MediaControllerCompatApi21.fromToken(paramContext, paramToken.getToken());
      if (mControllerObj == null) {
        throw new RemoteException();
      }
    }
    
    public MediaControllerImplApi21(Context paramContext, MediaSessionCompat paramMediaSessionCompat)
    {
      mControllerObj = MediaControllerCompatApi21.fromToken(paramContext, paramMediaSessionCompat.getSessionToken().getToken());
    }
    
    public boolean dispatchMediaButtonEvent(KeyEvent paramKeyEvent)
    {
      return MediaControllerCompatApi21.dispatchMediaButtonEvent(mControllerObj, paramKeyEvent);
    }
    
    public Object getMediaController()
    {
      return mControllerObj;
    }
    
    public MediaMetadataCompat getMetadata()
    {
      Object localObject = MediaControllerCompatApi21.getMetadata(mControllerObj);
      if (localObject != null) {
        return MediaMetadataCompat.fromMediaMetadata(localObject);
      }
      return null;
    }
    
    public MediaControllerCompat.PlaybackInfo getPlaybackInfo()
    {
      Object localObject = MediaControllerCompatApi21.getPlaybackInfo(mControllerObj);
      if (localObject != null) {
        return new MediaControllerCompat.PlaybackInfo(MediaControllerCompatApi21.PlaybackInfo.getPlaybackType(localObject), MediaControllerCompatApi21.PlaybackInfo.getLegacyAudioStream(localObject), MediaControllerCompatApi21.PlaybackInfo.getVolumeControl(localObject), MediaControllerCompatApi21.PlaybackInfo.getMaxVolume(localObject), MediaControllerCompatApi21.PlaybackInfo.getCurrentVolume(localObject));
      }
      return null;
    }
    
    public PlaybackStateCompat getPlaybackState()
    {
      Object localObject = MediaControllerCompatApi21.getPlaybackState(mControllerObj);
      if (localObject != null) {
        return PlaybackStateCompat.fromPlaybackState(localObject);
      }
      return null;
    }
    
    public int getRatingType()
    {
      return MediaControllerCompatApi21.getRatingType(mControllerObj);
    }
    
    public MediaControllerCompat.TransportControls getTransportControls()
    {
      Object localObject = MediaControllerCompatApi21.getTransportControls(mControllerObj);
      if (localObject != null) {
        return new MediaControllerCompat.TransportControlsApi21(localObject);
      }
      return null;
    }
    
    public void registerCallback(MediaControllerCompat.Callback paramCallback, Handler paramHandler)
    {
      MediaControllerCompatApi21.registerCallback(mControllerObj, mCallbackObj, paramHandler);
    }
    
    public void sendCommand(String paramString, Bundle paramBundle, ResultReceiver paramResultReceiver)
    {
      MediaControllerCompatApi21.sendCommand(mControllerObj, paramString, paramBundle, paramResultReceiver);
    }
    
    public void unregisterCallback(MediaControllerCompat.Callback paramCallback)
    {
      MediaControllerCompatApi21.unregisterCallback(mControllerObj, mCallbackObj);
    }
  }
  
  static class MediaControllerImplBase
    implements MediaControllerCompat.MediaControllerImpl
  {
    public boolean dispatchMediaButtonEvent(KeyEvent paramKeyEvent)
    {
      return false;
    }
    
    public Object getMediaController()
    {
      return null;
    }
    
    public MediaMetadataCompat getMetadata()
    {
      return null;
    }
    
    public MediaControllerCompat.PlaybackInfo getPlaybackInfo()
    {
      return null;
    }
    
    public PlaybackStateCompat getPlaybackState()
    {
      return null;
    }
    
    public int getRatingType()
    {
      return 0;
    }
    
    public MediaControllerCompat.TransportControls getTransportControls()
    {
      return null;
    }
    
    public void registerCallback(MediaControllerCompat.Callback paramCallback, Handler paramHandler) {}
    
    public void sendCommand(String paramString, Bundle paramBundle, ResultReceiver paramResultReceiver) {}
    
    public void unregisterCallback(MediaControllerCompat.Callback paramCallback) {}
  }
  
  public static final class PlaybackInfo
  {
    public static final int PLAYBACK_TYPE_LOCAL = 1;
    public static final int PLAYBACK_TYPE_REMOTE = 2;
    private final int mAudioStream;
    private final int mCurrentVolume;
    private final int mMaxVolume;
    private final int mPlaybackType;
    private final int mVolumeControl;
    
    PlaybackInfo(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
    {
      mPlaybackType = paramInt1;
      mAudioStream = paramInt2;
      mVolumeControl = paramInt3;
      mMaxVolume = paramInt4;
      mCurrentVolume = paramInt5;
    }
    
    public int getAudioStream()
    {
      return mAudioStream;
    }
    
    public int getCurrentVolume()
    {
      return mCurrentVolume;
    }
    
    public int getMaxVolume()
    {
      return mMaxVolume;
    }
    
    public int getPlaybackType()
    {
      return mPlaybackType;
    }
    
    public int getVolumeControl()
    {
      return mVolumeControl;
    }
  }
  
  public static abstract class TransportControls
  {
    public abstract void fastForward();
    
    public abstract void pause();
    
    public abstract void play();
    
    public abstract void rewind();
    
    public abstract void seekTo(long paramLong);
    
    public abstract void setRating(RatingCompat paramRatingCompat);
    
    public abstract void skipToNext();
    
    public abstract void skipToPrevious();
    
    public abstract void stop();
  }
  
  static class TransportControlsApi21
    extends MediaControllerCompat.TransportControls
  {
    private final Object mControlsObj;
    
    public TransportControlsApi21(Object paramObject)
    {
      mControlsObj = paramObject;
    }
    
    public void fastForward()
    {
      MediaControllerCompatApi21.TransportControls.fastForward(mControlsObj);
    }
    
    public void pause()
    {
      MediaControllerCompatApi21.TransportControls.pause(mControlsObj);
    }
    
    public void play()
    {
      MediaControllerCompatApi21.TransportControls.play(mControlsObj);
    }
    
    public void rewind()
    {
      MediaControllerCompatApi21.TransportControls.rewind(mControlsObj);
    }
    
    public void seekTo(long paramLong)
    {
      MediaControllerCompatApi21.TransportControls.seekTo(mControlsObj, paramLong);
    }
    
    public void setRating(RatingCompat paramRatingCompat)
    {
      Object localObject = mControlsObj;
      if (paramRatingCompat != null) {}
      for (paramRatingCompat = paramRatingCompat.getRating();; paramRatingCompat = null)
      {
        MediaControllerCompatApi21.TransportControls.setRating(localObject, paramRatingCompat);
        return;
      }
    }
    
    public void skipToNext()
    {
      MediaControllerCompatApi21.TransportControls.skipToNext(mControlsObj);
    }
    
    public void skipToPrevious()
    {
      MediaControllerCompatApi21.TransportControls.skipToPrevious(mControlsObj);
    }
    
    public void stop()
    {
      MediaControllerCompatApi21.TransportControls.stop(mControlsObj);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaControllerCompat
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */