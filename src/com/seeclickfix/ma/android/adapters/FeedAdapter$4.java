package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.CommentCardClickListener;
import com.seeclickfix.ma.android.objects.issue.Comment;

class FeedAdapter$4
  implements View.OnClickListener
{
  FeedAdapter$4(FeedAdapter paramFeedAdapter) {}
  
  public void onClick(View paramView)
  {
    paramView = (Comment)paramView.getTag();
    if (FeedAdapter.access$400(this$0) != null) {
      FeedAdapter.access$400(this$0).onCommentCardClick(paramView);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */