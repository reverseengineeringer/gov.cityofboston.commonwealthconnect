package com.seeclickfix.ma.android.api;

import com.seeclickfix.ma.android.objects.issue.Vote;

public class SCFService$VoteResultEvent
  extends SCFService.IssueActionEvent
{
  public SCFService$VoteResultEvent(Vote paramVote, SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    super(paramVote, paramRetrofitResult);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.VoteResultEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */