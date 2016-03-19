package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.SeeclickfixActivity;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedAdapter$8
  implements View.OnClickListener
{
  FeedAdapter$8(FeedAdapter paramFeedAdapter) {}
  
  public void onClick(View paramView)
  {
    paramView = (Issue)paramView.getTag();
    ((SeeclickfixActivity)FeedAdapter.access$200(this$0)).showFlagDialog("issue", paramView.getId());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */