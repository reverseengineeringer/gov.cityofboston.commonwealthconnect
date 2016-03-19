package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.interfaces.CommentCardClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.HomeButtonsInterface;
import com.seeclickfix.ma.android.objects.issue.Comment;

class FeedFrag$11
  implements CommentCardClickListener
{
  FeedFrag$11(FeedFrag paramFeedFrag) {}
  
  public void onCommentCardClick(Comment paramComment)
  {
    ((HomeButtonsInterface)this$0.getActivity()).onClickButton(4, Integer.valueOf(paramComment.getIssueId()));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.11
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */