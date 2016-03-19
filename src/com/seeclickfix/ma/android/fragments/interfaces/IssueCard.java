package com.seeclickfix.ma.android.fragments.interfaces;

import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.objects.issue.Comment;
import com.seeclickfix.ma.android.objects.issue.Follow;
import com.seeclickfix.ma.android.objects.issue.RevokeVote;
import com.seeclickfix.ma.android.objects.issue.Transition;
import com.seeclickfix.ma.android.objects.issue.Vote;

public abstract interface IssueCard
{
  public abstract void recordVote(Vote paramVote, SCFService.IssueActionReceipt paramIssueActionReceipt);
  
  public abstract void revokeVote(RevokeVote paramRevokeVote, SCFService.IssueActionReceipt paramIssueActionReceipt);
  
  public abstract void updateComment(Comment paramComment, SCFService.IssueActionReceipt paramIssueActionReceipt);
  
  public abstract void updateFollow(Follow paramFollow, SCFService.IssueActionReceipt paramIssueActionReceipt);
  
  public abstract void updateStatus(Transition paramTransition, SCFService.IssueActionReceipt paramIssueActionReceipt);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.interfaces.IssueCard
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */