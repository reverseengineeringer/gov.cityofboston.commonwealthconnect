package android.support.v4.media.session;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.media.MediaMetadataCompat;

public abstract class MediaControllerCompat$Callback
{
  final Object mCallbackObj;
  
  public MediaControllerCompat$Callback()
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

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaControllerCompat.Callback
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */