package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.interfaces.VoteClickListener;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedFrag$14
  implements VoteClickListener
{
  FeedFrag$14(FeedFrag paramFeedFrag) {}
  
  public void onVoteClick(Issue paramIssue)
  {
    FeedFrag.access$1202(this$0, paramIssue);
    FeedFrag.access$1300(this$0);
    FeedFrag.access$1400(this$0, paramIssue.suitableVoteAction());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */