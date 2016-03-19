package android.support.v4.media.session;

import android.content.Intent;
import android.media.Rating;
import android.media.session.MediaSession.Callback;
import android.os.Bundle;
import android.os.ResultReceiver;

class MediaSessionCompatApi21$CallbackProxy<T extends MediaSessionCompatApi21.Callback>
  extends MediaSession.Callback
{
  protected final T mCallback;
  
  public MediaSessionCompatApi21$CallbackProxy(T paramT)
  {
    mCallback = paramT;
  }
  
  public void onCommand(String paramString, Bundle paramBundle, ResultReceiver paramResultReceiver)
  {
    mCallback.onCommand(paramString, paramBundle, paramResultReceiver);
  }
  
  public void onFastForward()
  {
    mCallback.onFastForward();
  }
  
  public boolean onMediaButtonEvent(Intent paramIntent)
  {
    return mCallback.onMediaButtonEvent(paramIntent);
  }
  
  public void onPause()
  {
    mCallback.onPause();
  }
  
  public void onPlay()
  {
    mCallback.onPlay();
  }
  
  public void onRewind()
  {
    mCallback.onRewind();
  }
  
  public void onSeekTo(long paramLong)
  {
    mCallback.onSeekTo(paramLong);
  }
  
  public void onSetRating(Rating paramRating)
  {
    mCallback.onSetRating(paramRating);
  }
  
  public void onSkipToNext()
  {
    mCallback.onSkipToNext();
  }
  
  public void onSkipToPrevious()
  {
    mCallback.onSkipToPrevious();
  }
  
  public void onStop()
  {
    mCallback.onStop();
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaSessionCompatApi21.CallbackProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */