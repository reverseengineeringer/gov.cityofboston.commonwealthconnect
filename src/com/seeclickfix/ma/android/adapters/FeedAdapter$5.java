package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import com.seeclickfix.ma.android.fragments.interfaces.OnIssueStarClickListener;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedAdapter$5
  implements View.OnClickListener
{
  FeedAdapter$5(FeedAdapter paramFeedAdapter) {}
  
  public void onClick(View paramView)
  {
    Issue localIssue = (Issue)paramView.getTag();
    paramView = (CheckBox)paramView;
    if (FeedAdapter.access$500(this$0) != null) {
      FeedAdapter.access$500(this$0).onIssueStarClick(localIssue);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */