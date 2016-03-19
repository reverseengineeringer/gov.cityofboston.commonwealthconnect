package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.interfaces.IssueClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.IssueListFragInterface;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedFrag$13
  implements IssueClickListener
{
  FeedFrag$13(FeedFrag paramFeedFrag) {}
  
  public void onIssueClick(Issue paramIssue)
  {
    FeedFrag.access$1202(this$0, paramIssue);
    FeedFrag.access$1300(this$0);
    ((IssueListFragInterface)this$0.getActivity()).onSelectIssueListItem(paramIssue, null);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */