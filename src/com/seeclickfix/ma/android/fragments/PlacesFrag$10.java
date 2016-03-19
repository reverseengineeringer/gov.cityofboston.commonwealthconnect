package com.seeclickfix.ma.android.fragments;

import android.view.View;
import com.seeclickfix.ma.android.objects.loc.Place;

class PlacesFrag$10
  implements Runnable
{
  PlacesFrag$10(PlacesFrag paramPlacesFrag, Place paramPlace) {}
  
  public void run()
  {
    try
    {
      if (val$p.getIgnored())
      {
        PlacesFrag.access$700(this$0);
        View localView = this$0.getPlaceRowByTag(val$p);
        localView.setTag(val$p);
        PlacesFrag.access$800(this$0, localView);
      }
      return;
    }
    catch (Exception localException) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */