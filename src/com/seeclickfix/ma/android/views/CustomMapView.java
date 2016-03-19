package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewParent;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;

public class CustomMapView
  extends MapView
{
  public CustomMapView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public CustomMapView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public CustomMapView(Context paramContext, GoogleMapOptions paramGoogleMapOptions)
  {
    super(paramContext, paramGoogleMapOptions);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction())
    {
    }
    for (;;)
    {
      super.onTouchEvent(paramMotionEvent);
      return false;
      getParent().requestDisallowInterceptTouchEvent(true);
      continue;
      getParent().requestDisallowInterceptTouchEvent(false);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.CustomMapView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */