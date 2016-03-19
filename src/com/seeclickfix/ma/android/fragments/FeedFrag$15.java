package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.interfaces.CommentBtnClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.IssueListFragInterface;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedFrag$15
  implements CommentBtnClickListener
{
  FeedFrag$15(FeedFrag paramFeedFrag) {}
  
  public void onCommentClick(Issue paramIssue)
  {
    ((IssueListFragInterface)this$0.getActivity()).onSelectIssueListItem(paramIssue, "com.seeclickfix.actions.COMMENT");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.15
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */