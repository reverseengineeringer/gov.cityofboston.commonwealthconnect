package com.seeclickfix.ma.android.media;

import android.os.Bundle;
import android.support.v4.app.Fragment;

public class ImageCache$RetainFragment
  extends Fragment
{
  private Object mObject;
  
  public Object getObject()
  {
    return mObject;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setRetainInstance(true);
  }
  
  public void setObject(Object paramObject)
  {
    mObject = paramObject;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.ImageCache.RetainFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */