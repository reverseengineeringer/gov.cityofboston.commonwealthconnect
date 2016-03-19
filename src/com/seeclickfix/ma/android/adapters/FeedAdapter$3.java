package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.CommentBtnClickListener;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedAdapter$3
  implements View.OnClickListener
{
  FeedAdapter$3(FeedAdapter paramFeedAdapter) {}
  
  public void onClick(View paramView)
  {
    paramView = (Issue)paramView.getTag();
    if (FeedAdapter.access$300(this$0) != null) {
      FeedAdapter.access$300(this$0).onCommentClick(paramView);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */