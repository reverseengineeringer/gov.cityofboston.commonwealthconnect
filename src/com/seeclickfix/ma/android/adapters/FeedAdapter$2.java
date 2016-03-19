package com.seeclickfix.ma.android.adapters;

import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.events.ShowReportEvent;
import com.squareup.otto.Bus;

class FeedAdapter$2
  implements Runnable
{
  FeedAdapter$2(FeedAdapter paramFeedAdapter) {}
  
  public void run()
  {
    MyApplication.getEventBus().post(new ShowReportEvent("zone-card"));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */