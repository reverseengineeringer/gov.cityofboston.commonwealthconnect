package android.support.v4.media.session;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.MediaMetadataCompat;
import android.view.KeyEvent;

class MediaControllerCompat$MediaControllerImplApi21
  implements MediaControllerCompat.MediaControllerImpl
{
  private final Object mControllerObj;
  
  public MediaControllerCompat$MediaControllerImplApi21(Context paramContext, MediaSessionCompat.Token paramToken)
    throws RemoteException
  {
    mControllerObj = MediaControllerCompatApi21.fromToken(paramContext, paramToken.getToken());
    if (mControllerObj == null) {
      throw new RemoteException();
    }
  }
  
  public MediaControllerCompat$MediaControllerImplApi21(Context paramContext, MediaSessionCompat paramMediaSessionCompat)
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

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaControllerCompat.MediaControllerImplApi21
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */