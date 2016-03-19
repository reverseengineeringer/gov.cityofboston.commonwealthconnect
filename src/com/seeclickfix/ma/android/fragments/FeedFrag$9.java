package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;

class FeedFrag$9
  implements View.OnClickListener
{
  FeedFrag$9(FeedFrag paramFeedFrag) {}
  
  public void onClick(View paramView)
  {
    FeedFrag.access$900(new AuthRequiredEvent(FeedFrag.access$700(this$0)));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */