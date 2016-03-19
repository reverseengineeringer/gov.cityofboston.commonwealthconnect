package com.seeclickfix.ma.android.location;

import com.seeclickfix.ma.android.events.LocationTimeoutEvent;

class LocationAdapter$1
  implements Runnable
{
  LocationAdapter$1(LocationAdapter paramLocationAdapter) {}
  
  public void run()
  {
    LocationAdapter.access$100(this$0, new LocationTimeoutEvent(LocationAdapter.access$000(this$0)));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationAdapter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */