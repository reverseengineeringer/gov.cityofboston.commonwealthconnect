package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog;
import com.seeclickfix.ma.android.fragments.interfaces.OnIssueStarClickListener;
import com.seeclickfix.ma.android.objects.issue.Follow;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedFrag$16
  implements OnIssueStarClickListener
{
  FeedFrag$16(FeedFrag paramFeedFrag) {}
  
  public void onIssueStarClick(Issue paramIssue)
  {
    FeedFrag.access$1202(this$0, paramIssue);
    FeedFrag.access$1300(this$0);
    OneTimeWarnDialog.followWarning(this$0, new Runnable()new Runnable
    {
      public void run()
      {
        FeedFrag.access$1400(this$0, new Follow(FeedFrag.access$1200(this$0)));
      }
    }, new Runnable()
    {
      public void run()
      {
        FeedFrag.access$1500(this$0, FeedFrag.access$1200(this$0));
      }
    });
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.16
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */