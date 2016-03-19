package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.IssueClickListener;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedAdapter$6
  implements View.OnClickListener
{
  FeedAdapter$6(FeedAdapter paramFeedAdapter) {}
  
  public void onClick(View paramView)
  {
    paramView = (Issue)paramView.getTag();
    if (FeedAdapter.access$600(this$0) != null) {
      FeedAdapter.access$600(this$0).onIssueClick(paramView);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */