package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.VoteClickListener;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedAdapter$7
  implements View.OnClickListener
{
  FeedAdapter$7(FeedAdapter paramFeedAdapter) {}
  
  public void onClick(View paramView)
  {
    Issue localIssue = (Issue)paramView.getTag();
    if (FeedAdapter.access$700(this$0) != null)
    {
      paramView.setEnabled(false);
      FeedAdapter.access$700(this$0).onVoteClick(localIssue);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */