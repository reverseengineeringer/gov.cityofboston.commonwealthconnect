package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.adapters.FeedAdapter.OnScrollListener;

class FeedFrag$10
  implements FeedAdapter.OnScrollListener
{
  FeedFrag$10(FeedFrag paramFeedFrag) {}
  
  public void onScrollToPosition(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 0) {}
    while ((paramInt2 <= 0) || (paramInt1 <= paramInt2 - 7) || (FeedFrag.access$100(this$0))) {
      return;
    }
    FeedFrag.access$1000(this$0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */