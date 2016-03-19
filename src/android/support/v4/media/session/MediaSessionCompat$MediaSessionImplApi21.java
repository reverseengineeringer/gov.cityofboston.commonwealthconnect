package android.support.v4.media.session;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.VolumeProviderCompat;

class MediaSessionCompat$MediaSessionImplApi21
  implements MediaSessionCompat.MediaSessionImpl
{
  private final Object mSessionObj;
  private final MediaSessionCompat.Token mToken;
  
  public MediaSessionCompat$MediaSessionImplApi21(Context paramContext, String paramString)
  {
    mSessionObj = MediaSessionCompatApi21.createSession(paramContext, paramString);
    mToken = new MediaSessionCompat.Token(MediaSessionCompatApi21.getSessionToken(mSessionObj));
  }
  
  public MediaSessionCompat$MediaSessionImplApi21(Object paramObject)
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

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaSessionCompat.MediaSessionImplApi21
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */